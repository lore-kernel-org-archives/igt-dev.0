Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBC2010E3FF
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Mar 2022 14:06:46 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  3 Mar 2022 19:36:34 +0530
Message-Id: <20220303140636.26652-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Add placement to gem_exec_stress
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

 lib/i915/gem_memory_topology.c | 79 ++++++++++++++++++++++++++++++++++
 lib/i915/gem_memory_topology.h | 45 +++++++++++++++++++
 lib/meson.build                |  1 +
 tests/i915/gem_eio.c           | 40 +++++++++++++++++
 tests/i915/i915_pm_rpm.c       | 30 +++++++++----
 5 files changed, 187 insertions(+), 8 deletions(-)
 create mode 100644 lib/i915/gem_memory_topology.c
 create mode 100644 lib/i915/gem_memory_topology.h

-- 
2.26.2
