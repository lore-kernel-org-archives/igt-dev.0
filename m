Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 564FECD4851
	for <igt-dev@archiver.kernel.org>; Tue, 12 May 2026 12:27:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C29CA10EA89;
	Tue, 12 May 2026 12:27:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZlBMIdNx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A06610EA7F
 for <igt-dev@lists.freedesktop.org>; Tue, 12 May 2026 12:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778588595; x=1810124595;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=GOMbFbvx+TKifYgN6FcQgCCgxqNZ6taFJ7SGBpCfHQM=;
 b=ZlBMIdNxqGyXtCA4z2fz1G6GOECIrmq4H30u0BRzdsMn926irRDJX9SX
 FagZ1nQSmoDa81GhmHYzLhDU2cjw3i9qatttb55cA9rCoF6YuLN7wdDMp
 bbP/yWldim/dQzHGCdskad6m7hA/jikQimvt5a3UuDp6sEJtRTjsx4/bc
 Nvx2ODFttCkpf8meHvR8GfJ5Hg3q2hBPcXP/rxwV/6bxhF7IdO2lHOrxF
 mf7OORB2sXtN0VNU+jfjWAY27nzNrXK9V+FkWkJu2yGZiX0lAM9XS1o1L
 4N0e0IsarxfPhWIjLzZHIgAZCpt81wt5XDa5yhVxAWaw710+W+O20kKaO A==;
X-CSE-ConnectionGUID: ZT6iH3DVQQKHAqxw9tvaqA==
X-CSE-MsgGUID: QNafTrjqQv2xR8FUEXefRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="104950058"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="104950058"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 05:23:14 -0700
X-CSE-ConnectionGUID: sB1kkPyyTQiLK3OHIry4uA==
X-CSE-MsgGUID: ejbJ+doJQriFN42aQUMBwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="234691191"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.104])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 05:23:13 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 22/25] tests/kms_async_flips: Use
 igt_format_mods_has_modifier()
Date: Tue, 12 May 2026 15:21:40 +0300
Message-ID: <20260512122143.11013-23-ville.syrjala@linux.intel.com>
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

Use igt_format_mods_has_modifier() instead of hand rolling it
for the linear check.

And to make the code less convoluted, let's just look for
whatever modifier we want to use, linear or not.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_async_flips.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 3d8c37631e2a..e8c9979bd06d 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -869,20 +869,6 @@ static void test_crc(data_t *data)
 	igt_assert_lt(data->frame_count * 2, data->flip_count);
 }
 
-static void require_linear_modifier(data_t *data)
-{
-	for (int i = 0; i < data->plane->format_mods_async.count; i++) {
-		uint64_t modifier = data->plane->format_mods_async.modifiers[i];
-
-		if (modifier == DRM_FORMAT_MOD_LINEAR) {
-			data->modifier = DRM_FORMAT_MOD_LINEAR;
-			return;
-		}
-	}
-
-	igt_skip("Linear modifier not supported for async flips on this platform\n");
-}
-
 static void run_test(data_t *data, void (*test)(data_t *))
 {
 	igt_crtc_t *crtc;
@@ -903,10 +889,13 @@ static void run_test(data_t *data, void (*test)(data_t *))
 		test_init(data);
 
 		if (data->linear_modifier)
-			require_linear_modifier(data);
+			data->modifier = DRM_FORMAT_MOD_LINEAR;
 		else
 			data->modifier = default_modifier(data);
 
+		igt_require(igt_format_mods_has_modifier(&data->plane->format_mods_async,
+							 data->modifier));
+
 		igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
 			      data->output->name) {
 			/*
-- 
2.52.0

