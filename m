Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98EE889FA6
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Mar 2021 05:23:09 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
Date: Wed,  3 Mar 2021 10:37:32 +0530
Message-Id: <20210303050737.22056-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v3 0/5] PC state igt test
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

v3 has changed the pc8/pc10 timeout values.

Anshuman Gupta (5):
  i915/i915_pm_rpm: Enable PC8+ residency test
  i915/i915_pm_rpm: optimize modeset-pc8-residency-stress test
  i915/i915_pm_rpm: gem-execbuf-stress PC8 timeout
  i915/i915_pm_rpm: Add PC10 display off test
  i915/i915_pm_rpm: Add PC10 idle display on test

 tests/i915/i915_pm_rpm.c | 113 +++++++++++++++++++++++++++++++--------
 1 file changed, 92 insertions(+), 21 deletions(-)

-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
