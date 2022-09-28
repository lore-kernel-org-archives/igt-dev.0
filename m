Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEFE610E50E
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Sep 2022 12:40:30 +0000 (UTC)
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 28 Sep 2022 17:43:01 +0530
Message-Id: <20220928121304.2590-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v6 0/3] tests/kms_content_protection: Test
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

 tests/kms_content_protection.c | 390 ++++++++++++++++++---------------
 1 file changed, 213 insertions(+), 177 deletions(-)

-- 
2.22.0
