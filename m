Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA69BCE8D60
	for <igt-dev@archiver.kernel.org>; Fri, 14 Nov 2025 17:22:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F2F010EAE9;
	Fri, 14 Nov 2025 17:22:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NNvVZ8vA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C870D10EAEA
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Nov 2025 17:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763140958; x=1794676958;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S6mfoP47hz9Ginc06aMVITmkEzvmTjWvcnpdZT1JlUg=;
 b=NNvVZ8vAceP4JYWYMpf5gSMxonTzQKh6fnhWyA6jthv1G+vVrmdp0q50
 WcLKRPFlV914t1+xq9T9ccqIOcNL8J9XAsZW3y0oV/xILNPhk3K3I+4vw
 pJwJDmhuuHmdKplZrlYXDOUnpCAyvVbhg8Bh4xrp2NtPpmfZfPEE1u8UP
 GcjgK4S27pS7OXr2d5KBW3lBmSi4ZEQJPWySxDfiSi/Rdpi29ONNcEwc+
 mEzL7XpU/OF2SCr5gFeC2Jzl3SWS6dySJWIWm/CDLWadzU4pQXl6qrJK6
 0wq3IKVD7NDw9Ra5BxhxR7ah3iSE/l0Wthq4m2RDndRZ5bYXzFZHbKLnm Q==;
X-CSE-ConnectionGUID: SB9HGUHaTpCfEMCbCLvk5w==
X-CSE-MsgGUID: WFX0x2R/Ro2owYwfAv/OEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="82871445"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="82871445"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 09:22:38 -0800
X-CSE-ConnectionGUID: 1VmXfiZNQ6aHBs9nWMlpPQ==
X-CSE-MsgGUID: cjUuyHEITaClOczmHcik8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="194981442"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 09:22:37 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: uma.shankar@intel.com, chaitanya.kumar.borah@intel.com,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v4 08/23] tests/kms_color: Add helper to check if pipeline contains
 only CTM colorop
Date: Fri, 14 Nov 2025 22:58:53 +0530
Message-Id: <20251114172908.1027816-9-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251114172908.1027816-1-swati2.sharma@intel.com>
References: <20251114172908.1027816-1-swati2.sharma@intel.com>
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

Add ctm_colorop_only() to determine if colorop in pipeline is
of type KMS_COLOROP_CTM_3X4.

__maybe_unused prevents compiler warnings when the helper
is not referenced, while keeping it available for future use in
color pipeline validation.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_color.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index f8d74a92c..7c113de85 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -773,6 +773,17 @@ static void prepare_lut_data(data_t *data, kms_colorop_t *colorops[])
 	}
 }
 
+__maybe_unused
+static bool ctm_colorop_only(kms_colorop_t *colorops[])
+{
+	int i;
+
+	for (i = 0; colorops[i]; i++)
+		if (colorops[i]->type != KMS_COLOROP_CTM_3X4)
+			return false;
+	return true;
+}
+
 static void
 prep_pipe(data_t *data, enum pipe p)
 {
-- 
2.25.1

