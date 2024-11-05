Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54EC8D1CA30
	for <igt-dev@archiver.kernel.org>; Tue,  5 Nov 2024 05:53:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0B2F10E511;
	Tue,  5 Nov 2024 05:53:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ivKWk9XE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAC0010E12A
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Nov 2024 05:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730786005; x=1762322005;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fConQV6y4UuRwCRCerJut1g+XFrUFq1lAENu4A3HtIE=;
 b=ivKWk9XEPSBtHBhTu74cIrLGOfVn+gUUOIHszCwzbuAnigxYkU5g3vYb
 tWKak05708qSKpDLVIqvqq6qUM6O5Uh6vohBi/ERBa0nAYS1eP+b0kDOy
 7sEJy4N7OIgU8uFIyOCPYZN5vSeRqfQ+8OVp1x3ifKwejfktR57S+6sqh
 4Oc40LnskpF+7UX05ypXdIWalqBFxfK4hZIsJd322WO7VI3kxu0st2OUV
 rJMd2ufFN9djwU+89jQjlNe9prmsq1JPZdYdvi7+Mkb9GsDcsyR5iYLqr
 K0zopoJkhpwxRwnOmKvQAgrKfN5IYW7uhJZaW9ZtQdsGiRzUEshu7Hipf w==;
X-CSE-ConnectionGUID: IqNPNJ/ZQZSP0s+6Nu9hTQ==
X-CSE-MsgGUID: Pe0iccHHQ16jPRgg7q8jWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="33351542"
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; d="scan'208";a="33351542"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 21:53:25 -0800
X-CSE-ConnectionGUID: BJKLufoLRiCm3xF7eiDCzw==
X-CSE-MsgGUID: 4ZZOPvL9QjmxEOADPvhIaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; d="scan'208";a="87815933"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 21:53:24 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 0/3] lib/igt_kmod: Drop legacy kunit integration
Date: Mon,  4 Nov 2024 21:52:52 -0800
Message-ID: <20241105055255.2466236-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
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

Drop the legacy path with the minimum amount of conversion. There's
still a lot of room for simplification in handling the debugfs path/dir,
but that can be done later.

v2: Use igt_require() rather than igt_assert() and add 2 more patches.

Lucas De Marchi (3):
  lib/igt_kmod: Drop legacy kunit fallback
  lib/igt_kmod: Stop handling _kunit suffix
  lib/igt_kmod: Fix leaking subtest name

 lib/igt_kmod.c | 297 ++++---------------------------------------------
 1 file changed, 19 insertions(+), 278 deletions(-)

-- 
2.47.0

