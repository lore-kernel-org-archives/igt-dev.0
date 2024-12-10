Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 600F0E77181
	for <igt-dev@archiver.kernel.org>; Tue, 10 Dec 2024 02:08:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 410FA10E5AD;
	Tue, 10 Dec 2024 02:08:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E6p9+1U2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 404C410E5AD
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Dec 2024 02:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733796508; x=1765332508;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Yel4cd2GVHFfET/br3vlsaP7sJfQgtefOae5gsxPBRI=;
 b=E6p9+1U2VJMXgrOspv3bC7NrjsgWptssxw756XdqgRVjkGH3DAa6UTHx
 EN1VWPjkLNm4j69T8/uFJB4flm+kjR6vAq8BtZLxeCClGScf9x8sKEamK
 sZxN9+sUJFDHWunEu4AsJsaGaIoLLrMJCxB4/Z2s3L8fS2kqE42R0RW8v
 n3m0tVky6vjJo8oTb+xxmdmO8DKVYcfZSFbBSQKfk/DjaXB/V4EMKn1JL
 8kmtbGtyEzDgh21gWAa+skU5k4OZoeO8vAyygxurwaFzwZ570psXglxcR
 87rVlw41bBxalsdTuay/ITbjU62KjDbWRAg/jwjGlUMYr/EC0TTbsuVLF A==;
X-CSE-ConnectionGUID: CWD+In25QU2m6qkX10FO7w==
X-CSE-MsgGUID: WxRe8uHjQRGwAM/SHHmguQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="44724567"
X-IronPort-AV: E=Sophos;i="6.12,221,1728975600"; d="scan'208";a="44724567"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 18:08:18 -0800
X-CSE-ConnectionGUID: cEHVR13iT/qLfeOZKwQxVQ==
X-CSE-MsgGUID: SC1lvd7gR/KpglW7KpJbkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,221,1728975600"; d="scan'208";a="100203708"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 18:08:19 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 1/3] tests/intel/xe_oa: Move Xe2+ check before
 init_sys_info
Date: Mon,  9 Dec 2024 18:08:10 -0800
Message-ID: <20241210020812.1513475-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.47.1
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

In order to avoid failures on unsupported Xe1 platforms, move Xe2+ check
before init_sys_info.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3645
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel/xe_oa.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 8a88945a2b..9e7c2ae1e6 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -4855,14 +4855,14 @@ igt_main
 		devid = intel_get_drm_devid(drm_fd);
 		sysfs = igt_sysfs_open(drm_fd);
 
+		/* Currently only run on Xe2+ */
+		igt_require(intel_graphics_ver(devid) >= IP_VER(20, 0));
+
 		igt_require(init_sys_info());
 
 		write_u64_file("/proc/sys/dev/xe/observation_paranoid", 1);
 
 		render_copy = igt_get_render_copyfunc(devid);
-
-		/* Currently only run on Xe2+ */
-		igt_require(intel_graphics_ver(devid) >= IP_VER(20, 0));
 	}
 
 	igt_subtest("non-system-wide-paranoid")
-- 
2.47.1

