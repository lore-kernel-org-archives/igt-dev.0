Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A65110E166
 for <igt-dev@lists.freedesktop.org>; Sun, 25 Jun 2023 12:30:30 +0000 (UTC)
From: priyanka.dandamudi@intel.com
To: janga.rahul.kumar@intel.com, tejas.upadhyay@intel.com,
 igt-dev@lists.freedesktop.org, priyanka.dandamudi@intel.com
Date: Sun, 25 Jun 2023 17:59:43 +0530
Message-Id: <20230625122948.535456-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/5] Add tests for scheduler control
 interface
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

New lib function has been added to iterate over sysfs/engines.
Added 4 new tests to validate basic scheduler control interface and its defaults.

v2: Adjust space issues.

Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Priyanka Dandamudi (5):
  lib/igt_sysfs: Add support to iterate over engines
  xe/xe_sysfs_defaults: Verify .defaults in engines directory
  xe/xe_sysfs_preempt_timeout: Verify preempt_timeout
  xe/xe_sysfs_timeslice: Verify timeslice_duration
  xe/xe_sysfs_job_timeout: Verify job_timeout

 lib/igt_sysfs.c                     |  35 +++++++
 lib/igt_sysfs.h                     |   3 +
 tests/meson.build                   |   4 +
 tests/xe/xe_sysfs_defaults.c        | 105 +++++++++++++++++++++
 tests/xe/xe_sysfs_job_timeout.c     | 138 +++++++++++++++++++++++++++
 tests/xe/xe_sysfs_preempt_timeout.c | 139 ++++++++++++++++++++++++++++
 tests/xe/xe_sysfs_timeslice.c       | 138 +++++++++++++++++++++++++++
 7 files changed, 562 insertions(+)
 create mode 100644 tests/xe/xe_sysfs_defaults.c
 create mode 100644 tests/xe/xe_sysfs_job_timeout.c
 create mode 100644 tests/xe/xe_sysfs_preempt_timeout.c
 create mode 100644 tests/xe/xe_sysfs_timeslice.c

-- 
2.25.1
