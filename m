Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B637E10E7B4
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Sep 2023 12:11:40 +0000 (UTC)
From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  1 Sep 2023 17:51:55 +0530
Message-Id: <20230901122156.361769-1-sujaritha.sundaresan@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v3 0/1] Add multi-gt support for rc6_residency testing
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

Adding multi-gt support for rc6_idle and rc6_fence.

Sujaritha Sundaresan (1):
  tests/i915: Add multi-gt support for rc6_idle and rc6_fence tests

 tests/i915/i915_pm_rc6_residency.c | 32 +++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 12 deletions(-)

-- 
2.25.1
