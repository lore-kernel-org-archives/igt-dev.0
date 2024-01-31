Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE197C47258
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jan 2024 10:52:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F3FD113B17;
	Wed, 31 Jan 2024 10:52:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8783F113B17
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Jan 2024 10:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706698320; x=1738234320;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Wy1j2cvrrdChr8WI7l0RNsZXvXVUGjPxmcqmZT+gpi4=;
 b=XsjzmF7oEMCX5y0IJrs6Ip8r+6Oztg++Kl5R5r2NJPelehqRLet2Yrm+
 w5buP7MTu3xxtafO3zf0gvaN5KwHZhSz81Jgi4SOqOJBSsu8sHFnN/jx1
 W6ZWg+jLUd9+scGJiezWUKn8pXQwKL04aIEAjS1vuQWLDV8BHArqnfW73
 Zl3D7ApFliO+VYArNG6nIj6gwnNoKWxrzK32OB49Io6UD57sV1mILQ/Q1
 puDByTFYaFbCWL7HRamIBx4NvbFBgbxweRrGkEPuyBrv501VSb0tzLv27
 l9UaZYR2O82aUsubZW76hEQxgixTGeswWpbaWHk8WtSU+aEBfCU+viu3P g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10200940"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="10200940"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 02:51:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="858776708"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="858776708"
Received: from mmackowi-mobl.ger.corp.intel.com (HELO localhost)
 ([10.246.18.126])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 02:51:56 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 1/4] lib/intel_blt: Use object pitch and aligned height
 on png write
Date: Wed, 31 Jan 2024 11:51:45 +0100
Message-Id: <20240131105148.182261-2-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240131105148.182261-1-zbigniew.kempczynski@intel.com>
References: <20240131105148.182261-1-zbigniew.kempczynski@intel.com>
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
Cc: Karolina Drobnik <karolina.drobnik@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Pitch and buffer height on tiled surfaces might be bigger than
image width and height so dump memory to png using pitch size
instead width and aligned height instead height.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Karolina Drobnik <karolina.drobnik@intel.com>
---
 lib/intel_blt.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index 25d251c4f8..951c364d5f 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -2019,6 +2019,11 @@ void blt_surface_to_png(int fd, uint32_t run_id, const char *fileid,
 	char filename[FILENAME_MAX];
 	bool is_xe = is_xe_device(fd);
 
+	if (obj->tiling) {
+		width = obj->pitch;
+		height = blt_get_aligned_height(height, obj->tiling);
+	}
+
 	snprintf(filename, FILENAME_MAX-1, "%d-%s-%s-%ux%u-%s.png",
 		 run_id, fileid, blt_tiling_name(obj->tiling), width, height,
 		 obj->compression ? "compressed" : "uncompressed");
-- 
2.34.1

