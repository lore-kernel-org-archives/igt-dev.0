Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC26E83820
	for <igt-dev@archiver.kernel.org>; Mon, 16 Feb 2026 18:44:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9D5C10E3DF;
	Mon, 16 Feb 2026 18:44:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="rQEAzjkj";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D86C010E3DE
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Feb 2026 18:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BEif5VqzXt0WR7q4qY2f9CdmbJms/28Je8wflnWHAjI=; b=rQEAzjkjrxdLCTvcclQUfrNhcN
 5autOGCVAzz5luHMPa5dHt03JJIjSZbj8FZsCA81AOpoco0n3GmWyRxsDJHDfO62B4COELTEqHL4+
 s2yQyrg6+KGKy7TqqFaKzrrBkd1hZiGDY4zm6y+ZAD3fMy0krD7j1yAfAMVoEbKNZtM5QeXpfo8Dt
 TfJwy9NxOiaOB+qRCQqNwhvBx/4+uN768c6HJWHil1DFtaY/pN8o2Vls7AERfq0bDqN6uhPZLdsdM
 sNOeXIdSJPO4C9Zm9GI3/HWhw/ADiZljmRUt3tAK5fFAvly1Supl8pi5s4dp7ykhWu+4cC3qWLCua
 gZQNKiXw==;
Received: from c-73-157-168-91.hsd1.or.comcast.net ([73.157.168.91]
 helo=localhost.localdomain) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vs3Zi-001Ohv-Io; Mon, 16 Feb 2026 19:44:03 +0100
From: John Harrison <John.Harrison@Igalia.com>
To: igt-dev@lists.freedesktop.org
Cc: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v2 2/2] tool/intel_hdcp: Fix flickering when changing
 HDCP state
Date: Mon, 16 Feb 2026 10:43:41 -0800
Message-ID: <20260216184341.437722-3-John.Harrison@Igalia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260216184341.437722-1-John.Harrison@Igalia.com>
References: <20260216184341.437722-1-John.Harrison@Igalia.com>
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
index 8e29c5e32..56ed720cf 100644
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
 
@@ -678,13 +667,12 @@ int main(int argc, char **argv)
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
@@ -718,7 +706,6 @@ int main(int argc, char **argv)
 			enable_hdcp_type(&data, HDCP_TYPE_2_2_TYPE_1);
 			break;
 		case 5:
-			stop_video_player(&data);
 			set_hdcp_prop(&data, CP_UNDESIRED, HDCP_TYPE_2_2_TYPE_1,
 				      data.selected_connector);
 			data.hdcp_type = HDCP_TYPE_NONE;
@@ -727,17 +714,6 @@ int main(int argc, char **argv)
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

