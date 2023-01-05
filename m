Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1C4910E633
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Jan 2023 03:34:35 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  4 Jan 2023 19:34:31 -0800
Message-Id: <20230105033431.3981780-2-ashutosh.dixit@intel.com>
In-Reply-To: <20230105033431.3981780-1-ashutosh.dixit@intel.com>
References: <20230105033431.3981780-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/1] HAX: Add gem_ctx_freq@sysfs and
 perf_pmu@frequency to fast-feedback.testlist
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

CI ONLY, PLEASE DON'T REVIEW

Try to repro GL #6806 nad #6786 because these could not be reproduced
locally. Also, the only DG2 machines these are reproducing on are in
drm-tip CI and not in trybot so not sending this patch to trybot.

Bug: https://gitlab.freedesktop.org/drm/intel/-/issues/6806
Bug: https://gitlab.freedesktop.org/drm/intel/-/issues/6786
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel-ci/fast-feedback.testlist | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index 88c90221e5a..723bb9af3b1 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -19,6 +19,7 @@ igt@gem_close_race@basic-threads
 igt@gem_ctx_create@basic
 igt@gem_ctx_create@basic-files
 igt@gem_ctx_exec@basic
+igt@gem_ctx_freq@sysfs
 igt@gem_exec_basic@basic
 igt@gem_exec_create@basic
 igt@gem_exec_fence@basic-busy
@@ -128,6 +129,7 @@ igt@i915_pm_backlight@basic-brightness
 igt@i915_pm_rpm@basic-pci-d3-state
 igt@i915_pm_rpm@basic-rte
 igt@i915_pm_rps@basic-api
+igt@perf_pmu@frequency
 igt@prime_self_import@basic-llseek-bad
 igt@prime_self_import@basic-llseek-size
 igt@prime_self_import@basic-with_fd_dup
-- 
2.38.0
