Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD4B0C43458
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jun 2026 09:14:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 708BD10E7D4;
	Mon, 29 Jun 2026 09:14:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tz8CxbY2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1C7410E7CD
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jun 2026 09:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782724454; x=1814260454;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=E7OaKmt8O81Hrt9f4F9zZzHW7y1oL7Sv9PxgAtkvhWM=;
 b=Tz8CxbY2sQ+qlSbvBPqezQoWrYpJfnqLTM55r6WS/asVjvgjKI5bt1V3
 jX/UGTw1SsesfSr5a76biqCXJ+kczJACa9QwRTkmsQvaMfXUA/vKRY/ms
 G1Th33JuvMEc3m9/MAzcBEKRHkZJNzxq4K3bOcxNpyXfY66wbGHdSIgKx
 i51wBvI6iav4g2pZlrXWpQJAQ+9NZn6ud4Rtogyt96SEEETznWaYlK1Yd
 XjeCAIAwnWCEse/sY4kJVvN3mAhsxZ5VwlQhK9iGTHfyHifxiC6wTy0rR
 Vq2X2Dof000BIJURURhg/1uszzpDs3fBaSoyzgXGxBkeIu+dL5v0JyanI g==;
X-CSE-ConnectionGUID: Vg+Ac2TmRDWP2/bLPw4BUw==
X-CSE-MsgGUID: F7JobypMTYSZYHG2MSLTjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="94556933"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; d="scan'208";a="94556933"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 02:14:14 -0700
X-CSE-ConnectionGUID: Z7wly7MGS82VfvPQp3AZcA==
X-CSE-MsgGUID: FXd8K9N5QymSHKSYYh3ExA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; d="scan'208";a="249277750"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa008.fm.intel.com with ESMTP; 29 Jun 2026 02:14:12 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: juhapekka.heikkila@gmail.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v1 0/1] pipe_crc_basic: limit suspend
Date: Mon, 29 Jun 2026 11:13:49 +0200
Message-ID: <20260629091350.2706610-1-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

Next series of limiting # of executed suspend tests, but applied
to kms_pipe_crc_basic.

Other series:
 * kms_ccs, v1: [1].
 * kms_sharpness_filter, v1: [2]

Series already merged:
 * kms_flip, v9: [3].

BR,
Michał

[1] https://lore.kernel.org/igt-dev/20260622225811.1703400-1-michal.grzelak@intel.com/
[2] https://lore.kernel.org/igt-dev/20260629090740.2706320-1-michal.grzelak@intel.com/
[3] https://lore.kernel.org/igt-dev/20260330075508.1003899-1-michal.grzelak@intel.com/

Michał Grzelak (1):
  tests/kms_pipe_crc_basic: limit execution of suspend tests

 tests/kms_pipe_crc_basic.c | 4 ++++
 1 file changed, 4 insertions(+)

-- 
2.45.2

