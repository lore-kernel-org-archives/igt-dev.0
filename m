Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B92FA10F6D4
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jun 2022 13:29:02 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 28 Jun 2022 19:02:18 +0530
Message-Id: <20220628133220.26100-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] tests/kms_invalid_mode: Test Cleanup
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

Convert all possible subtests to dynamic and sanitize the system
state before starting/exiting the subtest

Nidhi Gupta (2):
  tests/kms_invalid_mode: Convert tests to dynamic
  tests/kms_invalid_mode: Test Cleanup

 tests/kms_invalid_mode.c | 73 +++++++++++++++-------------------------
 1 file changed, 28 insertions(+), 45 deletions(-)

-- 
2.26.2
