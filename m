Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 388EEE77173
	for <igt-dev@archiver.kernel.org>; Mon,  9 Dec 2024 08:05:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D076E10E4A1;
	Mon,  9 Dec 2024 08:05:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OKtEpO3L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E943510E4A1
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Dec 2024 08:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733731557; x=1765267557;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NgnrTXB9Gj6+H2oB0DkHUywGY3pJGx6bZuOOxhD7yHA=;
 b=OKtEpO3LXl+SYV5sRvetmL7apxdx2Un3m7yIvoXkM/heNtpwjdZQCrDi
 4HlJw1i+OiQ5PSnQlKDGJtJ+rzEJSUiZNUfEIffEMkOpuo2q3y9JMffO6
 dp2y1GWrcQCmVveTsZ3XMzEu6uBBZQT6jO2n5HMC/R+m6kdGQxvwbkZYv
 Gsm8pZAADw//sWp3F2cFwBM0e1CPCmV8QygbqWfyYeChcTZxqwan1XJo7
 n6MvzTv+FjmD+lZDizGKxZRA+4Vc1D4fj7Ew4dm0d9miZCcivQf+ze4st
 JWe6iV8/S7tBJ8HobhiaYdLZepkKum9P7Jr4NB7t69QewtNjEnTokrbw9 A==;
X-CSE-ConnectionGUID: vLWVMS/DTkmVzyaSd1XJKg==
X-CSE-MsgGUID: qzjnwqUpS8SkzZEuOQTMFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="56495708"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; d="scan'208";a="56495708"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 00:05:57 -0800
X-CSE-ConnectionGUID: YygKYHjVT7+44Z6malFdyg==
X-CSE-MsgGUID: NmtQOIK0QNiQ0ewoS9bR5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; d="scan'208";a="99952433"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.211.135.227])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 00:05:56 -0800
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t 0/1] Adjust test documentation to given standard
Date: Mon,  9 Dec 2024 08:05:45 +0000
Message-Id: <20241209080546.557032-1-katarzyna.piecielska@intel.com>
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

Change Category for:
 * tests/intel/xe_exec_sip.c
 * tests/intel/xe_tlb.c

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Katarzyna Piecielska (1):
  tests/intel: Adjust test documentation to given standard

 tests/intel/xe_exec_sip.c | 8 ++++----
 tests/intel/xe_tlb.c      | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.34.1

