Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99FE36E83F
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Mar 2020 21:50:06 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Date: Wed, 25 Mar 2020 14:50:02 -0700
Message-Id: <20200325215005.5489-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/3] Test configurable poll delay in perf OA
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
To: igt-dev@lists.freedesktop.org, Lionel G Landwerlin <lionel.g.landwerlin@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Add tests that verify the configurable poll delay in perf OA.

Lionel Landwerlin (2):
  include/drm-uapi: Update i915_drm.h for perf OA APIs
  tests/perf: new tests for parameterized OA buffer polling

Umesh Nerlige Ramappa (1):
  tools: Allow user to set poll delay in i915 perf recorder

 include/drm-uapi/i915_drm.h          |  24 +++++
 tests/perf.c                         | 144 ++++++++++++++++++++-------
 tools/i915-perf/i915_perf_recorder.c |  38 ++++++-
 3 files changed, 165 insertions(+), 41 deletions(-)

-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
