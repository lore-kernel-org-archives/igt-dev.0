Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E6AD65C77
	for <igt-dev@archiver.kernel.org>; Thu, 14 Nov 2024 11:15:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9290810E7E8;
	Thu, 14 Nov 2024 11:15:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F2DM12d6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1219110E7E7
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Nov 2024 11:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731582911; x=1763118911;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=S5YSAlWKYXOvKiIeONY9CfvV247M+ue0SEREx7yOKvU=;
 b=F2DM12d6lj3AHxhtZ4ORFOFdah9nHeo2rfntLGBWME/8LoBCZ9M/DU4y
 3ni4ArdiIIqIMftBJZ6sWGuj7TwP9FjtBxRmiDmkpIStsDBwTw/oteNE5
 WtVe1dQaViukVbp/CWF0lQxaD+GtFs6JkYjBTOPZmM9gt2QI890F4isFR
 BuNT3AtX3jW8opF9btuGt8QY8qaFo4Gu8OsDIinwpKEBQuSkwkWDgqGLD
 Bmqz0I6WpugodfjCOUKJJzIDz0DjsLX/R+flPzYCA0aW3IM66JjlxsGjR
 Yh6BhncWhPZMSNdKOCNR+kAboC3KhgrVlVWMPc3LVd+jolcyvu1xXpMPa A==;
X-CSE-ConnectionGUID: hOP0kbdPSpK/gAy8yQfiOA==
X-CSE-MsgGUID: dFrwuK2gSECPJ8leav44KA==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="31619234"
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; d="scan'208";a="31619234"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 03:15:05 -0800
X-CSE-ConnectionGUID: mpDmsc4MQhKki5GC6MWuTw==
X-CSE-MsgGUID: 82VMhF34Q6+/IOkwBUXmsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; d="scan'208";a="92625855"
Received: from ksztyber-mobl2.ger.corp.intel.com (HELO jhogande-mobl1..)
 ([10.245.245.231])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 03:15:03 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH i-g-t] tests/kms_vrr: Set VRR_ENABLED property as false for
 non-VRR panel as well
Date: Thu, 14 Nov 2024 13:14:45 +0200
Message-Id: <20241114111445.3249373-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Currently we are facing problems with PSR testcases after running
negative-basic subtest. These are because VRR_ENABLED property is left
enabled by negative-basic subtest and having VRR enabled disables PSR
currently. Fix this by setting the property as false for non-VRR panel as
well.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 tests/kms_vrr.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index d0db954fa..830fd8ba8 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -862,8 +862,7 @@ test_cmrr(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 
 static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t *output)
 {
-	if (vrr_capable(output))
-		igt_pipe_set_prop_value(&data->display, pipe, IGT_CRTC_VRR_ENABLED, false);
+	igt_pipe_set_prop_value(&data->display, pipe, IGT_CRTC_VRR_ENABLED, false);
 
 	igt_plane_set_fb(data->primary, NULL);
 	igt_output_set_pipe(output, PIPE_NONE);
-- 
2.34.1

