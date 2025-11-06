Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B5A3CCF9F8
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 05:34:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C73C310E315;
	Thu,  6 Nov 2025 05:34:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ALJ8mmc3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4324210E315
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Nov 2025 05:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762407279; x=1793943279;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A+xsXS1necUNluD/Q9fHXDmf5zgiksUqoMri96h9sPY=;
 b=ALJ8mmc3UG7+uYfsdMEs1G9tq8VEx5R2sskcUSIXsHlmyb4kC/Nd6XwH
 AIQVLmEbjiOqfqTZLRs0SPNNXtprCjZPUE7s+Ir2isJrwK41WOAm92AfT
 DJ3qLY2gQ8Il6FwKGFoOAGUwRQCdoaqqFCwADIuuAjvAmXH/dPMybw/fy
 XSrh4RrVDgViPaaPcRtjS0ig0jP/EO9wS9vdJtihPIvgeGW0HLfPyBYQy
 ot1hTc+Rqm0UxMqXjGF6pN4LTqHUm5gQ8kvbcLCJOoxVNvZ6JZTAAUJOI
 1E5ei57WC89px7f0HwuPkt5+MVJeWgY9l8LLQjgLBsy1VAIBOKejlTXOG w==;
X-CSE-ConnectionGUID: Mo184LPySVq4KlfHQCTD8Q==
X-CSE-MsgGUID: utD4TjapRdSkzp6v/eBOWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="75218501"
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; d="scan'208";a="75218501"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 21:34:39 -0800
X-CSE-ConnectionGUID: 6mvcIS8ITBGBovtmj9WhvQ==
X-CSE-MsgGUID: +wcD2C+uTU2nwEo7GU0wzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; d="scan'208";a="192022374"
Received: from shekharc-mobl2.iind.intel.com ([10.190.239.16])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 21:34:37 -0800
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: lucas.demarchi@intel.com, balasubramani.vivekanandan@intel.com,
 kamil.konieczny@linux.intel.com, shekhar.chauhan@intel.com
Subject: [PATCH i-g-t v1 3/3] lib/intel_pat: Define pat indices for xe3p_xpc
Date: Thu,  6 Nov 2025 11:04:25 +0530
Message-ID: <20251106053425.1731151-4-shekhar.chauhan@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251106053425.1731151-1-shekhar.chauhan@intel.com>
References: <20251106053425.1731151-1-shekhar.chauhan@intel.com>
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

From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Right PAT indices selected for xe3p_xpc.

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
---
 lib/intel_pat.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/lib/intel_pat.c b/lib/intel_pat.c
index 156b1ee5d..e3588110a 100644
--- a/lib/intel_pat.c
+++ b/lib/intel_pat.c
@@ -19,8 +19,12 @@ static void intel_get_pat_idx(int fd, struct intel_pat_cache *pat)
 {
 	uint16_t dev_id = intel_get_drm_devid(fd);
 
-	if (intel_get_device_info(dev_id)->graphics_ver == 30 ||
-	    intel_get_device_info(dev_id)->graphics_ver == 20) {
+	if (intel_graphics_ver(dev_id) == IP_VER(35, 11)) {
+		pat->uc = 3;
+		pat->wb = 2;
+		pat->max_index = 31;
+	} else if (intel_get_device_info(dev_id)->graphics_ver == 30 ||
+		   intel_get_device_info(dev_id)->graphics_ver == 20) {
 		pat->uc = 3;
 		pat->wt = 15; /* Compressed + WB-transient */
 		pat->wb = 2;
-- 
2.51.1

