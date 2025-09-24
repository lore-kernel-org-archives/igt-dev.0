Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5CD8CAC5A5
	for <igt-dev@archiver.kernel.org>; Wed, 24 Sep 2025 07:32:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E78110E226;
	Wed, 24 Sep 2025 07:32:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q8kTqwjH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66ADA10E226
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Sep 2025 07:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758699147; x=1790235147;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GQrSc1PlgTep7ztQvEzGUZNOkvd4EkMv5FMsGm3vMo8=;
 b=Q8kTqwjH8nchjDzQdzdWtDrBg6FWz3TNSD0RtpH8uqN5zHslWXN7/Vp7
 7yV5QvXvrT4abW4qPZAMwUo43LEdw3iGnNOdyLT8Ign3YPtrvaK96hiOy
 fF8FiRGg0fhIR+B2GBKi3IKrj0nWqeWp6K09Ap/vSw+hOtjdE+Fhv5jGm
 AP3ZEPoFL+aoaXQ9XAeUXB4HsCf4mLj9I7sJu7hmAndQ9EVBvQKqjJgl7
 pdE7KEllxsK4YhaWhLpZLXEL7+2fqwmGFUhkHP5/p26wS7Nv2Fn/+JlaL
 fZ1WlghAZIU1iVQRLdN9c1AZ6H+dQXSwvlzkfFoSrriEEZ6rBKSppNQqn g==;
X-CSE-ConnectionGUID: DW/kOf0wT+Wi9fXdKewyXA==
X-CSE-MsgGUID: ZTY2fttaRt6dgcIaXQz+/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="86432567"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="86432567"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 00:32:27 -0700
X-CSE-ConnectionGUID: kZX3x6KPR1CXyN3CFJb57g==
X-CSE-MsgGUID: VD5MQ1n3STayYnCJSvmMMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="214092838"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 00:32:25 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, suraj.kandpal@intel.com,
 mohammed.thasleem@intel.com, ankit.k.nautiyal@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v6 1/6] tools/intel_hdcp: Basic init and cleanup for
 hdcp, constants, enums
Date: Wed, 24 Sep 2025 12:59:35 +0530
Message-Id: <20250924072940.413695-2-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250924072940.413695-1-santhosh.reddy.guddati@intel.com>
References: <20250924072940.413695-1-santhosh.reddy.guddati@intel.com>
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
index 8ec698828..c0d8e52e0 100644
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
+		igt_output_set_pipe(data->output, data->pipe);
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

