Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20FDDC282D0
	for <igt-dev@archiver.kernel.org>; Mon,  3 Mar 2025 23:15:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D235210E3FF;
	Mon,  3 Mar 2025 23:15:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gcVXe7Fs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B662510E0A0
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Mar 2025 23:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741043707; x=1772579707;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=bTiV7xc1XCd/oFKhXyId+EaLveZhFGhxvAWFnBC1C6o=;
 b=gcVXe7FsRmQCO5erFOMySBax0CTt0rBLBNQd5I3sgVm3dOrifOAZQCpA
 UY4GEY0B2vQ62Ju1lATjARULOHzNK5fN0INu25KPpM76x5mpcNaN20WtJ
 vC1wk/2s7NoHQFiwSMNkbaUJfHrBZgAQhSfzlMaCvvUv1NE9GcpgxYZyg
 /31JeFsokk3EhM+pOt/o+EUALYtftFZ+Z6sZZwT2aoW+k7lOA3ncH6APa
 2fqBOVYeKbtZ57lRuegL8ExApsJV0jpqcTXuKLoj/5Ap0CH1RBm+Nhp7v
 WFjFhHvol7P1ywXj4Ve7dfPSgKFjA0Yu4XDWtk54f5zhM2O1EIV2Iyk1p w==;
X-CSE-ConnectionGUID: okef1RX9THuLpVUFR5U8gA==
X-CSE-MsgGUID: oLFI301PR6Cha03J2WzaAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="41793037"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="41793037"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 15:15:07 -0800
X-CSE-ConnectionGUID: 4PP79vg4Tf6sxs0akQSlGQ==
X-CSE-MsgGUID: izfOggPDSN+cj7Sf9h0c0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118716680"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.25])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 15:15:07 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v2 02/14] tests/intel/xe_oa: Drop unused macro
Date: Mon,  3 Mar 2025 15:14:50 -0800
Message-Id: <20250303231502.135720-3-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250303231502.135720-1-umesh.nerlige.ramappa@intel.com>
References: <20250303231502.135720-1-umesh.nerlige.ramappa@intel.com>
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

Drop unused for helper

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel/xe_oa.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 562a4edf2..5c68f1d79 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -4788,13 +4788,6 @@ static const char *xe_engine_class_name(uint32_t engine_class)
 		igt_dynamic_f("%s-%d-%s", xe_engine_class_name(hwe->engine_class), \
 			      hwe->engine_instance, str)
 
-#define __for_one_render_engine_0(hwe) \
-	xe_for_each_engine(drm_fd, hwe) \
-		if (hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER) \
-			break; \
-	for_each_if(hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER) \
-		igt_dynamic_f("rcs-%d", hwe->engine_instance)
-
 #define __for_one_render_engine(hwe)	      \
 	for (int m = 0, done = 0; !done; m++) \
 		for_each_if(m < xe_number_engines(drm_fd) && \
-- 
2.34.1

