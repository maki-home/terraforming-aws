resource "aws_iam_policy" "spot_instance" {
    name = "${var.env_name}_spot_instance"
    policy = <<EOF
{
"Version": "2012-10-17",
"Statement": [
    {
        "Action": "ec2:RequestSpotInstances",
        "Effect": "Allow",
        "Resource": "*"
    },
    {
        "Action": "ec2:DescribeSpotInstanceRequests",
        "Effect": "Allow",
        "Resource": "*"
    },
    {
        "Action": "ec2:CancelSpotInstanceRequests",
        "Effect": "Allow",
        "Resource": "*"
    },
    {
        "Action": "iam:CreateServiceLinkedRole",
        "Effect": "Allow",
        "Resource": "*"
    }
]
}
EOF
}

resource "aws_iam_user_policy_attachment" "spot_instance" {
    user       = "${aws_iam_user.ops_manager.name}"
    policy_arn = "${aws_iam_policy.spot_instance.arn}"
}
