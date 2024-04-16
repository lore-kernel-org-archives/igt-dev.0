Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C01C4345F
	for <igt-dev@archiver.kernel.org>; Tue, 16 Apr 2024 15:43:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2D9310F040;
	Tue, 16 Apr 2024 15:43:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="edKgWC2o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E846210F040
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Apr 2024 15:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713282231; x=1744818231;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TaVZUO4kGVcb8VxuqnOnIutbaz0alUGB/LfoL29IMhc=;
 b=edKgWC2okvBv2khJ7ZSVq8Yz/33qyzD4RuaHp9XcBSrkvDMsnZgw4Ub4
 UwqEKJU1pbU2REUif8RaWYtEwNiV+xVNuOGSJp5jHFnewfi8uOpdbQUrN
 weSvVjM1/1T2RHtm1sQ0KhiE+egv0ZdiPdhtpLQLjVwm2r8rlZ2i2k4VF
 fXq3/O8AF6uVS5g8hiA2uZoqS1Uq4HimuRzmopQONRkxT69GuZnlnG3aa
 fUL7pF/9z7abqt9BUQd8tvG8soM6nxJznBiCNBlES3V6cCJWumHDqN8ZI
 D9TQG1yYEdsrcYEcGNWvNb2H/XFo9lgMav2hEMUnBYTGnd6AZR105YCdv A==;
X-CSE-ConnectionGUID: H6nao4WiTY6szQm4Sl467Q==
X-CSE-MsgGUID: ScdfWvMdRbqvdCghd+TcpA==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="19877298"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="19877298"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 08:43:51 -0700
X-CSE-ConnectionGUID: RzuK76ZUSSWX+4xZD4lWtg==
X-CSE-MsgGUID: 9TzPsKTvQee+Dbr+KwPXVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="22187445"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2.intel.com)
 ([10.212.69.76])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 08:43:50 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Ville Syrjala <ville.syrjala@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH] intel_reg: Move decoding behind an option
Date: Tue, 16 Apr 2024 10:42:07 -0500
Message-ID: <20240416154338.102157-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.44.0
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

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tools/intel_reg.c | 31 ++++++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/tools/intel_reg.c b/tools/intel_reg.c
index 6c37e14d1..1b6a07aca 100644
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
@@ -941,7 +947,7 @@ static int intel_reg_decode(struct config *config, int argc, char *argv[])
 			continue;
 		}
 
-		dump_decode(config, &reg, val);
+		dump_regval(config, &reg, val);
 	}
 
 	return EXIT_SUCCESS;
@@ -1037,10 +1043,11 @@ static int intel_reg_help(struct config *config, int argc, char *argv[])
 	printf("\n\n");
 
 	printf("OPTIONS common to most COMMANDS:\n");
-	printf(" --spec=PATH    Read register spec from directory or file\n");
+	printf(" --spec=PATH    Read register spec from directory or file. Implies --decode\n");
 	printf(" --mmio=FILE    Use an MMIO snapshot\n");
 	printf(" --devid=DEVID  Specify PCI device ID for --mmio=FILE\n");
-	printf(" --all          Decode registers for all known platforms\n");
+	printf(" --decode       Decode registers\n");
+	printf(" --all          Decode registers for all known platforms. Implies --decode\n");
 	printf(" --binary       Binary dump registers\n");
 	printf(" --verbose      Increase verbosity\n");
 	printf(" --quiet        Reduce verbosity\n");
@@ -1106,6 +1113,9 @@ static int read_reg_spec(struct config *config)
 	struct stat st;
 	int r;
 
+	if (!config->decode)
+		return 0;
+
 	path = config->specfile;
 	if (!path)
 		path = getenv("INTEL_REG_SPEC");
@@ -1154,6 +1164,7 @@ enum opt {
 	OPT_DEVID,
 	OPT_COUNT,
 	OPT_POST,
+	OPT_DECODE,
 	OPT_ALL,
 	OPT_BINARY,
 	OPT_SPEC,
@@ -1188,6 +1199,7 @@ int main(int argc, char *argv[])
 		/* options specific to write */
 		{ "post",	no_argument,		NULL,	OPT_POST },
 		/* options specific to read, dump and decode */
+		{ "decode",	no_argument,		NULL,	OPT_DECODE },
 		{ "all",	no_argument,		NULL,	OPT_ALL },
 		{ "binary",	no_argument,		NULL,	OPT_BINARY },
 		{ 0 }
@@ -1223,6 +1235,7 @@ int main(int argc, char *argv[])
 			config.post = true;
 			break;
 		case OPT_SPEC:
+			config.decode = true;
 			config.specfile = strdup(optarg);
 			if (!config.specfile) {
 				fprintf(stderr, "strdup: %s\n",
@@ -1232,6 +1245,10 @@ int main(int argc, char *argv[])
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
-- 
2.44.0

