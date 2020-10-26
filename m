Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA2816E973
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Oct 2020 08:48:50 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Mon, 26 Oct 2020 10:48:40 +0200
Message-Id: <20201026084840.13061-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib/igt_core: Don't return too early in
 common_init_config
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
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

common_init_config is responsible for adding the device filters
supplied through the environment to the filter list. If the .igtrc
file cannot be opened, make sure the filter is added still.

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Arkadiusz Hiler <arek@hiler.eu>
---
 lib/igt_core.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index b358173f..8f9d925b 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -775,21 +775,20 @@ GKeyFile *igt_load_igtrc(void)
 static void common_init_config(void)
 {
 	GError *error = NULL;
-	int ret;
+	int ret = 0;
 
 	igt_key_file = igt_load_igtrc();
-	if (!igt_key_file)
-		return;
 
-	if (!igt_frame_dump_path)
+	if (igt_key_file && !igt_frame_dump_path)
 		igt_frame_dump_path =
 			g_key_file_get_string(igt_key_file, "Common",
 					      "FrameDumpPath", &error);
 
 	g_clear_error(&error);
 
-	ret = g_key_file_get_integer(igt_key_file, "DUT", "SuspendResumeDelay",
-				     &error);
+	if (igt_key_file)
+		ret = g_key_file_get_integer(igt_key_file, "DUT", "SuspendResumeDelay",
+					     &error);
 	assert(!error || error->code != G_KEY_FILE_ERROR_INVALID_VALUE);
 
 	g_clear_error(&error);
@@ -804,9 +803,10 @@ static void common_init_config(void)
 		if (igt_rc_device) {
 			igt_debug("Notice: using IGT_DEVICE env:\n");
 		} else {
-			igt_rc_device =	g_key_file_get_string(igt_key_file,
-							      "Common",
-							      "Device", &error);
+			if (igt_key_file)
+				igt_rc_device =	g_key_file_get_string(igt_key_file,
+								      "Common",
+								      "Device", &error);
 			g_clear_error(&error);
 			if (igt_rc_device)
 				igt_debug("Notice: using .igtrc "
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
