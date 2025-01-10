Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB1AE77188
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jan 2025 06:39:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D025210EFDE;
	Fri, 10 Jan 2025 06:39:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S2dpjCZF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7CBF10EFDE
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jan 2025 06:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736491191; x=1768027191;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QjoDKFrUFIlcd6ix6IwVyjNpK8z2B55XtzRvMCAgdjM=;
 b=S2dpjCZFKmBVMDLqV/WpVJk0i3qB9loYfUrIAhsTGLP/GeVAZGvF0J1H
 L2aJ33kOd7ooOaJ8jOKjC9zvZxSz9Zi5wGuLwKePCo3wU4Ce40UyiROML
 nX3qnW+PZiFxmk9qmNQ0UBDPvfjx/UzeI744Jv8q+iddvYZWaWyY/RIJI
 n47prYDIy41FlBm/f1BSM3ILT7m2ZzU175kJyUT/mznikqik1C7dg5Rwd
 MlPTWxO3VtMopJ5zmlf6HzwsJsRvEWOMYptw5qmnhK41JcpdzipSpqfpX
 o4pXyyZ/ZK2TQJFl8wGJILxkMJPM3Q5Y2m2hDToLe2GoyjP7vH2xFl+AS A==;
X-CSE-ConnectionGUID: bAh8TSubRPWsrCZ2hRP+PQ==
X-CSE-MsgGUID: vqrbtpI4T9qU7LdoB52Ajg==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36800583"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; d="scan'208";a="36800583"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 22:39:51 -0800
X-CSE-ConnectionGUID: zUwHQVNTQ82cwiXKcOauKw==
X-CSE-MsgGUID: aI2L83RAQv+ZhPyuHnmdoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="104526796"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 22:39:50 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, arun.r.murthy@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1 2/2] tests/kms_async_flips: use in_formats_async for
 async modifiers
Date: Fri, 10 Jan 2025 12:09:09 +0530
Message-Id: <20250110063909.34042-3-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250110063909.34042-1-santhosh.reddy.guddati@intel.com>
References: <20250110063909.34042-1-santhosh.reddy.guddati@intel.com>
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
index 4a72be7b5..24d4022a5 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -719,12 +719,12 @@ static void run_test_with_modifiers(data_t *data, void (*test)(data_t *))
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
2.25.1

