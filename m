Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 406C2C54E58
	for <igt-dev@archiver.kernel.org>; Mon, 11 Mar 2024 16:41:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3645112B81;
	Mon, 11 Mar 2024 16:40:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e9FVSwpB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13EDA112B82
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Mar 2024 16:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710175258; x=1741711258;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZG6aUZL66QB4IGvamfkNVxdbhImI3HwqyN4XmOXxMdo=;
 b=e9FVSwpBzNvl8ORAbEOHXxO5ERjf14plvQM79VoxtJXkC6eAKjdDciWd
 K8P2gA7SqKw+w4mavGJUJromeBwUJYTz6mgVgFtoghEerGbMTQmxXFDzw
 aA/yJyDbDeZPrAnDjXVoAjLkSAni1Sd2oCkmG7csUybgFVGuzwviMxkW2
 zKQqe45da2et8zwgKkShZe8QrhaCjFK5Pt/JMQ2zL18IWzbX33v0740qN
 tKVH/fhrMd/mhkzC6Y0YMYBawgTmT/gKDUm3KvozQgF7LgdPaUfrxMQCl
 pGjXUAxiDCnp4Q4ipACi4r+skBKOE/S9+vBlfe8IVuY9E2Py98Z6tZmpp g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="4702569"
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="4702569"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 09:40:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; d="scan'208";a="15920893"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 09:40:56 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: janusz.krzysztofik@linux.intel.com, kamil.konieczny@linux.intel.com,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH i-g-t] tests/device_reset: Skip if no drm devices are preset
Date: Mon, 11 Mar 2024 17:27:13 +0100
Message-ID: <20240311162713.19137-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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

Skip the test if no drm devices are preset.

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/10087
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 tests/device_reset.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/device_reset.c b/tests/device_reset.c
index 817cbc285..e6920cdea 100644
--- a/tests/device_reset.c
+++ b/tests/device_reset.c
@@ -198,7 +198,7 @@ static void init_device_fds(struct device_fds *dev)
 	 * a device file descriptor open for exit handler use.
 	 */
 	dev->fds.dev = __drm_open_driver(DRIVER_ANY);
-	igt_assert_fd(dev->fds.dev);
+	igt_require(drm_fd != -1);
 	if (is_i915_device(dev->fds.dev))
 		igt_require_gem(dev->fds.dev);
 
-- 
2.42.0

