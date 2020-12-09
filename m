Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB1036EAC5
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Dec 2020 16:21:58 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
Date: Wed,  9 Dec 2020 21:36:36 +0530
Message-Id: <20201209160642.6317-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/6] PC state igt test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Pakage C state, PC8 and PC10 igt test.

Anshuman Gupta (6):
  i915/i915_pm_rpm: Enable PC8+ residency test
  i915/i915_pm_rpm.c: create PC state subtest group
  i915/i915_pm_rpm: enable modeset-pc8-residency-stress test
  i915/i915_pm_rpm: gem-execbuf-stress-pc8 use powetop
  i915/i915_pm_rpm: Add PC10 display off test
  i915/i915_pm_rpm: Add PC10 idle display on test

 tests/i915/i915_pm_rpm.c | 135 +++++++++++++++++++++++++++++++++------
 1 file changed, 114 insertions(+), 21 deletions(-)

-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
