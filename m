Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84C6B6ED79
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Feb 2020 13:09:50 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
Date: Thu, 20 Feb 2020 18:30:39 +0530
Message-Id: <20200220130041.24141-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 0/2] DC states IGT misc
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


Anshuman Gupta (2):
  tests/i915_pm_dc: Dump power_domain_info on DC test failures
  tests/i915_pm_dc: psr required only for dc*-psr tests

 tests/i915/i915_pm_dc.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

-- 
2.24.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
