Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81051D49797
	for <igt-dev@archiver.kernel.org>; Tue,  3 Dec 2024 09:20:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FA8E10E99F;
	Tue,  3 Dec 2024 09:20:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QIGhA3NG";
	dkim-atps=neutral
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0257510E99F
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Dec 2024 09:20:08 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-215bebfba73so4370435ad.1
 for <igt-dev@lists.freedesktop.org>; Tue, 03 Dec 2024 01:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733217607; x=1733822407; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mVXNMnt0bJzJrtXFXHhXRAm0lDRsDkMD3LAiK4gUmKM=;
 b=QIGhA3NG4mkJfym8l381PwtVerLV3QZgEqcXsv8L2bCvTEi9yO/FBDIJJ0nsjL4tDI
 JkGxJT2sLSx6Na3U8hctERs1X5u+K50yP8wjDQ7J1aNK9Cp/ojhM0Q2mZ7T3iTMfOpCF
 d47XgdENJm3f8E2HerrWJxLJBvZxvWknEZXjdVUh27r4ekR7qBU/MQVFZvN9cZGo+RJt
 /KD2Os5TBAFqhwkG6C1ZQGUfalmgj8le6MpE7hSjtPcPZn9VKEfs6Z83uJUJyAWB8tMc
 cZE2pYS9q3jUcrxGCEfLiiKQtL2LXUxJTdFsof+HSPEhbu5c1/V5oT23GVQ6L/0yre9d
 PkoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733217607; x=1733822407;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mVXNMnt0bJzJrtXFXHhXRAm0lDRsDkMD3LAiK4gUmKM=;
 b=NZGsA1RiCNg3xaqSo5DUdDt6BhFirdhL4/QpY+ku7eL/qK6UhoU8pejFMAwFDQMNUs
 8MTNm1BCow+DhjQtj2RED9QlTPSmlioODr9/HzPYnfLdtTWDtR3OG05qTY3ZiZwZ9Lnz
 +xs9VIWTORbNJMy3aJW+XoaTaEldxZZ+JjkWPDPmWxzUQgoq+RW0Ub/TnD7dotSWDcaF
 4dpN9Xd8V6cFGX/6+BlbTdlHsLMGuAV9ehX3IxzHkW0h0eOJZQh6psBN5bAX6ZFdRwuR
 GON6/5ZNYvUwZpFoTtLATcF/ItHhqmCe9si05yVB0+9vptygJ8RudSf4TogkFYsFWNlY
 Ih5g==
X-Gm-Message-State: AOJu0YzHOZMFaVTBQuLVhxB8KKSQoIy4Kqx8xYhpV6sEG9nw8QO+/xu6
 1zFVidRU1zDC5uy+Z4QCFspzt6S/lIeUJ52QnQAlxHg0IEnDD1Fs6q9TZILp
X-Gm-Gg: ASbGnctfsRfeSq63fsFDio4VDvr00vZexpgVGTRZvtKJSbNbWr8WxPNE94Ro0cnGJZ/
 uLkq4WwBQqCCjs0rbbMk71V2gfHWhxZOi1fpxLeSk6O6HuOnD/+9HTaqmM3y5KcihfE3M2c5dKU
 9fLArrZMpG7nGJPxLjGiG1BK8FiwQHdJixyYScd5FQh4e3EuAl1gJvPF6Tkm7pTUVFhj7XtsvRr
 ETjFR82P+2U+7JISXVT1vmxr3SLiOb2DWlKA7QM6ZRQ0dXbepIWeVg=
X-Google-Smtp-Source: AGHT+IFwAM69RxbZb6eoSjnc29WRPmVZdkbw9l+jcBzdH6dHNmnTR92306/oL9R9d40ju/Ps8Emrng==
X-Received: by 2002:a17:902:c94a:b0:215:5935:7eef with SMTP id
 d9443c01a7336-215bcfc2a99mr28401695ad.22.1733217607334; 
 Tue, 03 Dec 2024 01:20:07 -0800 (PST)
Received: from localhost ([192.55.54.45]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2156e0c8d2csm48287405ad.17.2024.12.03.01.20.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2024 01:20:07 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel/kms_ccs: add hiberbate test
Date: Tue,  3 Dec 2024 11:24:18 +0200
Message-ID: <20241203092418.3454357-3-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241203092418.3454357-1-juhapekka.heikkila@gmail.com>
References: <20241203092418.3454357-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Add hibernate test which bring entire system down for short
hibernate. This mode is added to suspend tests to be run
manually with '-r' flag because this is not ci friendly test,
on hibernate ci would lose connection to the hibernated box.

For this test to work kernel resume point need to be set, from
kernel command line is checked if there is found something along
the lines of "resume=/dev/nvme0n1p2" or so to verify hibernate
will be successful.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/intel/kms_ccs.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
index 3e9a57863..d720de04a 100644
--- a/tests/intel/kms_ccs.c
+++ b/tests/intel/kms_ccs.c
@@ -190,6 +190,7 @@ typedef struct {
 	bool user_seed;
 	enum igt_commit_style commit;
 	int fb_list_length;
+	bool do_hibernate;
 	struct {
 		struct igt_fb fb;
 		int width, height;
@@ -839,8 +840,17 @@ static bool try_config(data_t *data, enum test_fb_flags fb_flags,
 
 	if (ret == 0 && !(fb_flags & TEST_BAD_ROTATION_90) && crc) {
 		if (data->flags & TEST_SUSPEND && fb_flags & FB_COMPRESSED) {
-			igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
-						      SUSPEND_TEST_NONE);
+			if (data->do_hibernate) {
+				igt_require_f(igt_pm_check_hibernation_support(),
+					      "Kernel is not cofigured for resume\n");
+				igt_require_f(igt_pm_ensure_grub_boots_same_kernel(),
+					      "Couldn't find correct kernel in grub.cfg\n");
+				igt_system_suspend_autoresume(SUSPEND_STATE_DISK,
+							      SUSPEND_TEST_NONE);
+			} else {
+				igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
+							      SUSPEND_TEST_NONE);
+			}
 
 			/* on resume check flat ccs is still compressed */
 			if (is_xe_device(data->drm_fd) &&
@@ -1044,6 +1054,9 @@ static int opt_handler(int opt, int opt_index, void *opt_data)
 		data->user_seed = true;
 		data->seed = strtoul(optarg, NULL, 0);
 		break;
+	case 'r':
+		data->do_hibernate = true;
+		break;
 	default:
 		return IGT_OPT_HANDLER_ERROR;
 	}
@@ -1056,9 +1069,10 @@ static data_t data;
 static const char *help_str =
 "  -c\t\tCheck the presence of compression meta-data\n"
 "  -s <seed>\tSeed for random number generator\n"
+"  -r\t\tOn suspend test do full hibernate with reboot\n"
 ;
 
-igt_main_args("cs:", NULL, help_str, opt_handler, &data)
+igt_main_args("csr:", NULL, help_str, opt_handler, &data)
 {
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
-- 
2.45.2

