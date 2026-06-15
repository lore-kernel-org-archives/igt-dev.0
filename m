Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E2ECD98DA
	for <igt-dev@archiver.kernel.org>; Mon, 15 Jun 2026 11:31:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17C3410E3A6;
	Mon, 15 Jun 2026 11:31:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l2Tz/JIr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C215210E38F
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jun 2026 11:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781522965; x=1813058965;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+F9kt5soXeS8hy+Qd/DPYTU/emKbNB4NYoCk1ArfpL8=;
 b=l2Tz/JIrbByiSdOHH9OOEoufhvYZbNybg2N03sNXNkbUiUCRUa0SNDOh
 Bz1RbyInV+C7qHjB5o9La6FH85pL82WWu92ZXunY57RiN001y1krYmZLV
 1M5SdFH0iUb1Jf4L//3oTT+BNELPUmXjSCGJ1jIe51m17RM1A5opJDwxk
 YYDf+XFhMTXs3I+cmwdbRYHy1u1IpEPdcHMxjb9GEYE9yCdPDCIUzJcHf
 MGJ/F813UA8Asq300RCDRxMEl5eXKjktM/RMguKnrw0wUqXWbq6WN6wpN
 6B5vPYzhHOuy0xbRu5UnRj6sduBouZZ8G8odBDEA/YEUlPtZo4ngW4JP9 g==;
X-CSE-ConnectionGUID: e/29adUiStib3ZKEwjK31A==
X-CSE-MsgGUID: 4lsva5gpQUWAcufPKFlHkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="85893055"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="85893055"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 04:29:24 -0700
X-CSE-ConnectionGUID: ugsa4VkiTT+o0ZgcZR3GUw==
X-CSE-MsgGUID: EDh+0LJ3R6ezXMvsgwYlsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="252402890"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.28])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 04:29:23 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Cc: ville.syrjala@linux.intel.com,
	jani.nikula@intel.com
Subject: [PATCH i-g-t v2 1/4] tools/intel_vbt_decode: store codename from VBT
 signature to context
Date: Mon, 15 Jun 2026 14:29:11 +0300
Message-ID: <88388870be2b1e466c01d3095ba15fad360dfd18.1781522896.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781522896.git.jani.nikula@intel.com>
References: <cover.1781522896.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

The VBT often contains something resembling a codename in the
signature. Currently, we only use it for printing a description of sorts
(the --describe option). Store the codename-ish to context for more use.

Cc: Michał Grzelak <michal.grzelak@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Reviewed-by: Michał Grzelak <michal.grzelak@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tools/intel_vbt_decode.c | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index cf7bcc5771a4..5b39e0c1c33e 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -74,6 +74,8 @@ struct context {
 	const struct bdb_header *bdb;
 	int size;
 
+	char codename[sizeof(((struct vbt_header *)0)->signature) + 1];
+
 	uint32_t devid;
 	int panel_type, panel_type2;
 	int sdvo_panel_type;
@@ -4023,31 +4025,38 @@ static bool dump_section(struct context *context, int section_id)
 	return true;
 }
 
-/* print a description of the VBT of the form <bdb-version>-<vbt-signature> */
-static void print_description(struct context *context)
+/* initialize something resembling a codename based on the signature */
+static void init_codename(struct context *context)
 {
 	const struct vbt_header *vbt = context->vbt;
-	const struct bdb_header *bdb = context->bdb;
-	char *desc = strndup((char *)vbt->signature, sizeof(vbt->signature));
+	char signature[sizeof(vbt->signature) + 1] = {};
 	char *p;
 
-	for (p = desc + strlen(desc) - 1; p >= desc && isspace(*p); p--)
+	memcpy(signature, vbt->signature, sizeof(vbt->signature));
+
+	for (p = signature + strlen(signature) - 1; p >= signature && isspace(*p); p--)
 		*p = '\0';
 
-	for (p = desc; *p; p++) {
+	for (p = signature; *p; p++) {
 		if (!isalnum(*p))
 			*p = '-';
 		else
 			*p = tolower(*p);
 	}
 
-	p = desc;
+	p = signature;
 	if (strncmp(p, "-vbt-", 5) == 0)
 		p += 5;
 
-	printf("%d-%s\n", bdb->version, p);
+	strncpy(context->codename, p, sizeof(context->codename));
+}
+
+/* print a description of the VBT of the form <bdb-version>-<vbt-signature> */
+static void print_description(struct context *context)
+{
+	const struct bdb_header *bdb = context->bdb;
 
-	free (desc);
+	printf("%d-%s\n", bdb->version, context->codename);
 }
 
 static void dump_headers(struct context *context)
@@ -4313,6 +4322,8 @@ int main(int argc, char **argv)
 	context.bdb = (const struct bdb_header *)(VBIOS + bdb_off);
 	context.size = size;
 
+	init_codename(&context);
+
 	if (!context.devid) {
 		const char *devid_string = getenv("DEVICE");
 		if (devid_string)
-- 
2.47.3

