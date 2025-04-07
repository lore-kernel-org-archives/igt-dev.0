Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05787C3DA4A
	for <igt-dev@archiver.kernel.org>; Mon,  7 Apr 2025 14:54:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F0EB10E4CC;
	Mon,  7 Apr 2025 14:53:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YdcGbQqW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB84E10E4CC
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Apr 2025 14:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744037636; x=1775573636;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4RFmSE0EsOdtIXMlTLBIWpPQ912jJWxO+Pzz9Dvp02M=;
 b=YdcGbQqWDVm5AT15Ertkx5U/6INMLbn2vV2oAT63p7kq9JpBFoPlZ9Mp
 +r/H0Q7PTheIe7oEqF5musHiWCh2ZKyH67VmnlA/XpUMBQ08A6A7ZKdqR
 lJkBRvC9v+mJucu3aEo1aYHcTOYlinollDMePE9hs9fE9Wo7XVAENSdM5
 smN5k/6a/vX7MUvy2ETEBpel2yP1tsNf/ijBxs4v6uDlBDcd5TV9HIOCB
 ahOmYy/JIevWOD6mBxCIZF65IHTwz/lG6rBRG330ccbxK5zJx6tEHinLa
 GZ+3q0ThsqnEvcJ3i9AdrKxRoxL0iBC95JDPP/sRtcAJ+a0MBgdKJi6iA Q==;
X-CSE-ConnectionGUID: ou15enyBTwmUqAPuc4d3YQ==
X-CSE-MsgGUID: yrJrSc9YQt2at6kZiaf8+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45318579"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="45318579"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 07:53:55 -0700
X-CSE-ConnectionGUID: TtnYWPq/TGOzwfJ513t9wA==
X-CSE-MsgGUID: 7wNr6c+sR0qFVjsCT4QDcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="127729487"
Received: from tmistat-dev.igk.intel.com ([10.211.135.226])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 07:53:54 -0700
From: Jakub Kolakowski <jakub1.kolakowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t 0/2] check for display before cursor size
Date: Mon,  7 Apr 2025 14:45:02 +0000
Message-Id: <20250407144504.2907700-1-jakub1.kolakowski@intel.com>
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

Currently in kms_cursor_edge_walk and kms_plane_cursor tests
igt_display_require() and igt_display_require_output() are
called after trying to get cursor width and height which leads to
fails on configurations that do not have display enabled.
Move igt_display_require() and igt_display_require_output() before
getting cursor width and height so instead tests will skip on
configurations without display.
For kms_cursor_edge_walk this also applies to igt_require_pipe_crc()
helper.

Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>

Jakub Kolakowski (2):
  tests/kms_plane_cursor: check for display before cursor size
  tests/kms_cursor_edge_walk: check for display and pipe CRC before
    cursor size

 tests/kms_cursor_edge_walk.c | 10 +++++-----
 tests/kms_plane_cursor.c     | 10 +++++-----
 2 files changed, 10 insertions(+), 10 deletions(-)

-- 
2.34.1

