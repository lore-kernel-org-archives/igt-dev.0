Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE7E8C36010
	for <igt-dev@archiver.kernel.org>; Fri,  4 Apr 2025 07:24:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82B1310EA60;
	Fri,  4 Apr 2025 07:24:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S0aYwmiY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BA1510EA60
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Apr 2025 07:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743751452; x=1775287452;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oIUb8QKKXl0y9VtKtlw1fK+0pZWnmFDdFeH26DGbjlg=;
 b=S0aYwmiYnLYgWI9wlUZN9nP1DrJl7IR/vDtX3gQILONmWrnr6R+oNlIz
 iGDMTKJYSV4sf+K2G7yr0HncULvsyAt+0zd4zl8TagsmvCMA2gH5JmsWw
 otcFKDPg7vbkKyB8KvtHQpNVNj3h+0AyoG5fA1BvwNjD/2DBMvW9lT8gg
 Nyh90PFGfFRxBVcq4WfhVNxdoxUZ6Drgr8lHZ3GbEp+v1mwrKO+3Yz4cm
 UBAcaKKAMBWSWOpWoi7qzLWCu4tZgRwDgmgWDl67NRSN9wnPpnNNN9hRV
 2pxaWkOMQERSfqUcEfg7OYSNsHDXxlNlUdjZ/rRsXzyfvnajopYLh8sQh g==;
X-CSE-ConnectionGUID: PAxfP9vCTmybml0vDPTwDw==
X-CSE-MsgGUID: sraOai9/TfSZpZXIFdytGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="45359303"
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; d="scan'208";a="45359303"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2025 00:24:12 -0700
X-CSE-ConnectionGUID: ZQqtCVy9Q7i6idFsMMbgOg==
X-CSE-MsgGUID: Y0C/fFHVQnud0deiqYO5uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; d="scan'208";a="132361895"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2025 00:24:10 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, juhapekka.heikkila@gmail.com,
 uma.shankar@intel.com, chaitanya.kumar.borah@intel.com,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 2/3] lib/igt_chamelium: Fix CRC calculation in
 compared_frames_dump()
Date: Fri,  4 Apr 2025 12:59:29 +0530
Message-Id: <20250404072930.695363-3-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250404072930.695363-1-swati2.sharma@intel.com>
References: <20250404072930.695363-1-swati2.sharma@intel.com>
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

