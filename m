Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29A6510E0C9
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Jan 2023 04:41:49 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  4 Jan 2023 20:41:41 -0800
Message-Id: <20230105044144.3982688-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/3] Fix PMU freq verification with SLPC
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

With SLPC, even when we set the same min and max freq's, the requested and
actual freq's can differ from the min/max freq set. For example "efficient
freq" (when in effect) can override set min/max freq. In general FW is the
final arbiter in determining freq and can override set values.

Therefore compare the requested freq reported by PMU not against the set
freq's but against the requested freq reported in sysfs.

v2: Remove v1 patches which need to be redone. In v2 just add failing tests
    to BAT testlist to try to repro the failures
v3: Add modified v1 patches with minimal changes which are expected to fix
    the two issues

Bug: https://gitlab.freedesktop.org/drm/intel/-/issues/6806
Bug: https://gitlab.freedesktop.org/drm/intel/-/issues/6786

Ashutosh Dixit (3):
  tests/perf_pmu: Compare against requested freq in frequency subtest
  tests/gem_ctx_freq: Compare against requested freq
  HAX: Add gem_ctx_freq@sysfs and perf_pmu@frequency to
    fast-feedback.testlist

 tests/i915/gem_ctx_freq.c             | 18 ++++++++++--------
 tests/i915/perf_pmu.c                 |  5 +++--
 tests/intel-ci/fast-feedback.testlist |  2 ++
 3 files changed, 15 insertions(+), 10 deletions(-)

-- 
2.38.0
