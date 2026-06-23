Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9A85CDB470
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jun 2026 08:10:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BDED10E9E3;
	Tue, 23 Jun 2026 08:10:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KhZkq5Ff";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B25810E9E3
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jun 2026 08:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782202175; x=1813738175;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pOBATALGViCxa/RoLqq0YbeCNvMTF8FobVkBjD9fQoI=;
 b=KhZkq5FfXR7aHaPLNS9/hhDic6GS2eP31esOivo22EadFyLxO7rtEa6y
 DfbNDYfRfw9XIAXyL7RhOiDu9cpxp+mZO97gKNgCFu2cXj/H73bnD0uLp
 +TE0rPQScWRjAt96biH4/RPwaMpUA6g7C72/FPu4IBhVE3ZVNLdIRwU8l
 CdETA0rXRohyTSr5jeRf4GreIdSCQDI1uMKUWp/hcXvMXnQn8dEu9JXw4
 3NcjhNJYP439jnWZWRQXivOAtaxiocRFTcvz9ZWoL/SCFjoKeg+EDJCYb
 aWgDOmEpMVBWtj3ZKHeuB62NdX4aPU9F6wKNFpK++RgfUO3ea3nvFrC88 A==;
X-CSE-ConnectionGUID: JZ9fgbiyR+afgT0mfaBbuw==
X-CSE-MsgGUID: 1svPOjORQxObHT32ZeSlpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="82944732"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; d="scan'208";a="82944732"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 01:09:35 -0700
X-CSE-ConnectionGUID: /vymDrngR6K1Tmz4nP4yqQ==
X-CSE-MsgGUID: hndSaZPQTjOPOow50u5Vqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; d="scan'208";a="253794117"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 01:09:34 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t v2 0/3] tests/kms_setmode: Convert to igt_display atomic
 API
Date: Tue, 23 Jun 2026 13:39:23 +0530
Message-ID: <20260623080927.3216500-1-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This series updates kms_setmode to use the modern IGT atomic display API
instead of legacy DRM calls, switches to public igt_display helper functions,
and cleans up outdated code. As part of this, the legacy TEST_STEALING subtest
is removed since its behavior does not apply to the atomic model. Overall, this
makes the test simpler, more maintainable, and aligned with current KMS
practices without changing existing test behavior.

Jeevan B (3):
  tests/kms_setmode: Drop invalid-clone-single-crtc-stealing subtest
  tests/kms_setmode: Convert modeset path to atomic API
  tests/kms_setmode: Use public igt_display helper APIs

 tests/kms_setmode.c | 346 ++++++++++++++++++++------------------------
 1 file changed, 160 insertions(+), 186 deletions(-)

-- 
2.43.0

