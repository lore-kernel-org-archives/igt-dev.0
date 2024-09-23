Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0399DCF9C6F
	for <igt-dev@archiver.kernel.org>; Mon, 23 Sep 2024 20:46:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1AB110E494;
	Mon, 23 Sep 2024 20:46:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LOit+mcS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E16C10E494
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Sep 2024 20:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727124363; x=1758660363;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=5DRAhTvaT8zwDI0/no/s+yDZyrYfzxiP22GzknIz2vs=;
 b=LOit+mcSHZneTAoeY08LHSw3QqiPaNeHXrek2hHR9E9Vmb4aWkIozFS4
 xkJ5mvoHWM7BXlDTMXmpY3TcwX4qSPqF1cOUz/NwBeVxtgbCm8i405mHM
 YalZ6c9j6YaISJSHh+GQQW2uzTXoMy5YSpkMU8VeIKW0khMJX7rDSib42
 fj+Y1nXciUMwiC4zABJTR37Xh2wZk2mfqbO5iZemHmADcLLVh9TKPAAQd
 HyFDuiICwiTVpwFZh/sKjv26W7Lu0N1MAbSVWnEXr3GNMsPA1MopdHiBm
 YYbrJ6KinF1+ZJXnOkOQFjXr/lB0hPdfqN88O3ajOIU0ivWPB0n2e+42z w==;
X-CSE-ConnectionGUID: F8R7xdGgS9WbaQAK4IpaSg==
X-CSE-MsgGUID: LPZ+fStQS4eopXD7JxzRpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="25955980"
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="25955980"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 13:46:03 -0700
X-CSE-ConnectionGUID: +kX0Ams+RT+rdebZ/7p3FA==
X-CSE-MsgGUID: NY6U6GhoTNCjNZVBAhOFQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="71326676"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 23 Sep 2024 13:46:01 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 23 Sep 2024 23:46:00 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 1/6] tests/gem_ctx_engines: Fix gen6+ check
Date: Mon, 23 Sep 2024 23:45:52 +0300
Message-ID: <20240923204557.32123-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240923204557.32123-1-ville.syrjala@linux.intel.com>
References: <20240923204557.32123-1-ville.syrjala@linux.intel.com>
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Put the parens in the correct spot so that we are actually
checking for gen6+ instead of 'intel_gen() != 0' (which is
always true btw since intel_gen() returns -1 when it doesn't
detect a valid device).

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/intel/gem_ctx_engines.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/gem_ctx_engines.c b/tests/intel/gem_ctx_engines.c
index 94a47ecc3079..24240df66062 100644
--- a/tests/intel/gem_ctx_engines.c
+++ b/tests/intel/gem_ctx_engines.c
@@ -643,7 +643,7 @@ igt_main
 		const intel_ctx_t *ctx;
 
 		igt_require(gem_scheduler_enabled(i915));
-		igt_require(intel_gen(intel_get_drm_devid(i915) >= 6));
+		igt_require(intel_gen(intel_get_drm_devid(i915)) >= 6);
 
 		ctx = intel_ctx_create_all_physical(i915);
 		for_each_ctx_engine(i915, ctx, e) {
-- 
2.44.2

