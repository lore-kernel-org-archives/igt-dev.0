Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6414CD98C5
	for <igt-dev@archiver.kernel.org>; Mon, 15 Jun 2026 09:34:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EEE510E317;
	Mon, 15 Jun 2026 09:34:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j0XuA5ws";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C75510E30B
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jun 2026 09:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781515904; x=1813051904;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EQtSwQC4YFZrL4T5h1RPtW70FSUTzTpy/FsjpyaGSsA=;
 b=j0XuA5wshY9Kz0/n/Ab7bdTz3wYQHBAjKWKMb4SH5Qv/rqUZXNxWqepd
 OO8Wg6/WtVSWn7yXeIguErhF/C64lr6OXntRGxrAWekqHPrg3PlVZPJuY
 30TVxxxci7NoZU9lAorLrVLH/P5p0KsO7CnBo1cwevRrPYEFhMcCqPC+3
 VhToIh4a0G1vqB56oH1G/kgD24EjuBuxOlLzzOqGylK3i51NZ3/kHEL4z
 aqJvK5h4UM1SxcMR7cE2sRymoMnDE4b5+iR8hSKwYeq126cnd2qN/QFuM
 kLG0ASm4WTHvtwXLeH354YOjQ40WENIgBZ73uUSmAplT2qbIyvyHDuMU5 g==;
X-CSE-ConnectionGUID: /yPI3VqSSUWzd5FRVHq61w==
X-CSE-MsgGUID: +pubrlmdRiuv7bkKZPXzKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="82235878"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="82235878"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 02:31:43 -0700
X-CSE-ConnectionGUID: 5KmgOkD+TDm++19lTSyypQ==
X-CSE-MsgGUID: pE5KZV13TEe8ehdsM9rDtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="247465272"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa009.jf.intel.com with ESMTP; 15 Jun 2026 02:31:43 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v3 01/10] tools/vbt_decode: fix tables' offset reading
Date: Mon, 15 Jun 2026 11:31:28 +0200
Message-ID: <20260615093137.681050-2-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260615093137.681050-1-michal.grzelak@intel.com>
References: <20260615093137.681050-1-michal.grzelak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

During dumping of VBT #57, all rows are same because parser does not
change offset read. Adjust the offset to change basing on the row used.

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 tools/intel_vbt_decode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index cf7bcc5771..1d6bbc88a4 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -3478,7 +3478,7 @@ static void dump_vswing_preemphasis(struct context *context,
 			printf("\t\t%s: ", vswing_preemph[i]);
 
 			for (int j = 0; j < vs->num_columns; j++)
-				printf(" 0x%08x", vs->tables[n * 10 * vs->num_columns + j]);
+				printf(" 0x%08x", vs->tables[n * 10 * vs->num_columns + i * j]);
 			printf("\n");
 		}
 	}
-- 
2.45.2

