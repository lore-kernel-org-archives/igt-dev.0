Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 870F8C27C55
	for <igt-dev@archiver.kernel.org>; Fri, 31 May 2024 14:25:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C650A10E66A;
	Fri, 31 May 2024 14:25:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lu0cXYbh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20DE510E58A
 for <igt-dev@lists.freedesktop.org>; Fri, 31 May 2024 14:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717165512; x=1748701512;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=CdRhYF08XKCEZQAVux4zgQDjSaagKbHa05NkzdzTrqU=;
 b=Lu0cXYbhBep3oanqhBg37mhYpcEPzIQbFlhKymnTX6ePZyEK5x66NFwP
 uqaRuzqpv4HJyD4Dsp+hzlyKjmKUOQ+Yx4GOVLjPUxWiiBZXsI50R0Mrd
 j2ExqrhsSdmQj3idSRrmxI4WZNWR4nQ4x04yeyxOD9PoUszOrtHIHX4JJ
 ZfGj575qOdzp2wMs25cfx8pFvlgCTQfK7agJ0mwA/0qRrFKJwEnkYGYeS
 DuKRcP8WVsG5CkVypZmwFcS3aJN8JZpMNJtfOU68b+Rg6sA/5gONTtW1u
 /35WI69Tms3eB1WGoHZtAgzXiUKQSSnyVNGOdvJzzW01JLNvV2M7JDj0h w==;
X-CSE-ConnectionGUID: CEdf0dLATqeK2GC8QqwR1w==
X-CSE-MsgGUID: eRKI4Gp6Qs++wkB4RSW2Dw==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="25113745"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="25113745"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 07:24:41 -0700
X-CSE-ConnectionGUID: adOC/Wr6QyqrNqQ8c6tWFw==
X-CSE-MsgGUID: Fq8TXCWkToegGJhQod6xvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="36160915"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 31 May 2024 07:24:39 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 31 May 2024 17:24:38 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 16/20] tools/intel_vbt_decode: Track the SDVO panel type
Date: Fri, 31 May 2024 17:23:50 +0300
Message-ID: <20240531142354.16528-17-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20240531142354.16528-1-ville.syrjala@linux.intel.com>
References: <20240531142354.16528-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Just like we do for the LFP panel types, let's keep track of
the SDVO panel type.

I suppose technically we should also check h40_set_panel_type,
and if set then derive the panel type via some VBIOS call or
some such crazyness. We'll just ignore that and assume the VBT
specified panel type is correct. Could also add a comman line
override, but meh.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 34 +++++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 167b5751ad16..04520973aae1 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -69,6 +69,7 @@ struct context {
 
 	uint32_t devid;
 	int panel_type, panel_type2;
+	int sdvo_panel_type;
 	bool dump_all_panel_types;
 	bool hexdump;
 };
@@ -101,6 +102,14 @@ static const char *panel_str(const struct context *context, int panel_type)
 	return "";
 }
 
+static const char *sdvo_panel_str(const struct context *context, int sdvo_panel_type)
+{
+	if (sdvo_panel_type == context->sdvo_panel_type)
+		return " (*)";
+
+	return "";
+}
+
 /* Get BDB block size given a pointer to Block ID. */
 static uint32_t _get_blocksize(const uint8_t *block_base)
 {
@@ -1935,7 +1944,7 @@ static void dump_sdvo_lvds_dtd(struct context *context,
 	const struct bdb_sdvo_lvds_dtd *t = block_data(block);
 
 	for (int n = 0; n < ARRAY_SIZE(t->dtd); n++) {
-		printf("%d:\n", n);
+		printf("\tSDVO Panel %d%s\n", n, sdvo_panel_str(context, n));
 		print_detail_timing_data(&t->dtd[n]);
 	}
 }
@@ -2623,6 +2632,25 @@ static int get_panel_type(struct context *context, bool is_panel_type2)
 	return panel_type;
 }
 
+/* get SDVO panel type from SDVO options block, or -1 if block not found */
+static int get_sdvo_panel_type(struct context *context)
+{
+	const struct bdb_sdvo_lvds_options *options;
+	struct bdb_block *block;
+	int panel_type = -1;
+
+	block = find_section(context, BDB_SDVO_LVDS_OPTIONS);
+	if (!block)
+		return -1;
+
+	options = block_data(block);
+	panel_type = options->panel_type;
+
+	free(block);
+
+	return panel_type;
+}
+
 static int
 get_device_id(unsigned char *bios, int size)
 {
@@ -2933,6 +2961,7 @@ int main(int argc, char **argv)
 	struct context context = {
 		.panel_type = -1,
 		.panel_type2 = -1,
+		.sdvo_panel_type = -1,
 	};
 	const char *panel_edid = NULL, *panel_edid2 = NULL;
 	char *endp;
@@ -3134,6 +3163,9 @@ int main(int argc, char **argv)
 		context.panel_type2 = -1;
 	}
 
+	if (context.sdvo_panel_type == -1)
+		context.sdvo_panel_type = get_sdvo_panel_type(&context);
+
 	if (describe) {
 		print_description(&context);
 	} else if (header_only) {
-- 
2.44.1

