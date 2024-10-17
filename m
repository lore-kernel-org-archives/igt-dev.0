Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8377D3C525
	for <igt-dev@archiver.kernel.org>; Thu, 17 Oct 2024 17:14:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75D6C10E0F4;
	Thu, 17 Oct 2024 17:14:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MulPubGP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CF8A10E0F4
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Oct 2024 17:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729185268; x=1760721268;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OwVZS/YGYr3Dw8vjkOrAjCNpnC2NUDQRoaxPaCy5LXo=;
 b=MulPubGP1dqWCsVd9YHVLU5hN8wkSi8KkGLz4dg/rr/e2YBHuG0f2Bzr
 oPPszp0MSj0HhJaEXWVtVEvSvd3FGh3SWc9t2XRvrJANVjRaEh2rtifkf
 W2jUBIdOMjoPCnYi/kG3KUTMp52yoVNJxvuZIn4x+Za6gJ0mGx/bG//Km
 v31lStkXwdL/pgg3xI2bL/r7tx6drPugnXKXONGbNJ69t5OD0Ra0UY1Cd
 NP3FOMb0xCyBwaeugTDP4epTBso7hXjEAJuj6+lBQwAc1bDeyOuW6Jkg6
 QwrLJAa5zviVLXOfyKbbBb4XTytT+J1qRslA36t2c8TBbjMo1uaF73GiG g==;
X-CSE-ConnectionGUID: iZ5mDwiHQu63BarjGSi9fQ==
X-CSE-MsgGUID: x8oUrQsvRwO28VMl3EqY2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="28572301"
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; d="scan'208";a="28572301"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 10:14:27 -0700
X-CSE-ConnectionGUID: FGnqM6lRSiW2JtRb7iy5Tg==
X-CSE-MsgGUID: 4J5QdL3YSSaFP4adKfAXxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; d="scan'208";a="109348416"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 10:14:25 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mohammed.thasleem@intel.com, bhanuprakash.modem@intel.com,
 suraj.kandpal@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v2 0/2] Move backlight read, write to lib
Date: Thu, 17 Oct 2024 22:42:21 +0530
Message-Id: <20241017171223.533843-1-santhosh.reddy.guddati@intel.com>
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

Move backlight read , write functions to library to re use across
other tests.

Santhosh Reddy Guddati (2):
  lib/igt_kms: Move backlight read and write to lib
  tests/intel/kms_pm_backlight: Refactor and use functions from lib

 lib/igt_kms.c                  |  66 ++++++++++++++++++++
 lib/igt_kms.h                  |  12 ++++
 tests/intel/kms_pm_backlight.c | 108 +++++++++------------------------
 3 files changed, 106 insertions(+), 80 deletions(-)

-- 
2.34.1

