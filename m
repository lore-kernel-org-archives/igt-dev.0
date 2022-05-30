Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE7B410F3D9
 for <igt-dev@lists.freedesktop.org>; Mon, 30 May 2022 07:01:23 +0000 (UTC)
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 30 May 2022 11:59:57 +0530
Message-Id: <20220530062959.18257-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 0/2] tests/kms_async_flips: Cleanup
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

 tests/kms_async_flips.c | 273 +++++++++++++++++++++++++++-------------
 1 file changed, 189 insertions(+), 84 deletions(-)

-- 
2.22.0
