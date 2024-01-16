Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A34A110E074
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Jan 2024 21:22:48 +0000 (UTC)
From: janga.rahul.kumar@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 janga.rahul.kumar@intel.com
Subject: [PATCH i-g-t v2 0/4] Add LNL compute preempt test
Date: Wed, 17 Jan 2024 02:57:52 +0530
Message-Id: <20240116212756.2687603-1-janga.rahul.kumar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: nirmoy.das@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

Test compute wmtp preemption scenario by submitting opencl kernels.

v2:
-Address review comments. (Nirmoy)
-Use compute increment kernel as long kernel.
-Increase state context data base size to fix cat errors.
-Enable mid thread preemption in the pipeline.

Janga Rahul Kumar (4):
  opencl/compute_increment_kernel: Add opencl increment kernel
  lib/intel_compute_square_kernels: Add xe2lpg wmtp sip and long running
    opencl kernel
  lib/intel_compute: Add LNL compute preempt library support
  tests/intel/xe_compute_preempt: Add compute preempt test

 include/intel_gpu_commands.h       |    2 +
 lib/intel_compute.c                |  270 ++-
 lib/intel_compute.h                |    6 +-
 lib/intel_compute_square_kernels.c | 3635 ++++++++++++++++++++++++++++
 opencl/compute_increment_kernel.cl |    6 +
 tests/intel/xe_compute_preempt.c   |   45 +
 tests/meson.build                  |    1 +
 7 files changed, 3961 insertions(+), 4 deletions(-)
 create mode 100644 opencl/compute_increment_kernel.cl
 create mode 100644 tests/intel/xe_compute_preempt.c

-- 
2.25.1
