Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D769ECD3436
	for <igt-dev@archiver.kernel.org>; Thu,  7 May 2026 01:29:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A3B110E231;
	Thu,  7 May 2026 01:29:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a/uXRxaj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1272D10E231
 for <igt-dev@lists.freedesktop.org>; Thu,  7 May 2026 01:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778117313; x=1809653313;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SWc2G9L3FBWM59RK9hJ/gnctnK7OOzcxL4CKKS6Qyus=;
 b=a/uXRxajsU0PPm/H00xNbGt5sImkqon9UFDVTNbLCjK5pbubaTYS/VY+
 uA4qqPL0BBx90jMiuCpOHBFszyhOEbRFgb8+Ke8YNqQ4nq24jy4oGyF2w
 1vsc9wHN6LBK8KHq0oNkEkN4Dfgir6eotSGiCbeMqQjwBI50Sp8P9x/zl
 /wr3z82vXo1fOQIj+QcZqkKZ09uqUiJ8jJc8ZFz5orOArsQ7tnmSpTMUq
 Mp3PBrhEU16ftmnRRBSZeIF1Fk7VyEf9RsZkYbOhGFI3/OVxpYE9RR1vq
 NYwzTMzjytL0wy+qgqExJwhUlJRnRJBxIE/8GqWuPpI9/qi0jCnJ4Cq8N g==;
X-CSE-ConnectionGUID: fquaSo94TGKaVeQAXGlvtg==
X-CSE-MsgGUID: DbG9e2zmTQGW/xeRiq9ZPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="96490333"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="96490333"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 18:28:33 -0700
X-CSE-ConnectionGUID: HdD/Eg6eTYGaUsUKHYe2kw==
X-CSE-MsgGUID: o1XGCJE5RYahBvnsPBJmIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="238115846"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa004.fm.intel.com with ESMTP; 06 May 2026 18:28:32 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com, suraj.kandpal@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v1 4/7] tools/vbt_decode: nuke get_device_id()
Date: Thu,  7 May 2026 03:28:18 +0200
Message-ID: <20260507012821.527453-5-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260507012821.527453-1-michal.grzelak@intel.com>
References: <20260507012821.527453-1-michal.grzelak@intel.com>
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

VBT dump file does not contain device id. Stop calling the function and
remove it.

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 tools/intel_vbt_decode.c | 22 ----------------------
 1 file changed, 22 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 6879bd7a7e..f7ba4bc3d5 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -3699,26 +3699,6 @@ static int get_sdvo_panel_type(struct context *context)
 	return panel_type;
 }
 
-static int
-get_device_id(unsigned char *bios, int size)
-{
-    int device;
-    int offset = (bios[0x19] << 8) + bios[0x18];
-
-    if (offset + 7 >= size)
-	return -1;
-
-    if (bios[offset] != 'P' ||
-	bios[offset+1] != 'C' ||
-	bios[offset+2] != 'I' ||
-	bios[offset+3] != 'R')
-	return -1;
-
-    device = (bios[offset+7] << 8) + bios[offset+6];
-
-    return device;
-}
-
 struct dumper {
 	uint8_t id;
 	uint16_t min_bdb_version;
@@ -4324,8 +4304,6 @@ int main(int argc, char **argv)
 		if (devid_string)
 			context.devid = strtoul(devid_string, NULL, 16);
 	}
-	if (!context.devid)
-		context.devid = get_device_id(VBIOS, size);
 	if (!context.devid)
 		fprintf(stderr, "Warning: could not find PCI device ID!\n");
 
-- 
2.45.2

