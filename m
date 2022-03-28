Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07A8910E4B1
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Mar 2022 06:48:28 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 28 Mar 2022 12:17:20 +0530
Message-Id: <20220328064722.127301-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Basic Suspend/Resume with i915 unload
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

Add a new subtest system-suspend-without-i915 in i915_suspend to test the 
system wide health of suspend/resume feature before executing i915 
suspend/resume tests.

Tauro, Riana (2):
  tests/i915/i915_suspend: Add system-suspend-without-i915 subtest
  tests/intel-ci/fast-feedback: Add system-suspend-without-i915 subtest
    into fast-feedback list

 tests/i915/i915_suspend.c             | 16 ++++++++++++++++
 tests/intel-ci/fast-feedback.testlist |  1 +
 2 files changed, 17 insertions(+)

-- 
2.25.1
