Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA03AC43458
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jun 2026 09:09:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A91310E7A2;
	Mon, 29 Jun 2026 09:09:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a+/0o+JT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2943B10E79F
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jun 2026 09:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782724066; x=1814260066;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LWP3S6v/dMeAalWHfo4Dq575r1a2pYIG1qDM99ABQ6U=;
 b=a+/0o+JTTNByXnnBybJeiaSXPNtMLq45mGKiQSi/Fdjod6reeHLhkuIh
 7zn0GM/sJxsfndC0blZsQ4CYatVVMP9gnCBO82qABsfn3Ez2q+F8DfS/+
 mnGDyzL8A8pQeCevPf13stkxk8jtM0uVdhR6j/oNmal/naWHuW1dIrNYK
 qSdG/Lu1iwVb3g0G7/OLGgU8tiLE/5xINEKBP4EgPAFEAl/3xYeo3RQkF
 eyojvEnwHvjzD+4Zf7GVifyL68goboqlshGrnebeH51L1llkotusu8AzX
 3EB14BFEb6bgMBBEXKPoA9nifrpJ6vRwPQQDPtxItnsUhZUg3+5eO2bQI Q==;
X-CSE-ConnectionGUID: ZE9+4ASNTYCtwhd+c519Aw==
X-CSE-MsgGUID: OGIOLIK+QrCsyWQRrJoPeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="94893473"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; d="scan'208";a="94893473"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 02:07:45 -0700
X-CSE-ConnectionGUID: ZWLBSgwrSXuHZDs8zjBrGQ==
X-CSE-MsgGUID: ZlZwAYsMTn+rMez2LGSDFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; d="scan'208";a="247449755"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa006.fm.intel.com with ESMTP; 29 Jun 2026 02:07:44 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: juhapekka.heikkila@gmail.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v1 1/3] tests/sharpness_filter: fix typo
Date: Mon, 29 Jun 2026 11:07:38 +0200
Message-ID: <20260629090740.2706320-2-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260629090740.2706320-1-michal.grzelak@intel.com>
References: <20260629090740.2706320-1-michal.grzelak@intel.com>
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

Refer correctly to the connector while logging.

Cc: Juha-Pekka Heikkilä <juhapekka.heikkila@gmail.com>
Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 tests/intel/kms_sharpness_filter.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpness_filter.c
index 353a9a292a..1575cde6f7 100644
--- a/tests/intel/kms_sharpness_filter.c
+++ b/tests/intel/kms_sharpness_filter.c
@@ -448,7 +448,7 @@ static void test_sharpness_filter(data_t *data, enum test_type type)
 	igt_plane_set_fb(data->plane[0], &data->fb[0]);
 
 	if (type == TEST_INVALID_FILTER_WITH_SCALING_MODE)
-		igt_require_f(has_scaling_mode(output), "No connecter scaling mode found on %s\n", output->name);
+		igt_require_f(has_scaling_mode(output), "No connector scaling mode found on %s\n", output->name);
 
 	if (type == TEST_INVALID_FILTER_WITH_NEAREST_NEIGHBOR)
 		igt_require_f(igt_crtc_has_prop(data->crtc, IGT_CRTC_SCALING_FILTER),
-- 
2.45.2

