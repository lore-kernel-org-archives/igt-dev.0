Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66DD810E19D
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Jan 2023 18:09:39 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 27 Jan 2023 10:09:32 -0800
Message-Id: <20230127180934.158123-1-ashutosh.dixit@intel.com>
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
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Ashutosh Dixit (2):
  i915/i915_power: Sanity check power measurement
  HAX: Add i915_power@sanity to fast-feedback.testlist

 tests/i915/i915_power.c               | 72 +++++++++++++++++++++++++++
 tests/intel-ci/fast-feedback.testlist |  1 +
 tests/meson.build                     |  1 +
 3 files changed, 74 insertions(+)
 create mode 100644 tests/i915/i915_power.c

-- 
2.38.0
