Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A71B7EEE265
	for <igt-dev@archiver.kernel.org>; Fri,  2 Jan 2026 06:10:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58F0B10E03F;
	Fri,  2 Jan 2026 06:10:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WIIMEp1b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9231310E05D
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Jan 2026 06:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767334238; x=1798870238;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0A+tyGkhHvCInlPZWnEat9oLwuA82w6VVeiTV0TZkGQ=;
 b=WIIMEp1bpWraSdEviSHW/ok2KjWtMQxaloee8uHJRhGJoLuefTnZ8ecn
 /Fjio8D1OedaJvNCyvSPlLYvHFxoLhATCsma9U/il1euM4HETcskzrOoL
 TMbnvjLXXo0aLipw/c4jAA062xHH9xKgyHaN+Qm7bk6O2sTpmMTOF1qKx
 1LO0OGXt+qmYhqxdIBt0SdS2yyS52s+0auxCStTFM8/r+mjAkNYnsJiW5
 aO268DXRRnGVI9SiygWHMpri5bEIGt4b8ro6UQNnDNwJWq3Mw/W05FnIT
 9ZjAfHMXtl/sgi5N34GjB0p4UV6zslonvKDf1luSfT77jN8Rq/IkZ5SdA Q==;
X-CSE-ConnectionGUID: UNGk8hlpQGGMRFxQAwyCng==
X-CSE-MsgGUID: obNEUDeBRp6fQgAwkWezIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="72684669"
X-IronPort-AV: E=Sophos;i="6.21,196,1763452800"; d="scan'208";a="72684669"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jan 2026 22:10:38 -0800
X-CSE-ConnectionGUID: E1TKbiJDRTCrklng5u713g==
X-CSE-MsgGUID: y4hj/j9TRNeX+k5u8hFb6Q==
X-ExtLoop1: 1
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2026 22:10:36 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, suraj.kandpal@intel.com,
 mohammed.thasleem@intel.com, kamil.konieczny@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v7 3/6] tools/intel_hdcp: Interactive keypress thread
 for menu
Date: Fri,  2 Jan 2026 11:38:32 +0530
Message-Id: <20260102060835.89725-4-santhosh.reddy.guddati@intel.com>
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

Handle user input asynchronously with keypress_thread ,enable
interactive HDCP via user options.
Update print_menu to display available actions.

v2: Handle invalid user input like choosing an invalid connector or non
HDCP supported output

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tools/intel_hdcp.c | 161 +++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 155 insertions(+), 6 deletions(-)

diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c
index 129968b7a..9cfbc0576 100644
--- a/tools/intel_hdcp.c
+++ b/tools/intel_hdcp.c
@@ -5,6 +5,7 @@
 
 #include <fcntl.h>
 #include <stdio.h>
+#include <ctype.h>
 
 #include "igt.h"
 
@@ -29,6 +30,11 @@ typedef struct data {
 	igt_output_t *output;
 	enum pipe pipe;
 	enum hdcp_type hdcp_type;
+	int user_cmd;
+	bool running;
+	pthread_mutex_t lock;
+	pthread_t video_tid;
+	int selected_connector;
 } data_t;
 
 static void set_hdcp_prop(data_t *data, int property, int type, int connector_id)
@@ -184,12 +190,156 @@ static void get_hdcp_info(data_t *data)
 	drmModeFreeResources(res);
 }
 
-static void print_usage(void)
+static void print_menu(void)
 {
-	fprintf(stderr, "Usage: intel_hdcp [OPTIONS]\n");
-	fprintf(stderr, "Options:\n");
-	fprintf(stderr, "-i,	--info		Get HDCP Information\n");
-	fprintf(stderr, "-h,	--help		Display this help message\n");
+	printf("\n=== HDCP Tool ===\n");
+	printf("1. Get HDCP Information\n");
+	printf("2. Enable HDCP1.4 on connector\n");
+	printf("3. Enable HDCP2.2 Type 0 on connector\n");
+	printf("4. Enable HDCP2.2 Type 1 on connector\n");
+	printf("5. Disable HDCP on connector\n");
+	printf("q. Quit\n");
+}
+
+static void *keypress_thread(void *arg)
+{
+	data_t *data = (data_t *)arg;
+	char input[256], choice;
+	char *p, *rest, *q;
+	bool tail_ok;
+	char *output_name;
+	const char *hdcp_support;
+	drmModeConnector *connector;
+
+	print_menu();
+	while (data->running) {
+		tail_ok = true;
+		printf("Enter input 1-5 or q: ");
+		fflush(stdout);
+
+		if (!fgets(input, sizeof(input), stdin)) {
+			printf("\nExiting...\n");
+			break;
+		}
+
+		/* Trim leading whitespace */
+		p = input;
+		while (*p && isspace((unsigned char)*p))
+			p++;
+
+		/* Find first non-space and ensure rest is only whitespace/newline */
+		if (*p == '\0')
+			continue;
+
+		choice = *p;
+		rest = p + 1;
+		while (*rest) {
+			if (!isspace((unsigned char)*rest) && *rest != '\0') {
+				tail_ok = false;
+				break;
+			}
+			rest++;
+		}
+
+		pthread_mutex_lock(&data->lock);
+		if (!tail_ok) {
+			fprintf(stderr, "Invalid input format\n");
+			pthread_mutex_unlock(&data->lock);
+			continue;
+		}
+
+		if (choice == 'q' || choice == 'Q') {
+			data->running = false;
+			pthread_mutex_unlock(&data->lock);
+			continue;
+		}
+
+		if (choice >= '1' && choice <= '5') {
+			data->user_cmd = choice - '0';
+			/* connector id validated below */
+			if (data->user_cmd >= 2 && data->user_cmd <= 5 &&
+			    data->selected_connector == -1) {
+				int cid = -1;
+				bool valid = false;
+
+				while (!valid && data->running) {
+					printf("Enter connector id, blank to cancel): ");
+					fflush(stdout);
+					if (!fgets(input, sizeof(input), stdin)) {
+						fprintf(stderr, "No input; aborting action\n");
+						data->user_cmd = 0;
+						break;
+					}
+
+					/* blank line -> cancel */
+					q = input;
+					while (*q && isspace((unsigned char)*q))
+						q++;
+
+					if (*q == '\0' || *q == '\n') {
+						fprintf(stderr, "Cancelled connector selection\n");
+						data->user_cmd = 0;
+						break;
+					}
+
+					if (sscanf(input, "%d", &cid) != 1) {
+						fprintf(stderr, "Invalid number; try again\n");
+						continue;
+					}
+
+					connector = drmModeGetConnectorCurrent(data->fd, cid);
+					if (!connector) {
+						fprintf(stderr, "Connector %d not found\n", cid);
+						get_hdcp_info(data);
+						data->selected_connector = -1;
+						continue;
+					}
+
+					/* Validate connector is connected and has encoder */
+					if (connector->connection != DRM_MODE_CONNECTED) {
+						fprintf(stderr, "Connector %d not found\n", cid);
+						drmModeFreeConnector(connector);
+						get_hdcp_info(data);
+						data->selected_connector = -1;
+						continue;
+					}
+
+					if (connector->encoder_id == 0) {
+						fprintf(stderr, "%d has no encoder\n", cid);
+						drmModeFreeConnector(connector);
+						get_hdcp_info(data);
+						data->selected_connector = -1;
+						continue;
+					}
+
+					/* Check if connector supports HDCP */
+					asprintf(&output_name, "%s-%d",
+						 kmstest_connector_type_str(connector->connector_type),
+						 connector->connector_type_id);
+					hdcp_support = get_hdcp_version(data->fd, output_name);
+					free(output_name);
+
+					if (!hdcp_support ||
+					     strcmp(hdcp_support, "No HDCP support") == 0) {
+						fprintf(stderr, "%d does not support HDCP\n", cid);
+						drmModeFreeConnector(connector);
+						get_hdcp_info(data);
+						data->selected_connector = -1;
+						continue;
+					}
+
+					drmModeFreeConnector(connector);
+					data->selected_connector = cid;
+					valid = true;
+					printf("Using connector: %d\n", data->selected_connector);
+				}
+			}
+		} else {
+			fprintf(stderr, "Invalid choice: %c\n", choice);
+		}
+		pthread_mutex_unlock(&data->lock);
+	}
+	return NULL;
 }
 
 static void test_init(data_t *data)
@@ -251,7 +401,6 @@ int main(int argc, char **argv)
 			break;
 		case 'h':
 		default:
-			print_usage();
 			break;
 		}
 	}
-- 
2.34.1

