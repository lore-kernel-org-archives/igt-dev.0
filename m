Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93144C27C53
	for <igt-dev@archiver.kernel.org>; Fri,  7 Jun 2024 15:36:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 557B810ECBD;
	Fri,  7 Jun 2024 15:36:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MpxZdjSy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C31010ECBD
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jun 2024 15:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717774603; x=1749310603;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vZg+UAMDydOY4fzgC620NdYWiO7u5cJHImWlbf2ryA4=;
 b=MpxZdjSyi/C6hCuVIIHnFnFeO0XxzBpfQWRRsQfY7IUL+wzI1jXN6Tz9
 SwkfSgO2Bdv/q3Gxh3ohRt376UjRq84r+raKkXTh4R6y3al8hiV47OKH/
 84rLwfpqdsJOXLKeyJ9H5c/fZQFMj+633Z3TNvWuEH/to4rwN5QlBEXuN
 +vK8gT9Z92xh3acYfinoMSqOxzcLpDBYFCKTgobMf/r8K2yJ3pMaNSX1L
 o40ss5ESE2EtdsgVb3vv6wNZc4Z7w2cHw0kuXMPLsRLqrqweq1vmgpCAO
 G3AfCfbViaFHPsvTryxhE8mkcTYdm/3XMfgt3npX6r+7VAz4TQGNLNrJ7 Q==;
X-CSE-ConnectionGUID: s68aIwV8Tk20H+afehVwww==
X-CSE-MsgGUID: 2hgiLS89RcG0v/ct9C4MHw==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14620066"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="14620066"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 08:36:43 -0700
X-CSE-ConnectionGUID: 4PtV1qBgRFaaIWecgFzD3w==
X-CSE-MsgGUID: OcFDoZ2jRaCXJTN6r8N5+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38805263"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.84])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 08:36:42 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v1 2/7] tests/core_hotunplug: set known chipset before
 tests
Date: Fri,  7 Jun 2024 17:36:14 +0200
Message-ID: <20240607153629.52596-3-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240607153629.52596-1-kamil.konieczny@linux.intel.com>
References: <20240607153629.52596-1-kamil.konieczny@linux.intel.com>
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

Set chipset for all known drivers, not only for i915.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/core_hotunplug.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index db7a5c5e8..3971b94ff 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -685,9 +685,9 @@ igt_main
 		fd_drm = __drm_open_driver(DRIVER_ANY);
 		igt_skip_on_f(fd_drm < 0, "No known DRM device found\n");
 
-		if (is_i915_device(fd_drm)) {
-			priv.chipset = DRIVER_INTEL;
+		priv.chipset = drm_get_chipset(fd_drm);
 
+		if (is_i915_device(fd_drm)) {
 			gem_quiescent_gpu(fd_drm);
 			igt_require_gem(fd_drm);
 
-- 
2.43.0

