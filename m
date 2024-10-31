Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E87D6B6A7
	for <igt-dev@archiver.kernel.org>; Thu, 31 Oct 2024 12:14:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CA4A10E86F;
	Thu, 31 Oct 2024 12:14:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nsQNqAKh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09F0D10E86F
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Oct 2024 12:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730376872; x=1761912872;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bJThNQayw8AB7Mu/bOjMTQLkKT6bnQOXsLCAUV2K2dE=;
 b=nsQNqAKhozdASU1UZq/2MrGrqPSjUn8iSxyT63utyKRvFcu+1QD4XixJ
 kAEBIE1IEPuJLnmF0y3TBJQUEqkhIaEJ8aH9ZKqus6Uh+05wGXkxK0WvC
 9d6uzlrYo6NZWr3184cemoL9beGTAUrMc13YT2t1F5bZEyPjmNaLPaDaX
 L5O72vcamtizPGxetwlvPrEFekX/LwXyaTpggIwIEEAy8Q57LZGKzvUZ+
 pl73lkxACOehyO9WEGmwUSZ33PvpVYX0Sl7QALNfkp4H1WMTjU1i3dySM
 0oixItcsmERHkS3/euWZEPxVhUO4bv5m/x3vT9vAqW5Hli9Tw10i8I+s6 w==;
X-CSE-ConnectionGUID: /BtmiA8QTue/t7xllVgkxQ==
X-CSE-MsgGUID: yNE8dq6ESpCsgil9VC/RxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="47583887"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="47583887"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 05:14:31 -0700
X-CSE-ConnectionGUID: EuRn9UVwRjiHGKZOpqdsQQ==
X-CSE-MsgGUID: QId93IUnTGawpIvhcc970w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="83037306"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO jhogande-mobl1..)
 ([10.245.245.110])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 05:14:30 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH i-g-t] tests/kms_vrr: data->switch modes[LOW_RR_MODE] not
 initialized for lobf test
Date: Thu, 31 Oct 2024 14:13:55 +0200
Message-Id: <20241031121355.3419367-1-jouni.hogander@intel.com>
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

lobf subtest is using data->switch_modes[LOW_RR_MODE] but not initializing
it. Fix this in output_constraint.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 tests/kms_vrr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 36a22eebe..d0db954fa 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -923,7 +923,7 @@ static bool output_constraint(data_t *data, igt_output_t *output, uint32_t flags
 	igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE]);
 
 	/* Search for a low refresh rate mode. */
-	if (!(flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS)))
+	if (!(flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS | TEST_LINK_OFF)))
 		return true;
 
 	data->switch_modes[LOW_RR_MODE] = low_rr_mode_with_same_res(output, data->range.min);
-- 
2.34.1

