Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E93F3029B
	for <igt-dev@archiver.kernel.org>; Tue, 17 Mar 2026 05:34:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E88110E012;
	Tue, 17 Mar 2026 05:34:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iUkr+guw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A46A10E012
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Mar 2026 05:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773725692; x=1805261692;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=o3I3NgpdUQzbascp0Lphlwcpelp5fkb+GotWnPp+92w=;
 b=iUkr+guwE8tJzWqCLKy+dm4kYKIgGVlmv/gezNQhu4uacYAUkYDjganA
 l4oUImRfUMfCti8PoKTrFtaO2n1uj3PZXqyykRKp2He5RIQLlmHj2P6zs
 myIctfEOvyfqj26dB6V+RPCxMg/UW2SnbLyCL3eRLvmFaiulguFUzv2d8
 DoicW+NFSRRjVMMPPQTdMHr+hJo83CZ3rCUQ2UuH49XLVUck21o8oVJNw
 +pQhUQpcsZdbhW4SSOlIE42e4wAbIDlQ6wVy8m3Awb/PRn7hyy9kFSIeQ
 cW4TYIT9fWMqdHlf0aWebSrxpx4wjnlRWJ04fcfbHY9w3g1lnB4CYjEhb w==;
X-CSE-ConnectionGUID: ZYz28YBMQBqn0/yDuandIw==
X-CSE-MsgGUID: Brf2oJr6Quycm0GFxDPehA==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="97359477"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="97359477"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 22:34:51 -0700
X-CSE-ConnectionGUID: 2ccoEIuATTiA2tZhJv8diA==
X-CSE-MsgGUID: wc7OE8qmRxCFnm4S3NazvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="252651628"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 22:33:06 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jouni.hogander@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_dirtyfb: Skip output which doesn't
 support PSR
Date: Tue, 17 Mar 2026 11:01:32 +0530
Message-ID: <20260317053132.61166-1-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
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

Pass the actual output to psr_sink_support() instead of NULL so that
PSR sink support is checked per-output rather than generically.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_dirtyfb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
index b85e09346..36eee29db 100644
--- a/tests/intel/kms_dirtyfb.c
+++ b/tests/intel/kms_dirtyfb.c
@@ -120,8 +120,8 @@ static bool check_support(data_t *data)
 			return false;
 		}
 		if (!psr_sink_support(data->drm_fd, data->debugfs_fd,
-				      PSR_MODE_1, NULL)) {
-			igt_info("Output doesn't support PSR\n");
+				      PSR_MODE_1, data->output)) {
+			igt_info("Output %s doesn't support PSR\n", igt_output_name(data->output));
 			return false;
 		}
 		return true;
-- 
2.43.0

