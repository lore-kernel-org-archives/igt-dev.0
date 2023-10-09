Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CD8B10E0EB
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Oct 2023 10:03:43 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.31.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 1AFC9580DA1
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Oct 2023 03:03:36 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qpn6s-001eFg-05
 for igt-dev@lists.freedesktop.org; Mon, 09 Oct 2023 12:03:34 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  9 Oct 2023 12:01:37 +0200
Message-ID: <20231009100332.392968-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/4] Fix bad documentation validation logic
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mauro Carvalho Chehab <mchehab@kernel.org>

There's currently a bug at the logic which checks for IGT documentation:
it is not reporting all cases of undocumented tests.

Patch 1 on this series fix it, and uses a simpler logic to check for
differences between documented and existing tests.

After the fix, there will be 6 tests out of sync:

$ ./scripts/igt_doc.py --config tests/intel/xe_*.json --check
Warning: Documented igt@xe_sysfs_scheduler@job_timeout_ms-nonprivileged-user doesn't exist on source files
Warning: Documented igt@xe_sysfs_scheduler@preempt_timeout_us-nonprivileged-user doesn't exist on source files
Warning: Documented igt@xe_sysfs_scheduler@timeslice_duration_us-nonprivileged-user doesn't exist on source files

$ ./scripts/igt_doc.py --config tests/intel/kms_*.json --check
Warning: Documented igt@kms_big_fb@linear-addfb-size-offset-overflow doesn't exist on source files
Warning: Documented igt@kms_big_fb@linear-addfb-size-overflow doesn't exist on source files
Warning: Documented igt@kms_frontbuffer_tracking@fbc-slowdraw doesn't exist on source files

The remaining patches on this series fix them.

Mauro Carvalho Chehab (4):
  scripts/test_list.py: fix and simplify missing doc check
  intel/xe_sysfs_scheduler.c: remove nonpriviledged-user tests
  intel/kms_big_fb.c: remove linear-addfb-size*-overflow docs
  intel/kms_frontbuffer_tracking.c: remove fbc-slowdraw test

 scripts/test_list.py                   | 34 +++-----------------------
 tests/intel/kms_big_fb.c               | 16 ------------
 tests/intel/kms_frontbuffer_tracking.c |  7 ------
 tests/intel/xe_sysfs_scheduler.c       |  4 ---
 4 files changed, 4 insertions(+), 57 deletions(-)

-- 
2.41.0
