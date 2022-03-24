Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA68010E878
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Mar 2022 10:19:50 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 24 Mar 2022 15:48:48 +0530
Message-Id: <20220324101852.73089-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [RFC PATCH i-g-t 0/4] Basic Suspend/Resume with i915
 unload
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

Exercise suspend/resume cycles without i915 module to know the system wide health 
of suspend/resume feature before executing i915 suspend/resume tests.

Tauro, Riana (4):
  lib/igt_aux: Suspend/resume without i915 module
  lib/drmtest : add function to  call exit handler to unload i915 module
  tests/i915/i915_suspend: Add suspend/resume cycle without i915 module
  i915/i915_pm_rpm: Add suspend/resume cycle without i915 module

 lib/drmtest.c             | 17 +++++++++++++++++
 lib/drmtest.h             |  1 +
 lib/igt_aux.c             | 23 +++++++++++++++++++++++
 lib/igt_aux.h             |  3 +++
 tests/i915/i915_pm_rpm.c  | 12 ++++++++++++
 tests/i915/i915_suspend.c | 39 +++++++++++++++++++++++++++++++++------
 6 files changed, 89 insertions(+), 6 deletions(-)

-- 
2.25.1
