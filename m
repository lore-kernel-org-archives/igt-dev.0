Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE89C43458
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jul 2026 10:34:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17AFE10F836;
	Fri, 10 Jul 2026 10:34:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jOIOqQCj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D86710E18B
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jul 2026 10:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783679623; x=1815215623;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BLv8vl7hFa2dNwPp2QSip/DWlUpHbhxwJwWjr32CFxQ=;
 b=jOIOqQCjcsY5IieelkPj8abqWYqCdLPx/+OZmYjpw976qb1j9Ut+gTLk
 J6oUjDJrgGH9d7LCWOUiqMmlNhBUtPhfjen5xrgB5cgdtI2JsKISmKDj0
 DmVdtHRa13MSADxJilJ3Cu6vWFsVIXAiHQvsZK7JlZT/bh2uOHHjA4mJH
 vKUChtHCjhZL0r6ZwLXguIIPT1SECAsSR/lLYmfsRyxYveOmQ5uXJmz89
 H7wdHPfp/yomya3e4P1Z7yTUBFy1/p8ByQ/+bRwV2zq4GrKfPoBcmxahr
 8nC1p0wdnG31anopQIPXHx46cGxt7Y/vSNYqe9GKVpCKN0Ej+qYgk9Dv+ g==;
X-CSE-ConnectionGUID: VmcFvGUCR+i+ZTRPP2+v7g==
X-CSE-MsgGUID: Z9Fd7ygNQIqpnYtgI6jZXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="109922910"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="109922910"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2026 03:33:43 -0700
X-CSE-ConnectionGUID: F0histN0RaapPvBfHqcqMA==
X-CSE-MsgGUID: OFnaqDveRb678hnmf7Flqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="278094303"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.172])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2026 03:33:42 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t] tests/msm/msm_perfcntrs: Fix compilation break
Date: Fri, 10 Jul 2026 12:33:37 +0200
Message-ID: <20260710103337.73892-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.54.0
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

I used checkpatch script for fixes and forgot to check compilation
after, it added 'void' to igt_main and it caused fail with:

../tests/msm/msm_perfcntrs.c:64:18: error: macro "igt_main" passed 1 arguments, but takes just 0
   64 | int igt_main(void)

Fix it by removing unneeded 'void'.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/msm/msm_perfcntrs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/msm/msm_perfcntrs.c b/tests/msm/msm_perfcntrs.c
index ea63fbab3..e425ee255 100644
--- a/tests/msm/msm_perfcntrs.c
+++ b/tests/msm/msm_perfcntrs.c
@@ -61,7 +61,7 @@ get_available_counters(struct msm_device *dev, bool global)
 	}
 }
 
-int igt_main(void)
+int igt_main()
 {
 	/* device instance for global counter collection: */
 	struct msm_device *dev_global = NULL;
-- 
2.54.0

