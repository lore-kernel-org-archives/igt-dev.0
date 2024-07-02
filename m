Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA7B1C3065C
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jul 2024 23:29:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E59210E70E;
	Tue,  2 Jul 2024 23:29:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gcLFBPNB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB47C10E70E
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jul 2024 23:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719962962; x=1751498962;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=T6rD30JZdEDoZlfIbqLB+2HI+0LdK64Hz/gvASx+StM=;
 b=gcLFBPNBYjed1GhdrPMqtdekvkqKCxvQ6HUbhKgYq0Y9l4NjCaD64VyN
 OumKdoS6csRwDEBw9yzujSDusu3xOgUOy61Tfd+S/0dvSWiUvAhqGp0L5
 F1QY80j0VgFvo6+ZPHQ8tp1rbd4nUm9D/kMM20uW1PS3Q7IU/+c2DT20h
 vqJo+8+tUCVlNtY4KJH1FF9XYZPuh350jd5irtHIl8189QEGHGdfIbyot
 Zih8O0wyU7MM55JL6RGuTzy6+o3MH/06RN983GB4o7EE4WvmbJUcApAmD
 n344wXfjqRtuMleFGT1GDb7uDD8i9d4aal8lpu08+cwgVxIDDh+/0xJjj Q==;
X-CSE-ConnectionGUID: L456XzqDSWq8J1rO0U96rg==
X-CSE-MsgGUID: DCv1B68CToWxAdt+NQHevg==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="28559639"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="28559639"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 16:29:22 -0700
X-CSE-ConnectionGUID: ZIiPBDrYRmS79zuQ5O15LA==
X-CSE-MsgGUID: dKq0igbTSQyNMQ6x0Xffgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="46043891"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 02 Jul 2024 16:29:19 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 03 Jul 2024 02:29:19 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 22/37] lib/igt_fb: Add 16bpc compression format for the
 blitter
Date: Wed,  3 Jul 2024 02:28:02 +0300
Message-ID: <20240702232817.31147-23-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240702232817.31147-1-ville.syrjala@linux.intel.com>
References: <20240702232817.31147-1-ville.syrjala@linux.intel.com>
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

Pick the correct compression format for the block copy when
using an fp16 pixel format.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_fb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index e120ee9dcf70..c0b157ee44fa 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2879,6 +2879,7 @@ const struct {
 	enum blt_compression_type type;
 	uint32_t return_value;
 } compression_mappings[] = {
+	{ DRM_FORMAT_XRGB16161616F, COMPRESSION_TYPE_3D, 0x5 },
 	{ DRM_FORMAT_XRGB2101010, COMPRESSION_TYPE_3D, 0xc },
 	{ DRM_FORMAT_XRGB8888, COMPRESSION_TYPE_3D, 0x8 },
 	{ DRM_FORMAT_XRGB8888, COMPRESSION_TYPE_MEDIA, 8 },
-- 
2.44.2

