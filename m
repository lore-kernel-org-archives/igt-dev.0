Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76B2D10E413
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Mar 2023 23:04:08 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 22 Mar 2023 16:04:00 -0700
Message-Id: <20230322230402.3342787-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] i915/i915_power: Also show requested
 and actual freq's
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

Ashutosh Dixit (1):
  i915/i915_power: Also show requested and actual freq's

Zbigniew Kempczyński (1):
  lib/igt_sysfs: Add i915_for_each_gt() macro

 lib/igt_sysfs.h         |  5 +++++
 tests/i915/i915_power.c | 10 +++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

-- 
2.38.0
