Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E452C83F21
	for <igt-dev@archiver.kernel.org>; Tue, 15 Jul 2025 13:37:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1295910E5C6;
	Tue, 15 Jul 2025 13:37:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B1qTaX86";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2E1810E5C6
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 13:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752586664; x=1784122664;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EsapBPWcm/EQRviJ04pdloh1/ENZRScEWmAhelwc6KM=;
 b=B1qTaX86AQhI0znlRUq7tTKTGdcLf6lFwfw5g9D+XTH4p+GBdKt5LVv6
 O5lAXDOg5H/AYOBjn/dWLh45Whdo40Kij1s2NDgvqp7P2UDFXMYP4qUA5
 0UJwDkfqOIPlKh0scyguOSFasNcRek6ZDsZA9Sr+OcMaGd66d/c8OLhQt
 34W6kuul18R1HaxOUijjLcnVenfYgUg1ntqYUV+kiOVwW7u6fXBc1e2fY
 IxS7H+KAOrAO70CGld1Izb8E/HOkgDP4erVCftq5eDc4wCQ2ir/oEu3vf
 Gb2M43Fp87wxiszhJ6LPoOzPVM7l/oTJnHRwAt4bItGjsDvb8FSusOoqU w==;
X-CSE-ConnectionGUID: 2cAPaE+xR7aewI77FDXL9g==
X-CSE-MsgGUID: hd/aXtHdQTChBL/+BKpBAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54779988"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="54779988"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 06:37:44 -0700
X-CSE-ConnectionGUID: mBPnBIxLTMqiyrvMn8kOVg==
X-CSE-MsgGUID: aa2BRk/eT46/R1BxTs2OUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="156886352"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.245.118.0])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 06:37:41 -0700
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH v3 i-g-t 0/2] Add post-kmod-unbind igt_hook
Date: Tue, 15 Jul 2025 15:37:20 +0200
Message-ID: <20250715133722.32559-1-peter.senna@linux.intel.com>
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
managed by igt_runner if the module is already loaded. However, if the
unbind occurs outside of igt_runner, the hook will not be triggered and
the scan will not run.

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

Peter Senna Tschudin (2):
  igt_core_get_igt_hook: igt_hook pointer for other libs
  lib/igt_kmod: Add IGT_HOOK_POST_KMOD_UNBIND

 lib/igt_core.c | 12 ++++++++++++
 lib/igt_core.h |  2 ++
 lib/igt_hook.c | 11 +++++++++++
 lib/igt_hook.h |  3 +++
 lib/igt_kmod.c |  8 ++++++++
 5 files changed, 36 insertions(+)

-- 
2.43.0

