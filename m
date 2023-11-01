Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12C1810E7F6
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Nov 2023 23:55:37 +0000 (UTC)
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  1 Nov 2023 16:53:00 -0700
Message-Id: <20231101235303.4645-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [RFC v2 i-g-t 0/3] xe: Validate fixed CCS mode setting
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

Validate static assignment of compute slices to a user selected
number of compute engines. Select number of compute engines by
writing it to the per-tile 'ccs_mode' sysfs interface. Validate
that compute kernels can be run on enabled CCS engines and
submitting jobs on disabled compute engines is not permitted.

v2: Validate by running compute kernel on all possible CCS modes
    and enabled CCS engines. Ensure no exec queue is created with
    disabled CCS engines.

NOTE: Corresponding driver changes is,
[RFC v2 0/2] drm/xe/pvc: Enable fixed CCS mode

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Niranjana Vishwanathapura (3):
  lib/xe: Add __xe_exec_queue_create()
  lib/intel_compute: Update intel_compute to run on specified engine
  tests/xe_compute: Validate ccs_mode setting

 lib/intel_compute.c      |  76 ++++++++++++++------
 lib/intel_compute.h      |   3 +
 lib/xe/xe_ioctl.c        |  29 ++++++--
 lib/xe/xe_ioctl.h        |   3 +
 tests/intel/xe_compute.c | 146 +++++++++++++++++++++++++++++++++++++++
 tests/intel/xe_create.c  |  26 -------
 6 files changed, 229 insertions(+), 54 deletions(-)

-- 
2.21.0.rc0.32.g243a4c7e27
