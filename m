Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43A4FCA0ED3
	for <igt-dev@archiver.kernel.org>; Mon,  2 Sep 2024 14:38:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06D6810E32D;
	Mon,  2 Sep 2024 14:38:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jmYBcDAL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AAFB10E32D
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Sep 2024 14:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725287898; x=1756823898;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=21VGOs/44ua7CRAdtQIIgXhdDIPiSkEWhyBCSuufnyc=;
 b=jmYBcDALuo48z0FYx2csZkyGS7hHNtn242Ur5HLBeee1G7vt1UeMKV9B
 7HascJep4+39TJpfVJkYJThe4TipzDI3twhfq5XzmWz4L3pRIfXfmAZc4
 yMbh2hF8v0MAfA+oh3ypYupkNqz0/Y/zPyi3VDmJyZVUHRj/gZoYJ6qou
 /9sx2/fcWzJzbu1t6l0pehPZqG9doMMP9qL6e9vQp+uCw5gkTovir4vCe
 8+ysSXDsAA/tq81KUzbJqqlvJXk/ZoB16kzBTAvLS/MUn3Ndr+5FMMK4y
 0tEB73HzVUKk8qXhVGyOezxCVBflzmyPZiq1r2/zzgwoaXtNoB4LROEfx Q==;
X-CSE-ConnectionGUID: nLsN9kmXSbe/7wFt93HlmQ==
X-CSE-MsgGUID: lIqVy7FRQ0mbEJLZgaxn7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="24009440"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="24009440"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 07:38:18 -0700
X-CSE-ConnectionGUID: dwJTaG+0TXSUcww2r/6PxA==
X-CSE-MsgGUID: 793vIm2rTVuLPY8EYm14ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="64639383"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 02 Sep 2024 07:38:16 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 02 Sep 2024 17:38:15 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 06/23] lib/rendercopy: Don't skip clearcolor on flat CCS
Date: Mon,  2 Sep 2024 17:37:41 +0300
Message-ID: <20240902143758.21036-7-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240902143758.21036-1-ville.syrjala@linux.intel.com>
References: <20240902143758.21036-1-ville.syrjala@linux.intel.com>
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

We always need to tell the hardware about the clear
color buffer, otherwise if we sample from a fast cleared
buffer we get complete garbage.

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/rendercopy_gen9.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
index f0757a8e6b78..57b64dad1b1d 100644
--- a/lib/rendercopy_gen9.c
+++ b/lib/rendercopy_gen9.c
@@ -249,7 +249,7 @@ gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
 			ss->ss11.aux_base_addr_hi = (address + buf->ccs[0].offset) >> 32;
 		}
 
-		if (fast_clear || (buf->cc.offset && !HAS_FLATCCS(ibb->devid))) {
+		if (buf->cc.offset) {
 			igt_assert(buf->compression == I915_COMPRESSION_RENDER);
 
 			ss->ss10.clearvalue_addr_enable = 1;
-- 
2.44.2

