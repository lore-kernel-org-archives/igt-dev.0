Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 519FFD5AE79
	for <igt-dev@archiver.kernel.org>; Thu,  7 Nov 2024 09:53:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08ADE10E7E2;
	Thu,  7 Nov 2024 09:53:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dIXv1jVS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8593310E7E2
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Nov 2024 09:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730973181; x=1762509181;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UhfkSZ7cSSC8vdV27GjUFd6Vn2VQ4vHaMVbobSI0oIw=;
 b=dIXv1jVSslFV40/i9oo9v2DNmW4VxqYo7aNIWWKFIRpsacdnH5ihXp5b
 W2ePaJXNmT4TkwHbBJRPOz6KfSEtGEkNB4JGxoJxrOhgNRcxVied9w7xs
 9YwSszrwjdWGgFerrTxmvGoHYA5j2G8zE0VkR6QPbES/zisYUIzXjP6ug
 ScYWXYESFjU+Ai7vYWR4Q7+KnSZlcU7IJY4auyASEkTam0LH1+AIxMykc
 zcZ0mh20SeWYGmOczdD9jyhSSPr/tKa3Ao8WNGuH7NyDHFy2NYvwWGOqB
 RlbvmbktEJKoCHXUDgd9RJbvUckcR3g/E8Wa7K21YPIvIqBdHypW0al6h A==;
X-CSE-ConnectionGUID: 2NbgpFfLRmOZfW5QyKyN+A==
X-CSE-MsgGUID: ai5zR/6NSFCLxqNzUUvUtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="30229382"
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; d="scan'208";a="30229382"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 01:53:01 -0800
X-CSE-ConnectionGUID: Zihb9t5ZTuKi7Jyl9f/Myg==
X-CSE-MsgGUID: iPDaQQ/ARbye877FvOQymQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; d="scan'208";a="89844739"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by orviesa005.jf.intel.com with ESMTP; 07 Nov 2024 01:52:58 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com, swati2.sharma@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com,
 Mark Yacoub <markyacoub@chromium.org>, Mark Yacoub <markyacoub@google.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH i-g-t v8 3/3] lib/monitor_edids/hdmi_edids: Shuffle edid with
 the redundant one
Date: Thu,  7 Nov 2024 15:23:26 +0530
Message-Id: <20241107095326.1842621-4-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241107095326.1842621-1-pranay.samala@intel.com>
References: <20241107095326.1842621-1-pranay.samala@intel.com>
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

The EDID for the 1920x1200 at 59.950 Hz mode is already included.
It will be swapped with the EDID for the 2560x1600 at 59.972 Hz mode
to ensure full coverage of all EDIDs.

Cc: Mark Yacoub <markyacoub@chromium.org>
Cc: Mark Yacoub <markyacoub@google.com>
Cc: Louis Chauvet <louis.chauvet@bootlin.com>

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 lib/monitor_edids/hdmi_edids.h | 52 +++++++++++++++++-----------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/lib/monitor_edids/hdmi_edids.h b/lib/monitor_edids/hdmi_edids.h
index 9d75cfa98..f6cfe82ff 100644
--- a/lib/monitor_edids/hdmi_edids.h
+++ b/lib/monitor_edids/hdmi_edids.h
@@ -250,23 +250,15 @@ monitor_edid HDMI_EDIDS_NON_4K[] = {
 		  "34353732323059575320000000fc0044"
 		  "454c4c20323430375746500a000000fd"
 		  "00384c1e5311000a2020202020200068" },
-	{ .name = "DEL_61462_DELL_U2410_HDMI",
-	  .edid = "00ffffffffffff0010ac16f04c4e4332"
-		  "1f13010380342078ea1ec5ae4f34b126"
-		  "0e5054a54b008180a940d100714f0101"
-		  "010101010101283c80a070b023403020"
-		  "360006442100001a000000ff00463532"
-		  "354d39375332434e4c0a000000fc0044"
-		  "454c4c2055323431300a2020000000fd"
-		  "00384c1e5111000a202020202020012e"
-		  "020329f15090050403020716011f1213"
-		  "14201511062309070767030c00100038"
-		  "2d83010000e3050301023a801871382d"
-		  "40582c450006442100001e011d801871"
-		  "1c1620582c250006442100009e011d00"
-		  "7251d01e206e28550006442100001e8c"
-		  "0ad08a20e02d10103e96000644210000"
-		  "1800000000000000000000000000003e" },
+	{ .name = "HWP_12442_HP_Z30i_HDMI",
+	  .edid = "00ffffffffffff0022f09a3001010101"
+		  "06180103804028782a1df5ae4f35b325"
+		  "0d5054a10800d100b30095008100a940"
+		  "8180d1c081c0e26800a0a0402e603020"
+		  "360081902100001a000000fd00324618"
+		  "621b000a202020202020000000fc0048"
+		  "50205a3330690a2020202020000000ff"
+		  "00434e34343036304742530a20200078" },
 	{ .name = "DTV_0_DTV_HDMI",
 	  .edid = "00ffffffffffff001296000001010101"
 		  "0c180103803a20780a0dc9a057479827"
@@ -507,15 +499,23 @@ monitor_edid HDMI_EDIDS_NON_4K[] = {
 		  "442100001e011d00bc52d01e20b82855"
 		  "4006442100001e8c0ad08a20e02d1010"
 		  "3e9600064421000018000000000000c1" },
-	{ .name = "HWP_12442_HP_Z30i_HDMI",
-	  .edid = "00ffffffffffff0022f09a3001010101"
-		  "06180103804028782a1df5ae4f35b325"
-		  "0d5054a10800d100b30095008100a940"
-		  "8180d1c081c0e26800a0a0402e603020"
-		  "360081902100001a000000fd00324618"
-		  "621b000a202020202020000000fc0048"
-		  "50205a3330690a2020202020000000ff"
-		  "00434e34343036304742530a20200078" },
+	{ .name = "DEL_61462_DELL_U2410_HDMI",
+	  .edid = "00ffffffffffff0010ac16f04c4e4332"
+		  "1f13010380342078ea1ec5ae4f34b126"
+		  "0e5054a54b008180a940d100714f0101"
+		  "010101010101283c80a070b023403020"
+		  "360006442100001a000000ff00463532"
+		  "354d39375332434e4c0a000000fc0044"
+		  "454c4c2055323431300a2020000000fd"
+		  "00384c1e5111000a202020202020012e"
+		  "020329f15090050403020716011f1213"
+		  "14201511062309070767030c00100038"
+		  "2d83010000e3050301023a801871382d"
+		  "40582c450006442100001e011d801871"
+		  "1c1620582c250006442100009e011d00"
+		  "7251d01e206e28550006442100001e8c"
+		  "0ad08a20e02d10103e96000644210000"
+		  "1800000000000000000000000000003e" },
 	{ .name = "HWP_12447_HP_Z24i_HDMI",
 	  .edid = "00ffffffffffff0022f09f3001010101"
 		  "1a180103803420782e3c50a7544da226"
-- 
2.34.1

