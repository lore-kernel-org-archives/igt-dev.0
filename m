Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0BAEC369B8
	for <igt-dev@archiver.kernel.org>; Mon, 14 Apr 2025 10:17:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64DB710E554;
	Mon, 14 Apr 2025 10:17:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c4KY1wkJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5128410E53D
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Apr 2025 10:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744625858; x=1776161858;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2lk/aW//LFlq54/ttcWzQuR5MQCuId3q5+T9PC5nMKc=;
 b=c4KY1wkJ7C16/ec1nqT7WgjAVaTCm/3onNEBeBs1J76fGpP2ike6796p
 Vk95+QXCAD1BzFXTnTH9TeqPr+nRgt0J+t2vcbiHhX+9xDBQEjQP4I3/H
 V/Pl7c6mQ1gSyxHCyXcVJym2F8LYdtRk7VqeNWjqnx8R7KokVdxGcAeZv
 sWFvaStPvsDVQNJh/csiCgmgkpPdKdE8NkF3mXFF1liWsBdATblgmKBAk
 u380HDIFW2/Z41+WypL8NSRyigjqrj7TH19WxStbwtBbwzPj9GSw6hmsA
 tIV/JBk9zktlZ6vfP8l0f0uKtvgzoIHZ5/a38e1zuVgydjrG3ngT7MnB1 w==;
X-CSE-ConnectionGUID: rSrTHLXQSwi2YOz4Np7h/A==
X-CSE-MsgGUID: poJEJoljTICOBMQDZvGxpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="45999980"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="45999980"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 03:17:37 -0700
X-CSE-ConnectionGUID: cFGHqH1jR/2H6ASFE8rIJQ==
X-CSE-MsgGUID: y0eQnPhvRtecZgzZEUtF4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="134534130"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.246.186])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 03:17:35 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Jan Sokolowski <jan.sokolowski@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v2 i-g-t 1/1] tests/xe_eudebug_online: Calculate bb_size from
 shader
Date: Mon, 14 Apr 2025 12:17:14 +0200
Message-Id: <20250414101714.18581-2-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250414101714.18581-1-dominik.karol.piatkowski@intel.com>
References: <20250414101714.18581-1-dominik.karol.piatkowski@intel.com>
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

Right now, bb_size is retrieved from get_bb_size, which returns one of
two hardcoded values. This approach will fail, if shader turns out to be
big enough to not fit into bb. Fix it by always calculating bb_size from
shader.

v2: Improve bb size calculation (Zbigniew)

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 tests/intel/xe_eudebug_online.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index 582a26dca..af90b9b70 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -1020,12 +1020,11 @@ static struct intel_bb *xe_bb_create_on_offset(int fd, uint32_t exec_queue, uint
 	return ibb;
 }
 
-static size_t get_bb_size(int flags)
+static size_t get_bb_size(int fd, struct gpgpu_shader *shader)
 {
-	if ((flags & SHADER_CACHING_SRAM) || (flags & SHADER_CACHING_VRAM))
-		return 32768;
+	size_t shader_size = shader->size * sizeof(uint32_t);
 
-	return 4096;
+	return ALIGN(shader_size, PAGE_SIZE) + xe_cs_prefetch_size(fd);
 }
 
 static uint64_t get_memory_region(int fd, int flags, int region_bitmask)
@@ -1044,7 +1043,7 @@ static void run_online_client(struct xe_eudebug_client *c)
 	int threads = get_number_of_threads(c->flags);
 	const uint64_t target_offset = 0x1a000000;
 	const uint64_t bb_offset = 0x1b000000;
-	const size_t bb_size = get_bb_size(c->flags);
+	size_t bb_size;
 	struct online_debug_data *data = c->ptr;
 	struct drm_xe_engine_class_instance hwe = data->hwe;
 	struct drm_xe_ext_set_property ext = {
@@ -1076,6 +1075,9 @@ static void run_online_client(struct xe_eudebug_client *c)
 
 	fd = xe_eudebug_client_open_driver(c);
 
+	shader = get_shader(fd, c->flags);
+	bb_size = get_bb_size(fd, shader);
+
 	/* Additional memory for steering control */
 	if (c->flags & SHADER_LOOP || c->flags & SHADER_SINGLE_STEP || c->flags & SHADER_PAGEFAULT)
 		s_dim.y++;
@@ -1109,7 +1111,6 @@ static void run_online_client(struct xe_eudebug_client *c)
 	intel_bb_set_lr_mode(ibb, true);
 
 	sip = get_sip(fd, c->flags);
-	shader = get_shader(fd, c->flags);
 
 	igt_nsec_elapsed(&ts);
 	gpgpu_shader_exec(ibb, buf, w_dim.x, w_dim.y, shader, sip, 0, 0);
-- 
2.34.1

