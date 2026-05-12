Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 855BFCD4851
	for <igt-dev@archiver.kernel.org>; Tue, 12 May 2026 12:28:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C80010EA89;
	Tue, 12 May 2026 12:28:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LVFZ+jvY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B182410E0E5
 for <igt-dev@lists.freedesktop.org>; Tue, 12 May 2026 12:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778588587; x=1810124587;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=atmYJ9GKqX4IRAE9ZZ7lf/4fTTNt4hRRQ4IG3J4mh/0=;
 b=LVFZ+jvYzX5E0qjz5glKkZMucqBJekY6A3MW3fZb37t/E2hMTbTsT9nN
 1pPimR+pIdU86MkJubYBh79gil5m9Fsjk8f8tKvjMJ/CLSbIpPsseff+5
 qjdo9YHE1I0/SsnvApw300kIoWa77dg9/rqGaPTlQ3BKPz2jfP1CPYJLO
 Xi8p2feje3b/IXzuGztBJXKnDLVK55hJhKJWW1AeJ22pP1Q3V7zdalFEi
 3/lqujOqDpTuOrmcPDbXESMPws7O989Fy282LDDQs1INdOc0k+PvwJ4ic
 AuyJael/tQesZEHTBuEAqCsAcSTeQAi+ShTjN3xC+4J4Pebwq+hWLbsgU A==;
X-CSE-ConnectionGUID: wRGfedzJTfiVUBA9e3fBSQ==
X-CSE-MsgGUID: Loa2SRd4Rtiz8SBDGIt0lQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="104950049"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="104950049"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 05:23:07 -0700
X-CSE-ConnectionGUID: Sh/XmyjKRL2RzhZftaqExQ==
X-CSE-MsgGUID: 7fPis87HT92VesKpB6nPqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="234691140"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.104])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 05:23:05 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 20/25] tests/kms_plane: Use
 for_each_format_and_modifier()
Date: Tue, 12 May 2026 15:21:38 +0300
Message-ID: <20260512122143.11013-21-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260512122143.11013-1-ville.syrjala@linux.intel.com>
References: <20260512122143.11013-1-ville.syrjala@linux.intel.com>
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Replace the open coded copies of for_each_format_and_modifier()
with the real thing.

The AMD thing here could more properly use a for_each_modifier(),
if we had one. But implementing one on top of igt_format_mods
would still iterate each modifier multiple times (assuming the
same modifier is supported with multiple formats). So we'd
rather want a modifier counterpart to for_each_plane_format().
drmModePlane gave us a nice shortcut to for_each_plane_format()
but sadly it doesn't extend that service to modifiers. So we'd
have to build the pure modifier list by hand...

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_plane.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 5923b5917579..b82346464049 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -1122,6 +1122,7 @@ static void test_format_plane(data_t *data, igt_crtc_t *crtc,
 	igt_crc_t ref_crc[MAX_CRC_SET][ARRAY_SIZE(colors_extended)];
 	struct igt_vec tested_formats;
 	struct format_mod ref = {};
+	struct format_mod f = {};
 	igt_crc_t* crcset;
 	bool result = true;
 
@@ -1182,14 +1183,7 @@ static void test_format_plane(data_t *data, igt_crtc_t *crtc,
 	 */
 	igt_require(num_unique_crcs(ref_crc[MULTIPLE_CRC_SET], data->num_colors) > 1);
 
-	for (int i = 0; i < plane->format_mods.count; i++) {
-		uint32_t format = plane->format_mods.formats[i];
-		uint64_t modifier = plane->format_mods.modifiers[i];
-		struct format_mod f = {
-			.format = format,
-			.modifier = modifier,
-		};
-
+	for_each_format_and_modifier(&plane->format_mods, f.format, f.modifier) {
 		if (data->mod != f.modifier)
 			continue;
 
@@ -1252,17 +1246,17 @@ static void test_format_plane(data_t *data, igt_crtc_t *crtc,
 static bool skip_plane(data_t *data, igt_plane_t *plane)
 {
 	int index = plane->index;
-	int i;
-
-	for (i = 0; i < plane->format_mods.count; i++) {
-		uint64_t modifier = plane->format_mods.modifiers[i];
+	uint64_t modifier;
+	uint32_t format;
 
+	for_each_format_and_modifier(&plane->format_mods, format, modifier) {
 		if (IS_AMD_FMT_MOD(modifier) &&
 		    (AMD_FMT_MOD_GET(DCC, modifier) ||
 		     AMD_FMT_MOD_GET(DCC_RETILE, modifier))) {
 			igt_debug("Skipping planes with DCC or DCC_RETILE\n");
 			return true;
 		}
+		(void)format;
 	}
 
 	if (data->extended)
-- 
2.52.0

