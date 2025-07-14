Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A2C3C83F17
	for <igt-dev@archiver.kernel.org>; Mon, 14 Jul 2025 17:47:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5A5710E08E;
	Mon, 14 Jul 2025 17:47:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lZPcCBM9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFFBA10E2A8
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jul 2025 17:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752515221; x=1784051221;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vNGPSDKyv6M+frGUz+ialn9QXSfoKAx/tyTLjFKMVI4=;
 b=lZPcCBM9lD8ANGSmzMOhsY5PgbllspqagqhgdBjfGVuLNwO5JLpNSoQI
 +0c8rr9tpLG5ED7bpH1K0viXbA4qnnRA7hdDZkE0XmVzvBiPZNoWetzMG
 JVEuC2g9Z1+Dq1cYVKX0jfWLHNccsTY5xBoAF2mFnv5e8iBNa26Ue+tFB
 9up9IADy3KX7wWQC61j4csGbaMCwygracd4ubAriiB8NokMxJ27PmlUR7
 vX3LqaWFlutJCeaCZMHLqVIOr/AFRT3ukwsiYypbG5HXsplKUYons4aCW
 KNfQULvkVXiKbHou9PaHhC9pYzEXuM3gYv9j+o/gMjNyat51M0EDsf75X A==;
X-CSE-ConnectionGUID: gVCam0L6SjiKRm6xz7RQEw==
X-CSE-MsgGUID: KqhUzfkHQqGUpnHLNpLIgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="65289924"
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="65289924"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 10:46:44 -0700
X-CSE-ConnectionGUID: BAqBHuSMQT6fhviHzs2ozg==
X-CSE-MsgGUID: 0JpQ1eYPRwmRbGty6ImaaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="156803067"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 10:46:40 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, mohammed.thasleem@intel.com,
 suraj.kandpal@intel.com, ankit.k.nautiyal@intel.com,
 kamil.konieczny@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v4 1/2] tools/intel_hdcp: Support for enabling and
 disabling HDCP
Date: Mon, 14 Jul 2025 23:12:44 +0530
Message-Id: <20250714174245.1628709-2-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250714174245.1628709-1-santhosh.reddy.guddati@intel.com>
References: <20250714174245.1628709-1-santhosh.reddy.guddati@intel.com>
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

Introduce support for enabling and disabling HDCP on specific connectors
using command line options.

V2: Refactor logic, simplified frame buffer handling, remove update_display
and integrate its logic to igt_output_set_hdcp().

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tools/intel_hdcp.c | 129 ++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 115 insertions(+), 14 deletions(-)

diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c
index 8ec698828..b9e91276f 100644
--- a/tools/intel_hdcp.c
+++ b/tools/intel_hdcp.c
@@ -9,6 +9,15 @@
 #include "igt.h"
 
 #define MAX_HDCP_BUF_LEN	5000
+#define MAX_CONNECTORS		10
+
+#define CP_UNDESIRED		0
+#define CP_DESIRED		1
+#define CP_ENABLED		2
+
+/* Max time per authentication allowed = 6Sec */
+#define KERNEL_AUTH_TIME_ALLOWED_MSEC		(6 * 1000)
+#define KERNEL_DISABLE_TIME_ALLOWED_MSEC	(1 * 1000)
 
 typedef struct data {
 	int fd;
@@ -17,6 +26,79 @@ typedef struct data {
 	int height, width;
 } data_t;
 
+static void igt_output_set_hdcp(data_t *data, igt_output_t *output, bool enable)
+{
+	uint64_t prop_value;
+	igt_display_t *display = &data->display;
+	igt_plane_t *primary;
+	drmModeModeInfo *mode;
+
+	mode = igt_output_get_mode(output);
+	data->height = mode->vdisplay;
+	data->width = mode->hdisplay;
+
+	igt_output_set_pipe(output, PIPE_A);
+	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+
+	igt_create_color_fb(data->fd, data->width, data->height,
+			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+			    1.f, 0.f, 0.f, &data->red);
+
+	igt_plane_set_fb(primary, &data->red);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+
+	igt_output_set_prop_value(output, IGT_CONNECTOR_CONTENT_PROTECTION,
+				  enable ? CP_DESIRED : CP_UNDESIRED);
+
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+
+	if (enable) {
+		usleep(KERNEL_AUTH_TIME_ALLOWED_MSEC);
+		prop_value = igt_output_get_prop(output, IGT_CONNECTOR_CONTENT_PROTECTION);
+
+		if (prop_value == CP_ENABLED) {
+			fprintf(stderr, "HDCP enabled on output %s\n", output->name);
+			/* Switch to green to indicate success */
+			igt_create_color_fb(data->fd, data->width, data->height,
+					    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+					    0.f, 1.f, 0.f, &data->green);
+			igt_plane_set_fb(primary, &data->green);
+			igt_display_commit2(display, COMMIT_ATOMIC);
+			igt_remove_fb(data->fd, &data->green);
+		} else {
+			fprintf(stderr, "Failed to enable HDCP on connector %s\n", output->name);
+		}
+	} else {
+		usleep(KERNEL_DISABLE_TIME_ALLOWED_MSEC);
+		prop_value = igt_output_get_prop(output, IGT_CONNECTOR_CONTENT_PROTECTION);
+
+		if (prop_value == CP_UNDESIRED)
+			fprintf(stderr, "HDCP disabled on connector %s\n", output->name);
+		else
+			fprintf(stderr, "Failed to disable HDCP on connector %s\n", output->name);
+	}
+
+	igt_plane_set_fb(primary, NULL);
+	igt_remove_fb(data->fd, &data->red);
+	igt_output_set_pipe(output, PIPE_NONE);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+}
+
+static void set_hdcp(data_t *data, int connector_id, bool enable)
+{
+	igt_output_t *output;
+	drmModeConnector connector;
+
+	connector.connector_id = connector_id;
+	output = igt_output_from_connector(&data->display, &connector);
+	if (!output) {
+		fprintf(stderr, "Failed to get output for connector %d\n", connector_id);
+		return;
+	}
+
+	igt_output_set_hdcp(data, output, enable);
+}
+
 static const char *get_hdcp_version(int fd, char *connector_name)
 {
 	char buf[MAX_HDCP_BUF_LEN];
@@ -57,24 +139,24 @@ static void get_hdcp_info(data_t *data)
 	fprintf(stderr, "Connectors:\n");
 	fprintf(stderr, "id\tencoder\tstatus\t\ttype\tHDCP\n");
 	for (int i = 0; i < res->count_connectors; i++) {
-		drmModeConnector *c;
+		drmModeConnector *connector;
 
-		c = drmModeGetConnectorCurrent(data->fd, res->connectors[i]);
+		connector = drmModeGetConnectorCurrent(data->fd, res->connectors[i]);
 
-		if (!c)
+		if (!connector)
 			continue;
 
 		asprintf(&output_name, "%s-%d",
-			 kmstest_connector_type_str(c->connector_type),
-			 c->connector_type_id);
+			 kmstest_connector_type_str(connector->connector_type),
+			 connector->connector_type_id);
 
 		fprintf(stderr, "%d\t%d\t%s\t%s\t%s\n",
-			c->connector_id, c->encoder_id,
-			kmstest_connector_status_str(c->connection),
-			kmstest_connector_type_str(c->connector_type),
+			connector->connector_id, connector->encoder_id,
+			kmstest_connector_status_str(connector->connection),
+			kmstest_connector_type_str(connector->connector_type),
 			get_hdcp_version(data->fd, output_name));
 
-		drmModeFreeConnector(c);
+		drmModeFreeConnector(connector);
 	}
 
 	drmModeFreeResources(res);
@@ -85,7 +167,8 @@ static void print_usage(void)
 	fprintf(stderr, "Usage: intel_hdcp [OPTIONS]\n");
 	fprintf(stderr, "Options:\n");
 	fprintf(stderr, "-i,	--info		Get HDCP Information\n");
-	fprintf(stderr, "-h,	--help		Display this help message\n");
+	fprintf(stderr, "-e,	--enable	Enable HDCP on the specified connector id\n");
+	fprintf(stderr, "-d,	--disable	Disable HDCP on the specified connector id\n");
 }
 
 static void test_init(data_t *data)
@@ -103,11 +186,13 @@ int main(int argc, char **argv)
 {
 	data_t data;
 	int option;
-	static const char optstr[] = "hi";
+	static const char optstr[] = "hied:";
 	struct option long_opts[] = {
-		{"help",	no_argument,	NULL, 'h'},
-		{"info",	no_argument,	NULL, 'i'},
-		{NULL,		0,		NULL,  0 }
+		{"help",	no_argument,		NULL,	'h'},
+		{"info",	no_argument,		NULL,	'i'},
+		{"enable",	required_argument,	NULL,	'e'},
+		{"disable",	required_argument,	NULL,	'd'},
+		{NULL,		0,			NULL,	 0 }
 	};
 
 	test_init(&data);
@@ -117,6 +202,22 @@ int main(int argc, char **argv)
 		case 'i':
 			get_hdcp_info(&data);
 			break;
+		case 'e':
+			if (!optarg) {
+				fprintf(stderr, "Missing connector ID for enable\n");
+				print_usage();
+				exit(EXIT_FAILURE);
+			}
+			set_hdcp(&data, atoi(optarg), true);
+			break;
+		case 'd':
+			if (!optarg) {
+				fprintf(stderr, "Missing connector ID for enable\n");
+				print_usage();
+				exit(EXIT_FAILURE);
+			}
+			set_hdcp(&data, atoi(optarg), false);
+			break;
 		case 'h':
 		default:
 			print_usage();
-- 
2.34.1

