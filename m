Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 740D3FF885A
	for <igt-dev@archiver.kernel.org>; Tue, 28 Apr 2026 04:48:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 258C210E29C;
	Tue, 28 Apr 2026 04:48:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ovlg0Rgy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79CF310E29C
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2026 04:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777351638; x=1808887638;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kC8KZQxh/L0P/OFYogDpi02QdaiQegAG5msh9Zm1jQQ=;
 b=Ovlg0RgyFCU3keqGuonPvXXpVz8yk3pOYTU/6uVQLRD3JDNkmX0fwIEr
 +raQsBjwqjyXeaS7GAbAadTDkDRalD2+x+Cd7JPh+AAlN3A9FzKZPy6Z4
 0/QiPelsbEJrUAD/Z9977NvmllB5f/Vhmq22tuPXspqmlU08gq5kTFqDd
 FcqufCL78cdEfihsqNax+4X5V5l6q/t1flC1plrCrdsH6rf5GNiP4Bz+S
 DKdLxg4Q2+zTdwWJxmp3dvDvUDhrpnF09NnzB8tgyZSb46mLOAYbcCLZD
 ZmBBkw9iCaRq/geYaDfsAcvmBAMtYjnKfF6RMwTjAliBXGhDQcbjJL4hU w==;
X-CSE-ConnectionGUID: p06aQMiPQ2eh9a6fAJS3OA==
X-CSE-MsgGUID: AEW5o6C5QBSYm7bgBw1cpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78167812"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="78167812"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 21:47:18 -0700
X-CSE-ConnectionGUID: WdQ8pP31RwCtvD8buojhhg==
X-CSE-MsgGUID: XcpzN6jGRz+/VteN02shGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="233706640"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 21:47:16 -0700
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v1 10/25] lib/monitor_edids: Add new EDID for HDMI 4k
Date: Tue, 28 Apr 2026 10:16:19 +0530
Message-ID: <20260428044644.257001-11-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260428044644.257001-1-mohammed.bilal@intel.com>
References: <20260428044644.257001-1-mohammed.bilal@intel.com>
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

From: Louis Chauvet <louis.chauvet@bootlin.com>

Add EDID for the HDMI screen LG HDR 4K.

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/monitor_edids/hdmi_edids.h | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/lib/monitor_edids/hdmi_edids.h b/lib/monitor_edids/hdmi_edids.h
index 26dffb7bf..589a76a8a 100644
--- a/lib/monitor_edids/hdmi_edids.h
+++ b/lib/monitor_edids/hdmi_edids.h
@@ -49,7 +49,23 @@ monitor_edid HDMI_EDIDS_4K[] = {
 		  "5E00A0A0A0295030203500C48F210000"
 		  "1EEF5100A0F070198030203500C48F21"
 		  "00001E000000000000000000000000A8" },
-
+	{ .name = "4K_GSM_LG_HDR_4K_HDMI",
+	  .edid = "00ffffffffffff001e6d4f77c75f1500"
+		  "0521010380462878ea7ba1ae4f44a926"
+		  "0c5054210800d1c06140454001010101"
+		  "010101010101a0cb0046f0703e802010"
+		  "3500b9882100001a000000fd00283c1e"
+		  "873c000a202020202020000000fc004c"
+		  "472048445220344b0a202020000000ff"
+		  "003330354d414e4a43335a37350a01e4"
+		  "0203427223090707830100004d010304"
+		  "10121f202261605f5e5d6d030c001000"
+		  "b83c20006001020367d85dc401788003"
+		  "e30f0003e2006ae305c000e606050159"
+		  "5952a36600a0f0701f8030203500b988"
+		  "2100001a565e00a0a0a0295030203500"
+		  "b9882100001a023a801871382d40582c"
+		  "4500b9882100001a00000000000000af" },
 };
 
 monitor_edid HDMI_EDIDS_NON_4K[] = {
-- 
2.48.1

