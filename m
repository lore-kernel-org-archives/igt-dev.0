Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 576146E19C
 for <igt-dev@lists.freedesktop.org>; Tue,  4 May 2021 05:59:51 +0000 (UTC)
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
Date: Tue,  4 May 2021 11:10:27 +0530
Message-Id: <20210504054027.12895-2-pankaj.laxminarayan.bharadiya@intel.com>
In-Reply-To: <20210504054027.12895-1-pankaj.laxminarayan.bharadiya@intel.com>
References: <20210504054027.12895-1-pankaj.laxminarayan.bharadiya@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/kms_psr2_su: Add subtest
 description
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, gwan-gyeong.mun@intel.com, jose.souza@intel.com
Cc: kishore.kunche@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Add description for all subtests.

Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
---
 tests/kms_psr2_su.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/kms_psr2_su.c b/tests/kms_psr2_su.c
index 9215c59d6..c709065f5 100644
--- a/tests/kms_psr2_su.c
+++ b/tests/kms_psr2_su.c
@@ -272,6 +272,7 @@ igt_main
 	}
 
 	for (data.op = PAGE_FLIP; data.op < LAST; data.op++) {
+		igt_describe("Test that selective update works when screen changes");
 		igt_subtest_f("%s", op_str(data.op)) {
 			prepare(&data);
 			run(&data);
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
