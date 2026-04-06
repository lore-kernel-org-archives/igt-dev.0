Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16A72FB5173
	for <igt-dev@archiver.kernel.org>; Mon,  6 Apr 2026 23:15:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F11B10E056;
	Mon,  6 Apr 2026 23:15:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="POLrWf22";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70F4010E056
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Apr 2026 23:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775517344; x=1807053344;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OzxRnhZniK9F3QngklkxlWeux+IzxA2sJGJCbX9NwT0=;
 b=POLrWf22UZQ7nVjAxh+XLqKiN8756VGbWOE6NmhqgI8zmGr5Y2ElVPHK
 0yGsUug9NYUdQeRHQrGzHyQihITsZpI1G6oMT8qjMIKhNjbQROgsRIWMT
 rvVvaJPxnP8pSMeX31imDJhp74Ie98aLpD9kxKo/UBhUblKc4Gfse4Bc/
 rh3KcPQzS7BUYlIAx8nDhAJLLIEE3E20O72O83qKSUZj+kVu+G/1LAb0j
 fuEHi3t2LpCzxJn4XPSE2zcSBZqHrNyNFAMFfgW46iAqYaRZLHZUA/jE8
 2dKQzFI3wL7wW0Xm/gQhlavRwaTktJVYW6YN/Y/mzw+Ah7NhonpqwLaeU Q==;
X-CSE-ConnectionGUID: d9k/kF9vTK2BdTbeaxRdFQ==
X-CSE-MsgGUID: l8jli1NWR4OwGJVDK3YgoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76660625"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208,223";a="76660625"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 16:15:43 -0700
X-CSE-ConnectionGUID: aeKh+PdEQ8KrdCsH38Yxhg==
X-CSE-MsgGUID: JlvOaDGfTGqtWHJPll1KAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
 d="scan'208,223";a="227164732"
Received: from dut4072bmgfrd.fm.intel.com ([10.105.8.119])
 by orviesa010.jf.intel.com with ESMTP; 06 Apr 2026 16:15:43 -0700
From: Zongyao Bai <zongyao.bai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: x.wang@intel.com,
	Zongyao Bai <zongyao.bai@intel.com>
Subject: [PATCH v3 0/5] Randomize PAT test subset
Date: Mon,  6 Apr 2026 23:15:35 +0000
Message-ID: <20260406231540.3238758-1-zongyao.bai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119231900.3797119-1-zongyao.bai@intel.com>
References: <20251119231900.3797119-1-zongyao.bai@intel.com>
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

From Xe2 onwards, the PAT index has become large, making exhaustive testing 
of all combinations impractical. This series updates xe_pat to use a hybrid 
test selection strategy. It keeps broad coverage and avoiding impractical 
test runtimes.

The PAT test set is built in two parts:
    Mandatory entries: always-tested modes needed for baseline coverage.
    Random entries: additional modes sampled from platform PAT entries to
    extend coverage across runs.

  v2:
     - Modify patch tests/intel/xe_pat: switch PAT tests to igt_srandom()
     - Remove igt_srandom() because it is called in common_init().

  v3:
     - Separate patches according to their intended goals and features.
     - Generate test modes dynamically from platform PAT entries instead of 
       using hardcoded tables (suggested by Xin Wang).
     - Rebase
     - Correct commit headlines

Zongyao Bai (5):
  fixup! tests/intel/xe_pat: limit number of dynamic tests
  fixup! tests/xe: add some vm_bind pat_index tests
  tests/intel/xe_pat: cache and decode PAT entries
  tests/intel/xe_pat: detect wt support from cached PAT entries
  tests/intel/xe_pat: randomly generate test PAT set to cover more PAT
    index

 tests/intel/xe_pat.c | 371 ++++++++++++++++++++++++++++++++-----------
 1 file changed, 275 insertions(+), 96 deletions(-)

-- 
2.43.0

