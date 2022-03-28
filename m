Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D22710EC2B
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Mar 2022 05:18:34 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 28 Mar 2022 10:47:24 +0530
Message-Id: <20220328051727.119142-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/3] Basic Suspend/Resume with i915 unload
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

From: "Tauro, Riana" <riana.tauro@intel.com>

Add a new test system-suspend-without-i915 in i915_suspend to test the 
system wide health of suspend/resume feature before executing i915 
suspend/resume tests.

This test is a part of CI fast-feedback test list.
 
v2: Addressing review comments.

Tauro, Riana (3):
  lib/drmtest : add function to call exit handler to unload i915 module
  tests/i915/i915_suspend: Add system-suspend-without-i915 subtest
  tests/intel-ci/fast-feedback: Add system-suspend-without-i915 into
    fast-feedback list

 lib/drmtest.c                         | 17 +++++++++++++++++
 lib/drmtest.h                         |  1 +
 tests/i915/i915_suspend.c             | 20 ++++++++++++++++++++
 tests/intel-ci/fast-feedback.testlist |  1 +
 4 files changed, 39 insertions(+)

-- 
2.25.1
