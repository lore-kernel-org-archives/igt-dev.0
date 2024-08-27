Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C08DC5320E
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 05:52:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2455D10E05F;
	Tue, 27 Aug 2024 05:52:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MjOOroZG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2140610E235
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 05:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724737921; x=1756273921;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XeY3o62CJhGZCbDe3l9AI5VZ+xU7aeqavcK+P7IHW0g=;
 b=MjOOroZG4jKrUX9bjHYsADVY3oJcEp4WUgbpROFqhMjFtwgcXprMbJjU
 NbJGNNDYXk7A53RLK0XY+cjW0GDRZ3tWPbE3ztAoWK1OUDeA3EFiL/9X6
 yieCLcRWGDwKA1uMRkwYtZbBcRxDvhNvq/1h4zV1gZ/NIUCVhjUti33hj
 +KHV6mA8oCW58lqImlyUxHGdBVUZbZUgIozAsuWBvMKRtOvbdq1YWu+dQ
 Dzz8xYLizYbcHK3A10d6oqXoeTE895d9+HOoTemwv7VrEUCs4o+aVt60D
 f4PdARdrClwfLPO7tvOzgUwrgberp76Xqse4cGbIfLjHR5fCYvKxsZe7Q g==;
X-CSE-ConnectionGUID: TZMwPQMGT9iVYnM4hCryGw==
X-CSE-MsgGUID: CeJenpsaS4eex/6vdJb3Mg==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="23355593"
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; d="scan'208";a="23355593"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 22:52:01 -0700
X-CSE-ConnectionGUID: Bb17HA8zTU6A+rpxpPoBUQ==
X-CSE-MsgGUID: AmiRYBwHTraJVSPK+Wv0iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; d="scan'208";a="62800397"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 22:52:01 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v2 05/10] tests/intel/xe_drm_fdinfo: Be strict on == 0
 comparison
Date: Mon, 26 Aug 2024 22:51:24 -0700
Message-ID: <20240827055129.1671873-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240827055129.1671873-1-lucas.demarchi@intel.com>
References: <20240827055129.1671873-1-lucas.demarchi@intel.com>
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

Do not compare the percent to 0, just make sure there's not a single
tick in those cycles.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel/xe_drm_fdinfo.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index 1b5980752..ad563aa20 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -489,7 +489,8 @@ check_results(struct pceu_cycles *s1, struct pceu_cycles *s2,
 		igt_assert_lt_double(95.0, percent);
 		igt_assert_lt_double(percent, 105.0);
 	} else {
-		igt_assert(!percent);
+		igt_assert(!s2[class].cycles);
+		igt_assert(!s1[class].cycles);
 	}
 }
 
-- 
2.43.0

