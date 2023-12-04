Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5812E10E176
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Dec 2023 05:36:42 +0000 (UTC)
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sun,  3 Dec 2023 21:36:35 -0800
Message-Id: <20231204053638.29960-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 0/3] xe: Validate fixed CCS mode setting
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
writing it to the per-gt 'ccs_mode' sysfs interface. Validate
that compute kernels can be run on enabled CCS engines and
submitting jobs on disabled compute engines is not permitted.

NOTE: Corresponding driver changes is,
[PATCH v3 0/3] drm/xe: Enable fixed CCS mode

v2: Rebase
v3: Separate num_cslices sysfs interface

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Niranjana Vishwanathapura (3):
  lib/xe: Add __xe_exec_queue_create()
  lib/intel_compute: Update intel_compute to run on specified engine
  tests/xe_compute: Validate ccs_mode setting

 lib/intel_compute.c      |  80 +++++++++++++++------
 lib/intel_compute.h      |   3 +
 lib/xe/xe_ioctl.c        |  29 ++++++--
 lib/xe/xe_ioctl.h        |   3 +
 tests/intel/xe_compute.c | 149 ++++++++++++++++++++++++++++++++++++++-
 tests/intel/xe_create.c  |  26 -------
 6 files changed, 234 insertions(+), 56 deletions(-)

-- 
2.21.0.rc0.32.g243a4c7e27
