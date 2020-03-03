Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0707D6E978
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Mar 2020 22:38:14 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Date: Tue,  3 Mar 2020 14:38:07 -0800
Message-Id: <20200303223813.3866-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH 0/6] Add igt tests for perf OA interrupts
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, Lionel G Landwerlin <lionel.g.landwerlin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Tests to verify interrupt support in perf OA

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Lionel Landwerlin (4):
  include/drm-uapi: Update i915_drm.h for perf OA APIs
  tests/perf: new tests for parameterized OA buffer polling
  tests/perf: new tests for OA interrupt
  tests/perf: add flush data ioctl test

Umesh Nerlige Ramappa (2):
  test/perf: Drop caches when closing perf stream
  tools: Enable interrupt support in i915 perf recorder

 include/drm-uapi/i915_drm.h          |  41 +++
 tests/perf.c                         | 481 +++++++++++++++++++++++++--
 tools/i915-perf/i915_perf_recorder.c |  53 ++-
 3 files changed, 537 insertions(+), 38 deletions(-)

-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
