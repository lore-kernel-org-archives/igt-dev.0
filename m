Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6046C5B542
	for <igt-dev@archiver.kernel.org>; Mon, 26 May 2025 08:06:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37BCF10E293;
	Mon, 26 May 2025 08:06:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GfU7UAeS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2061F10E293
 for <igt-dev@lists.freedesktop.org>; Mon, 26 May 2025 08:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748246810; x=1779782810;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nKQ5ovgS7RbGAju2oNymGFYDANKm/ifECWoHJTRKQI4=;
 b=GfU7UAeSSM49M0Z90dvDB/mqtVYWphYSWbBDxOExhprmjwLS+TrNpJcR
 u9BSnqsdz8Lrc+/dIvG3zH1j2EvbKZI4wQQybWWyQX9UzUWFg8WqFr1Fo
 dgg8q/v5hZfxWG3PhHKKiN2ft7MrnVepyWo4wGJYFu8mNT5UbsMW5wu9z
 I5WXDYqeZ/G1DybAnuD/eHcep1ykfvijSLi5bm579Y+dIAjWW7DU5pteD
 5zxfH7yFcNF2qarqjUqiuQu+tNHlFYD7od9Kb60ACOj3gJajz5P6A5wo9
 F7laLt+BkygQBhhpDM8b5a36Gu8dIoJ/inAj6mwCnFERUlVmJPES+WKxw w==;
X-CSE-ConnectionGUID: yDJwhopKQj6lmSmIGuITtA==
X-CSE-MsgGUID: N28ccuvQStWZhDqWiwNVnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11444"; a="67762837"
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="67762837"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 01:06:50 -0700
X-CSE-ConnectionGUID: PAWQJZBEQ96VG7DsUc1BSQ==
X-CSE-MsgGUID: z9b3WAUFRAKASJSSkHWHXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="142208362"
Received: from artdev273.igk.intel.com ([172.28.176.71])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 01:06:49 -0700
From: Jan Sokolowski <jan.sokolowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jan Sokolowski <jan.sokolowski@intel.com>,
	Lyude Paul <lyude@redhat.com>
Subject: [PATCH i-g-t v3 3/8] lib/igt_nouveau: fixup print/scan formatting for
 files in lib
Date: Mon, 26 May 2025 08:07:35 +0000
Message-Id: <20250526080740.67790-4-jan.sokolowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250526080740.67790-1-jan.sokolowski@intel.com>
References: <20250526080740.67790-1-jan.sokolowski@intel.com>
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

Compiling on other architectures than x86-64 causes a lot
of print/scan formatting warnings.

Fix formatting by using proper formatters, eg. PRIx64.

Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
Cc: Lyude Paul <lyude@redhat.com>
---
 lib/igt_nouveau.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_nouveau.c b/lib/igt_nouveau.c
index fdf6020a3..62a53c8b1 100644
--- a/lib/igt_nouveau.c
+++ b/lib/igt_nouveau.c
@@ -96,7 +96,7 @@ uint64_t igt_nouveau_get_block_height(uint64_t modifier)
 		gob_height = 4;
 		break;
 	default:
-		igt_fail_on_f(true, "Unknown GOB height/page kind generation 3 in modifier %lx\n",
+		igt_fail_on_f(true, "Unknown GOB height/page kind generation 3 in modifier %" PRIx64 "\n",
 			      modifier);
 		break;
 	}
-- 
2.34.1

