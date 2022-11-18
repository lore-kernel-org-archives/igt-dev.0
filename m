Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED02A10E76F
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Nov 2022 16:36:24 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id jr19so3446313qtb.7
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Nov 2022 08:36:24 -0800 (PST)
From: Mark Yacoub <markyacoub@chromium.org>
To: igt-dev@lists.freedesktop.org
Date: Fri, 18 Nov 2022 11:35:45 -0500
Message-Id: <20221118163545.671778-1-markyacoub@chromium.org>
In-Reply-To: <20221117194639.481656-1-markyacoub@chromium.org>
References: <20221117194639.481656-1-markyacoub@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2] Cv3 workaround: skip plug all at init
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: robdclark@chromium.org, vsuley@google.com, petri.latvala@intel.com,
 ihf@google.com, amstan@chromium.org, kalin@google.com, seanpaul@chromium.org,
 matthewtlam@google.com, khaled.almahallawy@intel.com, markyacoub@google.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

[Why]
Currently, Cv3 doesn't allow all ports to be plugged in at the same time
so chamelium_plug_all() always fails.

[How]
Check for the first Port ID as it's unique between V2 and V3, and skip
the plugging if it's V3.

Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
---
 lib/igt_chamelium.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
index 68864bb8..79920de1 100644
--- a/lib/igt_chamelium.c
+++ b/lib/igt_chamelium.c
@@ -3019,6 +3019,17 @@ bool chamelium_plug_all(struct chamelium *chamelium)
 	if (port_count <= 0)
 		return false;
 
+	/*
+	 * A temporary workaround for Chamelium V3: Currently, Cv3 doesn't allow
+	 * all ports to be plugged in at the same time. Cv3 first port has an ID
+	 * of 0 while Cv2 has first port ID as 1.
+	 * TODO(markyacoub): Remove this workaround when V3 is fixed.
+	 */
+	if (port_ids[0] == 0) {
+		igt_debug("This should be Cv3. Skipping plugging all ports\n");
+		return true;
+	}
+
 	for (int i = 0; i < port_count; ++i) {
 		v = __chamelium_rpc(chamelium, NULL, "Plug", "(i)", port_ids[i]);
 
-- 
2.38.1.584.g0f3c55d4c2-goog
