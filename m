Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C875CD98F2
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jun 2026 14:12:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A9A110E7CC;
	Thu, 18 Jun 2026 14:12:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fhwipjyD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04E3710E7CC
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jun 2026 14:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781791859; x=1813327859;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4x3UmCek/zdV9rrnxxY5pFmf2ooxbDkZKiSYYSra/28=;
 b=fhwipjyDlGqPGQZse9zEazdReOD057Ia9qE3KG7lzbdPb5qh7o5z63na
 r/zPpf4Bud2yXg9h3YgCUIsKhkZhkhNnmr/pntJmmwfBK5Ijutufzh/gc
 +xLkLqeHd9n1YBFBrGJa0hNPfWb/ifAF7shEbuVLP9xU/HeI0uOPAl9ez
 NesE/nAwwghk+tr4y8rmrLWSLi3vU69xFRJD6EK/6qPHSGrMWCfT9oikn
 ssWmy6KyxcUjW/oTZpRnRgNBnPzI2nSZ3foJgXGyBOpS5Xiff1HmvzLqG
 wYPThzmZgvzRcL/s9h8kUdRLXXFMTh2imtecQpkjqyQFb6Rif2JTkMKuV Q==;
X-CSE-ConnectionGUID: A2lW74XzQuqenuMbGPG6wA==
X-CSE-MsgGUID: VDpynPNURCClxVLbs2Xo0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="86304759"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="86304759"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 07:10:56 -0700
X-CSE-ConnectionGUID: bpBAb+7yRBCYDw2gmZCscA==
X-CSE-MsgGUID: WEsfV9l0QpKux1PbHuLchQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="246003994"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.2])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2026 07:10:54 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH i-g-t 5/5] tests/gem_exec_lut_handle: use
 hars_petruska_f54_1_random() from lib/rand
Date: Thu, 18 Jun 2026 17:09:53 +0300
Message-ID: <5557fc29347fa3a35254ea56c57d81766e6973c0.1781791747.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781791747.git.jani.nikula@intel.com>
References: <cover.1781791747.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Remove the local duplicate of hars_petruska_f54_1_random() by switching
to use lib/rand.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tests/intel/gem_exec_lut_handle.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/tests/intel/gem_exec_lut_handle.c b/tests/intel/gem_exec_lut_handle.c
index fac7f2fbb45f..6ed304fc6d5e 100644
--- a/tests/intel/gem_exec_lut_handle.c
+++ b/tests/intel/gem_exec_lut_handle.c
@@ -40,6 +40,8 @@
 #include "i915/gem.h"
 #include "i915/gem_create.h"
 #include "igt.h"
+#include "igt_rand.h"
+
 /**
  * TEST: gem exec lut handle
  * Description: Exercises the basic execbuffer using the handle LUT interface.
@@ -65,15 +67,7 @@ int target[MAX_NUM_RELOC];
 struct drm_i915_gem_exec_object2 gem_exec[MAX_NUM_EXEC+1];
 struct drm_i915_gem_relocation_entry mem_reloc[MAX_NUM_RELOC];
 
-static uint32_t state = 0x12345678;
-
-static uint32_t
-hars_petruska_f54_1_random (void)
-{
-#define rol(x,k) ((x << k) | (x >> (32-k)))
-    return state = (state ^ rol (state, 5) ^ rol (state, 24)) + 0x37798849;
-#undef rol
-}
+static uint32_t random_state = 0x12345678;
 
 static int has_exec_lut(int fd)
 {
@@ -164,7 +158,7 @@ int igt_simple_main()
 					execbuf.flags |= I915_EXEC_NO_RELOC;
 
 				for (j = 0; j < m; j++) {
-					target[j] = hars_petruska_f54_1_random() % n;
+					target[j] = hars_petruska_f54_1_random(&random_state) % n;
 					reloc[j].target_handle = target[j];
 					reloc[j].presumed_offset = -1;
 				}
-- 
2.47.3

