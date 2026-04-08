Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 406EE10F9968
	for <igt-dev@archiver.kernel.org>; Wed,  8 Apr 2026 20:22:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF05610E260;
	Wed,  8 Apr 2026 20:22:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aE4mfXxu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E07810E3BE
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Apr 2026 20:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775679704; x=1807215704;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aUl1qqAq2aMBk4iTpA/5RojZztQ+2R4x46le5u/YEEU=;
 b=aE4mfXxuH/eaSx+FeSHGbjdRS/c+dCc3luTUItwSy5pw7eVLe5CLGtY5
 6ssyGlUGKXz9T9GbYRKkeFE+PFFUQIhD1GCMYJGwVwuXcIUWhRHSwdkG5
 6PETFOFF8anrdbEFa+nZjhcw2l3qhh2ooaD0QFv70OgJDgcnN4S/x4+RF
 ZAGjI3jI5GeGbex4s8Tb2QyKWGsKPzKEIdOyuJKECOPbj3W78eWGx8jKy
 hfodJK0EGGY/q/pIL1T5CCFs8Le64F+ar1bsirEKkIMRV7H045q7kqLPM
 t1XvIiokjsNk51G9RoFA1jeFohWWrxnjsrtN9Fok9Sv63LIwdj9zT9xY/ w==;
X-CSE-ConnectionGUID: mU7rOO9KTnyhESBPlRGVBg==
X-CSE-MsgGUID: HvExTlh8TVWPNItsig5/Nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="75713409"
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="75713409"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 13:21:44 -0700
X-CSE-ConnectionGUID: NRCCeeRqRQKrcp2DKDVAlQ==
X-CSE-MsgGUID: m5Jrja2iSla2ClqK34F/KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="223810553"
Received: from krybak-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.32])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 13:21:42 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH i-g-t 5/7] tests/kms_plane_lowres: use
 for_each_connector_mode()
Date: Wed,  8 Apr 2026 23:21:11 +0300
Message-ID: <294c6b14cb098cb18dccd8291c832276aabd6d3f.1775679624.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775679624.git.jani.nikula@intel.com>
References: <cover.1775679624.git.jani.nikula@intel.com>
MIME-Version: 1.0
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

We have	a helper for looping the output	modes. Use it.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tests/kms_plane_lowres.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tests/kms_plane_lowres.c b/tests/kms_plane_lowres.c
index 79e0d7a20c2a..83b8f6b173d4 100644
--- a/tests/kms_plane_lowres.c
+++ b/tests/kms_plane_lowres.c
@@ -87,12 +87,10 @@ get_lowres_mode(int drmfd, igt_output_t *output,
 {
 	const drmModeModeInfo *mode;
 	const drmModeModeInfo *min;
-	int j;
 
         /* search for lowest mode */
         min = mode_default;
-	for (j = 0; j < output->config.connector->count_modes; j++) {
-		mode = &output->config.connector->modes[j];
+	for_each_connector_mode(output, mode) {
 		if (mode->vdisplay < min->vdisplay)
 			min = mode;
 	}
-- 
2.47.3

