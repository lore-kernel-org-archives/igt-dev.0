Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 801C6CD4851
	for <igt-dev@archiver.kernel.org>; Tue, 12 May 2026 12:23:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30FD410E0E5;
	Tue, 12 May 2026 12:23:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gLtB9u0h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAD7910E0E5
 for <igt-dev@lists.freedesktop.org>; Tue, 12 May 2026 12:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778588579; x=1810124579;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=WHmioWxj7SlIEHvgGY0yV1ym/ShGCB1m79JEk2wqIeE=;
 b=gLtB9u0hew+Icy9i25/N83tPSi+yZ7GFS+6BGs1xgcY7gmcA7HNojEuI
 fIjvmw4Cj3ah3wyZWpOde2Z5pshH3tM8BcWGE/MQTzqAFv8fg/9GkQyoZ
 LHPKiMZQMD9WwlvcpOnogqesE5En/0Ks3Nl2hwG+OYI5J5//YoHKq2sFf
 x878Ldw2ju/FOLdKBgQo+mfivP2uw6N+0pCqVhvsY0Lgb7BluyaHyLKq2
 ViqfGyflh5IJmuFNHqfX562feBc12P0izVcQZfrh0aXs4g0xPZ9pk4xvt
 8zUJGxd3tN/bnFmN++Uzi/x9qbyoip+/U9JJxRwGiQEjrcFSTHxmjEi21 Q==;
X-CSE-ConnectionGUID: OSgxHXKISZCNH+Idqsex3Q==
X-CSE-MsgGUID: 86kyWdrsTFKtM5Bja0l61A==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="104950039"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="104950039"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 05:22:59 -0700
X-CSE-ConnectionGUID: 5MxdHy7cSrOW/ElYG9fXEw==
X-CSE-MsgGUID: eeSp/n/iS3+YmVBaoiHuEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="234691083"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.104])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 05:22:57 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 18/25] tests/chamelium/kms_chamelium_frames: Use
 for_each_format_and_modifier()
Date: Tue, 12 May 2026 15:21:36 +0300
Message-ID: <20260512122143.11013-19-ville.syrjala@linux.intel.com>
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

Replace the open coded for_each_format_and_modifier() with the real
thing.

igt_plane_for_each_format() would be a better fit here since we
don't need the modifier in the loop, but the test keeps track of
the index and stores that in a yet another array in order to
then pick a format+modifier combination in random. There's probably
a less convoluted way to implement this, but meh for now.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/chamelium/kms_chamelium_frames.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tests/chamelium/kms_chamelium_frames.c b/tests/chamelium/kms_chamelium_frames.c
index 3a59c2b51a9b..d1d76f26d6a0 100644
--- a/tests/chamelium/kms_chamelium_frames.c
+++ b/tests/chamelium/kms_chamelium_frames.c
@@ -305,14 +305,15 @@ static void randomize_plane_setup(chamelium_data_t *data, igt_plane_t *plane,
 	uint32_t idx[plane->format_mods.count];
 	unsigned int count = 0;
 	unsigned int i;
+	uint32_t f;
+	uint64_t m;
 
 	/* First pass to count the supported formats. */
-	for (i = 0; i < plane->format_mods.count; i++) {
-		uint32_t f = plane->format_mods.formats[i];
-
+	for_each_format_and_modifier(&plane->format_mods, f, m) {
 		if (igt_fb_supported_format(f) &&
 		    (allow_yuv || !igt_format_is_yuv(f)))
 			idx[count++] = i;
+		(void)m;
 	}
 
 	igt_assert(count > 0);
-- 
2.52.0

