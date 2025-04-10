Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD7D3C3601E
	for <igt-dev@archiver.kernel.org>; Thu, 10 Apr 2025 22:49:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F22410EA7F;
	Thu, 10 Apr 2025 22:49:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OZGB+UCo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1612210E1A1
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Apr 2025 22:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744325335; x=1775861335;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=m2ojGyZEsnhqieOT1L9kuxGT/LNFALIS/+3g+1Q9VxI=;
 b=OZGB+UCokI9eyozw+5QcbXbMEC05iTAW9gsS7U/472g0fQAVXFZAO6lf
 U+oIoL20pkeQVphmYeyk9Tqub3g22ndjRFwRxVCYcjlgRJVzjkRvt9GyA
 0UjgvmZxoDYgJX2wjMVZlDHSRmpNDvXuDaRZQPY5caY7VvfOEeX98m9J4
 DT/8BmRRVbfJixXKjCA5QuifFlVKUswYbo0VcL359krJ41cx2EGD4c3s6
 zqr+GxoalBIUPYR1k5PCaGlN1Gi4d+zwsjcqVFaa2/5tUcT2kujr8Jmf0
 nY1pXZrn5q12wZ83cTJg6Eyd5NPOT5XwEVKEwbk4cDC7PVpaphSsDN4iV Q==;
X-CSE-ConnectionGUID: VMHymHeYTSy3O4aIdN4jBw==
X-CSE-MsgGUID: F5jNvLa6ReGfZhb3jonsqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45757005"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="45757005"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 15:48:54 -0700
X-CSE-ConnectionGUID: 7KEZDG/7SbOVkpqx1mUFaA==
X-CSE-MsgGUID: Q7SqEhayRyqZCTZ1T8ma6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="159998312"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 15:48:55 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 03/10] lib/igt_kmod: Simplify igt_kmod_unbind()
Date: Thu, 10 Apr 2025 15:48:32 -0700
Message-ID: <20250410-lib-kmod-v1-3-84b1ad0b8075@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410-lib-kmod-v1-0-84b1ad0b8075@intel.com>
References: <20250410-lib-kmod-v1-0-84b1ad0b8075@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-9a9c7
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

There's no need to open the symlink and go to the driver/ dir. That will
only brings us back to the same directory we are on.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_kmod.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index ecc74e0fe..a1e39a429 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -672,7 +672,6 @@ int igt_kmod_unbind(const char *mod_name, const char *pci_device)
 		return 0;
 
 	while ((de = readdir(dir))) {
-		int devfd;
 		bool ret;
 
 		if (de->d_type != DT_LNK || !isdigit(de->d_name[0]))
@@ -681,13 +680,8 @@ int igt_kmod_unbind(const char *mod_name, const char *pci_device)
 		if (pci_device && strcmp(pci_device, de->d_name) != 0)
 			continue;
 
-		devfd = openat(dirfd(dir), de->d_name, O_RDONLY | O_CLOEXEC);
-		igt_assert(devfd >= 0);
-
-		ret = igt_sysfs_set(devfd, "driver/unbind", de->d_name);
+		ret = igt_sysfs_set(dirfd(dir), "unbind", de->d_name);
 		igt_assert(ret);
-
-		close(devfd);
 	}
 
 	closedir(dir);

-- 
2.49.0

