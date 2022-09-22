Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C121310E0BF
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Sep 2022 06:54:06 +0000 (UTC)
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 22 Sep 2022 11:56:38 +0530
Message-Id: <20220922062640.29863-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 0/2] tests/kms_content_protection: Test
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
-Cleanup the test
-Convert the test to dynamic

Signed-off-by: Karthik B S <karthik.b.s@intel.com>

Karthik B S (2):
  tests/kms_content_protection: Test Cleanup
  tests/kms_content_protection: Convert test to dynamic

 tests/kms_content_protection.c | 395 ++++++++++++++++++---------------
 1 file changed, 216 insertions(+), 179 deletions(-)

-- 
2.22.0
