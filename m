Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A7AAC47DD9
	for <igt-dev@archiver.kernel.org>; Fri, 22 Mar 2024 20:41:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D6BB112765;
	Fri, 22 Mar 2024 20:41:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IbMWQGIm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10A75112765
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Mar 2024 20:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711140104; x=1742676104;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=WwWhJafozacS/NGgWB0w9l0eDaTSti2GvpGd6EB2NIE=;
 b=IbMWQGImudte4ISiF3pcJl5uCmYJcLE+dTnzr9dB1elIJ8OXYjULwSs/
 kigOhAIf/SSU7AFijyBQXhA8A/v7YOaCTOtkdtqd5uIlZBxDZhHCOEP+/
 Kc5z6SbqCv8iQHhKBBe5qBH15NAkKT4YVodIZjLA2e7atG4W/oa1EtVwt
 2MmuPmfm/NUruc8r2Z7Nm9b4FgrvZPZthqLo0iLLK2FPwcqZ6T37Dkf0b
 rLtsx0wIjd18MrPs7vkWVOL0a5mspxfBTHkv+L8X5dUtk/e6HEgSEaUas
 I4m8AykheFNwslmJbXh5pQz4LvAGQKoveDfuwNZ76yhET+C0emcCnOu2Z Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="6329361"
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; 
   d="scan'208";a="6329361"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 13:41:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="827783614"
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; d="scan'208";a="827783614"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 22 Mar 2024 13:41:40 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 22 Mar 2024 22:41:40 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 05/13] tools/intel_vbt_decode: Dump AIM offsets
Date: Fri, 22 Mar 2024 22:41:17 +0200
Message-ID: <20240322204125.17212-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240322204125.17212-1-ville.syrjala@linux.intel.com>
References: <20240322204125.17212-1-ville.syrjala@linux.intel.com>
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

Dump the AIM offsets from the header. I don't think these should
be actually in ant of modern VBT, but no harm in dumping them out
anyway.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index ead3dd6450e9..9c0774248e56 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -2734,6 +2734,8 @@ static void dump_headers(struct context *context)
 	printf("\tVBT size:\t\t0x%04x (%u)\n", vbt->vbt_size, vbt->vbt_size);
 	printf("\tVBT checksum:\t\t0x%02x\n", vbt->vbt_checksum);
 	printf("\tBDB offset:\t\t0x%08x (%u)\n", vbt->bdb_offset, vbt->bdb_offset);
+	for (i = 0; i < ARRAY_SIZE(vbt->aim_offset); i++)
+		printf("\tAIM #%d offset:\t\t0x%08x (%u)\n", i+1, vbt->aim_offset[i], vbt->aim_offset[i]);
 
 	printf("\n");
 
-- 
2.43.2

