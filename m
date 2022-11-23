Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A1F710E633
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Nov 2022 21:18:34 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 23 Nov 2022 13:18:28 -0800
Message-Id: <20221123211830.630263-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Fix PMU freq verification with SLPC
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
freq's but against the requested freq reported in sysfs. Also add a delay
after setting freq's to account for messaging delays in setting freq's in
GuC.

The almost identical fix is applied to the two tests below.

Previous versions of PATCH 1 were posted here:
	https://patchwork.freedesktop.org/series/110574/
Now because the same fix has beed added to a second test I am re-posting
this as a series.

Bug: https://gitlab.freedesktop.org/drm/intel/-/issues/6806
Bug: https://gitlab.freedesktop.org/drm/intel/-/issues/6786
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>

Ashutosh Dixit (2):
  tests/perf_pmu: Compare against requested freq in frequency subtest
  tests/gem_ctx_freq: Compare against requested freq

 tests/i915/gem_ctx_freq.c | 19 ++++++++++++-------
 tests/i915/perf_pmu.c     | 23 +++++++++++++++--------
 2 files changed, 27 insertions(+), 15 deletions(-)

-- 
2.38.0
