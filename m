Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6FF010A1E7E
	for <igt-dev@archiver.kernel.org>; Thu, 26 Mar 2026 11:34:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6520310E969;
	Thu, 26 Mar 2026 11:34:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YTdWvpt6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B17710E969
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Mar 2026 11:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774524872; x=1806060872;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Rlv/O/q4feQqFxAh4ApwAVs+LW2iBtKSgun89dmH1R0=;
 b=YTdWvpt6BF0ZEFydSaUYHOKdy5aUesWTRp9yf0EDYZl8VTMOBAvQq/g6
 TztN8/NmHkfJHnoCz3raBVcldIzRpvDmt5ONKBQvfGMjZt7rHmma40ikV
 NiSZosO5kA56nEdFe6chlOeIyOp1O5v5wqZsicGGnMz5DufHO/eBiyXMG
 YrMcwHpStDm8CZT4t2kT1uKBYh5biKecsDsGyoDyjAxQnHGwSS3Kkznq/
 zB9tCbZK6ouP+zbb+/qqYsTPvj2gUeCe0JwjxrWR5zFE1pXBqcOCbMuza
 wNuIMjRs/1oiyIdQmYz8ELWUbWW4aIt9sJwwiNvE3rPd6LQz1nyY/NwPl A==;
X-CSE-ConnectionGUID: VhJFzCnMRwe0o+tLsL0FWg==
X-CSE-MsgGUID: b2mRxCpYStGS6KqQEwo/SQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75647917"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="75647917"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 04:34:32 -0700
X-CSE-ConnectionGUID: XkWo9XPdRxS9fFG+pXFoMw==
X-CSE-MsgGUID: LrZ6Uy2+QfWwQBf+qcuqng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="221675592"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.222])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 04:34:31 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH i-g-t 0/2] Verify PTA entries contains expected values
Date: Thu, 26 Mar 2026 12:34:26 +0100
Message-ID: <20260326113425.520545-4-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

According to spec verify PTA entries in reset / suspend scenarios.
Extending parsing to media gt was necessary as it may contain
different PTA values for main / media gts.

Cc: Matthew Auld <matthew.auld@intel.com>

Zbigniew Kempczyński (2):
  lib/intel_pat: Support other than gt0 during parsing debugfs PAT
  tests/xe_pat: Verify PTA PAT entries contain expected values

 lib/intel_pat.c      |  7 +++-
 lib/intel_pat.h      |  2 +-
 lib/xe/xe_query.c    |  2 +-
 tests/intel/xe_pat.c | 99 +++++++++++++++++++++++++++++++++++++++++++-
 4 files changed, 105 insertions(+), 5 deletions(-)

-- 
2.43.0

