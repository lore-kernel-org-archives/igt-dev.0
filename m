Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8721910E10A
 for <igt-dev@lists.freedesktop.org>; Sat, 21 Jan 2023 05:42:08 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 20 Jan 2023 21:41:51 -0800
Message-Id: <20230121054153.410979-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] i915/i915_power: Sanity check power
 measurement
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

Ashutosh Dixit (2):
  i915/i915_power: Sanity check power measurement
  HAX: Add i915_power@sanity to fast-feedback.testlist

 tests/i915/i915_power.c               | 73 +++++++++++++++++++++++++++
 tests/intel-ci/fast-feedback.testlist |  1 +
 tests/meson.build                     |  1 +
 3 files changed, 75 insertions(+)
 create mode 100644 tests/i915/i915_power.c

-- 
2.38.0
