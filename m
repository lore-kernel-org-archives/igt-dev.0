Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 155A9D4417C
	for <igt-dev@archiver.kernel.org>; Fri, 12 Dec 2025 11:03:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2B1010E2FB;
	Fri, 12 Dec 2025 11:03:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ISPwgZWF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A48A10E2FB
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Dec 2025 11:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765537390; x=1797073390;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=M1wxq8BTkW1VCHD/weVty2ud4HLPnF9l5WAIkP7Dmk0=;
 b=ISPwgZWFWCbC1maIa6MNkyxvC/0bwfJAyFs+bHAyVT8qM8NZFjVlScSD
 dXftn5Cswnag9pRV/dWnZggMKXTGDUBLUIfssqYBZDE2UUzZOZrUj59U5
 bA568gh11zN1x1uouYsb31jBUyHTvUBUWD2Fjzf4W1QvXNvtJz1GuYq7M
 BI+e3a39bs19brGVv4pmpBTfu1HJF0aX9KPXpxRNAOy2iCEuLWtQ2tm/q
 wVtF+rKw0Lbm32vrAiTna1CrRzmlxtf5z0aFQt5yy/K8NjAVLpHIFP4AI
 FTv96yUtSPAU3sj59qdqQ3LFXQw1M4h40O/NEBWn7TMSu1S4VBUheq2Tt g==;
X-CSE-ConnectionGUID: 7e2Ycd6vTlSGDjpuwOf9RQ==
X-CSE-MsgGUID: efw+r0J1QeebL7nK0vFAuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="78905029"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="78905029"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 03:03:10 -0800
X-CSE-ConnectionGUID: dtaaWap8QXewkSuICPlYvw==
X-CSE-MsgGUID: 6h9r0c9RSiSF5/vcaeOq0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="196662323"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.95])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 03:03:09 -0800
From: Pawel Sikora <pawel.sikora@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v4 0/1] docs: update for platform-neutrality
Date: Fri, 12 Dec 2025 12:02:59 +0100
Message-ID: <20251212110301.342433-1-pawel.sikora@intel.com>
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

Kind regards, 
Pawel

Pawel Sikora (1):
  docs: fix intel-specific descriptions

 docs/faq.md       | 15 +++++++++++----
 docs/platforms.md | 34 ++++++++++++++++++++--------------
 2 files changed, 31 insertions(+), 18 deletions(-)

-- 
2.51.0

