Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99135CDD548
	for <igt-dev@archiver.kernel.org>; Wed, 18 Sep 2024 16:36:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2137D10E5FB;
	Wed, 18 Sep 2024 16:36:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BFgLy93f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6C6B10E5EA
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Sep 2024 16:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726677392; x=1758213392;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VKtyLvOMl9N8AwBup0wLlI3Xj2w3sjbsjZdZC3vn8IA=;
 b=BFgLy93fnDwJ9CcjdO8QDl/vbasC184UV/6Baw5enAUmuHrwGbrj3ZZ+
 EpUkw6W+2tLahFvT0mL3SGnpm5Lm4Kr3dBQHrEahi6c51q+rMt59cPNhc
 brTtp1Le+R6oWoia609ibyjCsNB5qj6oTTsicIdvOMJIO2kdIueJDCP6c
 ZA0eZlE11L8afQVsttloHF8G0JHb7sIb4Tfr7IvPHZZtjqXZt2oykUKUA
 0I3XlObu4JSzOaCVifMPCndis4wnneeAYqKSefiiDepQtu18eL8bcDB11
 8YXJmKMQJHirjZI9lSQbRY/Z+v5CXnbqchtnD3MIhGtP5bsxGEPBrkln9 Q==;
X-CSE-ConnectionGUID: FgVJtaPiQ+e+HiOVAyTaEQ==
X-CSE-MsgGUID: EHyKSLgtQ5+KcqY8Hf1mUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="29496278"
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="29496278"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 09:36:31 -0700
X-CSE-ConnectionGUID: dqNN81xcQOKrJkb3KUaGNg==
X-CSE-MsgGUID: 74YAH6kuRf+iOc3v+XN0sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="69235583"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 09:36:31 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 5/6] tools/intel_reg: Add wrapper for reg access init
Date: Wed, 18 Sep 2024 09:36:28 -0700
Message-ID: <20240918163629.1186314-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240918163629.1186314-1-lucas.demarchi@intel.com>
References: <20240918163629.1186314-1-lucas.demarchi@intel.com>
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

Extract helper function so it can be extended to xe.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tools/intel_reg.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/tools/intel_reg.c b/tools/intel_reg.c
index c5800cf05..906ae9b84 100644
--- a/tools/intel_reg.c
+++ b/tools/intel_reg.c
@@ -800,6 +800,11 @@ static int parse_reg(struct config *config, struct reg *reg, const char *s)
 	return ret;
 }
 
+static int register_access_init(struct config *config)
+{
+	return intel_register_access_init(&config->mmio_data, config->pci_dev, 0, -1);
+}
+
 /* XXX: add support for register ranges, maybe REGISTER..REGISTER */
 static int intel_reg_read(struct config *config, int argc, char *argv[])
 {
@@ -812,8 +817,8 @@ static int intel_reg_read(struct config *config, int argc, char *argv[])
 
 	if (config->mmiofile)
 		intel_mmio_use_dump_file(&config->mmio_data, config->mmiofile);
-	else
-		intel_register_access_init(&config->mmio_data, config->pci_dev, 0, -1);
+	else if (register_access_init(config) < 0)
+		return EXIT_FAILURE;
 
 	for (i = 1; i < argc; i++) {
 		struct reg reg;
@@ -843,7 +848,9 @@ static int intel_reg_write(struct config *config, int argc, char *argv[])
 		return EXIT_FAILURE;
 	}
 
-	intel_register_access_init(&config->mmio_data, config->pci_dev, 0, -1);
+
+	if (register_access_init(config) < 0)
+		return EXIT_FAILURE;
 
 	for (i = 1; i < argc; i += 2) {
 		struct reg reg;
@@ -880,8 +887,8 @@ static int intel_reg_dump(struct config *config, int argc, char *argv[])
 
 	if (config->mmiofile)
 		intel_mmio_use_dump_file(&config->mmio_data, config->mmiofile);
-	else
-		intel_register_access_init(&config->mmio_data, config->pci_dev, 0, -1);
+	else if (register_access_init(config) < 0)
+		return EXIT_FAILURE;
 
 	for (i = 0; i < config->regcount; i++) {
 		reg = &config->regs[i];
-- 
2.46.1

