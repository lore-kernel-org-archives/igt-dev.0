Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C6CBCAC592
	for <igt-dev@archiver.kernel.org>; Mon, 22 Sep 2025 06:10:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E42E710E012;
	Mon, 22 Sep 2025 06:10:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XfF7Ctya";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC9F210E012
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Sep 2025 06:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758521446; x=1790057446;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/R0+8G+rfESZI1BtDixhWwSJu5MBPSJ4OaKW25N1fA8=;
 b=XfF7Ctyai+c7nI8/mzdXKiQOCpTSf05Z/7uUqOgZ/UEdZNix618dvAaW
 jz0WjF+rjUDFf8T+Q52eOI+/qFx1v3/2LgOT8G/PEylL4kQApNW7Z7EZm
 qGJKW5JPwfhFHC/wgUv/2GXdTOdZRRG+U3APxMaE6l+CY77XAdnBVea5b
 DmNW+7NlN7i58JFfTbmuOcF9Y5ap6+uk1GISdI9alrxAsLwcSwWG02XOK
 VMY5QTlA2rM0cIi72UQAo9X6Dhr4J7mu0zUYoG+iwpVIO9lttf5xLQiAr
 tGwzKpy95T5/LCQ7CcZ8P6D4ld3rUOFUDCPwzYT7t30EZ54GRdA2E2gZM Q==;
X-CSE-ConnectionGUID: KV2SDpuwSvS4A7j4Y+v9rw==
X-CSE-MsgGUID: 21+wAhCsSUWE5+qb2F8eqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="60938266"
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; d="scan'208";a="60938266"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2025 23:10:45 -0700
X-CSE-ConnectionGUID: Jn5I8pBmQWiKIRfvRhpOtw==
X-CSE-MsgGUID: eg8KsGsQS7uk/q5iICUv+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; d="scan'208";a="176768429"
Received: from jeevan24.iind.intel.com ([10.223.74.160])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2025 23:10:44 -0700
From: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com,
 Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
Subject: [PATCH i-g-t] lib/compute: choose BO alignment based on driver type
Date: Mon, 22 Sep 2025 11:46:21 +0530
Message-ID: <20250922061621.509408-1-smitha.balasubramanyam@intel.com>
X-Mailer: git-send-email 2.43.0
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

Previously, BO size alignment behavior was inconsistent:
 - For XeHP compute, xe_get_default_alignment() was used.
 - For XeLP compute, a fixed alignment value was used.

This patch updates the logic to select alignment dynamically
based on the driver type:

 - For Xe: use xe_get_default_alignment()
 - For i915: use gem_detect_safe_alignment()

Signed-off-by: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
---
 lib/intel_compute.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 147dd2916..8011e8360 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -1133,8 +1133,11 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
 
 	bo_execenv_create(fd, &execenv, eci, user);
 
-	/* Set dynamic sizes */
-	bo_dict[0].size = ALIGN(size, xe_get_default_alignment(fd));
+	/* Set dynamic sizes depending on the driver type(xe vs i915) */
+	bo_dict[0].size = ALIGN(size,
+				(execenv.driver == INTEL_DRIVER_XE) ?
+				xe_get_default_alignment(fd) :
+				gem_detect_safe_alignment(fd));
 	bo_dict[4].size = size_input(execenv.array_size);
 	bo_dict[5].size = size_output(execenv.array_size);
 
@@ -1733,8 +1736,11 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
 
 	bo_execenv_create(fd, &execenv, eci, user);
 
-	/* Set dynamic sizes */
-	bo_dict[0].size = ALIGN(size, 0x10000);
+	/* Set dynamic sizes depending upon the driver type (xe vs i915)*/
+	bo_dict[0].size = ALIGN(size,
+				(execenv.driver == INTEL_DRIVER_XE) ?
+				xe_get_default_alignment(fd) :
+				gem_detect_safe_alignment(fd));
 	bo_dict[4].size = size_input(execenv.array_size);
 	bo_dict[5].size = size_output(execenv.array_size);
 
-- 
2.43.0

