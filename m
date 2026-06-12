Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0198CD98CE
	for <igt-dev@archiver.kernel.org>; Fri, 12 Jun 2026 11:01:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61A5610E9DA;
	Fri, 12 Jun 2026 11:01:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TifgHutB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E5C710E9DA
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jun 2026 11:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781262072; x=1812798072;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kWgJ3P4/Ll30bBYyLZwoQQAbuthV8qVdfd5KKkSDhHc=;
 b=TifgHutButfSUguWd/p7N6JCeb+JFwiRmD0FHKm/hLjGnc26dKAz6cM3
 CK66KAaL/D6vqjE8VID29Ue29v4mKSxpEhMydo8+MzfDlhwA6d2/lZ3Ha
 7K5JxACtuO/wzs6T5niLVKIi7XVYWmFGMTnRjUiDKynZv+jlK0P97hthA
 2AAo4bvNyczjpSRUdOR6BJvoJqLA/A29XG5dAW9J9ITf6cn7WEAxZl9BN
 xFkN6+E8BaiZEisvvgpAmWQfKltgwolBEb7/JQ40cESmXfQ2c5WXwazoK
 Lqr2bZjHAARnZ/TevOuzK1thP28bRcUeJkhuPeiXcOAUwj2t1TJJ0e8yB A==;
X-CSE-ConnectionGUID: hBltI1nYSiactvtKugN6Mw==
X-CSE-MsgGUID: bleDNIi/RpqrYSu+7fbEUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81226213"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="81226213"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 04:00:59 -0700
X-CSE-ConnectionGUID: AsRBUy9OThmfpscbT2dR5w==
X-CSE-MsgGUID: P1w6B887R5qAJoFrr7wD3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="246818223"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.71])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 04:00:57 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Cc: ville.syrjala@linux.intel.com,
	jani.nikula@intel.com
Subject: [PATCH i-g-t 1/4] tools/intel_vbt_decode: store codename from VBT
 signature to context
Date: Fri, 12 Jun 2026 14:00:41 +0300
Message-ID: <f2fbc2d33202efafa7afb6a01353ba0ce8146f52.1781261899.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781261899.git.jani.nikula@intel.com>
References: <cover.1781261899.git.jani.nikula@intel.com>
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

