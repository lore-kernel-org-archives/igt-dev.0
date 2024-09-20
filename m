Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A97CF58E6
	for <igt-dev@archiver.kernel.org>; Fri, 20 Sep 2024 07:56:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA9FB10E7C6;
	Fri, 20 Sep 2024 07:56:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dUsDP6GC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28A5A10E7C6
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Sep 2024 07:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726818996; x=1758354996;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4CFBG8tY6s1AXrieeJx7mj1c2f4kVrYtKb1a8UyriRw=;
 b=dUsDP6GCF+HxXffUPnYsw73sOFFv0j8CrpVqUNrW3YVfXqfuSFKzA0ci
 DYSwRvqflb7VCsNwGz0hXXyJVR2mgFpbd8UEp97obuVRUgh7AKnElKaxp
 nUWMejhMu9S0Fab7ts6Ukd0x2+OryZiDh1g94xYC4fgJt2ExZOaiSD+fO
 JZ+b4LRjHtzTheEz+7XNQa+KA5qlYr5+BQS7bsyt/vFZ0iKlL+v6YbSq4
 bL2lqg2TcxXvXmwPPRBJ9YtQ+uGgC56XPPBihoe1dj618OKYF/BZK/KSD
 uNtMmUIHr+m2OGq3Clk5j8ev8ckn6bMOuQAvier6+EoR/JzxUEmhLVHMK Q==;
X-CSE-ConnectionGUID: PFJWottqTgqwJ24v4HpZfg==
X-CSE-MsgGUID: oCHwbq8tRvih9n+T76GXSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="25290597"
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="25290597"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 00:56:35 -0700
X-CSE-ConnectionGUID: yjKqbQvLT6iOs41hk4ilHA==
X-CSE-MsgGUID: E7hC+7EeSpexGmVSzfIZFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="70658693"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 00:56:33 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, karthik.b.s@intel.com, vandita.kulkarni@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v3 0/2] git format-patch -o my-series
 HEAD...origin/master -v6 --cover-letter
Date: Fri, 20 Sep 2024 13:26:16 +0530
Message-Id: <20240920075618.633792-1-santhosh.reddy.guddati@intel.com>
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

This patch introduces a new subtest to validate async flips during
suspend and resume cycle.

Santhosh Reddy Guddati (2):
  tests/kms_async_flips: Async flips suspend resume test
  HAX patch do not merge

 tests/intel-ci/fast-feedback.testlist    | 178 +-------------
 tests/intel-ci/xe-fast-feedback.testlist | 284 +----------------------
 tests/kms_async_flips.c                  |  15 ++
 3 files changed, 29 insertions(+), 448 deletions(-)

-- 
2.34.1

