Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56CB7E7717F
	for <igt-dev@archiver.kernel.org>; Mon, 16 Dec 2024 08:20:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BE5810E09F;
	Mon, 16 Dec 2024 08:20:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kaqQ/U2d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B951B10E09F
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Dec 2024 08:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734337253; x=1765873253;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IC9f0+YCtuvwY0bzjCthfqzICKRsu+kMFcU7my+4P7w=;
 b=kaqQ/U2dqVsscnhpJIzbBwQCJWhGlRIPaJx5OflbAGHMYskVzlmzwCt8
 nTBN6zIbMvcNqmZp9gIn/pmIf9oxFuyxwXspce9pmREWiCDWktnh+tPHn
 lmA2bFZ+l2mTGLReePvoGwUO1VkqCde7qF9zUMeHD63CF5sTbky8xwAZo
 fcBMf8Xxj0HuJZTtiyZMgTgUIaV0tFbQBLeQqQe3oE5qF7SfcSr/9mIN8
 m4kd3BdcmjoGKvSEmmltfMkwO+y5+CPXLh+RqD6NEXAasy13+CiTxyRBS
 vJzuWbkpoHLYPYUSqfe1jklNEsd2bOxNHAuGsGU0eFsNkc+Aq648RqW6S Q==;
X-CSE-ConnectionGUID: rceWvv1BQp6I2uFCAB2Dag==
X-CSE-MsgGUID: dvQxF46BReaMo/o/sGzFgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11287"; a="34034643"
X-IronPort-AV: E=Sophos;i="6.12,238,1728975600"; d="scan'208";a="34034643"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 00:20:52 -0800
X-CSE-ConnectionGUID: 6qQni2jYQ36vqrDYutce0Q==
X-CSE-MsgGUID: lZpoX69sT++QxLEwsjVZ9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="101278637"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 00:20:51 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com,
	Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t] tests/chamelium/kms_chamelium_hpd: don't unplug
 multiple times
Date: Mon, 16 Dec 2024 14:05:56 +0530
Message-Id: <20241216083556.1996857-1-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
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

Fixes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3505
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Reviewed-by: Jeevan B <jeevan.b@intel.com>
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

