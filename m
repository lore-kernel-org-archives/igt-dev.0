Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C014FED3DF
	for <igt-dev@archiver.kernel.org>; Fri, 24 Apr 2026 15:14:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D65C810F5EE;
	Fri, 24 Apr 2026 15:14:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PdWiA6cw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 774F210F5FE
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Apr 2026 15:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777043652; x=1808579652;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BWfZkTDP7kXdmCYF9AzfnOJVHdZiWnUDzDfv9Thcmxg=;
 b=PdWiA6cwEGeUcdWZSHB7IJfqNFok6xlyE8L8z1UPiKxUjYRqWkhLvf/h
 nzvK424oB2/f5Tgb7Lqh17NcpzJ1IxX22WuFfXoHLDIu3BadfsML3W3ip
 RDC1a4dn4hBAkzW/T3X0D9fQJAXNO3RVEuP7VvaX9DzQT0xoeHQX6WFUw
 Cz93mClvg3uw/eR/91dLxLmim6WwtgbThKoN+I9AK8MeObuS/rpIp7qqF
 FZeB70JxwepVKqVYOxUY1gji4Ccsy6q4Lh6A6pnjg6T/zDFlHxFthtvsu
 cumE7yHMwXecyisf8oNPRY1MOosVAyZdpGMfDhOPmEEY1k1Nhmgkkc7xb Q==;
X-CSE-ConnectionGUID: LH4f2UUFTI6cKs8RvVkDew==
X-CSE-MsgGUID: tuTMx3gtRsWl3s1rPVMSzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11766"; a="77728791"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; d="scan'208";a="77728791"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 08:14:12 -0700
X-CSE-ConnectionGUID: 2e4rpisUQSCMEyTIPNy9FQ==
X-CSE-MsgGUID: gRS9RGALS/adSEqbJnBcKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; d="scan'208";a="233271570"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.100])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 08:14:10 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jing-Ping Jan <jingpingjan@google.com>
Subject: [PATCH i-g-t 2/3] lib/igt_kms: Fix assert in
 igt_display_reset_outputs()
Date: Fri, 24 Apr 2026 17:13:54 +0200
Message-ID: <20260424151355.129423-3-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260424151355.129423-1-kamil.konieczny@linux.intel.com>
References: <20260424151355.129423-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

There is an error manifesting by assert, when primary plane was
not a first one:

sudo ./kms_getfb
INFO: IGT-Version: IGT_VERSION-GIT (arm64) (Linux:
	6.6.118-android15-8-g34da635f9b82-ab14801981-4k aarch64)
...
CRITICAL: Test assertion failure function igt_display_reset_outputs,
	file external/igt-gpu-tools/lib/igt_kms.c:2985:
CRITICAL: Failed assertion: old_primary->index != 0
CRITICAL: error: 0 == 0

It turns out that after swapping data and index, it should also
swap pointers itself so asserts will be correct checks.

Cc: Jani Nikula <jani.nikula@intel.com>
Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Reported-by: Jing-Ping Jan <jingpingjan@google.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_kms.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 2d758b63c..33092fc85 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2980,6 +2980,7 @@ void igt_display_reset_outputs(igt_display_t *display)
 
 				igt_swap(*old_primary, *new_primary);
 				igt_swap(old_primary->index, new_primary->index);
+				igt_swap(old_primary, new_primary);
 
 				igt_assert_neq(old_primary->index, 0);
 				igt_assert_eq(new_primary->index, 0);
-- 
2.54.0

