Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FAEAF513FA
	for <igt-dev@archiver.kernel.org>; Fri,  6 Mar 2026 04:17:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4B4E10E346;
	Fri,  6 Mar 2026 04:17:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EQzciFP2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FBDF10E333
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Mar 2026 04:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772770652; x=1804306652;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=oK4P5J7bRdck8Q6exVlSyVrUQJqy5I+FRRtGYFdINbA=;
 b=EQzciFP2lcTJTBukJLz6zGXraVM3CY/k8r7jmH9hQ7L+4lcyxeTFg/of
 zGVDyCbadMvtfjIBlZea4fPZoSx8zcj16OK74Q0nsw9J7of+ON6G1S48Z
 nqn3LjpuAb3i4iEU+I42pl2jmhJle+1qdtp1PMPK0pIEcQqMTfGq9jRSq
 oKrCUNfoNdWHjec0UOjJWzVB488fghCx0yP8Wfuje7W/86wgndHVzgDOC
 xmUmj5HYHzLKK7qOhNY7uAdZXQKZnsHqOYLEf6+AUQLaajj2/q/9suwLT
 ++LDc/rwKq4ncHgu5bETqvQ0sDIlxG0TQEGBxK1Hzta8P7DdePhjR2du2 Q==;
X-CSE-ConnectionGUID: BzhgWReyTieSn46ANvN+hg==
X-CSE-MsgGUID: +hXuWjs1Qh+iO6N6bepUzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="85223358"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="85223358"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 20:17:32 -0800
X-CSE-ConnectionGUID: WY1LbSHcTISDd0mbaslopA==
X-CSE-MsgGUID: USs2bLSgROixVrBbaq4IMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="256799131"
Received: from priyanka.iind.intel.com ([10.190.216.153])
 by orviesa001.jf.intel.com with ESMTP; 05 Mar 2026 20:17:31 -0800
From: priyanka.dandamudi@intel.com
To: igt-dev@lists.freedesktop.org,
	priyanka.dandamudi@intel.com
Subject: [PATCH i-g-t 3/5] tests/xe_pat: Add pat indices for XA App Transient
 in false-sharing test
Date: Fri,  6 Mar 2026 09:47:24 +0530
Message-ID: <20260306041720.1760867-10-priyanka.dandamudi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306041720.1760867-7-priyanka.dandamudi@intel.com>
References: <20260306041720.1760867-7-priyanka.dandamudi@intel.com>
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Added PAT 18,19 indices to test new XA WB-App Transient where buffer is being
shared by both CPU and GPU.XA WB-App Transient is a feature where
specific l3 cache lines marked as XA WB-App Transient will get invalidated
instead of whole l3 cache when CPU wanted to access the same buffer of
GPU. These pat indices are added as part of false-sharing test.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 tests/intel/xe_pat.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index d160dde9d..166941812 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -1373,6 +1373,12 @@ const struct fs_pat_entry fs_xe3p_xpc[] = {
 	{ 4, "cpu-wb-gpu-uc-1way", DRM_XE_GEM_CPU_CACHING_WB, true },
 };
 
+const struct fs_pat_entry fs_xe3p_lpg[] = {
+	{ 2, "cpu-wb-gpu-l3-2way", DRM_XE_GEM_CPU_CACHING_WB, true },
+	{ 18, "cpu-wc-gpu-xa-non-coh", DRM_XE_GEM_CPU_CACHING_WC, true },
+	{ 19, "cpu-wb-gpu-xa-1way", DRM_XE_GEM_CPU_CACHING_WB, true },
+};
+
 #define CPUDW_INC   0x0
 #define GPUDW_WRITE 0x4
 #define GPUDW_READY 0x40
@@ -1517,6 +1523,9 @@ static void false_sharing(int fd)
 	if (intel_graphics_ver(dev_id) == IP_VER(35, 11)) {
 		num_entries = ARRAY_SIZE(fs_xe3p_xpc);
 		fs_entries = fs_xe3p_xpc;
+	} else if (intel_graphics_ver(dev_id) == IP_VER(35, 10)) {
+		num_entries = ARRAY_SIZE(fs_xe3p_lpg);
+		fs_entries = fs_xe3p_lpg;
 	} else if (graphics_ver == 20) {
 		if (is_dgfx) {
 			num_entries = ARRAY_SIZE(fs_xe2_discrete);
-- 
2.43.0

