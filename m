Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E3FE7719C
	for <igt-dev@archiver.kernel.org>; Sat,  4 Jan 2025 07:16:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 278C410E44C;
	Sat,  4 Jan 2025 07:16:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qcj71qhr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86D2410E0C8
 for <igt-dev@lists.freedesktop.org>; Sat,  4 Jan 2025 07:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735974962; x=1767510962;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YaSKJ5l1ris0iBNgvRAvRGrhmNE+vmma3MduYWyw1k8=;
 b=Qcj71qhrpFLzRtkp5UR1rGat+kBjxPUmSJksY9VcT+YpCGoKO3U6kVmE
 UUzK9SJ5ryrRDZbCMxJB2/tVxHGhFFUtVWZrJs6tlrlnxnBIRmcjFfKUh
 FvASR9NbeeIpXfgt5Yt1kOG5HwYyJRTt9TyNPW7yMLkvNbU7Bvi0yTcAN
 Z0WJoxbuPfBBAZ1ZtJlUR5MVxXMVeYiGX/UBYXezqUxynmilRTGxtVUUe
 csChfx8tjJmQlT0Fh+FW3sMfK9rReuJdQ22i2aF/QbCu6dOC3ZKYafKfp
 IZ/577idnv8+zfJSZTzEP5fNM83tnC2MwfOau3/C1mJU6EQAQ7M3hOyoh Q==;
X-CSE-ConnectionGUID: VWArbfJXTGq5fIy8K8DiaQ==
X-CSE-MsgGUID: W+JjJ4g7R4S9HpVNkFeUPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="46878989"
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; d="scan'208";a="46878989"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2025 23:16:02 -0800
X-CSE-ConnectionGUID: uS60xLgMSWuKQ3B5hswU/g==
X-CSE-MsgGUID: RFPS0XoeTcmlJF4z/1XQnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; d="scan'208";a="101761979"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2025 23:16:01 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Pravalika Gurram <pravalika.gurram@intel.com>
Subject: [PATCH i-g-t 1/8] tests/intel/xe_drm_fdinfo: Do not end cork not
 started
Date: Fri,  3 Jan 2025 23:15:41 -0800
Message-ID: <20250104071548.737612-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
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

If cork was not started, do not try to end it. Similar fix to commit
598c268686f4 ("tests/intel/xe_drm_fdinfo: Do not destroy NULL xe_cork").

Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Pravalika Gurram <pravalika.gurram@intel.com>
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3869
Fixes: 2feb1d6718a1 ("lib/xe/xe_spin: move the spinner related functions to lib")
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel/xe_drm_fdinfo.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index e83c55c64..6549629b4 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -533,7 +533,9 @@ utilization_others_full_load(int fd, struct drm_xe_engine_class_instance *hwe)
 	read_engine_cycles(fd, pceu1);
 	usleep(batch_duration_usec);
 	xe_for_each_engine_class(class)
-		xe_cork_sync_end(fd, ctx[class]);
+		if (ctx[class])
+			xe_cork_sync_end(fd, ctx[class]);
+
 	read_engine_cycles(fd, pceu2);
 
 	xe_for_each_engine_class(class) {
-- 
2.47.0

