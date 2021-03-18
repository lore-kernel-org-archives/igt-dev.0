Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED2476E20B
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Mar 2021 23:54:39 +0000 (UTC)
From: Lucas De Marchi <lucas.demarchi@intel.com>
Date: Thu, 18 Mar 2021 16:54:26 -0700
Message-Id: <20210318235426.448465-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tool/lsgpu: Fix memory leak when no device
 is found
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
Cc: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>

Memory allocated during device scan were not being freed.
added call of igt_devices_free().

Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tools/lsgpu.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/tools/lsgpu.c b/tools/lsgpu.c
index 25358bbe..27e76f26 100644
--- a/tools/lsgpu.c
+++ b/tools/lsgpu.c
@@ -171,7 +171,7 @@ int main(int argc, char *argv[])
 		{"help",              no_argument,       NULL, OPT_HELP},
 		{0, 0, 0, 0}
 	};
-	int c, index = 0;
+	int c, ret = 0, index = 0;
 	char *env_device = NULL, *opt_device = NULL, *rc_device = NULL;
 	struct igt_devices_print_format fmt = {
 			.type = IGT_PRINT_USER,
@@ -257,7 +257,8 @@ int main(int argc, char *argv[])
 
 		if (!igt_device_card_match(igt_device, &card)) {
 			printf("No device found for the filter\n\n");
-			return -1;
+			ret = -1;
+			goto out;
 		}
 
 		printf("Device detail:\n");
@@ -272,9 +273,10 @@ int main(int argc, char *argv[])
 	} else {
 		igt_devices_print(&fmt);
 	}
-
+out:
+	igt_devices_free();
 	free(rc_device);
 	free(opt_device);
 
-	return 0;
+	return ret;
 }
-- 
2.30.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
