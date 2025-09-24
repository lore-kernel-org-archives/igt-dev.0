Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F164ACAC5A5
	for <igt-dev@archiver.kernel.org>; Wed, 24 Sep 2025 07:32:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F74010E6AF;
	Wed, 24 Sep 2025 07:32:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K+p+/Ias";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5725810E6B1
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Sep 2025 07:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758699154; x=1790235154;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WvF7gwZK6c9pGW5pXVCxyDMoH4y6MjCpPmM8dgFxcRM=;
 b=K+p+/IasU+66sgXIBgxVfGdFi2Q5gonyyVBrH6iR0bwWxlWe+zB2RGcV
 n7mFzEI5RnkLg2OwH6/zZLZGquZ+B5BTlJm4SNHFzj4QW3uruGo52eNSe
 fy7mo+KEhjPcaXdevA92ZgkY4DX+Z9WPnoR6WIrM+q1kS0gdExiQuzv95
 osPKNHAFtg/gXRC+pZhScmJA8C01MZkzqNDZlXUiI1QQ7TFK5zns8LX+Z
 s84LJ87Exhp9t4D4ihQDefvWcZF4omLXt2dsu/GgKhYrwV8OKX/jgUHM3
 iQZa5CXxVOKb5mAZy9dOLIv8jN61U6F/hRclVyOvayLy6pG/JtRKubKUc A==;
X-CSE-ConnectionGUID: GH008E0vT9Scs7PVqmqGKg==
X-CSE-MsgGUID: VDOipPycSaSTbE0/jv6sEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="86432579"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="86432579"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 00:32:34 -0700
X-CSE-ConnectionGUID: 6c1FZ5c1SZCc1YMVNkpEhQ==
X-CSE-MsgGUID: dqmMI4EuT16RLxXU4VHJLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="214092877"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 00:32:32 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, suraj.kandpal@intel.com,
 mohammed.thasleem@intel.com, ankit.k.nautiyal@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v6 4/6] tools/intel_hdcp: Interactive keypress thread
 for menu
Date: Wed, 24 Sep 2025 12:59:38 +0530
Message-Id: <20250924072940.413695-5-santhosh.reddy.guddati@intel.com>
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

Handle user input asynchronously with keypress_thread ,enable
interactive HDCP via user options.
Update print_menu to display available actions.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tools/intel_hdcp.c | 125 ++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 119 insertions(+), 6 deletions(-)

diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c
index 3c8099a4e..7babcf694 100644
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
 
 static void draw_menu(data_t *data, const char *status)
@@ -240,12 +246,120 @@ static void get_hdcp_info(data_t *data)
 	drmModeFreeResources(res);
 }
 
-static void print_usage(void)
+static void print_menu(void)
 {
-	fprintf(stderr, "Usage: intel_hdcp [OPTIONS]\n");
-	fprintf(stderr, "Options:\n");
-	fprintf(stderr, "-i,	--info		Get HDCP Information\n");
-	fprintf(stderr, "-h,	--help		Display this help message\n");
+	printf("\n=== Intel HDCP Tool ===\n");
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
+	bool tail_ok = true;
+	drmModeConnector *connector;
+
+	print_menu();
+	while (data->running) {
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
@@ -307,7 +421,6 @@ int main(int argc, char **argv)
 			break;
 		case 'h':
 		default:
-			print_usage();
 			break;
 		}
 	}
-- 
2.34.1

