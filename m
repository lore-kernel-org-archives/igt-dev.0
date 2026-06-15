Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC8EDCD98DA
	for <igt-dev@archiver.kernel.org>; Mon, 15 Jun 2026 11:30:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5863D10E38F;
	Mon, 15 Jun 2026 11:30:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NR5kwCQQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECEA610E38F
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jun 2026 11:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781522978; x=1813058978;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BaFJPOek7SFXsOJNKU5jJztz2OJ3nT17oPjVKoFhIWY=;
 b=NR5kwCQQogfOjwFG/Wdupp6JYJc0uJTLpzyjv3NtwPmVwRaOVD51IIgB
 PcF+DqGBWHBHI4Q8I8pI4rul6vSA6L1DsSwF1bYC2XY1dYJRIY7+WU0bo
 J91joBQz/7vTe28syV03QlwRvEnqnv8C/nb6CW57tAA7vPuqRiP2iwqBB
 KwaqHz+nQ1syTxc4tg2O48GZqVPpB7zVcOEPynHB85mETQ+OAf/zAT3OD
 Wra6Uq5w8Zbia4q7h9YpgyMqdcD4XNNAwuj8lQdGBIlnjUcp2vLJS6D6B
 6lXSq04oXlZ63JR3lDgoe6+Q5/bzVhT67jVDPX0McyBNhauO7euNGj5ha Q==;
X-CSE-ConnectionGUID: dAKiCxJnTUKm/Vx5H/eUdA==
X-CSE-MsgGUID: nrtQX8tOSX2NsCQknVNH/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="82323337"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="82323337"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 04:29:37 -0700
X-CSE-ConnectionGUID: heuFjVr6S2CGmsDDEKT6Nw==
X-CSE-MsgGUID: vpPSFWGMQIO5SzQLj3SlMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="246556220"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.28])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 04:29:37 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Cc: ville.syrjala@linux.intel.com,
	jani.nikula@intel.com
Subject: [PATCH i-g-t v2 4/4] tools/intel_vbt_decode: fall back to guessing
 PCI ID from VBT signature
Date: Mon, 15 Jun 2026 14:29:14 +0300
Message-ID: <397741e600a232910a01077d5e85b4c57fcc3672.1781522896.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781522896.git.jani.nikula@intel.com>
References: <cover.1781522896.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

If the PCI ID wasn't passed on the command-line, DEVICE environment
variable, or VBIOS, fall back to guessing the device ID from the VBT
signature.

Cc: Michał Grzelak <michal.grzelak@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Michał Grzelak <michal.grzelak@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tools/intel_vbt_decode.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 69961ce29e01..9451a77318ae 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -4331,6 +4331,8 @@ int main(int argc, char **argv)
 	}
 	if (!context.devid)
 		context.devid = get_device_id(VBIOS, size);
+	if (!context.devid)
+		context.devid = intel_guess_device_id(context.codename);
 	if (!context.devid)
 		fprintf(stderr, "Warning: could not find PCI device ID!\n");
 
-- 
2.47.3

