Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4EB7C83F03
	for <igt-dev@archiver.kernel.org>; Thu,  3 Jul 2025 15:04:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49CE710E868;
	Thu,  3 Jul 2025 15:04:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WTG+ZD9i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FDD010E868
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jul 2025 15:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751555060; x=1783091060;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SvoUG3Fe5GYxMKuJ2fblyN8gVL/nqiLZy8Md/Fs/Zr4=;
 b=WTG+ZD9i0r5cZQ+zzbXDscJ8ZFJWDXoNm1eC/UG2U1H9mGsf0zLfyeDe
 I57qWzqVTrqLliDC4Wgv+ERkcmX9gmihXUl5NbxwiBjod3+LDpnvk/gPj
 FviUs2XE/dYjzWZ+1h9r/XY09uDA9pv6TKywIaB51+QnSoZEfSpOvwZ4y
 bO49WoixLtbcPg0WBNx2BU+Q1/pxqwaHNoOl7+usqwQmxEWck+mb+JSnv
 DxTjcac6Hdd1j2dXv7aK6SLDxzwI+IVr8bnMwPJ6/O4hiNAfpRJkmpzY1
 2Shrz2jjrgmgejUirYIaFaBmkwjPItoEI+itKZrC93l2mfdbVdFQg/bUQ g==;
X-CSE-ConnectionGUID: OuPgWiCDQXaHxijs69AhVA==
X-CSE-MsgGUID: Bp4JlfHXRsGYdCy8wDwiQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="53603443"
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; d="scan'208";a="53603443"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 08:04:20 -0700
X-CSE-ConnectionGUID: XCSp/PVHT3io0Dg74ub8CQ==
X-CSE-MsgGUID: s+7XuJaqSXCcieASjGF+Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; d="scan'208";a="158952490"
Received: from jmkrefta-mobl2.ger.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.245.255.250])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 08:04:18 -0700
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Gustavo Sousa <gustavo.sousa@linux.intel.com>,
 Lucas de Marchi <lucas.demarchi@linux.intel.com>
Subject: [PATCH i-g-t 0/2] Add post-gpukmod-unbind igt_hook
Date: Thu,  3 Jul 2025 17:03:02 +0200
Message-ID: <20250703150304.101208-1-peter.senna@linux.intel.com>
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

his patch introduces a new IGT hook: IGT_HOOK_POST_GPUKMOD_UNBIND
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

Cc: Gustavo Sousa <gustavo.sousa@linux.intel.com>
Cc: Lucas de Marchi <lucas.demarchi@linux.intel.com>

Peter Senna Tschudin (2):
  igt_core: igt_hook_get_pointer() for external hooks
  lib/igt_kmod: Add IGT_HOOK_POST_GPUKMOD_UNBIND

 lib/igt_core.c | 12 ++++++++++++
 lib/igt_core.h |  9 +++++++++
 lib/igt_hook.c |  5 +++++
 lib/igt_hook.h |  1 +
 lib/igt_kmod.c |  7 +++++++
 5 files changed, 34 insertions(+)

-- 
2.43.0

