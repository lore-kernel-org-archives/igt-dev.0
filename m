Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF16310E0C2
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Aug 2023 03:32:37 +0000 (UTC)
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 25 Aug 2023 09:02:41 +0530
Message-Id: <20230825033243.1690-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] tests/i915/kms_big_joiner: Test Cleanup
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

Signed-off-by: Karthik B S <karthik.b.s@intel.com>

Karthik B S (2):
  tests/i915/kms_big_joiner: Test Cleanup
  tests/i915/kms_big_joiner: Make use of big joiner helpers

 tests/i915/kms_big_joiner.c | 46 +++++++++++++------------------------
 1 file changed, 16 insertions(+), 30 deletions(-)

-- 
2.39.1
