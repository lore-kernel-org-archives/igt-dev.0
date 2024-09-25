Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD4DC369C8
	for <igt-dev@archiver.kernel.org>; Wed, 25 Sep 2024 10:33:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0120410E7E5;
	Wed, 25 Sep 2024 10:33:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PWuSBP+e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CCF110E7E5
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Sep 2024 10:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727260434; x=1758796434;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LEzYqNS13ugVwRWUY3m35YDeS860KFNB1HsNMGzrh98=;
 b=PWuSBP+eb2eDt1BuvtcAe9UEh73C1m4KtheLQmy5WPxrivZKRptjY7se
 bW0F6pToHkNBxHaNJdccrlD57LLGtWOKyfuw0G4zj383PnxcUkGGq5THr
 Q5NrfmWNmHNmXX2OfgNYtZIgLDbTufoEsTUJI8wwHQwyaO+XkjlOGpW+l
 Ne6AOIyuh5HM9J73pjEduOnzJJLk7lj7xGayZpDbNCyhSse0r8cmC4ADo
 GE94eNdzcXlCsuSjFrfffJ60k/L/QqFmIYtGsYEFGgjTAxus/IKXaPxyN
 NmxGm5oWL3CDPG0CCkIx+ZzgXMhxfemvhaAyLmFtJDHsx0168eEDbDit6 g==;
X-CSE-ConnectionGUID: VJ4uJr7uSi+XFd7t0E9kMQ==
X-CSE-MsgGUID: 0aVg7eDiSIiXKi5F6vYUbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="26247940"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="26247940"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 03:33:54 -0700
X-CSE-ConnectionGUID: GZXk4cxQRsKBU+idDTptwg==
X-CSE-MsgGUID: VLGLIErwR7eKQrAr0Ba1fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="76658998"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 03:33:52 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1 0/2] tests/kms_plane_scaling: Cdclk exceeds max Cdclk
 issue fix
Date: Wed, 25 Sep 2024 16:03:11 +0530
Message-ID: <20240925103313.2126359-1-ramanaidu.naladala@intel.com>
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

This change will solve the cdclk exceeds max cdclk issue.

Naladala Ramanaidu (2):
  tests/kms_plane_scaling: Add mode override in scaling test
  HAX patch do not merge

 tests/intel-ci/fast-feedback.testlist    | 196 +++------------
 tests/intel-ci/xe-fast-feedback.testlist | 307 +++--------------------
 tests/kms_plane_scaling.c                |   1 +
 3 files changed, 67 insertions(+), 437 deletions(-)

-- 
2.43.0

