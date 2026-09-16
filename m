Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79D52C88E5C
	for <igt-dev@archiver.kernel.org>; Wed, 16 Sep 2026 11:16:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2235410E031;
	Wed, 16 Sep 2026 11:16:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="btGNBXho";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C259810E043
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Sep 2026 11:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789557099; x=1821093099;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PO31s6rkqa0yfxK5w8G+jMF85AVx2L1bjXSRz6bqHlg=;
 b=btGNBXhoIBfOIx9uxch5h/pjtUpixXN2QHCOz5D6piGl5bmTSt5dYiEO
 WgwnfNBI89+MossTprCIb7u3zIxl5hIobeu5mYSQSciUmFPb+4osIGKSW
 1616DxddICAA7R6vN2shq4EeCwT474v3Zt1aaWF3CeGubFPi1uERVomWI
 4wJzWxwFbEQaMEGaXAc7sovFredNWP8o+F1UG5ySaS1IA4fmfV6GuoIYQ
 B1qaBySV4F2Plw0RutgnIz+qGMU26AoUJoHnhyLBzEX/99FXLNc7XCtkE
 XNZ2OfcRGCPnxf6GRMaGVU4M4hRsqZhw0XznnHpEtxIk/MCnYiz/5zHOa A==;
X-CSE-ConnectionGUID: g2TSSdEdSKWnrbk/VqGkGA==
X-CSE-MsgGUID: 1Kw5MO1+ScCH3jducP4dsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="440527"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="440527"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 04:11:39 -0700
X-CSE-ConnectionGUID: JDOeodpoSZ6STdaKDNXrVA==
X-CSE-MsgGUID: YMfEiSN3TaiGhamtkgqoAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="296800761"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 04:11:36 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, swati2.sharma@intel.com,
 santhoshguddati@gmail.com, ankit.k.nautiyal@intel.com,
 karthik.b.s@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1 04/16] tools/intel_hdcp: Keep the picture and the
 protected link together
Date: Wed, 16 Sep 2026 16:36:57 +0530
Message-ID: <20260916110718.596603-5-santhosh.reddy.guddati@intel.com>
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

test_init() picks the output that gets a CRTC and a framebuffer, but the
connector HDCP is applied to was picked separately by the operator and
nothing checked that the two agreed. If two connectors ever qualify, the
overlay describes one display while the protection is on another.

Only prompt when there is more than one candidate, and warn when the
chosen connector is not the one being painted on.

While here, fix up test_init(): bail out with a message when no connected
output exposes Content Protection - the loop used to fall through with no
framebuffer created and crash later - set data->crtc only for the output
that is actually selected, and print the output, connector id and mode on
startup.

Assisted-by: GitHub Copilot:Claude Opus 4.6
Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tools/intel_hdcp.c | 39 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 37 insertions(+), 2 deletions(-)

diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c
index bd44ad94d5..742909b092 100644
--- a/tools/intel_hdcp.c
+++ b/tools/intel_hdcp.c
@@ -469,7 +469,30 @@ static bool handle_connector_selection(data_t *data, int cmd)
 		return false;
 	}
 
-	return select_connector(data, valid_connectors, valid_count);
+	/*
+	 * Only ask when there is a real choice to make. The usual case is a
+	 * single HDCP-capable connector, which is also the one test_init()
+	 * has modeset.
+	 */
+	if (valid_count == 1) {
+		data->selected_connector = valid_connectors[0];
+		printf("Using connector: %d\n", data->selected_connector);
+	} else if (!select_connector(data, valid_connectors, valid_count)) {
+		return false;
+	}
+
+	/*
+	 * The tool only paints on the output it modeset. Protecting some other
+	 * connector is allowed, but then the picture and the protected link
+	 * are on different displays, so say so rather than letting the
+	 * operator read the overlay as belonging to the protected output.
+	 */
+	if (data->selected_connector != (int)data->output->id)
+		fprintf(stderr,
+			"Warning: protecting connector %d, but the picture is on %s\n",
+			data->selected_connector, igt_output_name(data->output));
+
+	return true;
 }
 
 static void *keypress_thread(void *arg)
@@ -678,6 +701,7 @@ static void test_init(data_t *data)
 {
 	igt_crtc_t *crtc;
 	drmModeModeInfo *mode;
+	bool found = false;
 
 	data->fd = __drm_open_driver(DRIVER_ANY);
 	if (data->fd < 0) {
@@ -689,10 +713,10 @@ static void test_init(data_t *data)
 	igt_display_reset(&data->display);
 
 	for_each_crtc_with_valid_output(&data->display, crtc, data->output) {
-		data->crtc = crtc;
 		if (!igt_output_has_prop(data->output, IGT_CONNECTOR_CONTENT_PROTECTION))
 			continue;
 
+		data->crtc = crtc;
 		mode = igt_output_get_mode(data->output);
 		data->width = mode->hdisplay;
 		data->height = mode->vdisplay;
@@ -703,9 +727,20 @@ static void test_init(data_t *data)
 		igt_output_set_crtc(data->output, crtc);
 		igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
+		found = true;
 		break;
 	}
 
+	if (!found) {
+		fprintf(stderr,
+			"No connected output with a Content Protection property\n");
+		exit(EXIT_FAILURE);
+	}
+
+	printf("Displaying on %s (connector %d), %dx%d\n",
+	       igt_output_name(data->output), data->output->id,
+	       data->width, data->height);
+
 	pthread_mutex_init(&data->lock, NULL);
 	data->user_cmd = 0;
 	data->hdcp_type = 0;
-- 
2.43.0

