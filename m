Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD18210E10A
 for <igt-dev@lists.freedesktop.org>; Sat, 21 Jan 2023 05:42:08 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 20 Jan 2023 21:41:53 -0800
Message-Id: <20230121054153.410979-3-ashutosh.dixit@intel.com>
In-Reply-To: <20230121054153.410979-1-ashutosh.dixit@intel.com>
References: <20230121054153.410979-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] HAX: Add i915_power@sanity to
 fast-feedback.testlist
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

CI.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel-ci/fast-feedback.testlist | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index 4188e97375d..a266c316db9 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -128,6 +128,7 @@ igt@i915_pm_backlight@basic-brightness
 igt@i915_pm_rpm@basic-pci-d3-state
 igt@i915_pm_rpm@basic-rte
 igt@i915_pm_rps@basic-api
+igt@i915_power@sanity
 igt@prime_self_import@basic-llseek-bad
 igt@prime_self_import@basic-llseek-size
 igt@prime_self_import@basic-with_fd_dup
-- 
2.38.0
