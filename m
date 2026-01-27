Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED34D2D8DA
	for <igt-dev@archiver.kernel.org>; Tue, 27 Jan 2026 09:46:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B139F88735;
	Tue, 27 Jan 2026 09:46:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BF7YUvtP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F00BD88735
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jan 2026 09:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769507199; x=1801043199;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0UFzxlA0jg0GkS/I6MbaZv/u14DDPxDKOH4fgJof5vU=;
 b=BF7YUvtPQ1nrOHkUmdrt4wvMYgV5lxTYC3PzR35BDamK8Ed8ZvaYVZ5S
 W4EM91tJPeamGVKbOl87KvCxw0nfmTPr8/7Y/Nca2QmY7n5W57sf1OikU
 EA8oAr9oQAmPrZCNJY3pn/a44i6+xTpPebnUnL/UvRzLsnRV+xR0niejf
 KK4jZicL3TYk7WtSAAJzacWmyRUEwsnRgy5umqJcdsBEuLIRIanGLhqVj
 LapmdmQ166I6VvuDsnn0mmYIKrUFKbnraVkcz99491ORFjbotx1fpLW3M
 Kn3UMVjKnd0OagZolvcKllvKAZb4P0xR8Pu1+pIHp6wMX0/hjna82a/aP Q==;
X-CSE-ConnectionGUID: oDqQyyD1T2y1xWl/nlwT0g==
X-CSE-MsgGUID: 35KBY8/yQjCWlcuqEJ6/mQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="81420906"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="81420906"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 01:46:31 -0800
X-CSE-ConnectionGUID: K0r4wumhRzCjSBfcRjr/jg==
X-CSE-MsgGUID: g8RRZ95URii0C+rdRLgs+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="208172652"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 01:46:29 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, mohammed.thasleem@intel.com,
 suraj.kandpal@intel.com, ankit.k.nautiyal@intel.com,
 kamil.konieczny@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v9 01/11] tools/intel_hdcp: Basic init and cleanup for
 hdcp, constants, enums
Date: Tue, 27 Jan 2026 15:12:47 +0530
Message-Id: <20260127094257.572736-2-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260127094257.572736-1-santhosh.reddy.guddati@intel.com>
References: <20260127094257.572736-1-santhosh.reddy.guddati@intel.com>
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

