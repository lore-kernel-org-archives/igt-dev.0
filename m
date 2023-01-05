Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B83E910E631
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Jan 2023 03:34:35 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  4 Jan 2023 19:34:30 -0800
Message-Id: <20230105033431.3981780-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/1] Fix PMU freq verification with SLPC
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

Bug: https://gitlab.freedesktop.org/drm/intel/-/issues/6806
Bug: https://gitlab.freedesktop.org/drm/intel/-/issues/6786

Ashutosh Dixit (1):
  HAX: Add gem_ctx_freq@sysfs and perf_pmu@frequency to
    fast-feedback.testlist

 tests/intel-ci/fast-feedback.testlist | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.38.0
