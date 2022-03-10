Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFD5910E91F
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Mar 2022 13:36:04 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 10 Mar 2022 19:05:49 +0530
Message-Id: <20220310133551.5096-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 0/2] Add placement to gem_exec_stress
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: chris.p.wilson@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

This includes below dependent patch as well.
i915/gem_eio: Exercise object creation while wedged.

Anshuman Gupta (1):
  i915_pm_rpm: Add placement to gem_exec_stress

Chris Wilson (1):
  i915/gem_eio: Exercise object creation while wedged

 lib/i915/intel_memory_region.c | 51 ++++++++++++++++++++++++++++++++++
 lib/i915/intel_memory_region.h | 14 ++++++++++
 tests/i915/gem_eio.c           | 42 ++++++++++++++++++++++++++++
 tests/i915/i915_pm_rpm.c       | 33 ++++++++++++++++------
 4 files changed, 132 insertions(+), 8 deletions(-)

-- 
2.26.2
