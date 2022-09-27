Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C006E10E07E
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Sep 2022 08:03:42 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 27 Sep 2022 13:28:07 +0530
Message-Id: <20220927075809.14401-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 0/2] Convert PSR2 sf & su test to dynamic
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
  tests/i915/kms_psr2_sf: Convert tests to dynamic
  tests/i915/kms_psr2_su: Convert tests to dynamic

 tests/i915/kms_psr2_sf.c | 293 ++++++++++++++++++++++++++-------------
 tests/i915/kms_psr2_su.c |  93 ++++++++-----
 2 files changed, 258 insertions(+), 128 deletions(-)

-- 
2.36.0
