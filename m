Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C4C1CD129B
	for <igt-dev@archiver.kernel.org>; Fri,  5 Apr 2024 06:01:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAC1E11393E;
	Fri,  5 Apr 2024 06:01:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H36GrdqW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38ECB113939
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Apr 2024 06:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712296871; x=1743832871;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QZVPsvD6ZMxDN34eoBbkdk6yaiNWPGGIXgkatXdSuFw=;
 b=H36GrdqWD8TxqcXkbA3wOOSBnIrSXHeSAiU5Mq1Pmu0soXBq92Z2ETb6
 2PHRcVKWECepkxb8z0q4fMT+ZL85+deJZYednUNrYl3j5zxgGqxhPL+1w
 SHp3uy51rk9blRIsp1+NxqxY77untVsDKUBKq6HqHcFhO2mlzumGZD88V
 QNtdH8AHhf97JuRnF7oAolz48GyjNaid9WZBjzRf9aMZ8TmfwLwVBMSHj
 Ys5boXHY6t0i5EeYzDeua+yw+n5Ooh52ID3WlRaHPfSlM4pZZ84Wt5zLK
 Cg4U6a+rO7YQGP9obLODn8XrZBoSq45FEWbEgcWzoaADatN3HdNCtgSvq g==;
X-CSE-ConnectionGUID: aM/mMiObTtiFdd5fjbh4Nw==
X-CSE-MsgGUID: gZjjQzMBR2+Q0kaqixZTmw==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="25121740"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="25121740"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 23:01:10 -0700
X-CSE-ConnectionGUID: smHCexUdQxieYLQBMgtkaA==
X-CSE-MsgGUID: wAmRdbYJQgC039wGLUoCIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="19615810"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2.intel.com)
 ([10.212.102.22])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 23:01:10 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 04/12] lib/igt_drm_fdinfo: Assert pdev is not truncated
Date: Fri,  5 Apr 2024 01:00:48 -0500
Message-ID: <20240405060056.59379-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240405060056.59379-1-lucas.demarchi@intel.com>
References: <20240405060056.59379-1-lucas.demarchi@intel.com>
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

Since strncpy() may truncate the output, just assert we have enough
room for the string. It's not a big problem since we always copy 1 byte
less than the capacity and info->pdev is zero-allocated. But we may as
well be sure we aren't truncating it.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_drm_fdinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
index 9b1776775..de1962efa 100644
--- a/lib/igt_drm_fdinfo.c
+++ b/lib/igt_drm_fdinfo.c
@@ -237,6 +237,7 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
 		} else if (strstartswith(l, "drm-pdev:", &keylen)) {
 			v = l + keylen;
 			v = ignore_space(v);
+			assert(strlen(v) < sizeof(info->pdev));
 			strncpy(info->pdev, v, sizeof(info->pdev) - 1);
 		} else if (strstartswith(l, "drm-engine-capacity-", &keylen)) {
 			idx = parse_engine(l + keylen, info,
-- 
2.44.0

