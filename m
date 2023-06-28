Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1B8310E0E0
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jun 2023 09:53:25 +0000 (UTC)
From: priyanka.dandamudi@intel.com
To: janga.rahul.kumar@intel.com, tejas.upadhyay@intel.com,
 igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 priyanka.dandamudi@intel.com
Date: Wed, 28 Jun 2023 15:22:36 +0530
Message-Id: <20230628095239.615655-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/3] Add tests for scheduler control
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
Added 2 new tests to validate basic scheduler control interface and its defaults.

v2: Adjust space issues.

v3: Addressed Kamil and Rahul review comments.
Modified existing tests and made all 3 scheduler tests into one
xe_sysfs_scheduler.

Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Priyanka Dandamudi (3):
  lib/igt_sysfs: Add support to iterate over engines
  xe/xe_sysfs_defaults: Verify .defaults in engines directory
  xe/xe_sysfs_scheduler: Verify scheduler control interface

 lib/igt_sysfs.c               |  47 ++++++++
 lib/igt_sysfs.h               |   3 +
 tests/meson.build             |   2 +
 tests/xe/xe_sysfs_defaults.c  |  88 +++++++++++++++
 tests/xe/xe_sysfs_scheduler.c | 203 ++++++++++++++++++++++++++++++++++
 5 files changed, 343 insertions(+)
 create mode 100644 tests/xe/xe_sysfs_defaults.c
 create mode 100644 tests/xe/xe_sysfs_scheduler.c

-- 
2.25.1
