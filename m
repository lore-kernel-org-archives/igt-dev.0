Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41E4BC48BC4
	for <igt-dev@archiver.kernel.org>; Tue, 20 Feb 2024 10:20:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE07610E2E6;
	Tue, 20 Feb 2024 10:20:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RYLgEL/2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CBED10E31B
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Feb 2024 10:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708424399; x=1739960399;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Q+oRd8h+9okvvlw48tJOZwM7A/Fh1JZ+bw1XZ4IOozk=;
 b=RYLgEL/2jFrulY9Wnxcz0shmabLaZHOmNnBVWnFkAhX1vtZa0CSMEZ5F
 bD+ypYm8pBe0LhJmgJKvWjYCPRrBvGM3N7NXuI580cPjsFkeSyXGzvs82
 5jGfsDkge8sk/nZL8gElCvCNPY7wEwR513UwfFjUJ2p3wv961EJWbUTbe
 ZNhGLALR9rc9GxLDyhFqTgmJRZTU66Wpg3pctJNpBwkqwYSHrt9zIYpSx
 0ZNrkrWSSngYeKNZ32WUexymDTIuXK965K8NWU44Dapk9oDyi5IXzsDE+
 K5uz+u17IuOVhIheHjF33fjnAic7unzBHZxPG6x7VukY7obUOmzwg+K+e g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="13923327"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; d="scan'208";a="13923327"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 02:19:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; d="scan'208";a="35760617"
Received: from pwlazlyn-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.80.134])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 02:19:57 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Helen Koike <helen.koike@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Rob Clark <robdclark@chromium.org>
Subject: [PATCH i-g-t v1 0/3] print info in core_getversion
Date: Tue, 20 Feb 2024 11:19:50 +0100
Message-ID: <20240220101953.64371-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.42.0
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

Reorganize core_getversion test, make it a basic subtest which
prints info from ioctl. Add also multigpu subtest for all drm
cards.

Cc: Helen Koike <helen.koike@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Rob Clark <robdclark@chromium.org>

Kamil Konieczny (3):
  tests/core_getversion: convert to subtest
  tests/core_getversion: print version info
  tests/core_getversion: test all drm devices

 tests/core_getversion.c | 50 ++++++++++++++++++++++++++++++++++++-----
 1 file changed, 44 insertions(+), 6 deletions(-)

-- 
2.42.0

