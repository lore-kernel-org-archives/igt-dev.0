Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D620CF0427
	for <igt-dev@archiver.kernel.org>; Tue,  8 Oct 2024 21:49:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F24610E5F6;
	Tue,  8 Oct 2024 21:49:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SCvDbAhq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A178C10E5F6
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Oct 2024 21:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728424188; x=1759960188;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VayWLnduf5y4rgFxN1CXhGRkNouqj2yWmxCz+tXnXY4=;
 b=SCvDbAhqU8qvyAk9AdQEzcwKQd/jutDQu6hh6HD+y0b4d+SUkAoPnPkJ
 muTLYGYOC8r6D3xkJBMuEo7eCXAUYIGNfR059eDVvq6FevfMCtfCM5KH9
 VLkEWfHlksNwtMPlEknSq0nhUFyFZde8ETeOIKD3790z3A8n4QqK/ZUWc
 GCspRB8Ug66CnZWjkaqSPWePCZeYQ3jwgsOV9/WgRGjQarXlCND59Erm6
 cQBr3ViSi10IbTP22JTVwLphSAhOrBZFwFRkvbpj8+stBev3LdhVIS93u
 ttpVJI1OVlXH0zJl19yoFKRRXe6qf5vJWXIuzWjGVf02FPeuyv6S6kGEh g==;
X-CSE-ConnectionGUID: eGXGvOOOSq68xWdiOU+UTg==
X-CSE-MsgGUID: Pnr2r74MTiSDzgZpzn33Zg==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27832727"
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; d="scan'208";a="27832727"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 14:49:47 -0700
X-CSE-ConnectionGUID: B7gizImwQhiJRR2ZuRWZhA==
X-CSE-MsgGUID: YO+40Be2TduagnyoT5RkRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; d="scan'208";a="76114556"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 08 Oct 2024 14:49:45 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 09 Oct 2024 00:49:44 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] tools/intel_gpu_top: Fix intel_gpu_top for pre-snb
Date: Wed,  9 Oct 2024 00:49:44 +0300
Message-ID: <20241008214944.27549-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.2
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

__I915_PMU_REQUESTED_FREQUENCY is not available on pre-snb (*)
so checking for it breaks intel_gpu_top completely for those
machines. Check __I915_PMU_INTERRUPTS instead, which I believe
is available on everything. Another option would be
__I915_PMU_SOFTWARE_GT_AWAKE_TIME.

* we do have frequency information on ilk, but we've not
  reverse engineered the hw unit<->Hz conversion factor so
  exposing it as is might be a bit confusing...

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_gpu_top.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index 9b65ae4eb941..a608b894d3de 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -563,7 +563,7 @@ static int get_num_gts(uint64_t type)
 
 	errno = 0;
 	for (cnt = 0; cnt < MAX_GTS; cnt++) {
-		fd = igt_perf_open(type, __I915_PMU_REQUESTED_FREQUENCY(cnt));
+		fd = igt_perf_open(type, __I915_PMU_INTERRUPTS(cnt));
 		if (fd < 0)
 			break;
 
-- 
2.45.2

