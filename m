Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C2DFC43458
	for <igt-dev@archiver.kernel.org>; Sun, 12 Jul 2026 21:04:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B46D910E307;
	Sun, 12 Jul 2026 21:04:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="S0ugB0ds";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5C8210E307
 for <igt-dev@lists.freedesktop.org>; Sun, 12 Jul 2026 21:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WlmDWGUxHXMf9YHO1UT9osCuSBRSwx+LZxDQ9P/rkbE=; b=S0ugB0dsK3iM0Yi4sSaub9TEJF
 Kx8Ex5cjJiBTqRkmHyklkyzFbZ00bQSaFDruB5uSxD4REMAL39Ep1hQHpLK2uHH9E5PXp3BA3B/fV
 CWz+VCFLU+hmfIdG/fFkElSHpxfFdBUlwft46ivhmHSXPnp0F5P/UrtOcXTzJsXWhgqiXXb5tiU4R
 4uk3pyc6G3QM9go44Sfsra5N2rqspwbYBrZLbCmib7lnI/uM6wkXqBN0Kc3ALT877A1VQ9w7wLNqm
 p5Y9pT+AMvFzbVAMXZIriJDMMiFnYKloSzD2mQxF+K7x5svez8NNjDTs36JeisramLU/nZWrp0KPn
 1hJOOSJw==;
Received: from [189.7.87.67] (helo=prince) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wj1L8-00Ds7H-Ne; Sun, 12 Jul 2026 23:03:55 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Iago Toral <itoral@igalia.com>, Melissa Wen <mwen@igalia.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH i-g-t 2/2] tests/v3d: Pass the submit struct, not its address,
 to the ioctl
Date: Sun, 12 Jul 2026 18:00:58 -0300
Message-ID: <20260712210328.3690745-2-mcanal@igalia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260712210328.3690745-1-mcanal@igalia.com>
References: <20260712210328.3690745-1-mcanal@igalia.com>
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

Some submit subtests pass &job->submit to do_ioctl_err(), but job->submit
is already a pointer to the drm_v3d_submit_{cl,csd} struct. The ioctl thus
reads the pointer field's bytes instead of the configured submission, so
the tests don't exercise what they intend.

Pass job->submit directly, matching every other submit call site.

Fixes: 1c7ea154b625 ("tests/v3d_submit_cl: Create test for V3D's Submit CL IOCTL")
Fixes: 4d6551ca64cf ("tests/v3d_submit_csd: Create test for V3D's Submit CSD IOCTL")
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 tests/v3d/v3d_submit_cl.c  | 4 ++--
 tests/v3d/v3d_submit_csd.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/v3d/v3d_submit_cl.c b/tests/v3d/v3d_submit_cl.c
index 824b75793..c30fdebb7 100644
--- a/tests/v3d/v3d_submit_cl.c
+++ b/tests/v3d/v3d_submit_cl.c
@@ -218,7 +218,7 @@ int igt_main()
 		job->submit->flags = DRM_V3D_SUBMIT_CL_FLUSH_CACHE;
 
 		if (!igt_v3d_get_param(fd, DRM_V3D_PARAM_SUPPORTS_CACHE_FLUSH)) {
-			do_ioctl_err(fd, DRM_IOCTL_V3D_SUBMIT_CL, &job->submit, EINVAL);
+			do_ioctl_err(fd, DRM_IOCTL_V3D_SUBMIT_CL, job->submit, EINVAL);
 		} else {
 			job->submit->out_sync = syncobj_create(fd, DRM_SYNCOBJ_CREATE_SIGNALED);
 
@@ -238,7 +238,7 @@ int igt_main()
 		job->submit->flags = DRM_V3D_SUBMIT_EXTENSION;
 
 		if (!igt_v3d_get_param(fd, DRM_V3D_PARAM_SUPPORTS_MULTISYNC_EXT)) {
-			do_ioctl_err(fd, DRM_IOCTL_V3D_SUBMIT_CL, &job->submit, EINVAL);
+			do_ioctl_err(fd, DRM_IOCTL_V3D_SUBMIT_CL, job->submit, EINVAL);
 		} else {
 			igt_v3d_set_multisync(&ms, V3D_RENDER);
 			job->submit->extensions = to_user_pointer(&ms);
diff --git a/tests/v3d/v3d_submit_csd.c b/tests/v3d/v3d_submit_csd.c
index ca429f1db..4b342c79a 100644
--- a/tests/v3d/v3d_submit_csd.c
+++ b/tests/v3d/v3d_submit_csd.c
@@ -222,7 +222,7 @@ int igt_main()
 		job->submit->flags = DRM_V3D_SUBMIT_EXTENSION;
 
 		if (!igt_v3d_get_param(fd, DRM_V3D_PARAM_SUPPORTS_MULTISYNC_EXT)) {
-			do_ioctl_err(fd, DRM_IOCTL_V3D_SUBMIT_CSD, &job->submit, EINVAL);
+			do_ioctl_err(fd, DRM_IOCTL_V3D_SUBMIT_CSD, job->submit, EINVAL);
 		} else {
 			igt_v3d_set_multisync(&ms, V3D_CSD);
 			job->submit->extensions = to_user_pointer(&ms);
-- 
2.54.0

