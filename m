Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4DDAC48BEB
	for <igt-dev@archiver.kernel.org>; Wed, 14 Feb 2024 10:24:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C6C110E80C;
	Wed, 14 Feb 2024 10:24:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KOeTc+lV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94E5510E775
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Feb 2024 10:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707906284; x=1739442284;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/wlyxE0+EdbtdUBer8HhkJeaXx45HSKe2xmIZqvqinA=;
 b=KOeTc+lVIMZGgB6roo0zUs3ZngkyeiFYD+Idxea4YNxnsaNFTUTWIR5g
 TkUlwC752r1wKh8TLPDRFtNqlfsht1iWoJjP+6zcnh5MwsnApPgENlVxi
 AgQ7Ddf1DR7PEzHG8VQ8Cgxt9V4MPPQ09Q6srDujWTIAaSADA1qk/3t4y
 OTAtdQYgpTqGzf474xQjVFqRbR33HyIk3A42uxklYuvkbUjkq+5bVyyk0
 mHySGjLmo2pwDEJFopcTMnAiYR7FF3+IwldocO6NuMBWetGHAVly4wvTb
 eCav+bcVx2VwG/evTwIQEm96C4wkYhfa+mz50vEZF+dLGWkw5tbDjITnA w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="13332143"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; d="scan'208";a="13332143"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 02:24:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; d="scan'208";a="26308540"
Received: from eseidenw-mobl4.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.249.43.30])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 02:24:43 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t,v2 0/2] Add tests to query firmware version
Date: Wed, 14 Feb 2024 10:24:33 +0000
Message-Id: <20240214102435.7-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
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

This tests the kernel series https://patchwork.freedesktop.org/series/129640/.

v2: Address comments on HuC test

Francois Dugast (2):
  drm-uapi/xe: Add test to query GuC firmware submission version
  drm-uapi/xe: Add test to query HuC firmware version

 include/drm-uapi/xe_drm.h |  32 ++++++++
 tests/intel/xe_query.c    | 154 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 186 insertions(+)

-- 
2.34.1

