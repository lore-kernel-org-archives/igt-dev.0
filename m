Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF4FCCF2F6
	for <igt-dev@archiver.kernel.org>; Mon, 19 Jan 2026 12:35:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9171210E42F;
	Mon, 19 Jan 2026 12:35:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HIiePlkx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23C3710E42F
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jan 2026 12:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768826104; x=1800362104;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0UFzxlA0jg0GkS/I6MbaZv/u14DDPxDKOH4fgJof5vU=;
 b=HIiePlkx6aZhXgw8Z+Zj+XtQdgTRprtMAJX+7zJ4gP4JssNnLk5KXzVp
 aRojWmn4DNiHXb3YReYYnM3H/94QxNDObJy668GmquqM12C1QeCksYFOA
 xGeZ8ZqGPw4Xxy3/dCMiuj3jrFmw8Sm4ZWx3T8j7fQl3prEXKV+7u/xxW
 tw54IFmrOOfByWJniAd8mAXojHZg1dkfU040bd5Ila4qIqyAAHv+6Byoc
 4YubVGEzeZJK8VSTE6tPoiwc2Wh0FATOvvU2yXyy+/XoEZBmd/Sqq7v0w
 AnsgN70K3jX4iAQwaBRYMk7qS44fakj2dN0vKDqFR27wHesH2XDvqZMb0 w==;
X-CSE-ConnectionGUID: Irw4B5WeQ/WxX4DZa1SuuA==
X-CSE-MsgGUID: ARJRzML1SeK6+GbC4KfykA==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="69769773"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="69769773"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 04:35:04 -0800
X-CSE-ConnectionGUID: tV9tO8ANTHW3IVEfCDr49Q==
X-CSE-MsgGUID: IDmOvzD4QLG0cAoRj9ejCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="206211411"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 04:35:01 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, mohammed.thasleem@intel.com,
 suraj.kandpal@intel.com, ankit.k.nautiyal@intel.com,
 kamil.konieczny@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v6 01/10] tools/intel_hdcp: Basic init and cleanup for
 hdcp, constants, enums
Date: Mon, 19 Jan 2026 18:01:33 +0530
Message-Id: <20260119123142.504623-2-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260119123142.504623-1-santhosh.reddy.guddati@intel.com>
References: <20260119123142.504623-1-santhosh.reddy.guddati@intel.com>
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

Add hdcp enums and constants and proper cleanup for tool on exit

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 tools/intel_hdcp.c | 45 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 44 insertions(+), 1 deletion(-)

diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c
index 8ec698828..ae2520b03 100644
--- a/tools/intel_hdcp.c
+++ b/tools/intel_hdcp.c
@@ -10,11 +10,25 @@
 
 #define MAX_HDCP_BUF_LEN	5000
 
+#define CP_UNDESIRED	0
+#define CP_DESIRED	1
+#define CP_ENABLED	2
+
+enum hdcp_type {
+	HDCP_TYPE_NONE,
+	HDCP_TYPE_1_4,
+	HDCP_TYPE_2_2_TYPE_0,
+	HDCP_TYPE_2_2_TYPE_1
+};
+
 typedef struct data {
 	int fd;
 	igt_display_t display;
-	struct igt_fb red, green;
+	struct igt_fb fb;
 	int height, width;
+	igt_output_t *output;
+	enum pipe pipe;
+	enum hdcp_type hdcp_type;
 } data_t;
 
 static const char *get_hdcp_version(int fd, char *connector_name)
@@ -90,6 +104,8 @@ static void print_usage(void)
 
 static void test_init(data_t *data)
 {
+	drmModeModeInfo *mode;
+
 	data->fd = __drm_open_driver(DRIVER_ANY);
 	if (data->fd < 0) {
 		fprintf(stderr, "Failed to open DRM driver\n");
@@ -97,6 +113,32 @@ static void test_init(data_t *data)
 	}
 	igt_display_require(&data->display, data->fd);
 	igt_display_require_output(&data->display);
+	igt_display_reset(&data->display);
+
+	for_each_pipe_with_valid_output(&data->display, data->pipe, data->output) {
+		if (!igt_output_has_prop(data->output, IGT_CONNECTOR_CONTENT_PROTECTION))
+			continue;
+
+		mode = igt_output_get_mode(data->output);
+		data->width = mode->hdisplay;
+		data->height = mode->vdisplay;
+
+		igt_create_color_fb(data->fd, data->width, data->height, DRM_FORMAT_XRGB8888,
+				    DRM_FORMAT_MOD_LINEAR, 0.0, 0.0, 0.0, &data->fb);
+
+		igt_output_set_crtc(data->output, igt_crtc_for_pipe(&data->display, data->pipe));
+		igt_display_commit2(&data->display, COMMIT_ATOMIC);
+
+		break;
+	}
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+}
+
+static void cleanup(data_t *data)
+{
+	igt_remove_fb(data->fd, &data->fb);
+	igt_display_fini(&data->display);
+	close(data->fd);
 }
 
 int main(int argc, char **argv)
@@ -123,4 +165,5 @@ int main(int argc, char **argv)
 			break;
 		}
 	}
+	cleanup(&data);
 }
-- 
2.34.1

