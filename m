Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B6E589D4D
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Aug 2020 09:01:01 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Mon,  3 Aug 2020 12:00:48 +0300
Message-Id: <20200803090053.260115-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/5] tests: Add timeline semaphore tests
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Hi all,

With the help of the CI & Test-with tag, I found a couple of issues
that where not reproducable on my machines.

Cheers,

Chunming Zhou (1):
  igt: add timeline test cases

Lionel Landwerlin (4):
  drm-uapi: bump i915_drm.h for timeline semaphores
  tests/syncobj_timeline: add more timeline tests
  tests/i915/exec_fence: add timeline fence tests
  tests/i915/gem_exec_fence: add engine chaining tests

 include/drm-uapi/i915_drm.h |   65 +-
 lib/igt_syncobj.c           |  236 ++++++
 lib/igt_syncobj.h           |   22 +
 lib/intel_reg.h             |    2 +
 tests/i915/gem_exec_fence.c | 1329 ++++++++++++++++++++++++++++++
 tests/meson.build           |    1 +
 tests/syncobj_timeline.c    | 1537 +++++++++++++++++++++++++++++++++++
 7 files changed, 3189 insertions(+), 3 deletions(-)
 create mode 100644 tests/syncobj_timeline.c

--
2.28.0
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
