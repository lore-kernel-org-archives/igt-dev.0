Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D0B6C5CFDB
	for <igt-dev@archiver.kernel.org>; Fri, 14 Aug 2026 16:08:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20EBD10E11F;
	Fri, 14 Aug 2026 16:08:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nfwf2mua";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF62B10E11F
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Aug 2026 16:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786723611; x=1818259611;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ypmTmoshiUveI9LzUeCHMmeXioQCyJCOynXfBIbsHnw=;
 b=nfwf2muaLYAmXYP2zIXzbnx9linX+jFq96mJeHgfzwMV+UHjx9FXn57T
 6axZByrRFWix1kDrHM+Nr76NoCQb3NeYV33u7lFG8NJkAg2mrmBje2r1t
 v/BVpbASHC3G3pOU/D6k3HecGrzp/vPP2teU/inkPRfNT25GifZZP0zQ4
 x5L4TsLHZWtkWhV5W5Cu1g5vx96W81STvrstLK1A8KrA9npNVPLvwia7V
 IJVsjDG7Ij0N/TllbtntHZtAsfF6YEJQNUSxUZRTdMQuvPdxF4/d5DmVW
 vW1Xvs+HPEnCmXHKHObPvfl1cBeuz3tHHMv0e5KTsW8ks6OnTQv1G9YWB Q==;
X-CSE-ConnectionGUID: dtLhrMC4QfiBeZPkTdcjAg==
X-CSE-MsgGUID: TCtRvP5BTJm4I6sMiMadRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="97893311"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="97893311"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 09:06:51 -0700
X-CSE-ConnectionGUID: TjHNLIzNRRatHWFb7sRdyA==
X-CSE-MsgGUID: bqNUz3vMSLeCogLf0714jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="289059940"
Received: from unknown (HELO himanshu-H97M-D3H.iind.intel.com) ([10.223.55.10])
 by fmviesa001.fm.intel.com with ESMTP; 14 Aug 2026 09:06:50 -0700
From: himanshu.girotra@intel.com
To: igt-dev@lists.freedesktop.org,
	ramadevi.gandi@intel.com
Subject: [PATCH i-g-t 1/2] intel-ci: Add CRI core blocklist
Date: Fri, 14 Aug 2026 21:36:47 +0530
Message-ID: <20260814160648.19715-2-himanshu.girotra@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260814160648.19715-1-himanshu.girotra@intel.com>
References: <20260814160648.19715-1-himanshu.girotra@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Introduce core blocklist for the CRI platform containing
CRI-specific core test exclusions. Also add this blocklist file
to meson.build so that this can be used in execution.

Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
---
 tests/intel-ci/meson.build               |  1 +
 tests/intel-ci/xe.cri.core.blocklist.txt | 53 ++++++++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 tests/intel-ci/xe.cri.core.blocklist.txt

diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
index 3dab41898..c446b13a8 100644
--- a/tests/intel-ci/meson.build
+++ b/tests/intel-ci/meson.build
@@ -14,6 +14,7 @@ intelci_files = [
   'xe.bmg.core.blocklist.txt',
   'xe.bmg.display.blocklist.txt',
   'xe.bmg.eudebug.blocklist.txt',
+  'xe.cri.core.blocklist.txt',
   'xe.eudebug.blocklist.txt',
   'xe.fast-feedback.testlist',
   'xe-fast-feedback.testlist',
diff --git a/tests/intel-ci/xe.cri.core.blocklist.txt b/tests/intel-ci/xe.cri.core.blocklist.txt
new file mode 100644
index 000000000..1cfb1d587
--- /dev/null
+++ b/tests/intel-ci/xe.cri.core.blocklist.txt
@@ -0,0 +1,53 @@
+##################################################################
+# Valid skip: Display tests not valid for headless configuration
+##################################################################
+igt@.*kms.*
+igt@testdisplay
+igt@xe_pat@display-vs-wb-transient
+igt@fbdev@.*
+##################################################################
+# Valid skip: Features / hardware blocks not present on CRI
+#   - xe_huc_copy@: No HuC support on CRI.
+#   - xe_oa@oa-tlb-invalidate: valid only for older gen12 platforms.
+#   - xe_pxp@.*: No PXP (Protected Xe Path) support on CRI.
+##################################################################
+igt@xe_huc_copy@.*
+igt@xe_oa@oa-tlb-invalidate
+igt@xe_pxp@.*
+##################################################################
+# Valid skip: multigpu runs in separate config
+##################################################################
+igt@.*@.*multigpu.*
+igt@xe_peer2peer@.*
+#################################################################
+# Valid skip: No render engine support on CRI
+##################################################################
+igt@.*render.*
+##################################################################
+# Valid skip: PAT index tests targeting older/different platforms
+##################################################################
+igt@xe_pat@pat-index-xehpc
+igt@xe_pat@pat-index-xelp
+igt@xe_pat@pat-index-xelpg
+igt@xe_pat@pat-index-xe2
+##################################################################
+# Valid skip: Post DG2 there is no media pipeline
+##################################################################
+igt@xe_media_fill@media-fill
+##################################################################
+# Valid skip: No support for Compression on CRI
+##################################################################
+igt@xe_ccs@.*
+igt@xe_evict_ccs@.*
+##################################################################
+# Valid skip: Threadgroup-preemption not supported on CRI
+##################################################################
+igt@xe_compute_preempt@compute-threadgroup-preempt
+##################################################################
+# Valid skip: Tests requiring multiple CCS (Compute Command
+# Streamers) engines — CRI exposes only a single CCS engine.
+##################################################################
+igt@xe_compute@ccs-mode-basic
+igt@xe_compute@ccs-mode-compute-kernel
+igt@xe_compute@eu-busy-10s
+##################################################################
-- 
2.50.1

