Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C58E10EAC1
 for <igt-dev@lists.freedesktop.org>; Tue, 31 May 2022 06:08:08 +0000 (UTC)
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 31 May 2022 11:06:46 +0530
Message-Id: <20220531053648.19856-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v6 0/2] tests/kms_async_flips: Cleanup
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
-Convert tests to dynamic
-Cleanup the test

Signed-off-by: Karthik B S <karthik.b.s@intel.com>

Karthik B S (2):
  tests/kms_async_flips: Convert tests to dynamic
  tests/kms_async_flips: Test Cleanup

 tests/kms_async_flips.c | 235 +++++++++++++++++++++++++---------------
 1 file changed, 146 insertions(+), 89 deletions(-)

-- 
2.22.0
