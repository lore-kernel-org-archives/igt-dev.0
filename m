Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8373D591A5
	for <igt-dev@archiver.kernel.org>; Tue, 19 Nov 2024 05:30:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FF5110E0E4;
	Tue, 19 Nov 2024 05:30:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M2d7vTWv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBE2210E06A
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2024 05:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731994220; x=1763530220;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qFGQAvxzeZmW8dVYesYnL7RtQwyK+bfHXX+YjcsBvMg=;
 b=M2d7vTWvGQnlCevpQ4uRGkTgv4OeDFwyBwFdWyQiZyVQQHS2CpyhAnWw
 H/csogd7U/Rbi8RwHp0z4MjLwhhJ5ulFQSraKeCVXDVMM3FM38qZQEDCY
 KUJIshVKPQdWyFn6yBHFCzsNu1xQnvr7T8tMjxnIt9r+TxLrhje4oNBKR
 oG7KMMVXMjjNHcNj4HoItf++x9imfg+FPidalt9yxAF9Fx9nci6n5Q2yP
 dRTcSi3oGj6HjY6Tsz9h4KL7azn175NeUULxJn3P4uGMLcbDy/HQEHV3X
 IMfXRBlqEre2toJ+/c3sowr3xwxHmTtaZm+VbUNCkB2ckKGYZeOwXrzzo g==;
X-CSE-ConnectionGUID: x9MEPkAsTeSch83JxnhLww==
X-CSE-MsgGUID: EOJxVM12QCS+n4x2wfKDww==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="35884736"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="35884736"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 21:30:19 -0800
X-CSE-ConnectionGUID: fHtzq5OxR3G60HjLsMOHhA==
X-CSE-MsgGUID: yluV+8OBTOGjXMXD6v7P3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="89865095"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 21:30:19 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v4 0/6] lib/igt_kmod: Drop legacy kunit integration
Date: Mon, 18 Nov 2024 21:29:48 -0800
Message-ID: <20241119052954.1993905-1-lucas.demarchi@intel.com>
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

v2: Use igt_require() rather than igt_assert() and add 2 more patches.
v3:
  - Invert the order when checking by suite name
  - Simplify kunit_get_tests(), __igt_kunit() can skip by itself
  - Add a few more patches with refactors and leak fixes.
v4:
  - Replace patch dropping the debugfs_dir argument with one that only
    drops the extra pointer indirection.

Lucas De Marchi (6):
  lib/igt_kmod: Drop legacy kunit fallback
  lib/igt_kmod: Fix leaking subtest name
  lib/igt_kmod: Let the fixture open/close debugfs
  lib/igt_kmod: Stop passing ktap around
  lib/igt_ktap: Just free ktap
  lib/igt_kmod: Do not leak kmod ctx

 lib/igt_kmod.c              | 361 +++++-------------------------------
 lib/igt_ktap.c              |   5 +-
 lib/igt_ktap.h              |   2 +-
 lib/tests/igt_ktap_parser.c |  24 +--
 4 files changed, 64 insertions(+), 328 deletions(-)

-- 
2.47.0

