Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 687976E069
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Mar 2021 12:03:18 +0000 (UTC)
From: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Date: Thu, 18 Mar 2021 17:23:20 +0530
Message-Id: <20210318115320.109568-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [i-g-t] tests/kms_content_protection: Initialize fb
 height width to 0
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
Cc: hariom.pandey@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

While requesting for framebuffer height and width should be in
kernel expected limit. As the test is not initializing height
and width to 0 garbage framebuffer size is getting requested and
fails. Addressed same, initalizing height and width to 0.

Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
---
 tests/kms_content_protection.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 0c2173fb..9cd33b87 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -707,7 +707,7 @@ static void test_content_protection_cleanup(void)
 static void create_fbs(void)
 {
 	igt_output_t *output;
-	int width, height;
+	int width = 0, height = 0;
 	drmModeModeInfo *mode;
 
 	for_each_connected_output(&data.display, output) {
-- 
2.30.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
