Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4239C27C53
	for <igt-dev@archiver.kernel.org>; Fri,  7 Jun 2024 13:58:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81B3010EC77;
	Fri,  7 Jun 2024 13:58:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cYDHBKcl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3483210EC74
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jun 2024 13:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717768732; x=1749304732;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=yhWfUplIJ5cVfI3vggiUMV7RxBI9ubamuuGjpr/Yq8Q=;
 b=cYDHBKcl1GA7qadUtpsI3b005NKvVLwdfUc+c/jQck9l+07FMz6SUETG
 kwBQnR5i9rRJaUY4BAvrb5dzIWkH6WbsfahTIQIG5U7GXELoAJKh1KNlA
 n2yoHwBbbK3qBu+nEk1UOPI2ulMyZJsfZFH78ou3wAzguy+Z8MerkCXiw
 Yd9yQTXqLjSzMQg462Lm6+vx5hcyTzV7zn+UrTAWAdyeS3++rfJNhmoFF
 nF+mVYRwMUsLGKUXvKWu6zb666SJq8Nt4u4hFpH+RXMQrHXgKQpZhr0Uv
 UfaAgjdrWIbbvTQjMT6o9+YZ+EDoGF37QcK0TvTNrhCHg90hGqr/NPQP+ w==;
X-CSE-ConnectionGUID: opRMnWNmSyC9ZmMwPl3Ksw==
X-CSE-MsgGUID: Awf9ztWJSbadp/eCKU+ZlA==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="25116808"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="25116808"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 06:58:52 -0700
X-CSE-ConnectionGUID: OKh2xcODRTWri1XKh6o+xQ==
X-CSE-MsgGUID: R3YMY098T7m1fyRstww/ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38323847"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 07 Jun 2024 06:58:50 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 07 Jun 2024 16:58:49 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 18/27] tools/intel_vbt_decode: Decode block 26 (TV
 Options)
Date: Fri,  7 Jun 2024 16:57:49 +0300
Message-ID: <20240607135758.31421-19-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240607135758.31421-1-ville.syrjala@linux.intel.com>
References: <20240607135758.31421-1-ville.syrjala@linux.intel.com>
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

Decode VBT block 26 (TV Options). Nothing particularly interesting
in there for us.

Example output from CST:
BDB block 26 (2 bytes, min 2 bytes) - TV options:
        0000: 1a 02 00 00 00

        D connector support: no
        Add modes to avoid overscan issue: no
        Undescan/Overscan for HDTV via DVI: Neither
        Undescan/Overscan for HDTV via component: Neither

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index d5c6a225b3df..e88216c30a69 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -358,6 +358,8 @@ static size_t block_min_size(const struct context *context, int section_id)
 		return sizeof(struct bdb_sdvo_lvds_pnp_id);
 	case BDB_SDVO_LVDS_PPS:
 		return sizeof(struct bdb_sdvo_lvds_pps);
+	case BDB_TV_OPTIONS:
+		return sizeof(struct bdb_tv_options);
 	case BDB_EDP:
 		return sizeof(struct bdb_edp);
 	case BDB_DISPLAY_SELECT_IVB:
@@ -2294,6 +2296,28 @@ static void dump_efp_list(struct context *context,
 	}
 }
 
+static const char * const underscan_overscan[] = {
+	"Neither",
+	"Underscan/Overscan",
+	"Overscan only",
+	"Underscan only",
+};
+
+static void dump_tv_options(struct context *context,
+			    const struct bdb_block *block)
+{
+	const struct bdb_tv_options *tv = block_data(block);
+
+	printf("\tD connector support: %s\n",
+	       YESNO(tv->d_connector_support));
+	printf("\tAdd modes to avoid overscan issue: %s\n",
+	       YESNO(tv->add_modes_to_avoid_overscan_issue));
+	printf("\tUndescan/Overscan for HDTV via DVI: %s\n",
+	       underscan_overscan[tv->underscan_overscan_hdtv_dvi]);
+	printf("\tUndescan/Overscan for HDTV via component: %s\n",
+	       underscan_overscan[tv->underscan_overscan_hdtv_component]);
+}
+
 static void dump_edp(struct context *context,
 		     const struct bdb_block *block)
 {
@@ -3468,6 +3492,11 @@ struct dumper dumpers[] = {
 		.name = "SDVO LVDS PPS",
 		.dump = dump_sdvo_lvds_pps,
 	},
+	{
+		.id = BDB_TV_OPTIONS,
+		.name = "TV options",
+		.dump = dump_tv_options,
+	},
 	{
 		.id = BDB_EDP,
 		.name = "eDP block",
-- 
2.44.2

