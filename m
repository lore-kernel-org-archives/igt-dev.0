Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59487EF0704
	for <igt-dev@archiver.kernel.org>; Tue, 10 Feb 2026 04:57:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 013F310E4B3;
	Tue, 10 Feb 2026 04:57:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dCzkpF1y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EA0E10E4B3
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Feb 2026 04:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770699467; x=1802235467;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uY6goBx2Mar5S/d4toMSUQlzHBS4n0QudQBA172IrKE=;
 b=dCzkpF1yKn2foRl2T0Geg5vF2pl6rM8R7qobLuldYZ+x2UNcKj9EAwRi
 S9YGsVitMu1tdp0XJ5ibksr/Pof/sajlWG4lrF9Pdf5fKBbORd/ulbdZK
 UCeeaVaGxe9Mb/uj62zAblH9Sy48kLT9Q0JrUlKiqHQ/+lXHWljQkU4wo
 hATVvj6eNn6zFtsk6mhDex4QTH4T7JAI5N5zMnsdMeOsKcVFyk0+c7keB
 +6lSi2dXat+AZHb6Wbd/+3p1x8OD7pyRSuex8FD+Ws25GYGvUYziJ3p1R
 WzQv70hoGFPac/VROQXV6ilLO0+BmLau65v5HyNoGWBd2JOfNApw85yX2 A==;
X-CSE-ConnectionGUID: eYGFfLA4RMCtlVqvYgQFuQ==
X-CSE-MsgGUID: vIXKZW4ASgyPVsYNvB7PxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="82925830"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="82925830"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 20:57:46 -0800
X-CSE-ConnectionGUID: ABdL1+TcQU2DrsexDAxrYQ==
X-CSE-MsgGUID: WbqKl347RSyA/WZM3dawQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="211346943"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by fmviesa010.fm.intel.com with ESMTP; 09 Feb 2026 20:57:44 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, ramanaidu.naladala@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v5 0/2] tests/kms_plane: Refine clamping and modifier
 skips
Date: Tue, 10 Feb 2026 10:38:20 +0530
Message-Id: <20260210050822.1095409-1-pranay.samala@intel.com>
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

These changes avoid running source clamping tests on cursor planes and
skip modifier subtests that are not supported on the target display
platform.

Pranay Samala (2):
  tests/kms_plane: Skip cursor plane for source clamping
  tests/kms_plane: Skip unsupported modifiers

 tests/kms_plane.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

-- 
2.34.1

