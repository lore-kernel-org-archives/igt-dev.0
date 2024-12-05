Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA3BBE77175
	for <igt-dev@archiver.kernel.org>; Thu,  5 Dec 2024 09:25:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6148410E39A;
	Thu,  5 Dec 2024 09:25:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B+RCnBGB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 492EF10EDE6
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Dec 2024 09:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733390751; x=1764926751;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i/OH022Ac3TwsfI1Lj+9aRQCzS0PLLLkIOHQxrgPXVU=;
 b=B+RCnBGBU9XNCIVzfHkE9lif2yJkF6PA3KPCetsJX4HmnDNBOCI02Hka
 6pZC6XbKyqOsCkmkffvBjlEdqoDrgjuf5XYsVf84ikdVSBM0W1lCCtohN
 r1b38pI2UdsG9jzxbg1mzQ2YsgoQPuOsQVNyypIdwO/RSJisdjGP7G0DL
 +rWHQ0YKYO3FFCQze16yFgfpO9WLyLCsvk07Aue5r3yPWP2v0IycIJLAY
 sHrDMjUS4anxwm5sazokZR1o8Bg79FWQslBGX+NopPS9nt0rDccgb9K4g
 7qpu4xFeZmQ5WECJYhDbLsl0vtInktUOpqjBS+POIbCIzo2N6Gc5VUaqw A==;
X-CSE-ConnectionGUID: /fP9Ugh8R9O7XovfVWMWPQ==
X-CSE-MsgGUID: Rym+T+s2T8S/vT4juRu45w==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33827977"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; d="scan'208";a="33827977"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 01:25:51 -0800
X-CSE-ConnectionGUID: 1syGJV14SbCXxmfrcEvpJw==
X-CSE-MsgGUID: 5dMxRdANSgu5HZSHzllKcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; d="scan'208";a="99117522"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 01:25:50 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 1/2] tests/chamelium/kms_chamelium_hpd: don't unplug
 multiple times
Date: Thu,  5 Dec 2024 15:10:51 +0530
Message-Id: <20241205094052.1259373-2-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241205094052.1259373-1-kunal1.joshi@intel.com>
References: <20241205094052.1259373-1-kunal1.joshi@intel.com>
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

chamelium_reset_state will unplug all the ports,
prevent unplugging multiple times

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/chamelium/kms_chamelium_hpd.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/tests/chamelium/kms_chamelium_hpd.c b/tests/chamelium/kms_chamelium_hpd.c
index 52e758087..76a691043 100644
--- a/tests/chamelium/kms_chamelium_hpd.c
+++ b/tests/chamelium/kms_chamelium_hpd.c
@@ -329,10 +329,6 @@ static void test_hotplug_for_each_pipe(chamelium_data_t *data,
 			      data->ports, data->port_count);
 
 	igt_hpd_storm_set_threshold(data->drm_fd, 0);
-	/* Disconnect if any port got connected */
-	chamelium_unplug(data->chamelium, port);
-	chamelium_wait_for_connector_after_hotplug(data, mon, port,
-						   DRM_MODE_DISCONNECTED);
 
 	for_each_pipe(&data->display, pipe) {
 		igt_modeset_disable_all_outputs(&data->display);
-- 
2.25.1

