Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B169C2D0CD
	for <igt-dev@archiver.kernel.org>; Thu, 15 May 2025 07:17:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B28C610E06C;
	Thu, 15 May 2025 07:17:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hzKyyth6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B190910E06C
 for <igt-dev@lists.freedesktop.org>; Thu, 15 May 2025 07:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747293472; x=1778829472;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+vhnKzOBxEGUa8HhU/pNHnV6NqAPldwi0kbt8Hvg1TY=;
 b=hzKyyth66O8bR9B8p0ByxqSfQ+us5bJwpje5WXy1uqsDf1wkdT9G3j2X
 AzanpVWQasab2IcsuYtne7af8pVxD04shFETdoHtTGtvE6egnOKJileUU
 DXrA1j+emLUoahrdLTuWLc2oFCOYhw/ElCSMvIIhYzpPqp2GXD94NVUzg
 MCZjUuB3TuoUtUSxlTxxVAeBTJPVfknXohlRKWu7TPWUqTJ+U4jcHaj1U
 iuTDLVzVfeFvKHwSCKEUuDY8UsYAtYdiwAbypC4V4u6KKX60Qln02DZYz
 Z3NvoAFW8+L4yHE4axojyoFfufvyBCVsHBnm8ihWIXqBm6FbBoLgDVcWQ g==;
X-CSE-ConnectionGUID: bSgwRDxTTNC+PW7A7/gEHQ==
X-CSE-MsgGUID: 2ml+BrB9QP2AYOLXs2NDJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="49151367"
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; d="scan'208";a="49151367"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 00:17:49 -0700
X-CSE-ConnectionGUID: M5ygSTnyT5iy9P/skwfDpQ==
X-CSE-MsgGUID: jmm1rHvHR12aepsnh/1FMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; d="scan'208";a="143478642"
Received: from artdev273.igk.intel.com ([172.28.176.71])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 00:17:49 -0700
From: Jan Sokolowski <jan.sokolowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jan Sokolowski <jan.sokolowski@intel.com>
Subject: [PATCH i-g-t v2 1/1] tests/intel/xe_render_copy: Skip tests on
 renderless cards
Date: Thu, 15 May 2025 07:18:32 +0000
Message-Id: <20250515071832.63953-1-jan.sokolowski@intel.com>
X-Mailer: git-send-email 2.34.1
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

As some cards (eg. PVC) don't have render,
these tests will fail by definition.

Skip render tests on cards that don't have render.

Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
---

v2: made the check general instead of targetting only one card.

---
 tests/intel/xe_render_copy.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/intel/xe_render_copy.c b/tests/intel/xe_render_copy.c
index fadfd162c..d420191d6 100644
--- a/tests/intel/xe_render_copy.c
+++ b/tests/intel/xe_render_copy.c
@@ -697,6 +697,10 @@ igt_main_args("dpiW:H:", NULL, help_str, opt_handler, NULL)
 
 	igt_fixture {
 		xe = drm_open_driver(DRIVER_XE);
+
+		/* As some cards don't have render, we should skip these. */
+		igt_require(xe_has_engine_class(xe, DRM_XE_ENGINE_CLASS_RENDER));
+
 		bops = buf_ops_create(xe);
 		srand(time(NULL));
 		set = xe_get_memory_region_set(xe, DRM_XE_MEM_REGION_CLASS_SYSMEM);
-- 
2.34.1

