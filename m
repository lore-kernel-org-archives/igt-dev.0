Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B5FEC54E71
	for <igt-dev@archiver.kernel.org>; Fri, 22 Mar 2024 20:41:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D252112760;
	Fri, 22 Mar 2024 20:41:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FBseTr6p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C697112763
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Mar 2024 20:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711140095; x=1742676095;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=2TcnDt0jlp7PsvF76xDvAJ0pD3oTp6wyD4mH5OGN7eY=;
 b=FBseTr6paOUKDa8HEqOEwT1rkrJpZA69HVAjgZTS4+waXp60YKaqTGfB
 bdcno+kJpbpFc1lwRovZqye1eP6cW3kdS8a3rZBPCqRd4cnhhEXFFB4Tz
 GLxVYfz+5EaKKuwAGQ5flKW++CN5AeHFNVT32J375cTTq2H+2ebjVsiqg
 ec9SrOlySPdCuOzJrwU4S71aweTyhG+qCrq6oxlh+drjsIKBC4CsMQzHR
 dfcdNU9rV/qdQwGpKkcdhzrsEViNS11vI0fOBYLzI+pzpuX6xBncX6xmI
 J494GNRQqQgv0k4NWFgwelgl0+ftRQpsrG/3Qo/B3dtfWKAnsduGFnOf4 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="6329355"
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; 
   d="scan'208";a="6329355"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 13:41:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="827783611"
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; d="scan'208";a="827783611"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 22 Mar 2024 13:41:32 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 22 Mar 2024 22:41:31 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 02/13] tools/intel_vbt_decode: Extract
 default_algorithm()
Date: Fri, 22 Mar 2024 22:41:14 +0200
Message-ID: <20240322204125.17212-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240322204125.17212-1-ville.syrjala@linux.intel.com>
References: <20240322204125.17212-1-ville.syrjala@linux.intel.com>
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

Extract default_algorithm() for later use in decoding
other blocks.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index fd8118772845..b7cd2b3bfa69 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -1460,6 +1460,11 @@ static const char * const lvds_config[] = {
 	[BDB_DRIVER_EDP] = "Embedded DisplayPort",
 };
 
+static const char *default_algorithm(bool algorithm)
+{
+	return algorithm ? "driver default" : "OS default";
+}
+
 static void dump_driver_feature(struct context *context,
 				const struct bdb_block *block)
 {
@@ -1480,7 +1485,7 @@ static void dump_driver_feature(struct context *context,
 	printf("\tAllow display switching when DVD active: %s\n",
 	       YESNO(feature->allow_display_switch_dvd));
 	printf("\tBoot Device Algorithm: %s\n",
-	       feature->boot_dev_algorithm ? "driver default" : "os default");
+	       default_algorithm(feature->boot_dev_algorithm));
 
 	printf("\tBoot Mode X: %u\n", feature->boot_mode_x);
 	printf("\tBoot Mode Y: %u\n", feature->boot_mode_y);
-- 
2.43.2

