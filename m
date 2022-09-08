Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB72610EAEC
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Sep 2022 13:18:41 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  8 Sep 2022 18:44:15 +0530
Message-Id: <20220908131417.17308-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Convert PSR2 sf & su test to dynamic
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

Convert psr2_sf & psr2_su patch to dynamic subtests. 
We check psr2 support for each pipe and if the pipe supports then
its added as part of dynamic subtest instead to running through all
pipe.

Jeevan B (2):
  tests/i915/kms_psr2_su: Convert tests to dynamic
  tests/i915/kms_psr2_sf: Convert tests to dynamic

 tests/i915/kms_psr2_sf.c | 259 +++++++++++++++++++++++++++------------
 tests/i915/kms_psr2_su.c |  63 ++++++----
 2 files changed, 221 insertions(+), 101 deletions(-)

-- 
2.36.0
