Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31C7C10E607
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Dec 2023 20:42:05 +0000 (UTC)
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  5 Dec 2023 12:42:15 -0800
Message-Id: <20231205204217.322849-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 0/2] Test zero execs/binds with fences
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

Tests new Xe driver behavior in [1].

Matt

[1] https://patchwork.freedesktop.org/series/126546/

Matthew Brost (2):
  xe_vm: Add section to test zero number of VM binds
  xe_exec_basic: Add section to test zero number of BB in exec IOCTL

 lib/xe/xe_ioctl.c           |  13 +++++
 lib/xe/xe_ioctl.h           |   2 +
 tests/intel/xe_exec_basic.c | 108 ++++++++++++++++++++++++++++++++++++
 tests/intel/xe_vm.c         |  63 +++++++++++++++++++++
 4 files changed, 186 insertions(+)

-- 
2.34.1
