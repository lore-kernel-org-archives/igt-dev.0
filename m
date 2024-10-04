Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50869CFA750
	for <igt-dev@archiver.kernel.org>; Fri,  4 Oct 2024 07:50:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D600610E1B4;
	Fri,  4 Oct 2024 07:50:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lQlq2Gz/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02CAD10E1B4
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Oct 2024 07:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728028205; x=1759564205;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jP9ISzvYiw9rbBlOEM0hUCXtS7jojSAdSlz7D+ausKs=;
 b=lQlq2Gz/pP224srTVRz18uH9TwnOKkck8jvr5R/29mX7YnftGPQfp8/Y
 RGnITqYz6TNb3UOL56D2U8MPry6O/nNGPvWLuCSGSR2h1ZAD09ea7/5Uc
 xN1m/cQcyHktHyr62l4PEbAZiCp/FcAc5ZBUMHJm8hSIVPTywnf4ylZja
 DXlfCLPxTKgVVPxeT8P8Muz9bIkg+IrPBAw7xRgxzfDEXmPLFcTbhkSR/
 l7rZgN5tH4EuH1nohMIAiCr1qWegG6rwpWZcsJUVBOimwMV+X10VMtM1O
 u8MZnxNQrwXBIeEwLpQCUXDBsDa7BPN8tjJwZ5FxY8sRxpkOSw5s2d+86 w==;
X-CSE-ConnectionGUID: R6H0L98xR+eqwU28c7lKGg==
X-CSE-MsgGUID: z7feLpsDSMKGSr0CyCT6tw==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="38631355"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="38631355"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 00:50:04 -0700
X-CSE-ConnectionGUID: eAuzebDBSrCPHk3s98lO3w==
X-CSE-MsgGUID: WCfnp7jkSWWKe+5F//8/Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="112085031"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 00:50:03 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v4 0/1] tests/intel/kms_joiner: switch modeset from uj
 to bj and vice-versa
Date: Fri,  4 Oct 2024 13:18:53 +0530
Message-Id: <20241004074854.470546-1-santhosh.reddy.guddati@intel.com>
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

Add a subtest to validate switching from ultra joiner to big joiner
and vice-versa.

Santhosh Reddy Guddati (1):
  tests/intel/kms_joiner: switch modeset from uj to bj and vice-versa

 tests/intel/kms_joiner.c | 45 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

-- 
2.34.1

