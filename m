Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AA9010EA83
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Sep 2022 04:22:57 +0000 (UTC)
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 29 Sep 2022 09:22:42 +0530
Message-Id: <20220929035245.6567-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v7 0/3] tests/kms_content_protection: Test
 Refactoring
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

Series includes patches to:
-Bug Fix in MST subtests
-Cleanup the test
-Convert the test to dynamic

Signed-off-by: Karthik B S <karthik.b.s@intel.com>

Karthik B S (3):
  tests/kms_content_protection: Fix MST subtests
  tests/kms_content_protection: Test Cleanup
  tests/kms_content_protection: Convert test to dynamic

 tests/kms_content_protection.c | 389 ++++++++++++++++++---------------
 1 file changed, 212 insertions(+), 177 deletions(-)

-- 
2.22.0
