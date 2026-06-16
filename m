Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8050CD98DA
	for <igt-dev@archiver.kernel.org>; Tue, 16 Jun 2026 11:12:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DBCC10E6E2;
	Tue, 16 Jun 2026 11:12:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RkeXfreg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ECE810E6E2
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Jun 2026 11:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781608327; x=1813144327;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hlNUnCCUwSFjxYvVv5EgobmHJpkP6njdezJEEbl2Lo8=;
 b=RkeXfregox47I+WgJVEMjmLiUEfWFPcezhlPT+P931C1v1yVITE+0yDg
 pmFH9iL0uNgRf1pfCldMgHDv9ox8GjCudAudMLLitqZkhZ8PeLDicuMRh
 G9V6cR6tJEUC2UKCUhfZI47jguhQJXJmxLCVWAppkgH72bn3KPPulATm1
 wq1AWgHJMVv1jmwTdvrgAjQiLgXocOExE2EG4xvagR6dNsUTcC0vN+DiK
 h2lrwMCDuWQp4S5Om4wpwVIDKJL8ngjpGMT/7lguEjhaMLJThltwyYjKo
 KgMxKGeqbZ+QLhq15eGHY01LwV/2aBt9qU69cSv4IUX9yU/3GB5s2ffLJ A==;
X-CSE-ConnectionGUID: CYm4zJuNRaO8uKFRv1Zf4g==
X-CSE-MsgGUID: T0vY/LA1Sm64bmAnZAtLQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82381958"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="82381958"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 04:12:07 -0700
X-CSE-ConnectionGUID: NI7dWK+hRyGVMTkJKnRnFA==
X-CSE-MsgGUID: kU/8M+WxQmq+HMSZQ83JZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="252714036"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa005.jf.intel.com with ESMTP; 16 Jun 2026 04:12:06 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v4 1/6] tools/vbt_decode: fix tables' offset reading
Date: Tue, 16 Jun 2026 13:11:57 +0200
Message-ID: <20260616111202.1254067-2-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260616111202.1254067-1-michal.grzelak@intel.com>
References: <20260616111202.1254067-1-michal.grzelak@intel.com>
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
index 9451a77318..16f1c96fee 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -3480,7 +3480,7 @@ static void dump_vswing_preemphasis(struct context *context,
 			printf("\t\t%s: ", vswing_preemph[i]);
 
 			for (int j = 0; j < vs->num_columns; j++)
-				printf(" 0x%08x", vs->tables[n * 10 * vs->num_columns + j]);
+				printf(" 0x%08x", vs->tables[n * 10 * vs->num_columns + i * j]);
 			printf("\n");
 		}
 	}
-- 
2.45.2

