Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C76DDC4345F
	for <igt-dev@archiver.kernel.org>; Fri, 26 Apr 2024 15:33:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49C3310E27C;
	Fri, 26 Apr 2024 15:33:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MAV6rXMQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E86511249D
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Apr 2024 15:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714145588; x=1745681588;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2STnppq0A2XM/4CBwxxsgOf7X7NWBHLljesGjSiiLJU=;
 b=MAV6rXMQNEt4ZfU6Ag3+UlKhqU6/vfDUSU9iYSSzfMW6IuFOuqKYvvnT
 uT3Q374GzurqgE7v/mXhKvCWckJA1XWqfjL5tn04mwdqXdau1cEyQG9fG
 fEVO6zAAwRS+l688gQINwO0IsYqKuHc++/Rbt4BoKSui6omoUlo1anlnr
 BRzNC0Lx0hzoDqVvgjmhZOcSqUOhddlYiWHGsHZDVJmlm3nKbcBy1/eLn
 YHs4ZSNIHtpDFovzFRaGe8Wu84bLeP4f34oqaifRlRhYERz1lORWC/y8U
 By2E/vNmXFMIZTUq74zhaqR28JjcW7aA5oQTo3DM+gAQDRRdcimA5TOBj A==;
X-CSE-ConnectionGUID: zPrvUYcqTCmWyfocAB8htg==
X-CSE-MsgGUID: EA22Bj/5QWCAzuc86Hh/FQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21033219"
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000"; d="scan'208";a="21033219"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:33:07 -0700
X-CSE-ConnectionGUID: KKjtqPUKQ4S/j1vk5I4n+Q==
X-CSE-MsgGUID: vItC5jGsQS+cE06ZY99K/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="25953330"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:33:07 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 1/2] intel_reg: Reorder commands and annotate ones
 needing reg spec
Date: Fri, 26 Apr 2024 08:33:51 -0700
Message-ID: <20240426153352.3209972-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
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

Group together the commands that operate with a reg spec and annotate
those that will implicitly enable a future --decode option.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tools/intel_reg.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/tools/intel_reg.c b/tools/intel_reg.c
index aae5a2395..8f585e4bd 100644
--- a/tools/intel_reg.c
+++ b/tools/intel_reg.c
@@ -967,10 +967,16 @@ struct command {
 	const char *name;
 	const char *description;
 	const char *synopsis;
+	bool decode;
 	int (*function)(struct config *config, int argc, char *argv[]);
 };
 
 static const struct command commands[] = {
+	{
+		.name = "help",
+		.function = intel_reg_help,
+		.description = "show this help",
+	},
 	{
 		.name = "read",
 		.function = intel_reg_read,
@@ -983,31 +989,29 @@ static const struct command commands[] = {
 		.synopsis = "[--post] REGISTER VALUE [REGISTER VALUE ...]",
 		.description = "write value(s) to specified register(s)",
 	},
+	{
+		.name = "snapshot",
+		.function = intel_reg_snapshot,
+		.description = "create a snapshot of the MMIO bar to stdout",
+	},
 	{
 		.name = "dump",
 		.function = intel_reg_dump,
 		.description = "dump all known registers",
+		.decode = true,
 	},
 	{
 		.name = "decode",
 		.function = intel_reg_decode,
 		.synopsis = "REGISTER VALUE [REGISTER VALUE ...]",
 		.description = "decode value(s) for specified register(s)",
-	},
-	{
-		.name = "snapshot",
-		.function = intel_reg_snapshot,
-		.description = "create a snapshot of the MMIO bar to stdout",
+		.decode = true,
 	},
 	{
 		.name = "list",
 		.function = intel_reg_list,
 		.description = "list all known register names",
-	},
-	{
-		.name = "help",
-		.function = intel_reg_help,
-		.description = "show this help",
+		.decode = true,
 	},
 };
 
-- 
2.43.0

