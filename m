Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD91ACCF9E3
	for <igt-dev@archiver.kernel.org>; Tue,  4 Nov 2025 09:02:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A55210E566;
	Tue,  4 Nov 2025 09:02:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FYXv6DO1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2042F10E566
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Nov 2025 09:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762246930; x=1793782930;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TBh+Bu1f/HhE7DALfDgU1XccgvKDozNup9Nn+nYpoKk=;
 b=FYXv6DO12TFOodGmnKGf4a1o6W6+SakXcg9OS1m6ioBjkAV+R7HKZmwm
 3J2hPgR11ME6r0FWVJQ3kigkpz9RiF0gKBPW0zJE6zdX1G81XMHGQy8L5
 Za9aY/xiR+ySBSXvFwK5/iEj6lAkQcmH9c3VIvtct099dYXpE8XRkgEBd
 o3cDId4xJF36CAPie15Ca4rL8iOI4zXg3Xu3jlA2TV8ylEnQY5dNaRceZ
 MwHLOe5ROKh+u8QzkYHcfTEKyHm8BRrUQXR0VKXda4ClfAQdlyJLZWHp6
 NaWTzdGP4bE7t4eUgKS6vFd6z43OlYd61lOrIOCcUCkaZ5Qq5hUlWinHE g==;
X-CSE-ConnectionGUID: NOy/RwK1Tk2ab7lWZdzdxA==
X-CSE-MsgGUID: mOquXs/BQRSgWeXC74+25Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="64032925"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="64032925"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 01:02:09 -0800
X-CSE-ConnectionGUID: 33VESaHtTzeDJCipHfimWw==
X-CSE-MsgGUID: ctxIGivPTKeAZz3+khXVFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="224354186"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 01:02:06 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, anshuman.gupta@intel.com, matthew.auld@intel.com,
 kamil.konieczny@intel.com, nidhi1.gupta@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v16 0/3] Port kms_prime for xe
Date: Tue,  4 Nov 2025 14:26:37 +0530
Message-Id: <20251104085640.795121-1-santhosh.reddy.guddati@intel.com>
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

Add support for kms_prime for xe devices.

Bhanuprakash Modem (1):
  tests/kms_prime: Add XE support

Santhosh Reddy Guddati (2):
  tests/kms_prime: Enable basic-modeset for xe
  lib/igt_fb: Apply NEEDS_VISIBLE_VRAM in missing igt_fb

 lib/igt_fb.c      |   3 +-
 tests/kms_prime.c | 225 +++++++++++++++++++++++++++++++++++++++-------
 2 files changed, 197 insertions(+), 31 deletions(-)

-- 
2.34.1

