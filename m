Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB294CCF2EF
	for <igt-dev@archiver.kernel.org>; Mon, 19 Jan 2026 12:35:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A33C10E432;
	Mon, 19 Jan 2026 12:35:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J50rrs8M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A81310E432
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jan 2026 12:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768826119; x=1800362119;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E4nWZ3zdCzr6USD0pVyyyZqvQaUgpBQMJC1uEI0z9ic=;
 b=J50rrs8MkOmUvJ65OghNfAZWnJb3Nxcc4xXi4ulgAiQD8LSUsuOJZEDa
 wUZFv/etQkIoszcr32xj1BbRVjDCdPo/Zd/3Z1ett8jdRSvS4V43xsvFl
 9aMqUj/9E44rCGJl/AqcSNRbe74Mxf02IHCiVQdDxv96423FZpD7ALzp3
 p3TCw8JPyKLILopPZxuJjKizD3FH3M49y0tGAYFdmje6M3ChlSR3micvy
 /SrVa5WpnKFfR55Ogv/aV7xwSe2Ho6k7Dyc/fXhEUaJGVzXGGTJDHn4EM
 OWu10/Bqdvh/lTBMI6+cMHNnm0LJmKwYuuMGuHvDxQ/Pz64A4sZq5GKBb w==;
X-CSE-ConnectionGUID: pEEd2p6DS3SecBeQLbkVhA==
X-CSE-MsgGUID: zwEDG8xUQTa62MhOcrCwqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="69769792"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="69769792"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 04:35:18 -0800
X-CSE-ConnectionGUID: fhB+GnrTSf+pQmuxL/GjSw==
X-CSE-MsgGUID: 00vg3FWJQu+/3SGepzwBow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="206211472"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 04:35:16 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, mohammed.thasleem@intel.com,
 suraj.kandpal@intel.com, ankit.k.nautiyal@intel.com,
 kamil.konieczny@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v6 07/10] tools/intel_hdcp: Interactive keypress thread
 for menu
Date: Mon, 19 Jan 2026 18:01:39 +0530
Message-Id: <20260119123142.504623-8-santhosh.reddy.guddati@intel.com>
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

Handle user input asynchronously with keypress_thread ,enable
interactive HDCP via user options.
Update print_menu to display available actions.

v2: Handle invalid user input like choosing an invalid connector or non
HDCP supported output

v3: Use menu lines to print, Avoid reverifying the user input connector
id to be valid or not for HDCP. Instead display only HDCP supported
connectors to the user and verify the option provided by user (Suraj)

Introduce validate_input(), get_valid_hdcp_connectors(), select_connector()
and handle_connector_selection() to parse user input.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tools/intel_hdcp.c | 205 +++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 199 insertions(+), 6 deletions(-)

diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c
index b96fc570f..bc0485caa 100644
--- a/tools/intel_hdcp.c
+++ b/tools/intel_hdcp.c
@@ -5,6 +5,7 @@
 
 #include <fcntl.h>
 #include <stdio.h>
+#include <ctype.h>
 
 #include "igt.h"
 
@@ -29,8 +30,23 @@ typedef struct data {
 	igt_output_t *output;
 	enum pipe pipe;
 	enum hdcp_type hdcp_type;
+	int user_cmd;
+	bool running;
+	pthread_mutex_t lock;
+	pthread_t video_tid;
+	int selected_connector;
 } data_t;
 
+static const char * const menu_lines[] = {
+	"=== HDCP Tool ===",
+	"1. Get HDCP Information",
+	"2. Enable HDCP1.4",
+	"3. Enable HDCP2.2 Type 0",
+	"4. Enable HDCP2.2 Type 1",
+	"5. Disable HDCP",
+	"q. Quit"
+};
+
 static void set_hdcp_prop(data_t *data, int property, int type, int connector_id)
 {
 	drmModeConnector *drm_connector = drmModeGetConnectorCurrent(data->fd, connector_id);
@@ -223,12 +239,190 @@ static void get_hdcp_info(data_t *data)
 	drmModeFreeResources(res);
 }
 
-static void print_usage(void)
+static void print_menu(void)
+{
+	printf("\n");
+	for (size_t i = 0; i < ARRAY_SIZE(menu_lines); i++)
+		printf("%s\n", menu_lines[i]);
+	printf("\n");
+}
+
+static bool validate_input(const char *input, char *choice)
+{
+	const char *p = input;
+	const char *rest;
+
+	/* Trim leading whitespace */
+	while (*p && isspace((unsigned char)*p))
+		p++;
+
+	/* Empty input */
+	if (*p == '\0')
+		return false;
+
+	*choice = *p;
+	rest = p + 1;
+
+	/* Ensure rest is only whitespace/newline */
+	while (*rest) {
+		if (!isspace((unsigned char)*rest) && *rest != '\0') {
+			fprintf(stderr, "Invalid input format\n");
+			return false;
+		}
+		rest++;
+	}
+
+	return true;
+}
+
+static int get_valid_hdcp_connectors(data_t *data, int *valid_connectors)
+{
+	drmModeRes *res;
+	int valid_count = 0;
+
+	res = drmModeGetResources(data->fd);
+	if (!res)
+		return 0;
+
+	for (int i = 0; i < res->count_connectors; i++) {
+		drmModeConnector *connector;
+		char *output_name;
+		const char *hdcp_support;
+
+		connector = drmModeGetConnectorCurrent(data->fd, res->connectors[i]);
+		if (!connector)
+			continue;
+
+		if (connector->connection == DRM_MODE_CONNECTED &&
+		    connector->encoder_id != 0) {
+			asprintf(&output_name, "%s-%d",
+				 kmstest_connector_type_str(connector->connector_type),
+				 connector->connector_type_id);
+			hdcp_support = get_hdcp_version(data->fd, output_name);
+			free(output_name);
+
+			if (hdcp_support && strcmp(hdcp_support, "No HDCP support") != 0)
+				valid_connectors[valid_count++] = connector->connector_id;
+		}
+		drmModeFreeConnector(connector);
+	}
+	drmModeFreeResources(res);
+
+	return valid_count;
+}
+
+static bool select_connector(data_t *data, int *valid_connectors, int valid_count)
+{
+	char input[256];
+	int cid;
+	const char *q;
+
+	printf("\nValid HDCP-capable connector IDs: ");
+	for (int i = 0; i < valid_count; i++) {
+		printf("%d", valid_connectors[i]);
+		if (i < valid_count - 1)
+			printf(", ");
+	}
+	printf("\n");
+
+	while (data->running) {
+		printf("Enter connector id (blank to cancel): ");
+		fflush(stdout);
+
+		if (!fgets(input, sizeof(input), stdin)) {
+			fprintf(stderr, "No input; aborting action\n");
+			return false;
+		}
+
+		/* Check for blank line (cancel) */
+		q = input;
+		while (*q && isspace((unsigned char)*q))
+			q++;
+
+		if (*q == '\0' || *q == '\n') {
+			fprintf(stderr, "Cancelled connector selection\n");
+			return false;
+		}
+
+		if (sscanf(input, "%d", &cid) != 1) {
+			fprintf(stderr, "Invalid number; try again\n");
+			continue;
+		}
+
+		/* Verify connector is in valid list */
+		for (int i = 0; i < valid_count; i++) {
+			if (valid_connectors[i] == cid) {
+				data->selected_connector = cid;
+				printf("Using connector: %d\n", data->selected_connector);
+				return true;
+			}
+		}
+
+		fprintf(stderr, "Connector %d is not a valid HDCP-capable connector\n", cid);
+	}
+
+	return false;
+}
+
+static bool handle_connector_selection(data_t *data, int cmd)
+{
+	int valid_connectors[32];
+	int valid_count;
+
+	/* Commands 2-5 need connector selection if not already set */
+	if (cmd < 2 || cmd > 5 || data->selected_connector != -1)
+		return true;
+
+	valid_count = get_valid_hdcp_connectors(data, valid_connectors);
+
+	if (valid_count == 0) {
+		fprintf(stderr, "No HDCP-capable connectors available\n");
+		return false;
+	}
+
+	return select_connector(data, valid_connectors, valid_count);
+}
+
+static void *keypress_thread(void *arg)
 {
-	fprintf(stderr, "Usage: intel_hdcp [OPTIONS]\n");
-	fprintf(stderr, "Options:\n");
-	fprintf(stderr, "-i,	--info		Get HDCP Information\n");
-	fprintf(stderr, "-h,	--help		Display this help message\n");
+	data_t *data = (data_t *)arg;
+	char input[256], choice;
+
+	print_menu();
+
+	while (data->running) {
+		printf("Enter input 1-5 or q: ");
+		fflush(stdout);
+
+		if (!fgets(input, sizeof(input), stdin)) {
+			printf("\nExiting...\n");
+			break;
+		}
+
+		if (!validate_input(input, &choice))
+			continue;
+
+		pthread_mutex_lock(&data->lock);
+
+		if (choice == 'q' || choice == 'Q') {
+			data->running = false;
+			pthread_mutex_unlock(&data->lock);
+			continue;
+		}
+
+		if (choice >= '1' && choice <= '5') {
+			data->user_cmd = choice - '0';
+
+			if (!handle_connector_selection(data, data->user_cmd))
+				data->user_cmd = 0;
+		} else {
+			fprintf(stderr, "Invalid choice: %c\n", choice);
+		}
+
+		pthread_mutex_unlock(&data->lock);
+	}
+
+	return NULL;
 }
 
 static void test_init(data_t *data)
@@ -290,7 +484,6 @@ int main(int argc, char **argv)
 			break;
 		case 'h':
 		default:
-			print_usage();
 			break;
 		}
 	}
-- 
2.34.1

