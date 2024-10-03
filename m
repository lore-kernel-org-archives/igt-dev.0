Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02398CF856F
	for <igt-dev@archiver.kernel.org>; Thu,  3 Oct 2024 08:45:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5AB110E7D6;
	Thu,  3 Oct 2024 08:45:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lM8o7UOc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EA3010E7D6
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Oct 2024 08:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727945132; x=1759481132;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T8eIH0t8mSXdlGAMq2ULemxK68E65OYQ24dhmN+HwcQ=;
 b=lM8o7UOcBUEhynwj1vzzuUXuQdwdCvkNa7J4F5QnI5UCO1FYmbqvpLlL
 5zaOOlYJSwqFrivxbDX07mA6HcebLu5ZMgQ9gTLWS6QFi0w6Uu9VcOtjZ
 MKcHcqpzlbGd62R2wWSVjRH5VdO/mjaogFSirwIy+sjb8iDRrHFSmMAK/
 rTDd5h/W6RqXqoX03z9NWpI6M522Uzt1la542mlzT1p/jqq9bAAM+I/Dd
 vm+Zuof5HjI+HBVeDnPfZe+xenuwIVFIUXgnnAZmYzXYwt6btAGUjCSah
 URY6RbEtZu9rwkqy5DD4aaslrMk3oAozuy6Alxjz6qlRd3ygoeGF5KpYo g==;
X-CSE-ConnectionGUID: xuYxvoiuRa+60GhiT950Xw==
X-CSE-MsgGUID: icv79ov4TjuTJkwYieA12w==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="38489077"
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; d="scan'208";a="38489077"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 01:45:32 -0700
X-CSE-ConnectionGUID: aLnAjs5GQeG+obSJSEsaWA==
X-CSE-MsgGUID: WhnjiPM0Qm+YRhS4iPTq5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; d="scan'208";a="78828313"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 01:45:29 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: pranay.samala@intel.com, arun.r.murthy@intel.com,
 vandita.kulkarni@intel.com, karthik.b.s@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1 2/2] tests/kms_async_flips: use in_formats_async to
 get async modifiers list
Date: Thu,  3 Oct 2024 14:14:20 +0530
Message-Id: <20241003084420.2547152-3-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241003084420.2547152-1-santhosh.reddy.guddati@intel.com>
References: <20241003084420.2547152-1-santhosh.reddy.guddati@intel.com>
MIME-Version: 1.0
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

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_async_flips.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 5b70c4033..62bd12f41 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -655,12 +655,12 @@ static void run_test_with_modifiers(data_t *data, void (*test)(data_t *))
 	for_each_pipe_with_valid_output(&data->display, data->pipe, data->output) {
 		test_init(data);
 
-		for (int i = 0; i < data->plane->format_mod_count; i++) {
+		for (int i = 0; i < data->plane->async_format_mod_count; i++) {
 			if (data->plane->formats[i] != DRM_FORMAT_XRGB8888)
 				continue;
 
 			data->allow_fail = true;
-			data->modifier = data->plane->modifiers[i];
+			data->modifier = data->plane->async_modifiers[i];
 
 			igt_dynamic_f("pipe-%s-%s-%s", kmstest_pipe_name(data->pipe),
 				      data->output->name,
-- 
2.34.1

