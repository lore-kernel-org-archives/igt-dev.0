Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE655CD128A
	for <igt-dev@archiver.kernel.org>; Wed, 10 Apr 2024 14:43:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1104110EC80;
	Wed, 10 Apr 2024 14:43:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hbe3Ibxt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 038E110EC80
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2024 14:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712760210; x=1744296210;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding:sender;
 bh=LL1Ao6t3ActUkJGvCvwcAM3eJc7V1Q3+BtjoaBIAvCU=;
 b=hbe3IbxtTtKJa5/zKLoODy7ZHmpLFw7h3eA8+X2gcbeNCp72cAUhsgzl
 ukkUz4mZrGOWAJ0JLLRxhZ7C9H98t9zOiB7qz4oYR3a4A+EzP7qW8Xr76
 P9jw/97FUxorHbU8lSkPUWb2s2OowyO0ZZ/cWQ/+aTbYDn7r+fDj+/Fci
 4txbum2qwg0anjRaYXqZAREn8MgI6uTDhiKZxPaX6vXLQRsOBZ1WkdbRN
 ROJc5blV4jIgTRFeP70EcTgXgHHRdd2TqmPPgZyknZ/hD3qKWnBCCgt78
 n3JRpMev9hUrBhAM25eBzEM9zMzTp4rnZMsBmXrxOMPH6DDYx2TZBd+GR Q==;
X-CSE-ConnectionGUID: ztq7S/LZSWiMx72OkfIhjw==
X-CSE-MsgGUID: 26xrJNSWT8O+Mk/qDpuRww==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="18732386"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="18732386"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 07:43:27 -0700
X-CSE-ConnectionGUID: 6imQUc6vT6uc3EEIseJzIg==
X-CSE-MsgGUID: DtJEatZBRqOcRRvI7YNQNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="43828877"
Received: from linux.intel.com ([10.54.29.200])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 07:43:27 -0700
Received: from linux.intel.com (unknown [10.245.244.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id D5FE920B8D40
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2024 07:43:26 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1ruZAa-00000000BfH-3lwX for igt-dev@lists.freedesktop.org;
 Wed, 10 Apr 2024 16:43:24 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 4/4] lib: fix calloc calls with inverted arguments
Date: Wed, 10 Apr 2024 16:42:38 +0200
Message-ID: <20240410144321.44766-5-mauro.chehab@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240410144321.44766-1-mauro.chehab@linux.intel.com>
References: <20240410144321.44766-1-mauro.chehab@linux.intel.com>
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

From: Mauro Carvalho Chehab <mchehab@kernel.org>

The new gcc version 14 now complains when calloc is called
with inverted arguments. use the script from:
a0ee73a8f359 ("benchmarks: fix calloc calls with inverted arguments")

To fix it.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 lib/igt_chamelium.c | 4 ++--
 lib/igt_kms.c       | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
index 881e1892cf87..016d5356630c 100644
--- a/lib/igt_chamelium.c
+++ b/lib/igt_chamelium.c
@@ -153,7 +153,7 @@ struct chamelium_port **chamelium_get_ports(struct chamelium *chamelium,
 {
 	int i;
 	struct chamelium_port **ret =
-		calloc(sizeof(void*), chamelium->port_count);
+		calloc(chamelium->port_count, sizeof(void*));
 
 	*count = chamelium->port_count;
 	for (i = 0; i < chamelium->port_count; i++)
@@ -1516,7 +1516,7 @@ igt_crc_t *chamelium_read_captured_crcs(struct chamelium *chamelium,
 	res = chamelium_rpc(chamelium, NULL, "GetCapturedChecksums", "(in)", 0);
 
 	*frame_count = xmlrpc_array_size(&chamelium->env, res);
-	ret = calloc(sizeof(igt_crc_t), *frame_count);
+	ret = calloc(*frame_count, sizeof(igt_crc_t));
 
 	for (i = 0; i < *frame_count; i++) {
 		xmlrpc_array_read_item(&chamelium->env, res, i, &elem);
diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 2a518eb8d936..60339565a192 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2778,7 +2778,7 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 		     resources->count_crtcs, IGT_MAX_PIPES);
 
 	display->n_pipes = IGT_MAX_PIPES;
-	display->pipes = calloc(sizeof(igt_pipe_t), display->n_pipes);
+	display->pipes = calloc(display->n_pipes, sizeof(igt_pipe_t));
 	igt_assert_f(display->pipes, "Failed to allocate memory for %d pipes\n", display->n_pipes);
 
 	for (i = 0; i < resources->count_crtcs; i++) {
@@ -2806,7 +2806,7 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 	igt_assert(plane_resources);
 
 	display->n_planes = plane_resources->count_planes;
-	display->planes = calloc(sizeof(igt_plane_t), display->n_planes);
+	display->planes = calloc(display->n_planes, sizeof(igt_plane_t));
 	igt_assert_f(display->planes, "Failed to allocate memory for %d planes\n", display->n_planes);
 
 	for (i = 0; i < plane_resources->count_planes; ++i) {
@@ -2855,7 +2855,7 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 		}
 
 		igt_assert_lt(0, n_planes);
-		pipe->planes = calloc(sizeof(igt_plane_t), n_planes);
+		pipe->planes = calloc(n_planes, sizeof(igt_plane_t));
 		igt_assert_f(pipe->planes, "Failed to allocate memory for %d planes\n", n_planes);
 		last_plane = n_planes - 1;
 
-- 
2.44.0

