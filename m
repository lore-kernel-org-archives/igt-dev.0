Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A648EC8303F
	for <igt-dev@archiver.kernel.org>; Thu, 28 Aug 2025 10:41:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21ABD10E1CF;
	Thu, 28 Aug 2025 10:41:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UevNphsg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D8F010E1BE
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Aug 2025 10:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756377688; x=1787913688;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Bp5eevV3/yDwlmOlAUb5adoqPOvTdDePkQn7u1sUw2k=;
 b=UevNphsg4lCdGFoquF5GmzZu0ppTGNVOhqnhRG24T0j4TOErWA/Tv42p
 tbNQt2PS6zacdS6+nID23NfNxXyQTbtYE4PQaQYa4lnKXf/DGf4emiiJP
 kNo1rnZdmsaEBBTnqVHRpA998iZLrpxmksDp9IqLPGsKxYUNartDfJgbj
 vJWvdEQqKvBKaVNAxlanR84jrmf2PUU5+I7o1kBXtAUjE/0YKFHr90QpJ
 XtqCv5k8ziWMkLNTryj9oPsJ7rRr/dFOMSMzuyO7KHpmEXous3l2Dz6Gt
 DkfDSO+6ZvybfxS8szqizJOsesnsA14HTWuGmtfmcU0WHs8IHamxtste7 g==;
X-CSE-ConnectionGUID: kS1PykuWQ6Scjl/K4wieyw==
X-CSE-MsgGUID: wNFeMueiTRaXJdUyJdxh7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="58743298"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="58743298"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 03:41:28 -0700
X-CSE-ConnectionGUID: 76B8QNHeSOebBhRc9YmkBA==
X-CSE-MsgGUID: SSgvvIElSci1xz8gK1elDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="201044145"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by orviesa002.jf.intel.com with ESMTP; 28 Aug 2025 03:41:27 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jouni.hogander@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v2 1/1] lib/igt_psr: Skip the test when PSR is disabled
Date: Thu, 28 Aug 2025 12:43:11 +0200
Message-ID: <20250828104311.1279788-2-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250828104311.1279788-1-michal.grzelak@intel.com>
References: <20250828104311.1279788-1-michal.grzelak@intel.com>
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
 lib/igt_psr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/igt_psr.c b/lib/igt_psr.c
index 3d8f1949b..d5b4198c3 100644
--- a/lib/igt_psr.c
+++ b/lib/igt_psr.c
@@ -122,6 +122,8 @@ static bool psr_active_check(int debugfs_fd, enum psr_mode mode, igt_output_t *o
 
 	igt_skip_on(strstr(buf, "PSR sink not reliable: yes"));
 
+	igt_skip_on(strstr(buf, "PSR setup timing not met"));
+
 	active = strstr(buf, state) ||
 		 (c && (c->connector_type == DRM_MODE_CONNECTOR_DisplayPort) &&
 		  strstr(buf, "SU_STANDBY"));
-- 
2.45.2

