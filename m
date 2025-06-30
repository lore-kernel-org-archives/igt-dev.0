Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C928C8302D
	for <igt-dev@archiver.kernel.org>; Mon, 30 Jun 2025 16:35:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3B8E10E050;
	Mon, 30 Jun 2025 16:35:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AkhUxiXx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79C7810E050
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jun 2025 16:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751301348; x=1782837348;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qLjadZ/ngmdhBwqmFaxhzDGbU1T//M2mXNr525BCXRM=;
 b=AkhUxiXxeDnfj26UpTYxNNzphFB6dJia0kgszrKWNCDMN3tJCVsRev+P
 S1N/5SXiH12NA6YqbWnlUat+2zN7uXO4o81LvpNXiixM4Mzjscnf5VbSg
 6Gl31TxF5LwlTvCwBR4QhD83CW3mF4VwIHGoGjyRRH9L9P4t9c31erJHR
 Pwx0ZAKeoOSNysJv16WPROK2bKUTF/YUqtD5H7OObYBGZAxMVaO4zd9nP
 tJhOPWqaETmmSlQgP5KjG/VbXVcydCXzrrun93+B5EtOOab/uWRSqlKFc
 T1p6go8eJiPQ6ABKtETkBo4HPugI98uusl0CFRWvSNKetb4Qj7eskqk11 A==;
X-CSE-ConnectionGUID: vfjvVo4WQEWhRTbKD4hu1g==
X-CSE-MsgGUID: Apfuh7PJSMGjhxUQ+kJxhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="71101948"
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; d="scan'208";a="71101948"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 09:35:47 -0700
X-CSE-ConnectionGUID: iUzpT4C6Sg+VwIFUJRnwww==
X-CSE-MsgGUID: FrTBfiwiRL2UfAai68GnpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; d="scan'208";a="159226397"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 09:35:47 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH i-g-t 0/7] Future-proof GT ID handling for Xe
Date: Mon, 30 Jun 2025 09:35:30 -0700
Message-ID: <20250630163529.2096664-9-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.49.0
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

Current Intel platforms fall into one of three cases:
 * Single tile, single GT (primary)
 * Multiple tiles, one GT each (primary)
 * Single tile, two GTs (primary+media)

In all three cases, the GTs are always consecutive (0 and 1) and the
GT's uapi ID matches its index in the xe_query GT list.  Future
platforms could potentially have multiple tiles with multiple GTs each,
and/or could introduce new types of GTs.  In either case, it's possible
that there might be "holes" in the set of GT IDs returned by the GT
query (e.g., 0, 2, 3 if a multi-tile platform only media on the second
tile; or 0, 2 if a single-tile platform introduced a new type of GT, but
lacked media).

We need to break IGT's assumption that the uapi ID used to represent a
GT always matches its index in the GT query.  This series shouldn't have
any functional impact on today's Intel platforms; the goal is to just
future-proof the code for new types of platforms that could show up in
the future.  Similar refactoring and cleanup is happening on the xe.ko
side at https://patchwork.freedesktop.org/series/150192/  although this
series does not depend on the kernel work.


Matt Roper (7):
  lib/xe: Track valid GT IDs
  lib/xe: Don't assume GT ID matches location in GT query list
  lib/xe: Populate vram_size[] and visible_vram_size[] by GT ID
  lib/xe: Ensure GT loops iterate over all GTs properly
  tests/intel/xe_query: Look up GT reference clock correctly
  lib/xe: Add xe_dev_max_gt()
  tests/xe: Don't assume max GT ID is num_gt - 1

 lib/xe/xe_query.c        | 78 ++++++++++++++++++++++++++++++----------
 lib/xe/xe_query.h        | 10 ++++--
 lib/xe/xe_util.c         |  7 ++--
 tests/intel/xe_compute.c | 47 ++++++++++++------------
 tests/intel/xe_gt_freq.c |  8 ++---
 tests/intel/xe_query.c   | 13 +++----
 6 files changed, 103 insertions(+), 60 deletions(-)

-- 
2.49.0

