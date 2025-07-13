Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82BB0C83F17
	for <igt-dev@archiver.kernel.org>; Sun, 13 Jul 2025 11:24:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39A1610E03C;
	Sun, 13 Jul 2025 11:24:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JQn1VVCZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94E7C10E03C
 for <igt-dev@lists.freedesktop.org>; Sun, 13 Jul 2025 11:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752405854; x=1783941854;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=t2K++wAsgU7HdqH2Dn73PCAKLIG+dPjvgJlUQKt0Nxg=;
 b=JQn1VVCZ2vVuSJyYrBe+A1/Xmbp0xvhD0sVMEWIhMMdcf0yiLdnTNMRt
 v79PIxJA/AUcW3iAMf8dyPXJ2bZrMywEwF0aiRW6l6PtYuHML0zA9wgpB
 KUBHPG/8qP0w/Jf7NopzF//m5v0qtr8WVBkpm63FAKVG59ZGSlJn3mObO
 PUj2Bwr6w57hWNmezlQE51oHIbr4Me/lMOfN+mdOI/ERH8Gu8SIk4dt1B
 u0JaNHEYQvydh8foytVtOyY6F+EcqpvO1zrH/0I+ElqW0RA0C4AqXPdYM
 BfInubxJEo1yLnVlJWz+FjD/fTy3Ag65W3vCVaKWtdXFAkGhiiBXVuQty w==;
X-CSE-ConnectionGUID: VEeB36haRuulb6CyS/8AdA==
X-CSE-MsgGUID: cd8c3uGQTiuxNcEHCZ95zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="72070738"
X-IronPort-AV: E=Sophos;i="6.16,308,1744095600"; d="scan'208";a="72070738"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2025 04:24:14 -0700
X-CSE-ConnectionGUID: m0SS6pz7Q2+mTLAkTlS7pA==
X-CSE-MsgGUID: WV/JSMOTR2Cqy/pH7OQqgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,308,1744095600"; d="scan'208";a="156126317"
Received: from bleysen-mobl1.ger.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.245.96.65])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2025 04:24:12 -0700
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Gustavo Sousa <gustavo.sousa@linux.intel.com>
Subject: [PATCH v2 i-g-t 0/2] Add post-gpukmod-unbind igt_hook
Date: Sun, 13 Jul 2025 13:23:52 +0200
Message-ID: <20250713112354.32032-1-peter.senna@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

Introduces a new IGT hook: IGT_HOOK_POST_GPUKMOD_UNBIND
(post-gpukmod-unbind), designed to facilitate kmemleak scans in our CI
workflows.

As suggested by Lucas de Marchi, a useful strategy for detecting memory
leaks is to run kmemleak scans both before binding and after unbinding
the GPU kernel module. This patch adds support for the latter scenario,
enabling automated scans immediately after the GPU module is unbound.

Example test-list:
 igt@xe_module_load@load
 igt@core_hotunplug@unbind-rebind
 igt@xe_module_load@unload

Usage Example:
 IGT_PING_HOSTNAME='10.211.176.1'
 IGT_TEST_ROOT='/home/gta/UPSTREAM/igt-gpu-tools/build/tests/'
 ./build/runner/igt_runner -o -l verbose -s --per-test-timeout 120 \
   --overall-timeout 960 --piglit-style-dmesg --dmesg-warn-level=4 \
   --use-watchdog --inactivity-timeout 90 \
   --abort-on-monitored-error=ping,taint --disk-usage-limit=10M \
   --facts --hook 'post-gpukmod-unbind:OUTF=/tmp/kmemleak-post-unbind && \
                   echo $IGT_HOOK_TEST_FULLNAME $IGT_HOOK_TEST $IGT_HOOK_SUBTEST >> $OUTF && \
                   echo scan > /sys/kernel/debug/kmemleak && \
                   cat /sys/kernel/debug/kmemleak >> $OUTF' \
   --test-list ~/igt/test-list \
   /home/gta/igt/0

Known Limitations: In certain cases, such as when running
igt@core_hotunplug@unbind-rebind, the unbind operation is explicitly
managed by igt_runner if the module is already loaded. However, if the
unbind occurs outside of igt_runner, the hook will not be triggered and
the scan will not run.

v2:
 - change function name to igt_core_get_igt_hook()
 - Add env var IGT_HOOK_KMOD_UNBIND_MODULE_NAME
 - Fix minor issues

Cc: Gustavo Sousa <gustavo.sousa@linux.intel.com>

Peter Senna Tschudin (2):
  igt_core_get_igt_hook: igt_hook pointer for other libs
  lib/igt_kmod: Add IGT_HOOK_POST_GPUKMOD_UNBIND

 lib/igt_core.c | 12 ++++++++++++
 lib/igt_core.h |  2 ++
 lib/igt_hook.c | 10 ++++++++++
 lib/igt_hook.h |  3 +++
 lib/igt_kmod.c |  8 ++++++++
 5 files changed, 35 insertions(+)

-- 
2.43.0

