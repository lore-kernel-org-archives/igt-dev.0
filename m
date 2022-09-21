Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BEA210E143
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Sep 2022 23:10:12 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 22 Sep 2022 04:34:53 +0530
Message-Id: <20220921230455.21298-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/2] Convert PSR2 sf & su test to dynamic
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Convert psr2_sf & psr2_su patch to dynamic subtests. 
We check psr2 support for each pipe and if the pipe supports then
its added as part of dynamic subtest instead to running through all
pipe.

Jeevan B (2):
  tests/i915/kms_psr2_sf: Convert tests to dynamic
  tests/i915/kms_psr2_su: Convert tests to dynamic

 tests/i915/kms_psr2_sf.c | 278 +++++++++++++++++++++++++--------------
 tests/i915/kms_psr2_su.c |  92 ++++++++-----
 2 files changed, 243 insertions(+), 127 deletions(-)

-- 
2.36.0
