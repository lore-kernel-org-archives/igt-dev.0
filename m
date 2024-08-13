Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63872C52D7B
	for <igt-dev@archiver.kernel.org>; Tue, 13 Aug 2024 13:24:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0404B10E349;
	Tue, 13 Aug 2024 13:24:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HM0Sm1zj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E55E10E349
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Aug 2024 13:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723555498; x=1755091498;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UTSNmOFFk9MzfwE6eNzpD8XecZ30Av2SG//BVn1HrIM=;
 b=HM0Sm1zjOPn1SAnQc+GmxOWkBLDSrcu1rz1y3zvYV7VxEoybX79S+bNI
 ERY3lzok/xHkuoXJSPAu+wZWqihq8VheiMclBkhV9wHG+n5sbmjcv5sPo
 PfCqNANXFY7aDdglmrwJ1y4qTieIPUJ+tYwqRCXdbBx6mTI1ooFn5Ltd5
 SNnZXd9RLq1mTcjtuJzKkvb8B9kDqNW3jbmMuZg0p5Hcd02X/0j2mNY3s
 nWbxKbIP9ABLhKVds+U3LQ9uwPF9I1JiuUhaeuw4cfVOZAWW1yT8504wl
 EX6g4fOhBTh03wOkNfNlo9Rq1KtxVFqgyKMUgy/RoJtWKxMOxtbqL5jkc w==;
X-CSE-ConnectionGUID: uHeHF4ejT4em0K+2MGC5HQ==
X-CSE-MsgGUID: 4IsLfnMwTHOidb9vNsk9Yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="21579260"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="21579260"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 06:24:58 -0700
X-CSE-ConnectionGUID: /fT5K0thTPabLY4kYgQH+Q==
X-CSE-MsgGUID: zlK+26nRS1SlzRs1a7vrSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="63515037"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 06:24:58 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [i-g-t 1/2] lib/igt_kms: Clear all pipe properties on reset
Date: Tue, 13 Aug 2024 18:45:19 +0530
Message-ID: <20240813131520.2715442-2-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240813131520.2715442-1-bhanuprakash.modem@intel.com>
References: <20240813131520.2715442-1-bhanuprakash.modem@intel.com>
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

Just to sanitize all properties we should clear all
pipe properties on reset.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_kms.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index e030b35a6..f5fc9ada1 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2562,6 +2562,9 @@ static void igt_pipe_reset(igt_pipe_t *pipe)
 	if (igt_pipe_obj_has_prop(pipe, IGT_CRTC_SCALING_FILTER))
 		igt_pipe_obj_set_prop_enum(pipe, IGT_CRTC_SCALING_FILTER, "Default");
 
+	if (igt_pipe_obj_has_prop(pipe, IGT_CRTC_VRR_ENABLED))
+		igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_VRR_ENABLED, 0);
+
 	pipe->out_fence_fd = -1;
 }
 
-- 
2.43.2

