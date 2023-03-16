Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FFAB10E0E4
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Mar 2023 02:32:51 +0000 (UTC)
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 15 Mar 2023 19:32:46 -0700
Message-Id: <20230316023250.4115730-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 0/4] Test GPUVA and NULL VM binds
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

Tests: https://patchwork.freedesktop.org/series/115217/

v2: Fix build error add sections for splitting large pages

Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Matthew Brost (4):
  xe: Update to latest uAPI
  xe_exec_basic: Add NULL VM bind section
  xe_vm: MMAP style VM binds section
  xe_vm: Add mmap / munmap sections that split large pages

 include/drm-uapi/xe_drm.h |   8 +
 tests/xe/xe_exec_basic.c  |  29 ++-
 tests/xe/xe_vm.c          | 372 +++++++++++++++++++++++++++++++++-----
 3 files changed, 354 insertions(+), 55 deletions(-)

-- 
2.34.1
