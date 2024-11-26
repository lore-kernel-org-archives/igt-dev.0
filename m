Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 353CED3B996
	for <igt-dev@archiver.kernel.org>; Tue, 26 Nov 2024 14:24:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D57CC10E8CA;
	Tue, 26 Nov 2024 14:24:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F0iHriEB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2322810E8CA
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Nov 2024 14:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732631082; x=1764167082;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lYk4L5HEv8T35Ozu2wD5atWpoG59ec68pOJ4Zg8Gvbw=;
 b=F0iHriEBVClufiYuvZhX5qCiaRdjcu6WXAE7deJjIwmPtQgS8oAejJvP
 AkeUCfRJ1S2GRcirO9KflDhUXKgM+A/VC72DwjqfG0DOIpx0z+BF/yO4j
 ci7GjfJP7ZNKD5XCIq3cDyKmCyBR4AKibT8Ens+Aj5dwXPL4ir8xgcKOa
 Sc0LsnQjW+oyxxQMS0kBKiCITeOjpKR4IgEhCMux3s+XlnBWDnSLXAkvD
 4NwpCrnOPIMijcq5m2TH9k69qjrheseIUf682ZTi1j7k7neXHtNmeImaX
 tTn9bk3xMXiEZ7YEH49CwrA9KSBlrnMGoPcUOmCMW8tL7ws7Hi7FnnrGV A==;
X-CSE-ConnectionGUID: 92H8rxQ9T2i6RHOZO3RVfQ==
X-CSE-MsgGUID: QS1rcI1uSxSpv3Di4G61tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="33045363"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="33045363"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 06:24:41 -0800
X-CSE-ConnectionGUID: 6n5GwWmVTVKTr2FLEO14gg==
X-CSE-MsgGUID: UtIvjoKJSJOow9nle85p3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="122611965"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 06:24:40 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, ramanaidu.naladala@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v3 0/1] [i-g-t] RFC
 tests/intel/kms_frontbuffer_tracking: Introduce plane-fbc-dr test
Date: Tue, 26 Nov 2024 19:49:57 +0530
Message-Id: <20241126141958.1138489-1-santhosh.reddy.guddati@intel.com>
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

Use the FP_DAMAGE_CLIPS property of the plane for non psr modes
and fill the damaged rectangles on the plane with framebuffer
coordinates and verify that fbc dirty ctl is enabled.

Santhosh Reddy Guddati (1):
  RFC tests/intel/kms_frontbuffer_tracking: Introduce plane-fbc-dr test

 tests/intel/kms_frontbuffer_tracking.c | 233 +++++++++++++++++++++++++
 1 file changed, 233 insertions(+)

-- 
2.34.1

