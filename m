Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E465C83F1A
	for <igt-dev@archiver.kernel.org>; Tue, 22 Jul 2025 12:47:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC4F310E677;
	Tue, 22 Jul 2025 12:47:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PLI4OlxJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3B0610E677
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Jul 2025 12:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753188425; x=1784724425;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=R65oEFFc0IT22bzrIO0aIDWNfS6vpDcK27Q2T9CknaA=;
 b=PLI4OlxJa4BIeYHub6Vvpcp8tDUN8qeme60kN1BDQzATi0zk0Ob3BR/h
 SHsBm1aPYvQkk+yhuntVwpdR3NrXDsffuR0i3dD4r62B/UsElYvQfX6E5
 361cbLOEELY+742DOGGaxKo7zaNMaF+BxMhX9Kt4cSNdnrQ8N4Jj+jNJk
 omojCHmtiui5BJGCyab9dhYP65Ws11QK2pizij+MLObWYIjiaUu3t41kq
 S3s97kyY75Cn10GO/dPZjTmcZcWJSHScYBcdyQrwILgcQx506wl4Kipu6
 OMbT/BdLRiIF2fCMWyj9P1UjHppZRS31gNh4Rvzjr95xMppsJA4MxFcWU Q==;
X-CSE-ConnectionGUID: zt5hqV7pQVupZhHCm9czIA==
X-CSE-MsgGUID: i70rah9GSuSE85p7ks90RA==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="73006862"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="73006862"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 05:47:05 -0700
X-CSE-ConnectionGUID: +oFSNF7GTnmHGUWaMLT33A==
X-CSE-MsgGUID: 5MJy2ZzXQg25E9EFOAoxYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="163173185"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by fmviesa003.fm.intel.com with ESMTP; 22 Jul 2025 05:47:04 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v2 0/1] tests/kms_cursor_legacy: don't inhibit pipe CRC
 calculation
Date: Tue, 22 Jul 2025 14:48:22 +0200
Message-ID: <20250722124823.912472-1-michal.grzelak@intel.com>
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

Next version of v1 [1].

[1] https://lore.kernel.org/igt-dev/20250715123623.832027-1-michal.grzelak@intel.com

Best regards,
Michał

---
Changelog:
v1->v2
- reorder igt_pipe_crc_stop before the clean-up (Swati)
- describe in commit message stopping CRC calculation 

Michał Grzelak (1):
  tests/kms_cursor_legacy: don't inhibit pipe CRC calculation

 tests/kms_cursor_legacy.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
2.45.2

