Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B66BEC88E77
	for <igt-dev@archiver.kernel.org>; Wed, 16 Sep 2026 11:19:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69CC210E69C;
	Wed, 16 Sep 2026 11:19:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OmxaGXpL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF05F10E043
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Sep 2026 11:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789557119; x=1821093119;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ptdmDWfRaEWhhGp0bVSZ9wuBTtDWzhBFxK2GRrPRIpQ=;
 b=OmxaGXpLArwve46zljPSUFFYy0iNje5j36xWzcBmQ6Up4AogrIWHBZuT
 +gO/hfhLulAMsm5CRpCLNWrsmsjZKr150ERrRYSCKSMHwIBZe3XJmGoEa
 dv8A7XXg7Pz7iJqkpPhkSyD+P2JkhkuZcbW0PiHHVgMYNNARyRo0P41wf
 w76x9NVCopAH9b8DqYbqsLgpyvAket4/y2Ns8qfUbD8GC6a88bMNbadnZ
 ldTlAvx3HfmhG6Q6Wv581ytvtPW3C4+v60mioH+HUiLLI7UrP058CT5DJ
 32idr0wJuQ+MVIU+BZ8wHdgv8qiKlkY4zAyoJOg6ctDYBl6Sd4zKBkH62 A==;
X-CSE-ConnectionGUID: yh1ZgErdRJ6G5XF/eWgBmw==
X-CSE-MsgGUID: bCnG5ua9TSqVawur2GSywg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="440565"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="440565"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 04:11:58 -0700
X-CSE-ConnectionGUID: RU0OOJPKRNaGDXoqODDC9A==
X-CSE-MsgGUID: lSCItNE4TsC22FrJPr8z9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="296801035"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 04:11:55 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, swati2.sharma@intel.com,
 santhoshguddati@gmail.com, ankit.k.nautiyal@intel.com,
 karthik.b.s@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1 12/16] tools/intel_hdcp: Show the transition log on
 the display
Date: Wed, 16 Sep 2026 16:37:05 +0530
Message-ID: <20260916110718.596603-13-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916110718.596603-1-santhosh.reddy.guddati@intel.com>
References: <20260916110718.596603-1-santhosh.reddy.guddati@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

The tracker prints every Content Protection change to the console, which
is the right place when someone is reading a log afterwards and the wrong
place during a demo: from the display there is no way to tell an
authentication that took 280 ms from one that took two seconds, or a link
that dropped and came back from one that never moved.

Put the last few transitions on screen, under the state badge, in the
same form the console uses. When there have been none, say so and say
which keys produce one, so "nothing has happened yet" can be told from
"the tracker is not running".

The overlay reads these from the video thread while the tracker writes
them, so they go in their own small ring under data->lock rather than in
transitions[], which is only safe to read once the tracker has joined.

Assisted-by: GitHub Copilot:Claude Opus 4.6
Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tools/intel_hdcp.c | 81 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c
index 38ca8b2484..a77facf2f6 100644
--- a/tools/intel_hdcp.c
+++ b/tools/intel_hdcp.c
@@ -21,6 +21,9 @@
 /* Enough to cover a bring-up session; the counter keeps going past it. */
 #define MAX_CP_TRANSITIONS	64
 
+/* How many of them the overlay shows. Bounded by what fits on screen. */
+#define NUM_RECENT_TRANSITIONS	5
+
 /*
  * Bumped by hand when the operator-visible behaviour changes, so a log or a
  * photo of the screen can be tied back to a known build of the tool.
@@ -75,6 +78,14 @@ typedef struct data {
 	struct cp_transition transitions[MAX_CP_TRANSITIONS];
 	unsigned int num_transitions;
 	uint64_t protected_ms;
+	/*
+	 * A ring of the most recent transitions, for the overlay to show while
+	 * the session is still running. Separate from transitions[] above so
+	 * that it keeps turning over once that one is full, and guarded by
+	 * data->lock because the overlay reads it from another thread.
+	 */
+	struct cp_transition recent[NUM_RECENT_TRANSITIONS];
+	unsigned int num_recent;
 } data_t;
 
 static volatile sig_atomic_t quit_requested;
@@ -320,6 +331,12 @@ static void record_transition(data_t *data, uint64_t from, uint64_t to,
 	if (from == CP_ENABLED)
 		data->protected_ms += dwell_ms;
 
+	/* Called with the lock dropped, so taking it here does not recurse. */
+	pthread_mutex_lock(&data->lock);
+	data->recent[data->num_recent % ARRAY_SIZE(data->recent)] = t;
+	data->num_recent++;
+	pthread_mutex_unlock(&data->lock);
+
 	print_transition(&t);
 	fflush(stdout);
 }
@@ -919,6 +936,65 @@ static void draw_key_legend(cairo_t *cr, data_t *data, double y)
 	}
 }
 
+/*
+ * The transitions the tracker has seen, on the display. The console log has
+ * them too, but a demo is watched on the panel, and this is what shows that
+ * the uevents are arriving at all: press 2 and the line appears as the kernel
+ * moves the property, without the tool having polled for it.
+ *
+ * Called with data->lock held.
+ */
+static void draw_transition_log(cairo_t *cr, data_t *data, double y)
+{
+	char line[NUM_RECENT_TRANSITIONS][96];
+	double w = data->width, h = data->height;
+	double size = h * 0.025, widest = 0, x;
+	cairo_text_extents_t ext;
+	unsigned int n, i, first;
+
+	n = data->num_recent;
+	if (n > ARRAY_SIZE(data->recent))
+		n = ARRAY_SIZE(data->recent);
+
+	cairo_select_font_face(cr, "monospace", CAIRO_FONT_SLANT_NORMAL,
+			       CAIRO_FONT_WEIGHT_BOLD);
+	cairo_set_source_rgba(cr, 1.0, 1.0, 1.0, 0.5);
+	draw_text(cr, h * 0.020, w / 2, y, ALIGN_CENTER,
+		  n ? "CONTENT PROTECTION EVENTS" :
+		      "NO CONTENT PROTECTION EVENTS YET - PRESS 2, 3 OR 4");
+
+	/*
+	 * Lay the lines out as a block: measure them all, then left-align at a
+	 * common x. Centring each line individually would make the columns
+	 * wander as the timestamps and durations change width.
+	 */
+	first = data->num_recent - n;
+	cairo_set_font_size(cr, size);
+
+	for (i = 0; i < n; i++) {
+		const struct cp_transition *t =
+			&data->recent[(first + i) % ARRAY_SIZE(data->recent)];
+
+		snprintf(line[i], sizeof(line[i]),
+			 "%8.3fs  %-9s -> %-9s  after %5" PRIu64 " ms",
+			 t->ms / 1000.0, cp_state_name(t->from),
+			 cp_state_name(t->to), t->dwell_ms);
+
+		cairo_text_extents(cr, line[i], &ext);
+		if (ext.width > widest)
+			widest = ext.width;
+	}
+
+	x = (w - widest) / 2;
+	for (i = 0; i < n; i++) {
+		/* Dim everything but the most recent. */
+		cairo_set_source_rgba(cr, 1.0, 1.0, 1.0,
+				      i == n - 1 ? 0.95 : 0.55);
+		draw_text(cr, size, x, y + h * 0.05 + i * size * 1.5,
+			  ALIGN_LEFT, line[i]);
+	}
+}
+
 static void draw_video_frame(data_t *data, struct igt_fb *fb, int state,
 			     uint64_t frame)
 {
@@ -990,6 +1066,11 @@ static void draw_video_frame(data_t *data, struct igt_fb *fb, int state,
 	cairo_set_source_rgba(cr, 1.0, 1.0, 1.0, 0.85);
 	draw_text(cr, h * 0.026, w / 2, y + h * 0.06, ALIGN_CENTER, buf);
 
+	draw_transition_log(cr, data, h * 0.66);
+
+	cairo_select_font_face(cr, "Helvetica", CAIRO_FONT_SLANT_NORMAL,
+			       CAIRO_FONT_WEIGHT_BOLD);
+
 	/* Status bar: elapsed time and frame counter flanking the key legend. */
 	elapsed = time(NULL) - data->video_start_time;
 	snprintf(buf, sizeof(buf), "%02d:%02d",
-- 
2.43.0

