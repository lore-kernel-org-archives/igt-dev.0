Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA8CF10E329
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Mar 2023 20:59:39 +0000 (UTC)
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 15 Mar 2023 13:59:38 -0700
Message-Id: <20230315205941.4038718-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 0/3] Test GPUVA and NULL VM binds
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

Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Matthew Brost (3):
  xe: Update to latest uAPI
  xe_exec_basic: Add NULL VM bind section
  xe_vm: MMAP style VM binds section

 include/drm-uapi/xe_drm.h |   8 +
 tests/xe/xe_exec_basic.c  |  29 +++-
 tests/xe/xe_vm.c          | 326 +++++++++++++++++++++++++++++++++-----
 3 files changed, 322 insertions(+), 41 deletions(-)

-- 
2.34.1
