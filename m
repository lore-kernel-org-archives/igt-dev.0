Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5EF1E77184
	for <igt-dev@archiver.kernel.org>; Tue, 17 Dec 2024 06:50:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F7AE10E431;
	Tue, 17 Dec 2024 06:50:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZEx3pTVS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C11510E414
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Dec 2024 06:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734418229; x=1765954229;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E8mdYKDWqUi6KQ76nuisn5vwa9a1NvXcbLA7hOA/MKg=;
 b=ZEx3pTVScYZKLM2LeTPEZ9XyYmxCmbxgnwMP023evJBZzACANthfadWR
 tnEsf/UEI/IkzhiRSb8D+/rZQh5x/Eeqaayvk1iZt4EpStfGla3ByHJ+w
 jVoJ83ZZHxXHkaNLnAUfGTGDscYBVPEFAo3BcRnifYIIaf6N51dP5eKKN
 R7KhrfkyoVb1ddkWWcGRMuUm1/k02PfRc115XSBU4RUxcchIJCrLY9PPV
 x5DlB/ufeF1sm1VsEAI560ZTe8GTprA6QoFR+ICW3V3lo7P0E/q6xb9I7
 MiuItcpdrgnx18zxi3MORUMJUaIv2ncI9xgMssgPsK0Q5TpRVSvfy3I3P g==;
X-CSE-ConnectionGUID: YBNDQuFLRiCORB+uhC5cZg==
X-CSE-MsgGUID: vTdxx5HVQ5ajonyypZvQKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="45523659"
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; d="scan'208";a="45523659"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 22:50:29 -0800
X-CSE-ConnectionGUID: EhyRNjQrQLWUm86/qIyW4A==
X-CSE-MsgGUID: ykpptMp1Tr+RCVQveDGicA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; d="scan'208";a="97337491"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 22:50:27 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: arun.r.murthy@intel.com, karthik.b.s@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1 2/2] tests/kms_async_flips: use in_formats_async for
 async modifiers
Date: Tue, 17 Dec 2024 12:14:13 +0530
Message-Id: <20241217064413.2301301-3-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241217064413.2301301-1-santhosh.reddy.guddati@intel.com>
References: <20241217064413.2301301-1-santhosh.reddy.guddati@intel.com>
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
2.34.1

