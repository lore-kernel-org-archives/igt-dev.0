Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A0C3EF48F0
	for <igt-dev@archiver.kernel.org>; Fri, 13 Feb 2026 08:46:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3524B10E7B1;
	Fri, 13 Feb 2026 08:46:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GpNUXOde";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E2EA10E7B8
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Feb 2026 08:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770972371; x=1802508371;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=eSaQw3BHwd9+3ldgyUj2AC9W5xvmdXV753EkEfQUp5g=;
 b=GpNUXOdeHiT1Vpbpsi0tGysl5eYo48IThtskPoZvt8X/DQE5e9B+B73a
 CPC6Mmsz9PcbNt8R3cDDhAxWqnwheo/PzTPT9oibYviuKHMoZhlgktgSx
 kbE07uC8qkKgebd9fO9mTesezjea0B4C8HMn4KXicMsaacP71QY2q9+5p
 WhrWMZK0aBqbbZVlBvT3qfeuPQSkg91E0kZwfKaIBlQl0jENrEZfKGR9s
 acmd9JZkvQfTPltDaVKr5b5XEto3/p3Xyt9ZRc277n2fvlir8w9qHdyd/
 zyqq+3jXjDrfmNdHz3F0YyA/lmI+86LjIJ7SR9qcrdE/eZiTgyXLPVqdJ A==;
X-CSE-ConnectionGUID: ZRl00EaQQkulbYhBGzFQmQ==
X-CSE-MsgGUID: KUedfHkpSt2oWRSWme0ZNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="72142241"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="72142241"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 00:46:11 -0800
X-CSE-ConnectionGUID: 1eiLtnBwSsaaC8OZFXgwtw==
X-CSE-MsgGUID: Dm3yQYFLQ3aAh8YPwshEVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="217337016"
Received: from priyanka.iind.intel.com ([10.190.216.153])
 by fmviesa005.fm.intel.com with ESMTP; 13 Feb 2026 00:46:10 -0800
From: priyanka.dandamudi@intel.com
To: zbigniew.kempczynski@intel.com, matthew.auld@intel.com,
 igt-dev@lists.freedesktop.org, priyanka.dandamudi@intel.com
Subject: [PATCH i-g-t 3/5] tests/xe_pat: Add pat indices for XA App Transient
 in false-sharing test
Date: Fri, 13 Feb 2026 14:16:01 +0530
Message-ID: <20260213084603.1404162-4-priyanka.dandamudi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260213084603.1404162-1-priyanka.dandamudi@intel.com>
References: <20260213084603.1404162-1-priyanka.dandamudi@intel.com>
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
---
 tests/intel/xe_pat.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index 918f59c9e..132ac4773 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -1307,6 +1307,12 @@ const struct fs_pat_entry fs_xe3p_xpc[] = {
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
@@ -1451,6 +1457,9 @@ static void false_sharing(int fd)
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

