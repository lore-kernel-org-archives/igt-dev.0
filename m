Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3443EEE265
	for <igt-dev@archiver.kernel.org>; Fri,  2 Jan 2026 06:10:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4325D10E046;
	Fri,  2 Jan 2026 06:10:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nnbEZVXv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29F1E10E046
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Jan 2026 06:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767334234; x=1798870234;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=apd7pVycQZL6T4Ss16l5qgPr610pHWqObMHWj/Apo7o=;
 b=nnbEZVXvnWIGPJhr77j5ZVooU54lAHTkR9J5N57+xLsROwEvDw6lMt6M
 g7CBvbe5MQ35Knza7c87k/SB2G8YdpjvSHfO60zJ9e/oWFC+d4Xvqv6HT
 L0DkIo1LQE5duq9gGlj1tY+874KxvFhepKcumEFuQucbfTVk8c9QayKnO
 GJX6F9FiDscG96H8fSBIuWK7mc9iZo0KTs2cfZuKFOwp8CJorcQDJUinh
 RBOp8pD/A+7+N8UI5EJkf/v6Qx58/2ayQBwry1YNSv5IHIKI8E8zUSUMG
 7uKQeQ+jSREmCrOQ4bXd7DgYIGfYGFjvNDCJsf8bVlELn25DE08DN2VCu A==;
X-CSE-ConnectionGUID: bD9UyndFRzWIZX9kIot4Jg==
X-CSE-MsgGUID: frJ1A6kCTI+ZFHCWXeXsCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="72684659"
X-IronPort-AV: E=Sophos;i="6.21,196,1763452800"; d="scan'208";a="72684659"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jan 2026 22:10:34 -0800
X-CSE-ConnectionGUID: Ge3cOA7NTlWNogLigjWZjA==
X-CSE-MsgGUID: lY4TEO99TJm2L4lLRDYelw==
X-ExtLoop1: 1
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2026 22:10:32 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, suraj.kandpal@intel.com,
 mohammed.thasleem@intel.com, kamil.konieczny@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v7 1/6] tools/intel_hdcp: Basic init and cleanup for
 hdcp, constants, enums
Date: Fri,  2 Jan 2026 11:38:30 +0530
Message-Id: <20260102060835.89725-2-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260102060835.89725-1-santhosh.reddy.guddati@intel.com>
References: <20260102060835.89725-1-santhosh.reddy.guddati@intel.com>
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

