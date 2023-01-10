Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 276AD10E244
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Jan 2023 19:47:24 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 10 Jan 2023 11:47:17 -0800
Message-Id: <20230110194720.190515-1-ashutosh.dixit@intel.com>
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

After the i915 commit 95ccf312a1e4f ("drm/i915/guc/slpc: Allow SLPC to use
efficient frequency"), FW uses the requested freq as the efficient freq
which can exceed the max freq set. Therefore, in the "min freq" part of the
igt@perf_pmu@frequency subtest, compare the requested freq reported by PMU
not against the set freq but against the requested freq reported in sysfs.

v2: Remove v1 patches which need to be redone. In v2 just add failing tests
    to BAT testlist to try to repro the failures
v3: Add modified v1 patches with minimal changes which are expected to fix
    the two issues
v4: Retest
v5: Increase comparison tolerance and add comments to code explaining
    reason for the changes
v6: Retest
v7: Retest
v8: Repost and Cc reviewers, patches identical to v5

Ashutosh Dixit (3):
  tests/perf_pmu: Compare against requested freq in frequency subtest
  tests/gem_ctx_freq: Compare against requested freq
  HAX: Add gem_ctx_freq@sysfs and perf_pmu@frequency to
    fast-feedback.testlist

 tests/i915/gem_ctx_freq.c             | 24 ++++++++++++++++--------
 tests/i915/perf_pmu.c                 | 12 ++++++++++--
 tests/intel-ci/fast-feedback.testlist |  2 ++
 3 files changed, 28 insertions(+), 10 deletions(-)

-- 
2.38.0
