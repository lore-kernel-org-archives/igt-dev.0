Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69DC010E3C6
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Jul 2022 14:52:01 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id a9so3438935qtw.10
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Jul 2022 07:52:01 -0700 (PDT)
From: Mark Yacoub <markyacoub@chromium.org>
To: igt-dev@lists.freedesktop.org
Date: Fri, 29 Jul 2022 10:51:54 -0400
Message-Id: <20220729145154.1101502-1-markyacoub@chromium.org>
In-Reply-To: <20220715192200.1782193-1-markyacoub@chromium.org>
References: <20220715192200.1782193-1-markyacoub@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2] lib/igt_chamelium: Check for error instead of
 port id for invalid
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

[Why]
Chamelium V3 has a valid port 0 so 0 should not be rejected.

[How]
Check if there is an error set from g_key_file_get_integer instead of
depending on port id.

v1:
Use GError instead of check for port ID range.

Test: ./kms_chamelium --run-subtest dp-hp
Tested on: Volteer & cv3

Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
---
 lib/igt_chamelium.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
index c7b99ebc..fbdb87ac 100644
--- a/lib/igt_chamelium.c
+++ b/lib/igt_chamelium.c
@@ -2311,7 +2311,7 @@ static bool chamelium_read_port_mappings(struct chamelium *chamelium,
 		port->id = g_key_file_get_integer(igt_key_file, group,
 						  "ChameliumPortID",
 						  &error);
-		if (!port->id) {
+		if (error) {
 			igt_warn("Failed to read chamelium port ID for %s: %s\n",
 				 map_name, error->message);
 			ret = false;
-- 
2.37.1.455.g008518b4e5-goog
