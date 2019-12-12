Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13F796ECEF
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Dec 2019 09:48:55 +0000 (UTC)
From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
Date: Thu, 12 Dec 2019 11:45:58 +0200
Message-Id: <20191212094601.21940-1-stanislav.lisovskiy@intel.com>
Subject: [igt-dev] [PATCH i-g-t v15 0/3] Introduce i915 pipe stress test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: martin.peres@intel.com, juha-pekka.heikkila@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>

This test case will challenge hardware, by using as maximum
display buffer/memory bandwidth as possible. To achieve that
it runs some workload on each CPU core, also it runs some GPU
load simultaneously, also uses kms to add as much planes as
possible using highest possible mode.

Lisovskiy, Stanislav (2):
  igt/lib: Check if query_info is null
  igt/lib: Use proper functions to gen11+ gpgpu_fill

Stanislav Lisovskiy (1):
  igt/tests: kms_plane_stress: Add plane stress test

 lib/gpgpu_fill.c               |  54 +-
 lib/i915/intel_memory_region.c |   4 +
 tests/Makefile.sources         |   1 +
 tests/i915/i915_pipe_stress.c  | 885 +++++++++++++++++++++++++++++++++
 tests/meson.build              |   1 +
 5 files changed, 943 insertions(+), 2 deletions(-)
 create mode 100644 tests/i915/i915_pipe_stress.c

-- 
2.17.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
