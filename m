Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F8ACD13D3
	for <igt-dev@archiver.kernel.org>; Thu, 30 Apr 2026 19:02:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37E7E10F41D;
	Thu, 30 Apr 2026 19:02:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mQD8ZdpD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE76910F41D
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Apr 2026 19:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777575700; x=1809111700;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=b6/uv9jQGB98KWJP8Y9XIQM1kztBDSICaxlj0O6LHHM=;
 b=mQD8ZdpDHDizmSzs8qbQNggnTUEUALJIU+OKG7IkgjP27UNd11knj+8n
 btAD/Lws0IcUDQR4CSLbAPYVv7BvZ4i00UjVF3wNIAiKA0HO+gp3+dOgn
 ixNWxOMwN0x7Z7zpgdNK2HLqJ9BqR/Dxb5+mS/Kzw6gm4RxJF+i813N+k
 oclW+XDoLgrmWpS+kznWfmvIqqw5d41WIg1voaPoAW1ozfNYn25RxlA9Y
 8kLndfkaiSsEX/+ntLOPyWnSmhS0+yhQk8iuSEpzy1OSnEXQKiZywrSme
 Pdtgl1CBUa8q9ZMxFE0g2b5O43HhpL5luptwVZDjP3nArhLe0NED7+VDX Q==;
X-CSE-ConnectionGUID: wW2ooeXNTNiLAQCnxCUSQQ==
X-CSE-MsgGUID: L9dvsLzBRF+bqyheMYpNuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="90003569"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="90003569"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 12:01:24 -0700
X-CSE-ConnectionGUID: jOAvb4UdSTK6Nwsufkm5vg==
X-CSE-MsgGUID: dwfL1DKKScyfedVH/uVv5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="234559262"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 12:01:23 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,v6 0/4] Add dsc+bigjoiner subtest
Date: Fri,  1 May 2026 00:39:43 +0530
Message-Id: <20260430190947.2347314-1-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
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

New subtest is added to validate dsc + big/ultra joiner use cases.

Swati Sharma (4):
  tests/intel/kms_joiner_helper: Add igt_get_joined_pipes_name()
  tests/kms_joiner_helper: Add igt_is_joiner_supported_by_source()
  tests/intel/kms_dsc_helper: Add helper func()
  tests/intel/kms_dsc: Add force dsc and joiner test cases

 tests/intel/kms_dsc.c           | 203 +++++++++++++++++++++-----------
 tests/intel/kms_dsc_helper.c    |  54 +++++++++
 tests/intel/kms_dsc_helper.h    |   3 +
 tests/intel/kms_joiner.c        |   8 +-
 tests/intel/kms_joiner_helper.c |  55 +++++++++
 tests/intel/kms_joiner_helper.h |   3 +
 tests/meson.build               |  17 ++-
 7 files changed, 259 insertions(+), 84 deletions(-)

-- 
2.25.1

