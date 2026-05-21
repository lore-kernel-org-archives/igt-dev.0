Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 347A4CD5BAC
	for <igt-dev@archiver.kernel.org>; Thu, 21 May 2026 09:59:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B55C510E244;
	Thu, 21 May 2026 09:59:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Me7haEIj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E172010E244
 for <igt-dev@lists.freedesktop.org>; Thu, 21 May 2026 09:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779357559; x=1810893559;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0GIONYO8F2aIkwFc9gxlRfrkDl4X5itdl6uG6ztW6B0=;
 b=Me7haEIjATAmSb6pDguo56/hXguQv3BN97jUj6q6rZftMNBa/uvh/q88
 8qz/l2ZrlYBDV4UG9CvsVRfequOAduz8gzTqaXgnLj7jfgMKhaef5h8Wg
 6ovBOSoqZ8J4wqwjC+k1jpucTamXdWICguhzhejd27mmfWZLv9xVmtu6r
 w0sB0GaUPPpWJd7R45RrwVGmejWy3EdpxDbRYHHasshQM64wbfCARG+Vn
 42ro6AM73nu5HfXZYFDey1tZYsUd+ZKfIBn9saELTtd9e9QQ+z3uiI+pf
 S/DDi9RE2Wz+6QTBx79zan+KloWtoRmBOuO+6FUiZRtwA7MzKPCqLUqwu A==;
X-CSE-ConnectionGUID: Hz/EtkUgQF6Srns/maALsQ==
X-CSE-MsgGUID: 7LVARqawTviubUoD0onupA==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="90847571"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="90847571"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 02:59:19 -0700
X-CSE-ConnectionGUID: cYcw61wDRtuzTVUnx7mI/g==
X-CSE-MsgGUID: y3VkhspPQt2oMUZafNjq1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="234140621"
Received: from amiszcza-desk-dev.igk.intel.com (HELO localhost)
 ([10.91.214.39])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 02:59:18 -0700
From: Adam Miszczak <adam.miszczak@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@linux.intel.com
Subject: [PATCH i-g-t] tools/vmtb: Adjust BMG vGPU profile
Date: Thu, 21 May 2026 11:22:56 +0200
Message-Id: <20260521092256.619556-1-adam.miszczak@linux.intel.com>
X-Mailer: git-send-email 2.39.1
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

Reduce VRAM allocated for 1xVF vGPU profile for BMG (VRAM 12GB)
as the original value is too agressive and causes provisioning error.

Signed-off-by: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 .../vmtb/vmm_flows/resources/vgpu_profiles/Bmg_g21_12.json  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/vmtb/vmm_flows/resources/vgpu_profiles/Bmg_g21_12.json b/tools/vmtb/vmm_flows/resources/vgpu_profiles/Bmg_g21_12.json
index 75ca907ab..1b2e6111d 100644
--- a/tools/vmtb/vmm_flows/resources/vgpu_profiles/Bmg_g21_12.json
+++ b/tools/vmtb/vmm_flows/resources/vgpu_profiles/Bmg_g21_12.json
@@ -1,5 +1,5 @@
 {
-    "version": "1.2",
+    "version": "1.3",
     "PFResources": {
         "Default": "MinimumPFResources",
         "Profile": {
@@ -17,8 +17,8 @@
         "Profile": {
             "Bmg_12": {
                 "VFCount": 1,
-                "LocalMemoryEccOff": 12717129728,
-                "LocalMemoryEccOn": 12717129728,
+                "LocalMemoryEccOff": 12616466432,
+                "LocalMemoryEccOn": 12616466432,
                 "Contexts": 1024,
                 "Doorbells": 240,
                 "GGTTSize": 4026531840
-- 
2.39.1

