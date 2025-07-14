Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C2D2C83F1A
	for <igt-dev@archiver.kernel.org>; Mon, 14 Jul 2025 17:47:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25BC010E2B4;
	Mon, 14 Jul 2025 17:47:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ay8lG6bx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3D3D10E08E
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jul 2025 17:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752515221; x=1784051221;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X9be36rkMCTNKmgerURx+HfMo6Lf7EIRCuSGLDLpg5U=;
 b=Ay8lG6bxHlfa/yyjRuKBb9FL4Y30pU1pwfoHYGgSnte8T878PjEJ2zUo
 XG2uPvrpHoUQRGPx+x6DRWFFgkynk+P0pESKiqGSgEhsj3koeI+kD/6K5
 PD0Bk5TK3Mf1NjImvmywe5bZRtuzNxUj9+lcAalqF830Thazvxyl8EAJE
 jdZWZpQEp3J9pKGFrBMfU9YT2LdaZwUe9EAdv9W1XD9/DqdLG2ApM7Nrl
 /gHpQi6gY7LAO1/IwOBwG+xHF5KTdrsCuDSSvQHjgiHIl7px+gOsEcaKg
 I5qliT/4//Kqj58hTexJIUOoPkEdb16oIZaYvyf56hPYnE/sqBxv0VMma Q==;
X-CSE-ConnectionGUID: iBw2hW8NTFWphIK0wHd/Ew==
X-CSE-MsgGUID: /pm7i5X4SqOOF1I7fE6cvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="65289930"
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="65289930"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 10:46:45 -0700
X-CSE-ConnectionGUID: 2pyPot/nS4adn3LQNSaRXg==
X-CSE-MsgGUID: 49hh/VoYQTqAT/I2EpN0bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="156803073"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 10:46:43 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, mohammed.thasleem@intel.com,
 suraj.kandpal@intel.com, ankit.k.nautiyal@intel.com,
 kamil.konieczny@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v4 2/2] tools/intel_hdcp: Add interactive menu mode to
 tool
Date: Mon, 14 Jul 2025 23:12:45 +0530
Message-Id: <20250714174245.1628709-3-santhosh.reddy.guddati@intel.com>
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

Introduce text based menu mode for hdcp operations
and update command line options

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tools/intel_hdcp.c | 106 ++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 101 insertions(+), 5 deletions(-)

diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c
index b9e91276f..664234581 100644
--- a/tools/intel_hdcp.c
+++ b/tools/intel_hdcp.c
@@ -162,6 +162,25 @@ static void get_hdcp_info(data_t *data)
 	drmModeFreeResources(res);
 }
 
+static void wait_for_keypress(void)
+{
+	int c;
+
+	do {
+		c = getchar();
+	} while (c != '\n' && c != EOF);
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
@@ -169,6 +188,69 @@ static void print_usage(void)
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
+
+		if (fgets(input, sizeof(input), stdin)) {
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
+			printf("\nPress Any Key to continue...");
+			wait_for_keypress();
+			break;
+
+		case 2:
+			printf("\n--- Enable HDCP ---\n");
+			get_hdcp_info(data);
+			printf("\nEnter connector ID to enable HDCP: ");
+			if (!fgets(input, sizeof(input), stdin)) {
+				connector_id = atoi(input);
+				printf("Enabling HDCP on connector %d...\n", connector_id);
+				set_hdcp(data, connector_id, true);
+			}
+			printf("\nPress Any Key to continue...");
+			wait_for_keypress();
+			break;
+
+		case 3:
+			printf("\n--- Disable HDCP ---\n");
+			get_hdcp_info(data);
+			printf("\nEnter connector ID to disable HDCP: ");
+			if (!fgets(input, sizeof(input), stdin)) {
+				connector_id = atoi(input);
+				printf("Disabling HDCP on connector %d...\n", connector_id);
+				set_hdcp(data, connector_id, false);
+			}
+			printf("\nPress Enter to continue...");
+			wait_for_keypress();
+			break;
+
+		case 4:
+			printf("Exiting...\n");
+			return;
+
+		default:
+			printf("Invalid choice. Please try again.\n");
+			printf("Press Enter to continue...");
+			wait_for_keypress();
+			break;
+		}
+	}
 }
 
 static void test_init(data_t *data)
@@ -186,22 +268,28 @@ int main(int argc, char **argv)
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
+			return 0;
 		case 'e':
 			if (!optarg) {
 				fprintf(stderr, "Missing connector ID for enable\n");
@@ -209,19 +297,27 @@ int main(int argc, char **argv)
 				exit(EXIT_FAILURE);
 			}
 			set_hdcp(&data, atoi(optarg), true);
-			break;
+			return 0;
 		case 'd':
 			if (!optarg) {
-				fprintf(stderr, "Missing connector ID for enable\n");
+				fprintf(stderr, "Missing connector ID for disable\n");
 				print_usage();
 				exit(EXIT_FAILURE);
 			}
 			set_hdcp(&data, atoi(optarg), false);
+			return 0;
+		case 'm':
+			menu_mode = true;
 			break;
 		case 'h':
 		default:
 			print_usage();
-			break;
+			return (option == 'h') ? 0 : 1;
 		}
 	}
+
+	if (menu_mode)
+		interactive_menu(&data);
+
+	return 0;
 }
-- 
2.34.1

