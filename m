Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 921056F47C
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jun 2021 12:31:40 +0000 (UTC)
From: venkata.sai.patnana@intel.com
Date: Thu,  3 Jun 2021 17:50:17 +0530
Message-Id: <20210603122027.27330-14-venkata.sai.patnana@intel.com>
In-Reply-To: <20210603122027.27330-1-venkata.sai.patnana@intel.com>
References: <20210603122027.27330-1-venkata.sai.patnana@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 14/24] tests/kms_color_chamelium: Optimize
 plane ctm test
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: Kunal Joshi <kunal1.joshi@intel.com>

Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
(cherry picked from commit 71599658db6b7f60ba9381201074dbbae73381cf)
---
 tests/kms_color_chamelium.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/kms_color_chamelium.c b/tests/kms_color_chamelium.c
index 38c7169737..52eef8a66f 100644
--- a/tests/kms_color_chamelium.c
+++ b/tests/kms_color_chamelium.c
@@ -1265,6 +1265,8 @@ static void run_plane_ctm_test(data_t *data,
 			result |= test_plane_ctm(data, plane,
 					red_green_blue,	expected,
 					ctm);
+			if (result)
+				break;
 		}
 
 		igt_assert(result);
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
