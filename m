Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A356F10E1B5
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Dec 2023 00:10:25 +0000 (UTC)
From: janga.rahul.kumar@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 janga.rahul.kumar@intel.com, nirmoy.das@intel.com
Subject: [PATCH i-g-t 0/3] Add LNL compute preempt test
Date: Thu, 28 Dec 2023 05:45:07 +0530
Message-Id: <20231228001510.1399329-1-janga.rahul.kumar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

Test compute preemption scenario by submitting opencl kernels.



Janga Rahul Kumar (3):
  lib/intel_compute_square_kernels: Add xe2lpg wmtp sip and long running
    opencl kernel
  lib/intel_compute: Add LNL compute preempt library support
  tests/intel/xe_compute_preempt: Add compute preempt test

 lib/intel_compute.c                |  238 +-
 lib/intel_compute.h                |    6 +-
 lib/intel_compute_square_kernels.c | 4927 ++++++++++++++++++++++++++++
 tests/intel/xe_compute_preempt.c   |   46 +
 tests/meson.build                  |    1 +
 5 files changed, 5215 insertions(+), 3 deletions(-)
 create mode 100644 tests/intel/xe_compute_preempt.c

-- 
2.25.1
