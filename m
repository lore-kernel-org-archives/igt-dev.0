Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3DE889B84
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jul 2021 07:24:36 +0000 (UTC)
From: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Date: Tue, 20 Jul 2021 12:46:14 +0530
Message-Id: <20210720071614.995556-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [i-g-t] tests/kms_prime: Use 256B aligned width
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

Having different alignment requirement by different drivers,
256B aligned should work for all drm drivers.

Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
---
 tests/kms_prime.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_prime.c b/tests/kms_prime.c
index 35f4b5b7..2e20c58b 100644
--- a/tests/kms_prime.c
+++ b/tests/kms_prime.c
@@ -101,7 +101,7 @@ static void prepare_scratch(int exporter_fd, struct dumb_bo *scratch,
 	scratch->bpp = 32;
 
 	scratch->handle = kmstest_dumb_create(exporter_fd,
-			scratch->width,
+			ALIGN(scratch->width, 256),
 			scratch->height,
 			scratch->bpp,
 			&scratch->pitch,
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
