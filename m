Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41822C83F1A
	for <igt-dev@archiver.kernel.org>; Wed, 23 Jul 2025 10:44:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F336D88FAE;
	Wed, 23 Jul 2025 10:44:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kOYhtKFf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67B5588FAE
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Jul 2025 10:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753267461; x=1784803461;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ml9cIpaxkh8N13+MnpWSvY3fcZ3ZVb0N5t0qJSBMHM8=;
 b=kOYhtKFfBsbGb8P5Rrk5v+s9ZDo0gSsqMQO4yXKnmCYIiJK2WbXcNMLD
 HMudbcMQSuzpMvGIDa0nzUoVtvfKkSK36Puwy4sfI8BZQSGT5cH91SmgG
 jU6rjuLPabi3YPgMa3nIx4V41olUdmPzLQb+gHffrHr32epoborDy8ubq
 QVlHEJ2ger0i0RCpOZWqCXRK8tYnQ6dXQ/V5eeKF9kJY13CwN/WmGokTw
 7EOAT4VLRm9bdgCDNvtWG9eMyK4Uq2WXmuoI4fN+5ISXxa8jTJ3kCmW/G
 2DEZvRf/fH7noX+5g3e0NRKsaJn1C76pfl5zjhxGK3MFvV5QTGD/5E1k3 g==;
X-CSE-ConnectionGUID: x8Oj7KZYS46sZvXg/uyHiA==
X-CSE-MsgGUID: tJttRrJ6SJC1QAXM0zBGPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="55393772"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="55393772"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 03:44:20 -0700
X-CSE-ConnectionGUID: xtoKjIyzTZWXr6XkTzkcIg==
X-CSE-MsgGUID: bVIIjqYxThiIZ+UDtZI2RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="159984222"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.245.118.0])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 03:44:18 -0700
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH v4 i-g-t 0/3] Add post-kmod-unbind igt_hook
Date: Wed, 23 Jul 2025 12:44:03 +0200
Message-ID: <20250723104406.58784-1-peter.senna@linux.intel.com>
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

Introduces a new IGT hook: IGT_HOOK_POST_KMOD_UNBIND
(post-kmod-unbind), designed to facilitate kmemleak scans in our CI
workflows.

As suggested by Lucas de Marchi, a useful strategy for detecting memory
leaks is to run kmemleak scans both before binding and after unbinding
the kernel module. This patch adds support for the latter scenario,
enabling automated scans immediately after the module is unbound.

Example test-list:
 igt@xe_module_load@load
 igt@core_hotunplug@unbind-rebind
 igt@xe_module_load@unload

Example usage:
 IGT_PING_HOSTNAME='10.211.176.1'
 IGT_TEST_ROOT='/home/gta/UPSTREAM/igt-gpu-tools/build/tests/'
 ./build/runner/igt_runner -o -l verbose -s --per-test-timeout 120 \
   --overall-timeout 960 --piglit-style-dmesg --dmesg-warn-level=4 \
   --use-watchdog --inactivity-timeout 90 \
   --abort-on-monitored-error=ping,taint --disk-usage-limit=10M \
   --facts --hook 'post-kmod-unbind:OUTF=/tmp/kmemleak-post-unbind && \
                   echo $IGT_HOOK_TEST_FULLNAME $IGT_HOOK_TEST $IGT_HOOK_SUBTEST >> $OUTF && \
                   echo scan > /sys/kernel/debug/kmemleak && \
                   cat /sys/kernel/debug/kmemleak >> $OUTF' \
   --test-list ~/igt/test-list \
   /home/gta/igt/0

Known Limitations: In certain cases, such as when running
igt@core_hotunplug@unbind-rebind, the unbind operation is explicitly
managed by the igt if the module is already loaded. However, if the
unbind occurs outside of igt, the hook will not be triggered and
the scan will not run.

v4:
 - Updated hook unit testing to account for new env var
 - Updated cover letter

v3:
 - Wrote Gustavo's name and email address correctly (:facepalm:)
 - Renamed the hook to IGT_HOOK_POST_KMOD_UNBIND as the unbind can also happen
   for snd modules
 - Changed the logic for the IGT_HOOK_KMOD_UNBIND_MODULE_NAME env var so that
   it is only populated when the correct hook is used.

v2:
 - change function name to igt_core_get_igt_hook()
 - Add env var IGT_HOOK_KMOD_UNBIND_MODULE_NAME
 - Fix minor issues

Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Peter Senna Tschudin (3):
  lib/igt_core: Expose igt_hook pointer for other libs
  lib/igt_kmod: Add IGT_HOOK_POST_KMOD_UNBIND
  lib/tests: Update hook unit testing

 lib/igt_core.c                   | 12 ++++++++++++
 lib/igt_core.h                   |  2 ++
 lib/igt_hook.c                   | 11 +++++++++++
 lib/igt_hook.h                   |  3 +++
 lib/igt_kmod.c                   |  8 ++++++++
 lib/tests/igt_hook.c             |  1 +
 lib/tests/igt_hook_integration.c |  9 +++++----
 7 files changed, 42 insertions(+), 4 deletions(-)

-- 
2.43.0

