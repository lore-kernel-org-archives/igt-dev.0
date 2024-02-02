Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D49AC4828D
	for <igt-dev@archiver.kernel.org>; Fri,  2 Feb 2024 00:45:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A3E310EDAD;
	Fri,  2 Feb 2024 00:45:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oa3btPMs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C888D10ED9A
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Feb 2024 00:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706834740; x=1738370740;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GiKiz+VTfZb25AsXOzzsCdy5CaNkVfC2mnqdtB/DW7g=;
 b=Oa3btPMsAOhO9BBU4YLQ3l9kZFizuNbJdsdjdoNJ4NFl++od/sa0n657
 kOhFUtJO1fhOnXtq4dIPyToRUawnRcXRZTS3gWsH1FxE4fNg6AK097Qro
 UgslI49Q/KP8e1JX+f9Cb7drVvCL88DVeiNvR6RjK65e/Vh2TvELKd8ke
 OROIy1O/plCK6+uAn+ktCQIxu2Dob/kA9Pt+gNrRNLujBgdS8uf0yXxBQ
 2JyYjU6WDvQHz6QBkI71IrZIQqLir/T0wzKX7srwa6uvIEGhjz6s6oumY
 0QeYWf0knLMUUtwxsP1MD+ACd92BnAw2Y95+KlbXoU7paXX5L3OI3vdQF g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="227722"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; 
   d="scan'208";a="227722"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 16:45:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; 
   d="scan'208";a="4519395"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 16:45:40 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 0/2] live test renames
Date: Thu,  1 Feb 2024 16:45:27 -0800
Message-ID: <20240202004529.552806-1-lucas.demarchi@intel.com>
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

First patch ca be ignored, it's the entire series being reviewed
at https://lore.kernel.org/igt-dev/20240201190237.150754-8-janusz.krzysztofik@linux.intel.com/
It's brought in here as a dependency.

This also has a kernel dependency:
https://lore.kernel.org/intel-xe/20231122203147.988021-3-lucas.demarchi@intel.com/
I will send that again as it doesn't apply anymore.

Tested in LNL with the corresponding change in the kernel:

	$ sudo ./build/tests/xe_live_ktest --r xe_mocs
	IGT-Version: 1.28-g3f8041700 (x86_64) (Linux: 6.8.0-rc1-xe+ x86_64)
	Using IGT_SRANDOM=1706833679 for randomisation
	Starting subtest: xe_mocs
	Starting dynamic subtest: xe_live_mocs_kernel_kunit
	Dynamic subtest xe_live_mocs_kernel_kunit: SUCCESS (3.304s)
	Starting dynamic subtest: xe_live_mocs_reset_kunit
	Dynamic subtest xe_live_mocs_reset_kunit: SUCCESS (0.102s)
	Subtest xe_mocs: SUCCESS (3.484s)

For me it runs much slower than my manual execution (just modprobe'ing
xe_live_test... about 4x). I thought it was because it was still
loading/removing kunit or something like that, but it's not:

# cat /sys/kernel/tracing/trace
# tracer: nop
#
# entries-in-buffer/entries-written: 4/4   #P:8
#
#                                _-----=> irqs-off/BH-disabled
#                               / _----=> need-resched
#                              | / _---=> hardirq/softirq
#                              || / _--=> preempt-depth
#                              ||| / _-=> migrate-disable
#                              |||| /     delay
#           TASK-PID     CPU#  |||||  TIMESTAMP  FUNCTION
#              | |         |   |||||     |         |
   xe_live_ktest-9987    [002] .....  7410.386983: module_load: xe_live_test 
   xe_live_ktest-9987    [002] .....  7410.387378: module_free: xe_live_test
   xe_live_ktest-9990    [003] .....  7413.865052: module_load: xe_live_test 
   xe_live_ktest-9987    [000] .....  7413.866504: module_free: xe_live_test


Yes, it loads xe_live_test twice (one for list, one for execution).
Looking at dmesg, at least on my machine it's triggering timeouts in the
GPU scheduler, what doesn't happen with the manual execution.

Janusz: do we really need to list subtests? Why not simply pass the
subtest as filter_glob? Most of the time I believe we are not really
filtering by a regex. At least the testlists are not.

Janusz Krzysztofik (1):
  squashed 20240201190237.150754-8-janusz.krzysztofik@linux.intel.com

Lucas De Marchi (1):
  xe_live_ktest: Use xe_live_test kernel module

 lib/igt_kmod.c                           | 115 ++++++++++++++++-------
 tests/intel-ci/xe-fast-feedback.testlist |   6 +-
 tests/intel/xe_live_ktest.c              |  25 ++---
 3 files changed, 92 insertions(+), 54 deletions(-)

-- 
2.43.0

