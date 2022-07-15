Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EE2910E05A
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Jul 2022 19:22:12 +0000 (UTC)
Received: by mail-qv1-xf2f.google.com with SMTP id g9so4380506qvq.7
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Jul 2022 12:22:12 -0700 (PDT)
From: Mark Yacoub <markyacoub@chromium.org>
To: igt-dev@lists.freedesktop.org
Date: Fri, 15 Jul 2022 15:22:00 -0400
Message-Id: <20220715192200.1782193-1-markyacoub@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH] lib/igt_chamelium: Extend check of valid ports to
 port=0
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: robdclark@chromium.org, amstan@google.com, petri.latvala@intel.com,
 ihf@google.com, seanpaul@chromium.org, khaled.almahallawy@intel.com,
 markyacoub@google.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

[Why]
Chamelium V3 has a valid port at 0 so 0 should not be rejected.

[How]
Check for port values between 0 and CHAMELIUM_MAX_PORTS which should
also include the V2 ports range.

Test: ./kms_chamelium --run-subtest dp-hp
Tested on: Volteer & cv3

Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
---
 lib/igt_chamelium.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
index 55cbfa12..5d68372b 100644
--- a/lib/igt_chamelium.c
+++ b/lib/igt_chamelium.c
@@ -2311,7 +2311,7 @@ static bool chamelium_read_port_mappings(struct chamelium *chamelium,
 		port->id = g_key_file_get_integer(igt_key_file, group,
 						  "ChameliumPortID",
 						  &error);
-		if (!port->id) {
+		if (port->id < 0 || port->id > CHAMELIUM_MAX_PORTS) {
 			igt_warn("Failed to read chamelium port ID for %s: %s\n",
 				 map_name, error->message);
 			ret = false;
-- 
2.37.0.170.g444d1eabd0-goog
