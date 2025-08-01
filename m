Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A65C87FCB
	for <igt-dev@archiver.kernel.org>; Fri,  1 Aug 2025 06:48:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEDD710E7FD;
	Fri,  1 Aug 2025 06:48:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fNIM09ye";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0173C10E3C0
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Aug 2025 06:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754030934; x=1785566934;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o2xey6j/z7k1wkhRfNDIYgQhkdfbaWX5i8WPAW/OkLQ=;
 b=fNIM09yeOT280pBcyY4BMomVGrrYg7+zsxTUcqHhVx9rRW9ZUvJc/bki
 4ETIZBafhi9v3EqwzKS4Yn124J6HoSeAT1YjQFmWIEunK/n3zdhQukx65
 Rp6KVVmi+Z13jX3VQyV4NXpTNn02aiu8VRErCDVtLrNTwJHYkXqEp+XAn
 gNY4A4AZdjdNA2h+a/yuuJhGz3Vkeep+FmWuwXwblms9W9zUOvlsvwQ74
 MavFGna7sUxTVOuzSz8W8N+bq5DtmivWmmr9iFunQzLlbfsitIlHs8Ww3
 OBv283fBpF6oYeluxIzFxKS1VTMaTfwACdnFxYDiNNOkY5CIc0JtoBkTI Q==;
X-CSE-ConnectionGUID: 4qQWGfG5TKG2ubNerdP0eA==
X-CSE-MsgGUID: zQ9bRQ+IQgWGTPCq+1NgpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="60014045"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="60014045"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 23:48:54 -0700
X-CSE-ConnectionGUID: Ep+FBGpPRZ2/ylalHBDwFA==
X-CSE-MsgGUID: U1Qx3m6sRBCna6njHn379A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="168766699"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 23:48:52 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, mohammed.thasleem@intel.com,
 ankit.k.nautiyal@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v5 2/3] tools/intel_hdcp: Add interactive menu mode to
 tool
Date: Fri,  1 Aug 2025 12:17:00 +0530
Message-Id: <20250801064701.911143-3-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250801064701.911143-1-santhosh.reddy.guddati@intel.com>
References: <20250801064701.911143-1-santhosh.reddy.guddati@intel.com>
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

Introduce text based menu mode for hdcp operations
and update command line options

v2: Add cleanup() at the end of main to clean resources.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tools/intel_hdcp.c | 119 ++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 113 insertions(+), 6 deletions(-)

diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c
index b9e91276f..d9496050a 100644
--- a/tools/intel_hdcp.c
+++ b/tools/intel_hdcp.c
@@ -80,7 +80,6 @@ static void igt_output_set_hdcp(data_t *data, igt_output_t *output, bool enable)
 
 	igt_plane_set_fb(primary, NULL);
 	igt_remove_fb(data->fd, &data->red);
-	igt_output_set_pipe(output, PIPE_NONE);
 	igt_display_commit2(display, COMMIT_ATOMIC);
 }
 
@@ -162,6 +161,23 @@ static void get_hdcp_info(data_t *data)
 	drmModeFreeResources(res);
 }
 
+static void wait_for_keypress(void)
+{
+	printf("Press Enter to continue...");
+	fflush(stdout);
+	while (getchar() != '\n');
+}
+
+static void print_menu(void)
+{
+	printf("\n=== Intel HDCP Tool ===\n");
+	printf("1. Get HDCP Information\n");
+	printf("2. Enable HDCP on connector\n");
+	printf("3. Disable HDCP on connector\n");
+	printf("4. Exit\n");
+	printf("Enter your choice: ");
+}
+
 static void print_usage(void)
 {
 	fprintf(stderr, "Usage: intel_hdcp [OPTIONS]\n");
@@ -169,6 +185,74 @@ static void print_usage(void)
 	fprintf(stderr, "-i,	--info		Get HDCP Information\n");
 	fprintf(stderr, "-e,	--enable	Enable HDCP on the specified connector id\n");
 	fprintf(stderr, "-d,	--disable	Disable HDCP on the specified connector id\n");
+	fprintf(stderr, "-m,	--menu		Interactive menu mode (default if no options)\n");
+}
+
+static void interactive_menu(data_t *data)
+{
+	int choice, connector_id;
+	char input[256];
+
+	while (1) {
+		print_menu();
+		fflush(stdout);
+
+		if (!fgets(input, sizeof(input), stdin)) {
+			printf("\nExiting...\n");
+			break;
+		}
+
+		choice = atoi(input);
+
+		switch (choice) {
+		case 1:
+			printf("\n--- HDCP Information ---\n");
+			get_hdcp_info(data);
+			wait_for_keypress();
+			break;
+
+		case 2:
+			printf("\n--- Enable HDCP ---\n");
+			get_hdcp_info(data);
+			printf("\nEnter connector ID to enable HDCP: ");
+			fflush(stdout);
+			if (fgets(input, sizeof(input), stdin)) {
+				connector_id = atoi(input);
+				printf("Enabling HDCP on connector %d...\n", connector_id);
+				set_hdcp(data, connector_id, true);
+			}
+			wait_for_keypress();
+			break;
+
+		case 3:
+			printf("\n--- Disable HDCP ---\n");
+			get_hdcp_info(data);
+			printf("\nEnter connector ID to disable HDCP: ");
+			fflush(stdout);
+			if (fgets(input, sizeof(input), stdin)) {
+				connector_id = atoi(input);
+				printf("Disabling HDCP on connector %d...\n", connector_id);
+				set_hdcp(data, connector_id, false);
+			}
+			wait_for_keypress();
+			break;
+
+		case 4:
+			printf("Exiting...\n");
+			return;
+
+		default:
+			printf("Invalid choice. Please try again.\n");
+			wait_for_keypress();
+			break;
+		}
+	}
+}
+
+static void test_cleanup(data_t *data)
+{
+	igt_display_reset(&data->display);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 }
 
 static void test_init(data_t *data)
@@ -180,28 +264,38 @@ static void test_init(data_t *data)
 	}
 	igt_display_require(&data->display, data->fd);
 	igt_display_require_output(&data->display);
+
+	igt_display_reset(&data->display);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 }
 
 int main(int argc, char **argv)
 {
 	data_t data;
 	int option;
-	static const char optstr[] = "hied:";
+	bool menu_mode = false;
+	static const char optstr[] = "hied:m";
 	struct option long_opts[] = {
 		{"help",	no_argument,		NULL,	'h'},
 		{"info",	no_argument,		NULL,	'i'},
 		{"enable",	required_argument,	NULL,	'e'},
 		{"disable",	required_argument,	NULL,	'd'},
+		{"menu",	no_argument,		NULL,	'm'},
 		{NULL,		0,			NULL,	 0 }
 	};
 
 	test_init(&data);
 
+	/* If no arguments provided, default to menu mode */
+	if (argc == 1)
+		menu_mode = true;
+
 	while ((option = getopt_long(argc, argv, optstr, long_opts, NULL)) != -1) {
 		switch (option) {
 		case 'i':
 			get_hdcp_info(&data);
-			break;
+			test_cleanup(&data);
+			return 0;
 		case 'e':
 			if (!optarg) {
 				fprintf(stderr, "Missing connector ID for enable\n");
@@ -209,19 +303,32 @@ int main(int argc, char **argv)
 				exit(EXIT_FAILURE);
 			}
 			set_hdcp(&data, atoi(optarg), true);
-			break;
+			test_cleanup(&data);
+			return 0;
 		case 'd':
 			if (!optarg) {
-				fprintf(stderr, "Missing connector ID for enable\n");
+				fprintf(stderr, "Missing connector ID for disable\n");
 				print_usage();
 				exit(EXIT_FAILURE);
 			}
 			set_hdcp(&data, atoi(optarg), false);
+			test_cleanup(&data);
+			return 0;
+		case 'm':
+			menu_mode = true;
 			break;
 		case 'h':
 		default:
 			print_usage();
-			break;
+			test_cleanup(&data);
+			return (option == 'h') ? 0 : 1;
 		}
 	}
+
+	if (menu_mode)
+		interactive_menu(&data);
+
+	test_cleanup(&data);
+
+	return 0;
 }
-- 
2.34.1

