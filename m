Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E792CAC5B8
	for <igt-dev@archiver.kernel.org>; Tue, 30 Sep 2025 19:25:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4800810E09D;
	Tue, 30 Sep 2025 19:25:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k+iDhXxA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 934EC10E09D
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Sep 2025 19:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759260329; x=1790796329;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=b9dGbjbAB+VglrIU8R7ZqbOwO/ibNWCOoymAfkfBk6g=;
 b=k+iDhXxAz+1SX8bqe7HGNhASCfYXz3CxLTijRGHqwmDYkOtfmcTloRCN
 gxQIVXBbvU5ogsX+SdEX+tMk7c1y/yl8W7i5IbUAYZi6GGOHZaVVPzYMF
 iav+30mV2MphdUbUctRpMn4MMaLM8FzV84OmBQxNR2f0XSMVCAIeDKTLR
 B7zTtquUUR5p+ZjObYoKx+IsVV3GlyDAkIAXjQgzX+HwdwKGbBFnnmMLX
 80FtH8teZ0vGAUba201Hw+tbH2S0l+On+z9WAD8KHexriEgNPDawMvZfx
 l+7GAbD+jpwzkr0GkcXdM69vvb4iEqhhd5CcpoOuevAlcX2GjB+tF3zps Q==;
X-CSE-ConnectionGUID: 9xEHP8NQT3mo6NxZEWkDkw==
X-CSE-MsgGUID: Sc2+gWieQVibR3k6dMmhog==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="60562990"
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="60562990"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 12:25:29 -0700
X-CSE-ConnectionGUID: kp0ZvywFSlKlfLgPZUwvlw==
X-CSE-MsgGUID: IN6/1njkRkexe0PbLzE+2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="178646514"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.163])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 12:25:27 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t] intel-ci: Fix Xe blocklists for xe_noexec_ping_pong test
Date: Tue, 30 Sep 2025 21:25:21 +0200
Message-ID: <20250930192522.247775-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.51.0
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

Test xe_noexec_ping_pong was converted to contain one proper
subtest so both LNL and PTL blocklists need a fix.

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel-ci/xe.lnl.core.blocklist.txt | 2 +-
 tests/intel-ci/xe.ptl.core.blocklist.txt | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel-ci/xe.lnl.core.blocklist.txt b/tests/intel-ci/xe.lnl.core.blocklist.txt
index a3cd52935..56b3ef088 100644
--- a/tests/intel-ci/xe.lnl.core.blocklist.txt
+++ b/tests/intel-ci/xe.lnl.core.blocklist.txt
@@ -18,7 +18,7 @@ igt@xe_evict@.*
 igt@xe_evict_ccs@.*
 igt@xe_mmap@small-bar
 igt@xe_mmap@vram$
-igt@xe_noexec_ping_pong
+igt@xe_noexec_ping_pong@.*
 igt@xe_pm@d3-mmap-vram
 igt@xe_pm@d3hot-mmap-vram
 igt@xe_sysfs_tile@physical_vram_size_bytes
diff --git a/tests/intel-ci/xe.ptl.core.blocklist.txt b/tests/intel-ci/xe.ptl.core.blocklist.txt
index 3ca03a89d..811062449 100644
--- a/tests/intel-ci/xe.ptl.core.blocklist.txt
+++ b/tests/intel-ci/xe.ptl.core.blocklist.txt
@@ -12,7 +12,7 @@ igt@fbdev@.*
 igt@xe_mmap@vram$
 igt@xe_mmap@small-bar
 igt@xe_sysfs_tile@physical_vram_size_bytes
-igt@xe_noexec_ping_pong
+igt@xe_noexec_ping_pong@.*
 igt@xe_create@create-big-vram
 igt@xe_pm@d3hot-mmap-vram
 igt@xe_compute_preempt@.*vram.*
-- 
2.51.0

