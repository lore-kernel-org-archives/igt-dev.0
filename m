Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D33BAC02188
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jan 2025 23:18:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B00E10E095;
	Fri, 17 Jan 2025 23:18:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j6UJQRjv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C31E10E095
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jan 2025 23:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737155890; x=1768691890;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1kG55AapD4jyTd134hYXGnVHtH1WcV54cb+xmypPWXQ=;
 b=j6UJQRjvlO/KAfQJxQHN+SSvH7pFB2NZaqrFbcY9+pAfEa4OFgGo9XPC
 UbfUzTmvTjs7yepfnP5hDo4ZocEx98n5tosezxJBUA8q150ww6clEJd/S
 bTbQa4qToQyDv689XdyZ883CwKAmT7iF/NxJGMeGeLxBMRBxGpXMobLQ0
 gp4rDRitgY6DFciSvGW9gGJr6QV9bWyPMah36AwjWuLGkZvLHeYpcQYkQ
 qoiLKphSJaDioV+jQGz0KveJAL++uIa6ReiD3gaKFba2d8qsprvvkSxgc
 CokIE/BEaD8p1upghqBskRvQ9Y8mIYeMXCylcHQ6QhteW1Q8d45m2IfJS A==;
X-CSE-ConnectionGUID: yYS0xtr6QhuKhW6OCRNujQ==
X-CSE-MsgGUID: zVOTga0tRdqZXRDchwsmgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="37627811"
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; d="scan'208";a="37627811"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2025 15:18:10 -0800
X-CSE-ConnectionGUID: Q6PprCmrQTK43oZH+l/kaA==
X-CSE-MsgGUID: YPgyOBQqRiaCvv4+47uERw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="106819351"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2025 15:18:10 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 0/5] Add igt_runner's cmdline to results
Date: Fri, 17 Jan 2025 15:17:41 -0800
Message-ID: <20250117231751.429703-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.0
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

Help devs to reproduce what CI is running by dumping what is the command
line being used. While it's true that in the shard case we don't have
the testlist, just seeing the right incantation of command line is a
great improvement.

I plan to follow this with the env vars, but first want to get this
in. It seems we already have an environment.txt saved, however that
doesn't contain the igt_runner's env, only options passed via -e to
igt_runner which is then forwarded to each test. I'm wondering if this
is a source of bugs when using igt_resume:  if the environment doesn't
match, it will run with different options on each execution.

Lucas De Marchi (5):
  runner/settings: Deduplicate cleanup
  runner/settings: Use wrapper functions for each type
  runner/settings: Drop extra strdup
  runner/settings: Serialize command line
  runner/resultgen: Add cmdline to results.json

 runner/resultgen.c |   7 ++-
 runner/settings.c  | 114 +++++++++++++++++++++++++++++++--------------
 runner/settings.h  |   4 ++
 3 files changed, 90 insertions(+), 35 deletions(-)

-- 
2.48.0

