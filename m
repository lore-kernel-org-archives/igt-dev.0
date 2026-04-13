Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F0C5F531DE
	for <igt-dev@archiver.kernel.org>; Mon, 13 Apr 2026 23:37:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7E8C10E557;
	Mon, 13 Apr 2026 23:37:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ac0Q5qOw";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5ECF10E557
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Apr 2026 23:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aFvh85T1rSaeJYdV73TlZtENcUhytzEg0RRV+VEAsD4=; b=ac0Q5qOwnvC0AnYSoRDwSG7lSU
 Lx/gBKeQ1/skGRwJmA4HPXpeBBO6AIwE1X0py0u9OePYm9caH0KmlPPuPAutIMOmY0H+aGe8ACIfR
 xjCF5qZhFqIjSTuSlKN1rBVdiJPVltbSALHlSaQIPRnNN7QUOf2whz/+m3gofDJNAng+CDGZXG2lP
 7NunoJ8G5hgbQm88TrbwXoZCZfydhtoKQUSKc3oWzHlYK6tLGzWk9ufKmQFOWNf8nVYeaJV+TSLcP
 SxprwIKYGfjHYOvQHnvtGabP4QIElVylQs/cQCqcb0PxaxxZnrYY3ioirDYx/MSKebD0A+kFruepD
 bvATU2XA==;
Received: from c-73-157-168-91.hsd1.or.comcast.net ([73.157.168.91]
 helo=localhost.localdomain) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wCQqQ-00FeK3-KU; Tue, 14 Apr 2026 01:37:31 +0200
From: John Harrison <John.Harrison@Igalia.com>
To: igt-dev@lists.freedesktop.org
Cc: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v3 4/4] tools/intel_hdcp: Fix flickering when changing
 HDCP state
Date: Mon, 13 Apr 2026 16:36:29 -0700
Message-ID: <20260413233629.771034-5-John.Harrison@Igalia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260413233629.771034-1-John.Harrison@Igalia.com>
References: <20260413233629.771034-1-John.Harrison@Igalia.com>
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

The menu system would redraw the screen with a special colour to
denote the current HDCP status after a change was requested. However,
the screen was immediately redrawn by the player thread with a
background colour denoting the requested HDCP level. So all you
actually got was a very brief full screen flicker of the background
colour.

As the current HDCP status is now being shown as a separate line of
text in the video player's output, there is no need to use the screen
background to show the same. So, drop the menu updates once the video
player is running to remove the flickering.

Also, don't stop the video player thread when HDCP is disabled so that
the status update continues (given that the menu thread is no longer
redrawing the screen now).

v2: Split into two patches (review feedback by Kamil)

CC: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
CC: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: John Harrison <John.Harrison@Igalia.com>
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tools/intel_hdcp.c | 34 +++++-----------------------------
 1 file changed, 5 insertions(+), 29 deletions(-)

diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c
index c12de06df..448d2e36d 100644
--- a/tools/intel_hdcp.c
+++ b/tools/intel_hdcp.c
@@ -102,24 +102,13 @@ static void draw_menu_text(cairo_t *cr, data_t *data)
 	}
 }
 
-static void draw_menu(data_t *data, const char *status)
+static void draw_menu(data_t *data)
 {
 	cairo_t *cr = igt_get_cairo_ctx(data->fd, &data->fb);
 
-	/* Background color and text color based on HDCP status */
-	if (strcmp(status, "INIT") == 0) {
-		cairo_set_source_rgb(cr, 0.051, 0.278, 0.631);
-		cairo_paint(cr);
-		cairo_set_source_rgb(cr, 1.0, 1.0, 1.0);
-	} else if (strcmp(status, "Enabled") == 0) {
-		cairo_set_source_rgb(cr, 0.0, 1.0, 0.0);
-		cairo_paint(cr);
-		cairo_set_source_rgb(cr, 0.0, 0.0, 0.0);
-	} else {
-		cairo_set_source_rgb(cr, 1.0, 0.0, 0.0);
-		cairo_paint(cr);
-		cairo_set_source_rgb(cr, 1.0, 1.0, 1.0);
-	}
+	cairo_set_source_rgb(cr, 0.051, 0.278, 0.631);
+	cairo_paint(cr);
+	cairo_set_source_rgb(cr, 1.0, 1.0, 1.0);
 
 	draw_menu_text(cr, data);
 
@@ -666,13 +655,12 @@ int main(int argc, char **argv)
 {
 	data_t data;
 	pthread_t tid;
-	const char *status = NULL;
 	igt_plane_t *primary;
 
 	data.selected_connector = -1;
 	test_init(&data);
 
-	draw_menu(&data, "INIT");
+	draw_menu(&data);
 	primary = igt_output_get_plane_type(data.output, DRM_PLANE_TYPE_PRIMARY);
 	igt_plane_set_fb(primary, &data.fb);
 	igt_display_commit2(&data.display, COMMIT_ATOMIC);
@@ -706,7 +694,6 @@ int main(int argc, char **argv)
 			enable_hdcp_type(&data, HDCP_TYPE_2_2_TYPE_1);
 			break;
 		case 5:
-			stop_video_player(&data);
 			set_hdcp_prop(&data, CP_UNDESIRED, HDCP_TYPE_2_2_TYPE_1,
 				      data.selected_connector);
 			data.hdcp_type = HDCP_TYPE_NONE;
@@ -715,17 +702,6 @@ int main(int argc, char **argv)
 			break;
 		}
 
-		if (cmd == 1) {
-			draw_menu(&data, "INIT");
-		} else {
-			status = get_hdcp_status(&data, data.selected_connector);
-			draw_menu(&data, status);
-		}
-
-		primary = igt_output_get_plane_type(data.output, DRM_PLANE_TYPE_PRIMARY);
-		igt_plane_set_fb(primary, &data.fb);
-		igt_display_commit2(&data.display, COMMIT_ATOMIC);
-
 		usleep(200 * 1000);
 	}
 
-- 
2.43.0

