Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F74A11AC73
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jun 2022 04:28:32 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 10 Jun 2022 10:01:29 +0530
Message-Id: <20220610043131.3452-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 0/2] tests/kms: IGT test cleanup
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

In below test, convert all possible subtests to dynamic and
sanitize the system state before starting/exiting the subtest.

Nidhi Gupta (2):
  tests/i915/kms_draw_crc.c: Convert test to dynamic
  tests/i915/kms_draw_crc: Test Cleanup

 tests/i915/kms_draw_crc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

-- 
2.26.2
