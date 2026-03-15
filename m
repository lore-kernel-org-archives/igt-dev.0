Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF4CB10854B6
	for <igt-dev@archiver.kernel.org>; Sun, 15 Mar 2026 00:38:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CB4D10E46E;
	Sun, 15 Mar 2026 00:38:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KmyH4E4p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6AED10E1FC
 for <igt-dev@lists.freedesktop.org>; Sun, 15 Mar 2026 00:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773535113; x=1805071113;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=etNSOqcLQEgcs1NDOcAqL3ip2Im4Er/ywWMDi3qOpoo=;
 b=KmyH4E4pJlGO8EW0ZURX78AGsoZJJ7dNNgetopciOaKG8IWs1qoFYSjl
 B6P4tp5e0LgbGjaKn4lw/Au9/FnOxli7nJvPQugoTByaYU1Ktyg6CPPhg
 es8hz5Ok4fwGoeXetkQOIE004BpIEtvCDi4p8MAOz8P+p55NZ/wd+QmRD
 MyOsJAcP0BDg0849oOTxlPmcgiVqTtkAEOqksiRoS2ZvTDxdLCn9b70Vt
 OlEa8+1Rxxy3aeXbMCyR6L8bW2YXJvIW+dyTBdpBqPmyoLs0Q7bTPp/M/
 wwZ8z0o8CC4/rOG6xB1g3TaPuMOOW+fImBYvRAcuNTQvv3uaIrm+yGfu0 A==;
X-CSE-ConnectionGUID: +75WvT0QTUOBwNk3wUCO7Q==
X-CSE-MsgGUID: IYNnJFkYQd6T52ps+7Y70A==
X-IronPort-AV: E=McAfee;i="6800,10657,11729"; a="74632785"
X-IronPort-AV: E=Sophos;i="6.23,119,1770624000"; d="scan'208";a="74632785"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2026 17:38:33 -0700
X-CSE-ConnectionGUID: 4G0oqsKRRCiZu8BMi17imQ==
X-CSE-MsgGUID: Al4Wlm0gSRKfcuRbQFKoXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,119,1770624000"; d="scan'208";a="225648744"
Received: from administrator-system-product-name.igk.intel.com (HELO
 dev-417.igk.intel.com) ([10.91.214.181])
 by orviesa003.jf.intel.com with ESMTP; 14 Mar 2026 17:38:32 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t 2/2] tests/device_reset: unload audio on xe as well
Date: Sun, 15 Mar 2026 01:38:26 +0100
Message-ID: <20260315003826.3785048-2-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260315003826.3785048-1-michal.grzelak@intel.com>
References: <20260315003826.3785048-1-michal.grzelak@intel.com>
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

There has been observed errors caused by audio not being unloaded before
xe is unbound:

<3> [339.178598] xe 0000:00:02.0: [drm] *ERROR* audio power refcount 1 after unbind

This is due audio is being unloaded only when i915 has been loaded.
Change this behavior to unload audio with any Intel driver.

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 tests/device_reset.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/device_reset.c b/tests/device_reset.c
index b931dff7a0..b281f4eceb 100644
--- a/tests/device_reset.c
+++ b/tests/device_reset.c
@@ -426,7 +426,7 @@ static void set_device_filter(const char* dev_path)
 
 static void unbind_reset_rebind(struct device_fds *dev, enum reset type)
 {
-	if (is_i915_device(dev->fds.dev)) {
+	if (is_intel_device(dev->fds.dev)) {
 		igt_audio_driver_unload(&dev->snd_driver);
 	}
 
-- 
2.45.2

