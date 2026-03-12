Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E99AE11258BE
	for <igt-dev@archiver.kernel.org>; Thu, 12 Mar 2026 16:03:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C5DE10EA61;
	Thu, 12 Mar 2026 16:03:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vs0c1O2A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DDF110EA5D
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2026 16:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773331421; x=1804867421;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=dgy2aiNTVuh4tfnAG7AdHfNEz4RHFItT4n6inLtTyTQ=;
 b=Vs0c1O2Aj03jsh0RSKSYnO3tkdqfRbgWlOv450uBghAkKx7581/sWV3i
 UW8ezAzJ003NsylXB0KqFE0BPI3wTRlAYlh+f9d9phvKzzLKH3DM2xgwL
 fnAgQK/Gf1ROdVawk7j6VFg1y5jm6PbiHoa3sb24lICiJOzXZMfyg+Jhr
 h5qjqXRsm1Q+YmgKdFQZrpkV3sDhwtakPg62lg4WUI/c/kfCD/Mu7pl5R
 /nDqXIdSAj+xuXYGH6+M+Tn2M83Z/2EskKUbfhDohVBBoRWgp1WVX8JTU
 CCL4e7nuF7H2nwND+rlaR2pyBno6wRO8tdtVERoQ4aWLZ1Ay945GshmrP A==;
X-CSE-ConnectionGUID: mZnUuijTQFGZrixfpINi4w==
X-CSE-MsgGUID: X9cbpA8+TMmf9owZKXR84g==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="77037690"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="77037690"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 09:03:41 -0700
X-CSE-ConnectionGUID: 284nEGIzT822F2J1hScv7g==
X-CSE-MsgGUID: 6foPAxOvRiqM7Bse+i0/4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="225839083"
Received: from himanshu-h97m-d3h.iind.intel.com ([10.223.55.10])
 by orviesa005.jf.intel.com with ESMTP; 12 Mar 2026 09:03:39 -0700
From: himanshu.girotra@intel.com
To: ramadevi.gandi@intel.com, nishit.sharma@intel.com,
 aditya.chauhan@intel.com, kamil.konieczny@intel.com,
 shekhar.chauhan@intel.com, zbigniew.kempczynski@intel.com,
 igt-dev@lists.freedesktop.org
Subject: [PATCH v3 i-g-t 4/4] lib: Add WildcatLake to compute kernel tables
Date: Thu, 12 Mar 2026 21:33:28 +0530
Message-ID: <20260312160328.9462-5-himanshu.girotra@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260312160328.9462-1-himanshu.girotra@intel.com>
References: <20260312160328.9462-1-himanshu.girotra@intel.com>
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

From: Himanshu Girotra <himanshu.girotra@intel.com>

WildcatLake uses graphics IP 30.03 (Xe3_LPG), distinct from PTL's
30.00. The compute kernel lookup uses exact ip_ver matching, so without
a dedicated entry for IP_VER(30, 03), compute tests would skip on WCL
with "GPU not supported".

Add IP_VER(30, 03) entries to:
- intel_compute_square_kernels[]
- intel_compute_batches[]
- intel_compute_preempt_batches[]

Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
---
 lib/intel_compute.c                | 11 +++++++++++
 lib/intel_compute_square_kernels.c | 11 +++++++++++
 2 files changed, 22 insertions(+)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 0d1e0290f..b3336a7b5 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -2299,6 +2299,11 @@ static const struct {
 		.compute_exec = xe2lpg_compute_exec,
 		.compat = COMPAT_DRIVER_XE,
 	},
+	{
+		.ip_ver = IP_VER(30, 03),
+		.compute_exec = xe2lpg_compute_exec,
+		.compat = COMPAT_DRIVER_XE,
+	},
 	{
 		.ip_ver = IP_VER(30, 04),
 		.compute_exec = xe2lpg_compute_exec,
@@ -2803,6 +2808,12 @@ static const struct {
 		.compat = COMPAT_DRIVER_XE,
 		.preempt_type = PREEMPT_TGP | PREEMPT_WMTP,
 	},
+	{
+		.ip_ver = IP_VER(30, 03),
+		.compute_exec = xe2lpg_compute_preempt_exec,
+		.compat = COMPAT_DRIVER_XE,
+		.preempt_type = PREEMPT_TGP | PREEMPT_WMTP,
+	},
 	{
 		.ip_ver = IP_VER(30, 04),
 		.compute_exec = xe2lpg_compute_preempt_exec,
diff --git a/lib/intel_compute_square_kernels.c b/lib/intel_compute_square_kernels.c
index 7607fadc3..a612092fc 100644
--- a/lib/intel_compute_square_kernels.c
+++ b/lib/intel_compute_square_kernels.c
@@ -75,6 +75,17 @@ const struct intel_compute_kernels intel_compute_square_kernels[] = {
 		.loop_kernel = xe3lpg_kernel_loop_bin,
 		.loop_kernel_size = sizeof(xe3lpg_kernel_loop_bin),
 	},
+	{
+		.ip_ver = IP_VER(30, 03),
+		.size = sizeof(xe3lpg_kernel_square_bin),
+		.kernel = xe3lpg_kernel_square_bin,
+		.long_kernel = xe3lpg_kernel_count_bin,
+		.long_kernel_size = sizeof(xe3lpg_kernel_count_bin),
+		.sip_kernel = xe3lpg_kernel_sip_bin,
+		.sip_kernel_size = sizeof(xe3lpg_kernel_sip_bin),
+		.loop_kernel = xe3lpg_kernel_loop_bin,
+		.loop_kernel_size = sizeof(xe3lpg_kernel_loop_bin),
+	},
 	{
 		.ip_ver = IP_VER(30, 04),
 		.size = sizeof(xe3lpg_kernel_square_bin),
-- 
2.50.1

