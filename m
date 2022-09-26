Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C5B510E67C
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Sep 2022 10:33:21 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 26 Sep 2022 15:58:06 +0530
Message-Id: <20220926102808.28373-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 0/2] Convert PSR2 sf & su test to dynamic
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>, petri.latvala@intel.com
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

 tests/i915/kms_psr2_sf.c | 291 ++++++++++++++++++++++++++-------------
 tests/i915/kms_psr2_su.c |  93 ++++++++-----
 2 files changed, 257 insertions(+), 127 deletions(-)

-- 
2.36.0
