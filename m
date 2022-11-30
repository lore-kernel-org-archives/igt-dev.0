Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 310E310E10F
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Nov 2022 17:42:25 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id i9so12840972qkl.5
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Nov 2022 09:42:25 -0800 (PST)
From: Mark Yacoub <markyacoub@chromium.org>
To: igt-dev@lists.freedesktop.org
Date: Wed, 30 Nov 2022 12:42:17 -0500
Message-Id: <20221130174217.2261845-1-markyacoub@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH] igt_chameleon: Assert if there are no connected
 ports
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: robdclark@chromium.org, vsuley@google.com, petri.latvala@intel.com,
 ihf@google.com, amstan@chromium.org, kalin@google.com, seanpaul@chromium.org,
 matthewtlam@google.com, markyacoub@google.com, khaled.almahallawy@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

[Why]
The tests are meant to run on devices that have a chameleon connected.
If autodiscovery finds no port, it means something is off and the DUT is
not behaving well.

[How]
Add an assert if no port is mapped.

Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
---
 lib/igt_chamelium.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
index 79920de1..4e7a7a8f 100644
--- a/lib/igt_chamelium.c
+++ b/lib/igt_chamelium.c
@@ -2749,6 +2749,10 @@ unplug_port:
 	igt_debug("Auto-discovery took %fms and found %i connector(s)\n",
 		  (float)elapsed_ns / (1000 * 1000), chamelium->port_count);
 
+	igt_assert_f(
+		is_any_port_mapped,
+		"No port is mapped. We don't expect to have no connected connectors.\n");
+
 	return is_any_port_mapped;
 }
 
-- 
2.38.1.584.g0f3c55d4c2-goog
