Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F265DC3601A
	for <igt-dev@archiver.kernel.org>; Thu,  3 Apr 2025 12:57:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A080210E238;
	Thu,  3 Apr 2025 12:57:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y5SZoxaW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72AC210E23C
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Apr 2025 12:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743685040; x=1775221040;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+s+WUqJ5bSqT7VM+D75HgKAnRNDL0a4WPeuRmGcSH+4=;
 b=Y5SZoxaWIKJ+OowgefKI5tFPabZ/hp5A6as3MHpLaUDbUAQH2AzkhEO4
 KV2r7RwnwsYsB70t2bAOJyz89gZtO5nXTvcqcO4VQdFMqxoUjF1PwszDb
 gwwAFWP3Z9/XvitQ08sLKUuSwp+kMtu5vFtRPJq45BnrDZOYLqaMsgsvi
 Cwr3KJ1Q2n/xEWmYPCAlm5Nn9CMLUWnIgVIJ9NCjuwSqQ+lAbMQIuwZSL
 duMhTO8No6k2OD4drGHCXfcGPii/rPzBJs8YgJTgBp6jhAHqFRoTjB1kS
 SOL3bVZX5G0uR6zMJgoc+vd+U82e9vNBLhHYDWENRTSXhqDmjloDk8qaN g==;
X-CSE-ConnectionGUID: K+UnwrB1QBqf/4tfxOi6kg==
X-CSE-MsgGUID: DtoMO6QXRP61mdEF6MCChQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="70459048"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="70459048"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 05:57:18 -0700
X-CSE-ConnectionGUID: vIX3SRakQ6m4KCALDClR5Q==
X-CSE-MsgGUID: VKgM1DGlTiOyhFFgpN8ZXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="164231772"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.246.152])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 05:57:17 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Christoph Manszewski <christoph.manszewski@intel.com>,
 Jan Sokolowski <jan.sokolowski@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH i-g-t 1/1] tests/xe_eudebug_online: Calculate bb_size from
 shader
Date: Thu,  3 Apr 2025 14:55:25 +0200
Message-Id: <20250403125525.31573-2-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250403125525.31573-1-dominik.karol.piatkowski@intel.com>
References: <20250403125525.31573-1-dominik.karol.piatkowski@intel.com>
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

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 tests/intel/xe_eudebug_online.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index 84ba748c1..629a0ec16 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -1020,12 +1020,11 @@ static struct intel_bb *xe_bb_create_on_offset(int fd, uint32_t exec_queue, uint
 	return ibb;
 }
 
-static size_t get_bb_size(int flags)
+static size_t get_bb_size(struct gpgpu_shader *shader)
 {
-	if ((flags & SHADER_CACHING_SRAM) || (flags & SHADER_CACHING_VRAM))
-		return 32768;
+	size_t shader_size = shader->size * sizeof(uint32_t);
 
-	return 4096;
+	return (shader_size / PAGE_SIZE + !!(shader_size % PAGE_SIZE) + 1) * PAGE_SIZE;
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
+	bb_size = get_bb_size(shader);
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

