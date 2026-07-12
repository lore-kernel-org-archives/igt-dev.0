Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D964CC43458
	for <igt-dev@archiver.kernel.org>; Sun, 12 Jul 2026 21:05:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8188510E307;
	Sun, 12 Jul 2026 21:05:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Mz/7NZxq";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC6FA10E358
 for <igt-dev@lists.freedesktop.org>; Sun, 12 Jul 2026 21:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/8HcRvDsnW0C/XTqFyWdhguNFZNe4IIur403mGM3c8U=; b=Mz/7NZxqDjaV0LGIgkFt61J2oi
 qMIQ9mbOYqizKdIWXZGaERNDKAC1NhcEbj5QlcjGiYTVD+3YQc/iG1SxHzIkLNzwbJeQMYJLPcgcz
 I7eQnIY6kpAleoe4Y+1qZvuRZ7j7u4mrmeNLP1o+c9y/PdPEuK43Z97DvPfdYYTX0mRnxn8Ci2O61
 NqypaP0Vsn/6itklKJYpIn9jVikORErStudzJA8VGAE5ksMnSsXqBPrRc/GOaxGlEQtWjfnLBVRo+
 ijRVeI68/ZaQlZLr909qOSF75O2+Jtb3d7E8xbXy/hkqQPF2lLhyZLSiivDCxl7LnKlJL7lfvN91b
 wLTBQLfg==;
Received: from [189.7.87.67] (helo=prince) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wj1L4-00Ds7H-Qz; Sun, 12 Jul 2026 23:03:51 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Iago Toral <itoral@igalia.com>, Melissa Wen <mwen@igalia.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH i-g-t 1/2] tests/v3d: Expect EINVAL for empty multisync
 submissions
Date: Sun, 12 Jul 2026 18:00:57 -0300
Message-ID: <20260712210328.3690745-1-mcanal@igalia.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The kernel commit fb44d589bf31 ("drm/v3d: Reject empty multisync
extension to prevent infinite loop") makes v3d_get_multisync_submit_deps()
reject an empty multisync extension. Such an extension carries no
synchronization information and serves no useful purpose. More than that,
a self-referential empty extension could previously drive an unbounded
loop in v3d_get_extensions().

The valid-multisync-submission subtests submitted a multisync extension
without any syncobjs and expected the ioctl to succeed, which no longer
holds against stable kernels that rejects empty multisync submissions.
Rename them to empty-multisync-submission and expect -EINVAL instead,
for both the CL and CSD submit paths.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 tests/v3d/v3d_submit_cl.c  | 6 +++---
 tests/v3d/v3d_submit_csd.c | 6 +++---
 tests/v3d_ci/v3d.testlist  | 4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/tests/v3d/v3d_submit_cl.c b/tests/v3d/v3d_submit_cl.c
index 319fd7593..824b75793 100644
--- a/tests/v3d/v3d_submit_cl.c
+++ b/tests/v3d/v3d_submit_cl.c
@@ -230,8 +230,8 @@ int igt_main()
 		igt_v3d_free_cl_job(fd, job);
 	}
 
-	igt_describe("Test a valid submission with a multisync without syncobjs.");
-	igt_subtest("valid-multisync-submission") {
+	igt_describe("Test an invalid submission with a multisync without syncobjs.");
+	igt_subtest("empty-multisync-submission") {
 		struct drm_v3d_multi_sync ms = { };
 		struct v3d_cl_job *job = igt_v3d_noop_job(fd);
 
@@ -243,7 +243,7 @@ int igt_main()
 			igt_v3d_set_multisync(&ms, V3D_RENDER);
 			job->submit->extensions = to_user_pointer(&ms);
 
-			do_ioctl(fd, DRM_IOCTL_V3D_SUBMIT_CL, job->submit);
+			do_ioctl_err(fd, DRM_IOCTL_V3D_SUBMIT_CL, job->submit, EINVAL);
 		}
 
 		igt_v3d_free_cl_job(fd, job);
diff --git a/tests/v3d/v3d_submit_csd.c b/tests/v3d/v3d_submit_csd.c
index 35da19350..ca429f1db 100644
--- a/tests/v3d/v3d_submit_csd.c
+++ b/tests/v3d/v3d_submit_csd.c
@@ -214,8 +214,8 @@ int igt_main()
 		igt_v3d_free_csd_job(fd, job2);
 	}
 
-	igt_describe("Test a valid submission with a multisync without syncobjs.");
-	igt_subtest("valid-multisync-submission") {
+	igt_describe("Test an invalid submission with a multisync without syncobjs.");
+	igt_subtest("empty-multisync-submission") {
 		struct drm_v3d_multi_sync ms = { };
 		struct v3d_csd_job *job = igt_v3d_empty_shader(fd);
 
@@ -227,7 +227,7 @@ int igt_main()
 			igt_v3d_set_multisync(&ms, V3D_CSD);
 			job->submit->extensions = to_user_pointer(&ms);
 
-			do_ioctl(fd, DRM_IOCTL_V3D_SUBMIT_CSD, job->submit);
+			do_ioctl_err(fd, DRM_IOCTL_V3D_SUBMIT_CSD, job->submit, EINVAL);
 		}
 
 		igt_v3d_free_csd_job(fd, job);
diff --git a/tests/v3d_ci/v3d.testlist b/tests/v3d_ci/v3d.testlist
index 106e9cf2d..976d7d40d 100644
--- a/tests/v3d_ci/v3d.testlist
+++ b/tests/v3d_ci/v3d.testlist
@@ -27,7 +27,7 @@ igt@v3d/v3d_submit_cl@valid-submission
 igt@v3d/v3d_submit_cl@single-out-sync
 igt@v3d/v3d_submit_cl@single-in-sync
 igt@v3d/v3d_submit_cl@simple-flush-cache
-igt@v3d/v3d_submit_cl@valid-multisync-submission
+igt@v3d/v3d_submit_cl@empty-multisync-submission
 igt@v3d/v3d_submit_cl@multiple-job-submission
 igt@v3d/v3d_submit_cl@multisync-out-syncs
 igt@v3d/v3d_submit_cl@multi-and-single-sync
@@ -45,7 +45,7 @@ igt@v3d/v3d_submit_csd@bad-multisync-in-sync
 igt@v3d/v3d_submit_csd@valid-submission
 igt@v3d/v3d_submit_csd@single-out-sync
 igt@v3d/v3d_submit_csd@single-in-sync
-igt@v3d/v3d_submit_csd@valid-multisync-submission
+igt@v3d/v3d_submit_csd@empty-multisync-submission
 igt@v3d/v3d_submit_csd@multiple-job-submission
 igt@v3d/v3d_submit_csd@multisync-out-syncs
 igt@v3d/v3d_submit_csd@multi-and-single-sync
-- 
2.54.0

