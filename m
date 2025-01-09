Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A03AFE77197
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jan 2025 08:33:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55A5610ED2A;
	Thu,  9 Jan 2025 08:33:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H2kobWls";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B8DA10ED2A
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jan 2025 08:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736411632; x=1767947632;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=P6fD4POyIzk45d1hWxO09E35sPMF/W1Ftl/AxnWckcA=;
 b=H2kobWlsd41K4Uw+hpjniaG10OWFe1wyb2YS3Z6D8W87IM4GIn3ZUa0Q
 svD6D21uwDEykpYLcZ3YHmrMNOAzHLutDaS/5aMCjFSKHXSMFge7q3m8G
 k9CJyPZuNXecbfc1yfCXY7HzeQQtL4TZK0xwRNQzDch6llky/DEraHnVS
 LsdNHCPrDF3cdKkAphRQvMSfxgUSNyLqCaFr7NExkc2wmpHcMOGFPtCYy
 VV9srzXub6dJ1BHqs4XjDvKy7zSniuKxWWEebOb/CkqG84HnisgE9rlWc
 1eu3qnlb5OMzezkQ9PU7fBZWftVwJj/caYDU42H0f9q6HzsHX+oldZvGm Q==;
X-CSE-ConnectionGUID: q0SaGD/YTRmp98TYTs8npw==
X-CSE-MsgGUID: T+fQeBI0Qkqqo48yyN6brw==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="35885059"
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; d="scan'208";a="35885059"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 00:33:52 -0800
X-CSE-ConnectionGUID: S4BgINPgSOCSIPScRCTP4w==
X-CSE-MsgGUID: 8NN5Wi76QTeZcooDbALX9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="140659256"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by orviesa001.jf.intel.com with ESMTP; 09 Jan 2025 00:33:43 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, santhosh.reddy.guddati@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v2] tests/kms_plane_scaling: Add logs to skips
Date: Thu,  9 Jan 2025 14:08:58 +0530
Message-Id: <20250109083858.39089-1-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
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

Having some logs for test failures & skips would
make debugging much easier.

v2: Add output/pipe name for detailed message (Santhosh)

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_plane_scaling.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index c8c9aee31..43f578d55 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -1577,6 +1577,12 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 								       kmstest_pipe_name(pipe), igt_output_name(output))
 								intel_max_source_size_test(&data, pipe, output, mode,
 											   intel_paramtests[index].planesize);
+						} else {
+							igt_info("Unable to find the lowest " \
+								 "refresh rate mode on output " \
+								 "%s pipe %s\n",
+								 igt_output_name(output),
+								 kmstest_pipe_name(pipe));
 						}
 						continue;
 					}
-- 
2.34.1

