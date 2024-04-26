Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F8B7C04FFE
	for <igt-dev@archiver.kernel.org>; Fri, 26 Apr 2024 15:33:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65CD811249D;
	Fri, 26 Apr 2024 15:33:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bUR88Jkz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C68F11124BE
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Apr 2024 15:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714145588; x=1745681588;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hpslNLiriC2CpdzDIxcbBpIo4oLrfwbQBVLIMiqEooM=;
 b=bUR88JkzLiQ4ilCFBigl0a0RgOaq+/Ysf9T0T25AIXxXIKfcZQTiE5D4
 /72QgQGZTUFGPdkflJdvx2YM6ZcR6kqe1zKGtc8W1EBHNOotEx3Pev0DL
 KAExTfbU6GxudJqFQ9ZNUMFOQBSGenqxc6wBxVyRFjCk+lmbEkGF1Yoj3
 TIGLDakYD5Nl67K+ZJp4oWfylJ+lMjKpiH25at/3lq9ScT83AWcV/+FLe
 1cAHGjUAXjV82agbXCo7H0tsgIcUKFyStg3bVS4cFL6tgp19lvgyiiPyJ
 +sURlCUeDD/v31RyBtTPgWRJZ6P0nCK4CBlDckoDIYXlheNeV5hk1yJGn g==;
X-CSE-ConnectionGUID: 5DmKGy1STMCY1pp9i9F90g==
X-CSE-MsgGUID: 1Y60AaHQQVWWf4CXGHZDCg==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21033220"
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000"; d="scan'208";a="21033220"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:33:07 -0700
X-CSE-ConnectionGUID: 7MYiCpp4TmuNHbaQBOnKEA==
X-CSE-MsgGUID: Q0MfXN71Rn6ZabSkmlqrnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="25953333"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:33:07 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t 2/2] intel_reg: Move decoding behind an option
Date: Fri, 26 Apr 2024 08:33:52 -0700
Message-ID: <20240426153352.3209972-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240426153352.3209972-1-lucas.demarchi@intel.com>
References: <20240426153352.3209972-1-lucas.demarchi@intel.com>
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

Decoding the register can be only as good as the reg_spec being used.
The current builtin register spec is not that. Move that decoding behind
an option to make it better for the normal case when running from the
repo checkout where the external reg spec is not available. Passing any
of --decode, --all, --spec brings the old behavior back:

	$ sudo ./build/tools/intel_reg --decode read 0x2358
	Warning: stat '/usr/local/share/igt-gpu-tools/registers' failed: No such file or directory. Using builtin register spec.
					    (0x00002358): 0x00000000

vs the new behavior:

	$ sudo ./build/tools/intel_reg --decode read 0x2358
					    (0x00002358): 0x00000000

We could probably reduce the leading space since we won't have any name,
but that can be improved later.

v2: Instead of removing the warning, move the whole decoding logic
    behind a command line option
v3: Some commands also imply --decode

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tools/intel_reg.c | 41 ++++++++++++++++++++++++++++++-----------
 1 file changed, 30 insertions(+), 11 deletions(-)

diff --git a/tools/intel_reg.c b/tools/intel_reg.c
index 8f585e4bd..c5800cf05 100644
--- a/tools/intel_reg.c
+++ b/tools/intel_reg.c
@@ -68,6 +68,9 @@ struct config {
 	/* write: do a posting read */
 	bool post;
 
+	/* decode registers, otherwise use just raw values */
+	bool decode;
+
 	/* decode register for all platforms */
 	bool all_platforms;
 
@@ -195,7 +198,7 @@ static bool port_is_mmio(enum port_addr port)
 	}
 }
 
-static void dump_decode(struct config *config, struct reg *reg, uint32_t val)
+static void dump_regval(struct config *config, struct reg *reg, uint32_t val)
 {
 	char decode[1300];
 	char tmp[1024];
@@ -206,8 +209,11 @@ static void dump_decode(struct config *config, struct reg *reg, uint32_t val)
 	else
 		*bin = '\0';
 
-	intel_reg_spec_decode(tmp, sizeof(tmp), reg, val,
-			      config->all_platforms ? 0 : config->devid);
+	if (config->decode)
+		intel_reg_spec_decode(tmp, sizeof(tmp), reg, val,
+				      config->all_platforms ? 0 : config->devid);
+	else
+		*tmp = '\0';
 
 	if (*tmp) {
 		/* We have a decode result, and maybe binary decode. */
@@ -573,7 +579,7 @@ static void dump_register(struct config *config, struct reg *reg)
 	uint32_t val;
 
 	if (read_register(config, reg, &val) == 0)
-		dump_decode(config, reg, val);
+		dump_regval(config, reg, val);
 }
 
 static int write_register(struct config *config, struct reg *reg, uint32_t val)
@@ -944,7 +950,7 @@ static int intel_reg_decode(struct config *config, int argc, char *argv[])
 			continue;
 		}
 
-		dump_decode(config, &reg, val);
+		dump_regval(config, &reg, val);
 	}
 
 	return EXIT_SUCCESS;
@@ -1044,10 +1050,11 @@ static int intel_reg_help(struct config *config, int argc, char *argv[])
 	printf("\n\n");
 
 	printf("OPTIONS common to most COMMANDS:\n");
-	printf(" --spec=PATH    Read register spec from directory or file\n");
+	printf(" --spec=PATH    Read register spec from directory or file. Implies --decode\n");
 	printf(" --mmio=FILE    Use an MMIO snapshot\n");
 	printf(" --devid=DEVID  Specify PCI device ID for --mmio=FILE\n");
-	printf(" --all          Decode registers for all known platforms\n");
+	printf(" --decode       Decode registers. Implied by commands that require it\n");
+	printf(" --all          Decode registers for all known platforms. Implies --decode\n");
 	printf(" --binary       Binary dump registers\n");
 	printf(" --verbose      Increase verbosity\n");
 	printf(" --quiet        Reduce verbosity\n");
@@ -1113,6 +1120,9 @@ static int read_reg_spec(struct config *config)
 	struct stat st;
 	int r;
 
+	if (!config->decode)
+		return 0;
+
 	path = config->specfile;
 	if (!path)
 		path = getenv("INTEL_REG_SPEC");
@@ -1161,6 +1171,7 @@ enum opt {
 	OPT_DEVID,
 	OPT_COUNT,
 	OPT_POST,
+	OPT_DECODE,
 	OPT_ALL,
 	OPT_BINARY,
 	OPT_SPEC,
@@ -1195,6 +1206,7 @@ int main(int argc, char *argv[])
 		/* options specific to write */
 		{ "post",	no_argument,		NULL,	OPT_POST },
 		/* options specific to read, dump and decode */
+		{ "decode",	no_argument,		NULL,	OPT_DECODE },
 		{ "all",	no_argument,		NULL,	OPT_ALL },
 		{ "binary",	no_argument,		NULL,	OPT_BINARY },
 		{ 0 }
@@ -1230,6 +1242,7 @@ int main(int argc, char *argv[])
 			config.post = true;
 			break;
 		case OPT_SPEC:
+			config.decode = true;
 			config.specfile = strdup(optarg);
 			if (!config.specfile) {
 				fprintf(stderr, "strdup: %s\n",
@@ -1239,6 +1252,10 @@ int main(int argc, char *argv[])
 			break;
 		case OPT_ALL:
 			config.all_platforms = true;
+			config.decode = true;
+			break;
+		case OPT_DECODE:
+			config.decode = true;
 			break;
 		case OPT_BINARY:
 			config.binary = true;
@@ -1285,10 +1302,6 @@ int main(int argc, char *argv[])
 		config.devid = config.pci_dev->device_id;
 	}
 
-	if (read_reg_spec(&config) < 0) {
-		return EXIT_FAILURE;
-	}
-
 	for (i = 0; i < ARRAY_SIZE(commands); i++) {
 		if (strcmp(argv[0], commands[i].name) == 0) {
 			command = &commands[i];
@@ -1301,6 +1314,12 @@ int main(int argc, char *argv[])
 		return EXIT_FAILURE;
 	}
 
+	if (command->decode)
+		config.decode = true;
+
+	if (read_reg_spec(&config) < 0)
+		return EXIT_FAILURE;
+
 	ret = command->function(&config, argc, argv);
 
 	free(config.mmiofile);
-- 
2.43.0

