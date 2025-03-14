Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB093C35FF6
	for <igt-dev@archiver.kernel.org>; Fri, 14 Mar 2025 22:45:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 759F710E36E;
	Fri, 14 Mar 2025 22:45:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G36l9K3E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 026B610E0A5
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Mar 2025 22:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741992351; x=1773528351;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=63YxAQXoz0V5oi7rsQpkW4jTioXrNWJFu7YkJz1RkBQ=;
 b=G36l9K3EG7eSSAiSz/ezpnxV0tkGQoe3jubHxBZFgOMmFlOjrT2ozNsD
 nfQXSJ23BQFC82bkrYdZdPbJFp+qUPDCdyFYIknX9rd9D9Z4U/PAxJ68d
 RRZ8hK0F5gutvwS1p+lb/ZWk+Y6eY2BG6HTJPBeNG//eiT11j/8g6ZKWE
 OhmyhQYdZFIWapnXWCxJ+IfEEbcjBAFihCAbCp0QiGbrnOG7L8qHUk4En
 mLWGUzGYIaBbUWrKlSRir+k2lTaCCNzl5eKc3IoqwE0cfU0DHWDFZUI8I
 woKtcCCFo/TowZwu9Ld6IV8AxJ/Lm1UOL+fBVVPbEOwpwCqjq3UXAbSVi Q==;
X-CSE-ConnectionGUID: 7qPbjh6iQmiishu1AOtBsg==
X-CSE-MsgGUID: wLSM9E7TQGachEOgYWfzFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="68524123"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="68524123"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 15:45:50 -0700
X-CSE-ConnectionGUID: huM1As83Q2mdrqJF9jodJQ==
X-CSE-MsgGUID: ybLKK1QjQ/WZ3fIx4EGVMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="121907754"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 15:45:50 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel/xe_oa: Don't limit sync tests to render
 engine
Date: Fri, 14 Mar 2025 15:45:45 -0700
Message-ID: <20250314224545.239134-3-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250314224545.239134-1-ashutosh.dixit@intel.com>
References: <20250314224545.239134-1-ashutosh.dixit@intel.com>
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

OA sync tests need not be limited to render engine only. Extend them to use
any engine using __for_one_hwe_in_oag macro instead.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
---
 tests/intel/xe_oa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 03b0acf5db..d15462c182 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -4893,7 +4893,7 @@ igt_main
 
 		for (const struct sync_section *s = sync_sections; s->name; s++) {
 			igt_subtest_with_dynamic_f("syncs-%s", s->name) {
-				__for_one_render_engine(hwe)
+				__for_one_hwe_in_oag(hwe)
 					test_syncs(hwe, s->sync_type, s->flags);
 			}
 		}
-- 
2.48.1

