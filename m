Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C46D43363
	for <igt-dev@archiver.kernel.org>; Fri, 12 Dec 2025 07:36:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AB1D10E284;
	Fri, 12 Dec 2025 07:36:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YcyQk4L2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE0BB10E284
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Dec 2025 07:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765524991; x=1797060991;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hsV4ywN74CIcZSdw3xkTgqQrJrjz6aODltHUC6M/jL4=;
 b=YcyQk4L2I+j6LV67SrUm03O7JcBYkUDDPAVD3BXeQuCICgLGQalyZ32k
 zqcAPK6SRjQge5jFBZiEFIqii5BPow54bzEx19WUG1XTnz9LckC3MOlJJ
 P+JnysTi4IjxdF4jLo1QqixYjfDsed36vnoX2aBjCJLEQ9i2ypvxh3nCv
 q1fhqET9Aqyjblll40BESYMT0xMVQJFt1py86hR38pKKXLczvgWqES6I8
 fa5MB3Tz6egZUPoFPTGLVoZyJpUSL/mjnfKQwZRfmbYCPUFzWKwEn5Eca
 kxgSsfy5fJKYJpbEWe+fpN2oy7PXhy9R5Kfs1OyUrEX8yNNW1j/CNk5zm A==;
X-CSE-ConnectionGUID: 6MBY+RsyS7+W8/5E6oK5RQ==
X-CSE-MsgGUID: WZkhrdC4R3auaPsaoaU/zA==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="90164627"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="90164627"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 23:36:31 -0800
X-CSE-ConnectionGUID: 5nnw+mSHSdqBYnqeir2TfA==
X-CSE-MsgGUID: 3gJ7B4NQQ3Csmh7P/yVCLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="197069112"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.95])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 23:36:30 -0800
From: Pawel Sikora <pawel.sikora@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v2 0/1] docs: update for platform-neutrality
Date: Fri, 12 Dec 2025 08:36:22 +0100
Message-ID: <20251212073623.337981-1-pawel.sikora@intel.com>
X-Mailer: git-send-email 2.51.0
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

Dear IGT Maintainers,
I am submitting this patch to update the documentation to better
reflect IGT's current multi-platform scope.

While IGT historically focused primarily on Intel GPU testing, 
the project has evolved to support multiple GPU platforms. 
However, some documentation still contains language that suggests 
Intel GPUs remain the primary or exclusive focus, which may mislead
new contributors and users about IGT's current capabilities and direction.

This patch updates Intel-specific language in the documentation
to use more platform-neutral terminology.

v2:
 - minor corrections suggested by Kamil

Kind regards, 
Pawel

Pawel Sikora (1):
  docs: fix intel-specific descriptions

 docs/faq.md       | 15 +++++++++++----
 docs/platforms.md | 23 ++++++++++++++---------
 2 files changed, 25 insertions(+), 13 deletions(-)

-- 
2.51.0

