Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 963A1C3ABC3
	for <igt-dev@archiver.kernel.org>; Tue, 13 May 2025 12:18:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 530F910E596;
	Tue, 13 May 2025 12:18:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U2kRbed7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8C1010E596
 for <igt-dev@lists.freedesktop.org>; Tue, 13 May 2025 12:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747138738; x=1778674738;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/faAk7H2xJ8Int/FDzXLgO5yuVeRlxuMBffpkySrEak=;
 b=U2kRbed7z74v42caY8bwPe+92eRBVK4kx1Rl6uGeeGft/gi8Kq3LOUiy
 +S2/mFfPReKtLnsuIZ+VtLLFjzhzINizNEnlgZq/iqRN4patl48T9GxWK
 aWSYMeRaZ50ju2zj4RXDr2P9kT0P1POLlb+PfF9KX9sCwzIPKRuoWnknX
 UQqR1U4KUpt5PLAXEAG2OX1Dp5a8mFoVcBlPJ0yxBjsJv/rJjNbWH3Qqe
 s8Rn0Sn1Euz27NjSOjQu7HbDXQjimYympvvB65aZa9yVRw4U+WwSJ0YtA
 fPFD96b30aQqjdkcJEIbjdPM/VR3Oz4GtyMn//Elq9jPIQOTr4uchHabl A==;
X-CSE-ConnectionGUID: J18ofLfRQEuT/MGJn9J+5Q==
X-CSE-MsgGUID: LC+X7TTTTB6IP+7n8WsqpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="48911094"
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; d="scan'208";a="48911094"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 05:18:57 -0700
X-CSE-ConnectionGUID: m1v13kQgRPqDAUTs91AmAg==
X-CSE-MsgGUID: FZquKHLdR0+adktc+6eI4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; d="scan'208";a="138669490"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by fmviesa009.fm.intel.com with ESMTP; 13 May 2025 05:18:57 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v1 1/2] lib/igt_psr: Skip the test when PSR is disabled
Date: Tue, 13 May 2025 14:19:17 +0200
Message-ID: <20250513121918.2758842-2-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250513121918.2758842-1-michal.grzelak@intel.com>
References: <20250513121918.2758842-1-michal.grzelak@intel.com>
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

If PSR setup timing is not met, then PSR will stay disabled and test
will fail anyway. Skip the test upon finding that setup timing was not
met.

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 lib/igt_psr.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/lib/igt_psr.c b/lib/igt_psr.c
index 3d8f1949b..f35051ebc 100644
--- a/lib/igt_psr.c
+++ b/lib/igt_psr.c
@@ -38,7 +38,7 @@ bool psr_disabled_check(int debugfs_fd)
 	igt_debugfs_simple_read(debugfs_fd, "i915_edp_psr_status", buf,
 				sizeof(buf));
 
-	return strstr(buf, "PSR mode: disabled\n");
+	return strstr(buf, "PSR disabled:");
 }
 
 bool selective_fetch_check(int debugfs_fd, igt_output_t *output)
@@ -122,6 +122,8 @@ static bool psr_active_check(int debugfs_fd, enum psr_mode mode, igt_output_t *o
 
 	igt_skip_on(strstr(buf, "PSR sink not reliable: yes"));
 
+	igt_skip_on(strstr(buf, "PSR setup timing not met"));
+
 	active = strstr(buf, state) ||
 		 (c && (c->connector_type == DRM_MODE_CONNECTOR_DisplayPort) &&
 		  strstr(buf, "SU_STANDBY"));
-- 
2.45.2

