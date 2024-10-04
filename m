Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 757A1CFA765
	for <igt-dev@archiver.kernel.org>; Fri,  4 Oct 2024 10:41:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3588610E29C;
	Fri,  4 Oct 2024 10:41:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WoCUFOgP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D61010E295
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Oct 2024 10:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728038501; x=1759574501;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=PHifmdc63gLbIhrLRX4DvNdh3jSkvDvtiE3dAfkJdBw=;
 b=WoCUFOgPnCfcuNxgBQlIiX7lIBnKRs0JFu++GUqBsQgDhE+sBLZAT88A
 uFLyB77WqX7vz4//qGw6mlPyHPc/1JK/M4xtapNoOPn4dtC8WzumlSuBz
 nTaeIIaqxIbR4MutXrRBkaHtWZq7VkP/Gi9QQMKxSMhyUAeBVfnnQAQdz
 JoWAh0I3m/irk7RZISdiwO1GbN/6EOKTyO+A1dA0ZILYfbReOw+irsILe
 hIDO+Vah/YwSdACKaz1hlmtPWsT39/UPadz3bh/39mPCAPJLdJq+824Ej
 7RozDxnQQJSYuNkNDZXiwKssbRq+N/HFK7KOwglLsW3aXntxDwOqxdgH/ A==;
X-CSE-ConnectionGUID: ipwspL5cSqmPS35q1Tl3NA==
X-CSE-MsgGUID: MPwV8VjRRfGDw1zX5UPPZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="31140473"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="31140473"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 03:41:33 -0700
X-CSE-ConnectionGUID: xxLzOqw0TKK9FmpLgG3J2w==
X-CSE-MsgGUID: YafdHabbQki28LCNzYQ3ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="74778279"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 04 Oct 2024 03:41:30 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 04 Oct 2024 13:41:29 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 03/14] lib/igt_draw: Support 64bpp int the mmap/pwrite
 paths
Date: Fri,  4 Oct 2024 13:41:10 +0300
Message-ID: <20241004104121.32750-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241004104121.32750-1-ville.syrjala@linux.intel.com>
References: <20241004104121.32750-1-ville.syrjala@linux.intel.com>
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

Handle 64bpp pixels formats correcly in the mmap/pwrite
methods.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_draw.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/igt_draw.c b/lib/igt_draw.c
index 917cc37a2175..54c46fe6360c 100644
--- a/lib/igt_draw.c
+++ b/lib/igt_draw.c
@@ -371,6 +371,9 @@ static void set_pixel(void *_ptr, int index, uint64_t color, int bpp)
 	} else if (bpp == 32) {
 		uint32_t *ptr = _ptr;
 		ptr[index] = color;
+	} else if (bpp == 64) {
+		uint64_t *ptr = _ptr;
+		ptr[index] = color;
 	} else {
 		igt_assert_f(false, "bpp: %d\n", bpp);
 	}
-- 
2.45.2

