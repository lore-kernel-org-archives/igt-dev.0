Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D95C4D49208
	for <igt-dev@archiver.kernel.org>; Mon, 18 Nov 2024 10:10:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FE0D10E1A4;
	Mon, 18 Nov 2024 10:10:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a3CIBap3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 545AB10E1A4
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Nov 2024 10:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731924640; x=1763460640;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KNZ06Pvw/z1lJUe+Gu1M9ME7qI6Fwut7SekMcRQtjD4=;
 b=a3CIBap31jT4r22JRlvb//LXtkmWAMDmjl3sCl9b2fr6KlnCHxMYKj/H
 TLfKFPHYEeu/9UvwEEAE7/VjiTPFSji7kapyR7i9sozFM6Hma4hFiWQSE
 DOuG0f6I6X+4DDOKv+vihpIKjLqLhBFtqOuFsEJd0H7F1rzrlt0vOQW3E
 x5ir3COibhDMNLm8bV9V1Cd1005uKL5i58D8TfOai2PyYRv9SVx+Kax6A
 GzZ6zI8t+3tO7g6LQ+V+HdBL7HnhyQe/mVc82TiB1r38v/cGNosoMowan
 LuJ490gUUelvJNlzajTjFbg4L48cp1Nec0F1Fv1/XyhWWqHXzxtAnuyN3 w==;
X-CSE-ConnectionGUID: WKTRPF4MSnSPWdrLa+1enA==
X-CSE-MsgGUID: PrbtjBLSTguXQzDfNq/vzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="31809906"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="31809906"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 02:10:40 -0800
X-CSE-ConnectionGUID: zvGmKImqQ4298bIflPSMPw==
X-CSE-MsgGUID: wyH1dqVZQAytgM3OQhUjkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="94272102"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 02:10:38 -0800
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	swati2.sharma@intel.com
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [i-g-t V3 0/4] Force connector/crtc attrs to default
Date: Mon, 18 Nov 2024 15:29:44 +0530
Message-ID: <20241118095948.2017893-1-bhanuprakash.modem@intel.com>
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

Bhanuprakash Modem (4):
  lib/igt_kms: Add infra to handle crtc arbitrary attributes
  lib/drrs: Add support to force drrs to default on exit
  lib/dsc: Reset DSC bpc to default on exit
  lib/igt_kms: Reset spurious hpd to default on exit

 lib/i915/intel_drrs.c        |  41 ++++----
 lib/igt_dsc.c                |  16 +++
 lib/igt_dsc.h                |   1 +
 lib/igt_kms.c                | 188 +++++++++++++++++++++++++++++++++++
 lib/igt_kms.h                |   6 ++
 tests/intel/kms_dsc_helper.c |  11 +-
 6 files changed, 243 insertions(+), 20 deletions(-)

-- 
2.43.0

