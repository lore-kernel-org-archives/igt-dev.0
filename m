Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A947C3DA4A
	for <igt-dev@archiver.kernel.org>; Mon,  5 Aug 2024 14:37:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06CCF10E216;
	Mon,  5 Aug 2024 14:37:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iy36Q65w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 338EE10E216
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Aug 2024 14:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722868666; x=1754404666;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CMx7AERrCfxeAEqnxcx6Z1vq++DZvxpXm7QIWCW4iS8=;
 b=iy36Q65wNmgSxRi2cTXVtZER6cBu4p6+YxtpgRTjaLDLMt2/elyvJjyX
 oHC+pz2XUy38Rf7IXyl4OwWLenNkwzhbnYKJdRmvPnFZDkeFg7AXGLWB9
 qV/vZ8JBlLKnlouoacalwSLGFqg87rHX+kE2FsKi+gHBl7Rvo2MxAt99v
 kIlpLvZk1F7T0Dt69d/QXbhmO/HKyoH1L/NaShNXwwMDeDlXGss1FCbVB
 xYGEGItKiGiQ8NCdBum7QLM/8FNDBO9J3K9iI8IkcO1WWiZcIMz2H9whC
 p8pd1Zac27FlHFihoFLBMTslXRPby9u2h2/mJYUj6sYYujFhxvwKCGkuf Q==;
X-CSE-ConnectionGUID: ACUQHmtESkK+ku+Ms5ixOw==
X-CSE-MsgGUID: h+tonjy6RT6DJtytaq6VVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="24702288"
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; d="scan'208";a="24702288"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 07:37:46 -0700
X-CSE-ConnectionGUID: MWqqzIBnTCK2gsyMuu/Ktw==
X-CSE-MsgGUID: bXaZNOX9T3yArpxh3Y2bQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; d="scan'208";a="56755073"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 localhost) ([10.245.245.246])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 07:37:45 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH i-g-t v2 6/8] tests/core_hotunplug: Skip if no render available
Date: Mon,  5 Aug 2024 16:37:09 +0200
Message-ID: <20240805143713.76034-7-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240805143713.76034-1-kamil.konieczny@linux.intel.com>
References: <20240805143713.76034-1-kamil.konieczny@linux.intel.com>
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

All subtests uses render device for health checks so skip
early if it is not present.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 tests/core_hotunplug.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index b66d5e4cf..7f17f4423 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -708,6 +708,10 @@ igt_main
 
 		igt_assert_eq(close_device(fd_drm, "", "selected "), -1);
 
+		fd_drm = __drm_open_driver_render(priv.chipset);
+		igt_skip_on_f(fd_drm < 0, "No known DRM render device found\n");
+		igt_assert_eq(close_device(fd_drm, "", "selected render "), -1);
+
 		prepare(&priv);
 	}
 
-- 
2.43.0

