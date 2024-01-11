Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6582B10E7D2
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jan 2024 06:24:59 +0000 (UTC)
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH v3 0/3] tests/xe_waitfence: removed invalid_engine subtest
Date: Thu, 11 Jan 2024 11:55:15 +0530
Message-Id: <20240111062518.393544-1-krishnaiah.bommu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

tests/xe_waitfence: Rename invalid_engine to invalid-exec_queue
Rename invalid_engine to invalid-exec_queue subtest and changed return value
as per kernel implementation.
failure link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1067

tests/xe_waitfence: Removed drm_xe_sync data in exec_queue_reset_wait
Removed drm_xe_sync data in exec_queue_reset_wait since it was declaredand unused, failure Intel XE#1081
failure link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1081

tests/xe_waitfence: Removed duplicate code in waitfence
Removed duplicate cod in xe_waitfence@waitfence

Kernel commit:
	drm/xe/uapi: add exec_queue_id member to drm_xe_wait_user_fence structure


Bommu Krishnaiah (3):
  tests/xe_waitfence: Rename invalid_engine to invalid-exec_queue
  tests/xe_waitfence: Removed drm_xe_sync data in exec_queue_reset_wait
  tests/xe_waitfence: Removed duplicate code in waitfence

 lib/xe/xe_ioctl.c          | 35 ---------------------------------
 lib/xe/xe_ioctl.h          |  2 --
 tests/intel/xe_waitfence.c | 40 ++++++++++++++++++++++----------------
 3 files changed, 23 insertions(+), 54 deletions(-)

-- 
2.25.1
