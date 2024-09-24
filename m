Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94979CF9C6F
	for <igt-dev@archiver.kernel.org>; Tue, 24 Sep 2024 14:35:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B84710E6FF;
	Tue, 24 Sep 2024 14:35:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XnrSyIz1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B45C710E6FF
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Sep 2024 14:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727188559; x=1758724559;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5vkW1/02frH9PXDrY/5DOFARsw8aA18WKH7oh9aeu5I=;
 b=XnrSyIz1MaXfS7I1t5mxqQTWWJC7KuqbeRkOMXQ5407NUF/UWq6uLiOq
 B3hbIiR0Kj7gJtrw3NeR8pZZYhxX8L0pBzEmQuza4gPs+if1plqBhwWAA
 7CxnsIXecPz4t6hR0tMJZBBEiw/HWRaR6p9DF+bBv643iLgy73L0uNuMM
 pHtDp4rioegJXSnKEkK+1ht1kcl8CUYS0E9Y24xaiWoa52QgVzKWeZLq6
 4Jr91Iw2FcqL+3LZVFhzYITX5eeH+USEEo1l536b5XP7SVu1NNoaCPc+M
 ikC0gXlcICY3RYYFZBCbxPITB16MMt5Gm+NGrfxNedEK30EZcQDUPaC1B A==;
X-CSE-ConnectionGUID: Sq1puwn8SziA76Jgk1NJWQ==
X-CSE-MsgGUID: 1rcexBKCTjmCueFHacUQiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="26137192"
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; d="scan'208";a="26137192"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 07:35:58 -0700
X-CSE-ConnectionGUID: sMAE3VZjRFGJU0tETEqbww==
X-CSE-MsgGUID: qZ7fimeWSFq4CsJA8kmMMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; d="scan'208";a="102258297"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 07:35:57 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [i-g-t V2 0/5] Force connector/crtc attrs to default
Date: Tue, 24 Sep 2024 19:56:33 +0530
Message-ID: <20240924142638.238291-1-bhanuprakash.modem@intel.com>
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

Add a mechamisn to force connector/crtc arbitrary attributes
to default on exit.

Bhanuprakash Modem (5):
  lib/igt_kms: Add infra to handle crtc arbitrary attributes
  lib/drrs: Add support to force drrs to default on exit
  lib/dsc: Reset DSC bpc to default on exit
  lib/igt_kms: Force "edid_override" to NULL on exit
  lib/igt_kms: Reset spurious hpd to default on exit

 lib/i915/intel_drrs.c        |  41 ++++----
 lib/igt_dsc.c                |  16 +++
 lib/igt_dsc.h                |   1 +
 lib/igt_kms.c                | 192 ++++++++++++++++++++++++++++++++++-
 lib/igt_kms.h                |   6 ++
 tests/intel/kms_dsc_helper.c |  11 +-
 6 files changed, 246 insertions(+), 21 deletions(-)

-- 
2.43.0

