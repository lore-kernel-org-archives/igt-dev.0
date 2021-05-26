Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB54A6EC1A
 for <igt-dev@lists.freedesktop.org>; Wed, 26 May 2021 07:36:32 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
Date: Wed, 26 May 2021 12:50:35 +0530
Message-Id: <20210526072040.2286-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v4 0/5] PC state igt test
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

v4 has rebased and fixed some review comments from Uma.

Anshuman Gupta (5):
  i915/i915_pm_rpm: Enable PC8+ residency test
  i915/i915_pm_rpm: optimize modeset-pc8-residency-stress test
  i915/i915_pm_rpm: gem-execbuf-stress PC8 timeout
  i915/i915_pm_rpm: Add PC10 display off test
  i915/i915_pm_rpm: Add PC10 idle display on test

 tests/i915/i915_pm_rpm.c | 103 +++++++++++++++++++++++++++++++--------
 1 file changed, 83 insertions(+), 20 deletions(-)

-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
