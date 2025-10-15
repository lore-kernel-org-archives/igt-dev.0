Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D329ACCD195
	for <igt-dev@archiver.kernel.org>; Wed, 15 Oct 2025 07:35:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 072FB10E262;
	Wed, 15 Oct 2025 07:35:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BDzA+BE4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F1B510E262
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Oct 2025 07:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760513733; x=1792049733;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bBewMCsOH5VQTRmKQ4d8mNceRYP3Ws86Zrg47Xk5wGQ=;
 b=BDzA+BE4Fo6FOp8XrqKJMiuDyAJFl1hhVsDojQSpJYKg84ifOe5Rnzu3
 vm6Co06R6jhlAGg+KUxK0BFbWKAp1Rz9QB9cULIDsrev39xpkJ/9Xss33
 w7hXIVdHtW+PJ9nUjzNgdZKtjh7/Dty6Un7BYGX1xaILFk3ALjDyK4g9E
 iSYuJVkb0GDma3JkzUz7kD6DS5NiK26CBtUCS5oBkpLQreZy3nic9S+gs
 ldyZoU1teTq4yOfEiTTShu6juzS4rLtgXV2IT+sem1xZ7uEnHyEq29Kto
 bPsLaqpKs1VW/VwdQHm8cLucwwaCCMVLr0PUO/heaob6sHq/c3BkMITQq A==;
X-CSE-ConnectionGUID: ftwd0uyGROa5G77ZSQv/LA==
X-CSE-MsgGUID: tugnzkPpSomS9YD6AWzCTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="62573601"
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="62573601"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 00:35:21 -0700
X-CSE-ConnectionGUID: HV66rbQ2T9uhHzqURLOZDA==
X-CSE-MsgGUID: pMIQ99fpTLCK5rRqXwYLow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="182882136"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 00:35:20 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com,
	Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v4 0/2] tests/kms_vrr: Dynamically verify LOBF across
 vrefresh steps
Date: Wed, 15 Oct 2025 13:05:06 +0530
Message-ID: <20251015073508.448186-1-ramanaidu.naladala@intel.com>
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

Conditional logging applied. Replace the static LOBF check with
iterative vrefresh stepping to detect LOBF enablement.

Naladala Ramanaidu (2):
  tests/kms_vrr: Dynamically verify LOBF across vrefresh steps
  tests/kms_vrr: Reduce unnecessary logging in specific test cases

 tests/kms_vrr.c | 57 +++++++++++++++++++++++++++++++++++--------------
 1 file changed, 41 insertions(+), 16 deletions(-)

-- 
2.43.0

