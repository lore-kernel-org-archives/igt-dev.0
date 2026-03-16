Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE685F53D6D
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 16:24:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9590A10E29A;
	Mon, 16 Mar 2026 16:24:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="oNcDEOj6";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3BC310E292
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 16:23:17 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 8E0684E42609;
 Mon, 16 Mar 2026 16:23:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 66A745FC4A;
 Mon, 16 Mar 2026 16:23:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4CD7110372203; Mon, 16 Mar 2026 17:23:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773678195; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=69U3dHUmDqONc/BRG1qJkZIM++WtstJiaSAkTpaTuho=;
 b=oNcDEOj6Gf1DlzqBOk5UXFeA4RZ1P5VxI4JtW9DP5v+qc4B17gKNLbgy9V+ZvJH0/INqLN
 snBNZ9dzfW2ANMpITCVyCumKbsYhXFukwcoe3CaY8ro3hDWCxLAJIKBmSHxcGFaiUDuanq
 qtfJj9rpbpNHpBFLaCpkZ1DUtIdT4uMe9emj0W4lzo136b1WwFXpDRJr4RpzjzwWR4F2Vp
 ae45ymZYqnx9iHFk0rhYBSS+Kn+FVl1MkQYZBIra/oT8IKq41g83/kbB5z0zbILUgaesiv
 mx2JScYzSQBj249XhtEDbpm8hQ1yl3JjBsSvJm2y49YynQJ3NpTwMPh8eTLjOg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 17:17:30 +0100
Subject: [PATCH i-g-t v9 09/49] lib/igt_kms: Expose
 reset_connectors_at_exit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-unigraf-integration-v9-9-a01dffc3b0cb@bootlin.com>
References: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1256;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=fKhevELmAZtNJbexAGw/zrFaX5h1FRkO+XG9cxzGq2M=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpuC6K4eC3e4q6KcGwNt32ZAAINAjUA3ZiC2fmW
 KoHXb+HJMOJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabguihsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOJygBAAzA061ZVX0n1YtmOZ4N3YSBS6iyoNE4/
 xeZs0VFH3Q6bQp83zK4/2DC65A6WY2K73pOVCJP4o6QlZ7XFH6p20NmFLBzmL1ue+JqIMRMjnw0
 beO75tZb40lhk+0HyHIQPH9DBcbhEJGc4HROg3eXfIUH7V4oL/KqPtP8IwXmPOtsZSm+ENmRU9z
 yHyCMCRS2Yh/xxbdhyEodd1EQVtDefHGynvmEaOeaOzCL4DoCfWlrHC0N6ZrqOBYV7CWGc0kOuE
 PjY8tDTiP0gjHzdm9Z7s1P3V0/m5CHHs1KwuxPXwmyqq+tgycM1+HaXzyBVjS+kUCJbPypXdWWd
 HzRa54UaU5QRlgpeZU0j3Kfvs6XlloR7c3PuMV8v1XeGsYabM+SQ1Mc98PasFZ6HHeZREnEJZDW
 5NH1I9LU0JBM0EW7Kfo23msIGTWZ/jTMlKOsalhm+HoxairACxeZx6rz2M+FFq8G0bo1WQf+rAR
 mG2g8lb1DOidYW0CzWSHCgo0EMSVFPSDvxIr26BXrwoYtYmaxRwNnsn7AyafxRaW6jEiX5aZGNi
 yLiRZg6tZ5KScTCcK9IPswnXEUVtriDgypLDQswz82JfyQkbXySv1iEKFd3jNTUAGFlp/fm2lmi
 C4wWgxp1nanNNWuWlzK6h2U858qhRsz+ljaJ3yoXiE0x82XUa/8U=
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3
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

reset_connectors_at_exit is used by i915 DP helpers, expose it so it can
be reused in a different file.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
---
 lib/igt_kms.c | 7 ++++++-
 lib/igt_kms.h | 1 +
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index a0d12800404b..451b273999f0 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1577,7 +1577,12 @@ void kmstest_set_vt_text_mode(void)
 	igt_assert(set_vt_mode(KD_TEXT) >= 0);
 }
 
-static void reset_connectors_at_exit(int sig)
+/**
+ * reset_connectors_at_exit:
+ *
+ * Exit handler used to remove any forced state from the connectors.
+ */
+void reset_connectors_at_exit(int sig)
 {
 	igt_reset_connectors();
 }
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index d071ca1800f8..5a9efc8cee48 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -152,6 +152,7 @@ int kmstest_get_crtc_index_from_id(int fd, int crtc_id);
 void kmstest_set_vt_graphics_mode(void);
 void kmstest_restore_vt_mode(void);
 void kmstest_set_vt_text_mode(void);
+void reset_connectors_at_exit(int sig);
 
 enum igt_atomic_crtc_properties {
        IGT_CRTC_CTM = 0,

-- 
2.52.0

