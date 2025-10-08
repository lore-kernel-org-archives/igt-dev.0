Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A85CCD188
	for <igt-dev@archiver.kernel.org>; Wed,  8 Oct 2025 21:02:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1543010E8E2;
	Wed,  8 Oct 2025 21:02:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f8utiBKP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6140C10E8DB
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Oct 2025 21:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759957361; x=1791493361;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1M7dkAvWBsU6ueDY8jhkdI4qjiC0vtdknaFlQINaiIs=;
 b=f8utiBKPqh5l6W5WMjNAwmMRYESdlDq5Bc5I+lvnma13xJNB2uSTI93t
 65GRqP0BOO4T5N1HdRLkQtGAkt827sMzDMdVBe3a7KJok3FALE2E8tRc/
 hs0rcAFiriWEyM+2r6denu+GjDuyqH9ZtHxZhDV3n3okj8CG2h9DyIkoH
 6lKgNm1sCsMSsDLys1Ac8+l6FFEv1SRTPCrRLjx50J2DAUupQYiIAj/2A
 eVpqTBHmulsyHtxlwmldKFPZs7hcGgGZEaR56vUNLd4X+laegH8Pl59Iy
 uj/azpKYJit9t3ug13qPKKs6OPDWyZeCl+NluRQFLCJaxyxOhW1F3TcmP Q==;
X-CSE-ConnectionGUID: /mfgQXHJTwS08A6Dc6lgeg==
X-CSE-MsgGUID: sNY/KcZ3TdSAeeSkOrJR9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="61867754"
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="61867754"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:02:41 -0700
X-CSE-ConnectionGUID: b4k4RyXfRX6ladCqW2zDKw==
X-CSE-MsgGUID: CBrFVRvRQcedgBxdpL75Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="184920025"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.61])
 by fmviesa005.fm.intel.com with ESMTP; 08 Oct 2025 14:02:40 -0700
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, matthew.d.roper@intel.com,
 shuicheng.lin@intel.com, brian3.nguyen@intel.com, alex.zuo@intel.com,
 nakshtra.goyal@intel.com, dnyaneshwar.bhadane@intel.com,
 gustavo.sousa@intel.com, Xin Wang <x.wang@intel.com>
Subject: [PATCH v3 6/6] lib/intel_device_info: Remove hardcoded .graphics_rel
 values
Date: Wed,  8 Oct 2025 21:02:36 +0000
Message-ID: <20251008210236.396859-7-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251008210236.396859-1-x.wang@intel.com>
References: <20251007050554.340485-1-x.wang@intel.com>
 <20251008210236.396859-1-x.wang@intel.com>
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

Remove hardcoded .graphics_rel values from device info structures.
For xe devices, the graphics_rel will be determined at runtime
via GMD_ID queries instead of static values.

Signed-off-by: Xin Wang <x.wang@intel.com>
---
 lib/intel_device_info.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index a853f9ab4..4c35a422f 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -505,7 +505,6 @@ static const struct intel_device_info intel_pontevecchio_info = {
 
 static const struct intel_device_info intel_lunarlake_info = {
 	.graphics_ver = 20,
-	.graphics_rel = 4,
 	.display_ver = 20,
 	.has_4tile = true,
 	.has_flatccs = true,
@@ -517,7 +516,6 @@ static const struct intel_device_info intel_lunarlake_info = {
 
 static const struct intel_device_info intel_battlemage_info = {
 	.graphics_ver = 20,
-	.graphics_rel = 1,
 	.display_ver = 14,
 	.has_4tile = true,
 	.has_flatccs = true,
@@ -529,7 +527,6 @@ static const struct intel_device_info intel_battlemage_info = {
 
 static const struct intel_device_info intel_pantherlake_info = {
 	.graphics_ver = 30,
-	.graphics_rel = 0,
 	.display_ver = 30,
 	.has_4tile = true,
 	.has_flatccs = true,
-- 
2.43.0

