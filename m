Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84412C36010
	for <igt-dev@archiver.kernel.org>; Fri, 28 Mar 2025 18:05:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17A2410EA74;
	Fri, 28 Mar 2025 18:05:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ay8Vf9QI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2B5D10EA66
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Mar 2025 18:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743185139; x=1774721139;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZzNNto2D/iGcXXt/4CNj7g31+GPW+InMJ0kgF40BKXI=;
 b=Ay8Vf9QIeiHY3FHwve7oVolOA3Y7b2szH9+AHigJdMKxDg58MpRY7ly8
 17VwPM3Gkxm9bFoS1Me6GgR0DwHWsRyln5C8D/6ODiwqfy0vuvK7+sJB3
 g8dnzTEWWvVVO2REorV9a/1SKNPEFjmFyPEPty4rgee2c4tZKrXKoak1P
 qYViAN5Rg/fmYRJAp2BJOYfrNWZJZe8pWsHEVz09SwD4GI9ST3Yy4Q1sE
 Wy9WJjwNGSBCHCVJ6jT3uQF71xewWTbyW0DRPfKNd/8PS06SGOKfocxg2
 cGrl1nnJ6HyKUwLMz36PUgyWFMY+i3rjE6cn5NoTtFEh4kZluPPqTt7xd g==;
X-CSE-ConnectionGUID: AGHsVp7iTYWbBlisWOORiA==
X-CSE-MsgGUID: bJA9xVNcT3KmNZQKLCS7CA==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="62088490"
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; d="scan'208";a="62088490"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 11:05:39 -0700
X-CSE-ConnectionGUID: 2YznrFFrSUu9RYI8NXPeKA==
X-CSE-MsgGUID: qBtwG1z6RRev20Xlj2tl3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; d="scan'208";a="130725719"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 11:05:36 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, uma.shankar@intel.com,
 chaitanya.kumar.borah@intel.com, Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 2/3] lib/igt_chamelium: Fix CRC calculation in
 compared_frames_dump()
Date: Fri, 28 Mar 2025 23:40:54 +0530
Message-Id: <20250328181055.642777-3-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250328181055.642777-1-swati2.sharma@intel.com>
References: <20250328181055.642777-1-swati2.sharma@intel.com>
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

The CRC calculation in compared_frames_dump is incorrectly
using the reference frame instead of the captured frame when
capture_crc is NULL.

Fix this by correctly passing the captured frame to
chamelium_do_calculate_fb_crc().

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_chamelium.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
index c86773898..a96e36b5b 100644
--- a/lib/igt_chamelium.c
+++ b/lib/igt_chamelium.c
@@ -1878,7 +1878,7 @@ static void compared_frames_dump(cairo_surface_t *reference,
 	}
 
 	if (!capture_crc) {
-		chamelium_do_calculate_fb_crc(reference, &local_capture_crc);
+		chamelium_do_calculate_fb_crc(capture, &local_capture_crc);
 		capture_crc = &local_capture_crc;
 	}
 
-- 
2.25.1

