Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3801C27C75
	for <igt-dev@archiver.kernel.org>; Thu, 13 Jun 2024 10:24:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA8B610EA17;
	Thu, 13 Jun 2024 10:24:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Eq1QZZcO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8F4F10EA11
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Jun 2024 10:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718274268; x=1749810268;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uxMkImLPHLe+JdKzVy4CnLpLm7Xs6NJfPydSb99KbrY=;
 b=Eq1QZZcOeQRk/8kFY2pTOryVhsVnIlVHX5rc9lcMWakzq+wa6fj8zpEY
 f5F5FLtE476W/dSulNzFsR+LgkN6eifbeB54s/WrMdKjvjBuRH2LXrUNp
 ZKEbqK8JlKL2EWW8cOiEJQ+qyafwrW3990KoV58V1shbpHZxvgHB7agGL
 wa6mGqmke+a9WFYPwPScCLQcwq5tnFJ/RrUxJsRtfPQ1h7CVdhocQifpc
 i47/QghLMZ9Wt+gyGf3j7wsEDkurd4YE3bOoc/d6QWdiPVnuekpc1sO9P
 Oq8xmeetk9GxBtzJ3zhGChLpQBsno2KoX3Ze3u1RbzpjPrFtdopW7uNj+ A==;
X-CSE-ConnectionGUID: thsFLJslRTOsa5X63XZtKw==
X-CSE-MsgGUID: yQH2aXAcTuCTUrNhPxWYFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="18011153"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="18011153"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 03:24:27 -0700
X-CSE-ConnectionGUID: vw9/3Q2aRSWirHTwQTeGRw==
X-CSE-MsgGUID: f7rSP5HdR8WotsWO9ycN/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="40214995"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 03:24:26 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	mitulkumar.ajitkumar.golani@intel.com
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Manasi Navare <navaremanasi@chromium.org>
Subject: [i-g-t V2 3/4] tests/kms_vrr: Enable VRR in seamless-virtual subtest
Date: Thu, 13 Jun 2024 15:46:32 +0530
Message-ID: <20240613101633.3804434-4-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240613101633.3804434-1-bhanuprakash.modem@intel.com>
References: <20240613101633.3804434-1-bhanuprakash.modem@intel.com>
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

We must enable the VRR to exercise the virtual mode
with in the VRR range.

Cc: Manasi Navare <navaremanasi@chromium.org>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_vrr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index dec49eb12..626be8ec6 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -671,6 +671,7 @@ test_seamless_virtual_rr_basic(data_t *data, enum pipe pipe, igt_output_t *outpu
 	kmstest_dump_mode(&data->switch_modes[HIGH_RR_MODE]);
 
 	prepare_test(data, output, pipe);
+	set_vrr_on_pipe(data, pipe, false, true);
 	rate[0] = rate_from_refresh(data->switch_modes[HIGH_RR_MODE].vrefresh);
 
 	/*
-- 
2.43.2

