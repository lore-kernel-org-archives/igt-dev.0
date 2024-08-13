Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E47C52D7B
	for <igt-dev@archiver.kernel.org>; Tue, 13 Aug 2024 05:48:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6876310E2A2;
	Tue, 13 Aug 2024 05:48:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G63ibCCK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC68810E2A2
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Aug 2024 05:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723528115; x=1755064115;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GX2cV2LAlu0rlsiwN90huC2KGfAfKrTTF98Quh70EDA=;
 b=G63ibCCKCT1vBC+oK5Gklo6NCw2d0OK//ZBqa/RozVW2DXR/93lLH5GY
 N/r8HYnuNlD3tTmfjwZs4M0U7Ll4IMnyyA0Bg3YDELXPzXiVd3S/ZQ8wX
 xVZIci5LXSMj3Tq4TcjBjP1AK3ViH8ezsGL1pNe5aNRc8e2tqQnr42sOQ
 TpQVjeGxVYKIQ9/HsmPg0TplQoHUvqF3dyPZU1dkdHD+b98ylwSl0xKse
 wj0pvoaNn9poSAd4EF8N4CYzix2JmqAFhIX0M5kQJVlO6JLeo/diMl419
 RMlAL1idqLTb8hA2n5t4OBx0irMhh12Mk+8czTnV3EVZikpbV3aSnFS9M A==;
X-CSE-ConnectionGUID: Ag/GQNvMRYiKoF+HOEXAGA==
X-CSE-MsgGUID: GKrMs+n+QFWZIU2Qnv87nw==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="25459872"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="25459872"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 22:48:23 -0700
X-CSE-ConnectionGUID: sW/qCB6WR5OKVoMhdJQdeA==
X-CSE-MsgGUID: yr2H49VySqW2O31FA1oZSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="58623735"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 22:48:21 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [i-g-t 0/4] Add more logs to skips (KMS)
Date: Tue, 13 Aug 2024 11:08:41 +0530
Message-ID: <20240813053845.2567954-1-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
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

Debugging would be easier if we had logs available for
test failures and skips. This patch adds print statements
at crucial points to provide better insights.

Bhanuprakash Modem (4):
  tests/kms_color: Add more logs to skips
  tests/kms_dither: Add more logs to skips
  tests/kms_vblank: Add more logs to skips
  tests/kms_vrr: Add more logs to skips

 tests/kms_color.c  | 21 +++++++++++++++++----
 tests/kms_dither.c | 10 ++++++++--
 tests/kms_vblank.c | 12 +++++++++---
 tests/kms_vrr.c    | 29 +++++++++++++++++++++--------
 4 files changed, 55 insertions(+), 17 deletions(-)

-- 
2.43.2

