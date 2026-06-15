Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5BE2CD98DA
	for <igt-dev@archiver.kernel.org>; Mon, 15 Jun 2026 09:32:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64E7710E317;
	Mon, 15 Jun 2026 09:32:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HouOTrxq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98E2810E30B
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jun 2026 09:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781515907; x=1813051907;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DY7VuAMeVk03RHA/6VbeKGihQDR6SJI5965Ldb5r3vs=;
 b=HouOTrxq3tgeonQ0Xb182R26hZtrATKH9oC07526stC0+fYTm7ZpvlDr
 wYh4EGFp7PN7VkLVa2IolTIObZAjn3tHuJ9XaqftArksW2tZG8yOrlboh
 J7DGuwMysmOsrSKgNK4J3mj0NiUnwROK4wEIBLJ2OMPF9Jw52hsDC+3Ly
 rCURq6gkK0HREWQ/bz6SnSwfZFJ46e+LEX9l3fgbbk6tFWeMBX/l71VuD
 6Rt4eb4twLzzOzBwXtPN5itRJxTM3EAcZYR6iMo0K8n/7zkM5Um7CtRcn
 6StF6MebPIDwM8oiHIPIzYlwQPiIYT36pO9YqWqj6fRV7TNrzlVgM/3ee Q==;
X-CSE-ConnectionGUID: PhMKNMvMSzSn8qtb6RXq5g==
X-CSE-MsgGUID: RSNzEnTRS0+k5gNX/mZRwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="82235883"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="82235883"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 02:31:46 -0700
X-CSE-ConnectionGUID: pJCgnWNFSxmsRt4l7YSINw==
X-CSE-MsgGUID: KWsab5FcR12k1JluTFkYsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="247465279"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa009.jf.intel.com with ESMTP; 15 Jun 2026 02:31:46 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH i-g-t v3 03/10] tools/intel_vbt_decode: store codename from
 VBT signature to context
Date: Mon, 15 Jun 2026 11:31:30 +0200
Message-ID: <20260615093137.681050-4-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260615093137.681050-1-michal.grzelak@intel.com>
References: <20260615093137.681050-1-michal.grzelak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

From: Jani Nikula <jani.nikula@intel.com>

From: Jani Nikula <jani.nikula@intel.com>

The VBT often contains something resembling a codename in the
signature. Currently, we only use it for printing a description of sorts
(the --describe option). Store the codename-ish to context for more use.

Cc: Michał Grzelak <michal.grzelak@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tools/intel_vbt_decode.c | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 5b7a6a49e9..ab0ad5ada6 100644
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
2.45.2

