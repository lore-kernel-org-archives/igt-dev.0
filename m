Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3CE06F492
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jun 2021 14:52:09 +0000 (UTC)
From: venkata.sai.patnana@intel.com
Date: Thu,  3 Jun 2021 20:10:12 +0530
Message-Id: <20210603144022.28176-13-venkata.sai.patnana@intel.com>
In-Reply-To: <20210603144022.28176-1-venkata.sai.patnana@intel.com>
References: <20210603144022.28176-1-venkata.sai.patnana@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v2 i-g-t 13/23] tests/kms_color: Optimize plane
 ctm test
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
Cc: Kunal Joshi <kunal1.joshi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Kunal Joshi <kunal1.joshi@intel.com>

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/kms_color.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index f8e0485f75..622faf0934 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -1361,6 +1361,8 @@ static void run_plane_ctm_test(data_t *data,
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
