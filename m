Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B30C5D216BF
	for <igt-dev@archiver.kernel.org>; Tue, 15 Oct 2024 14:49:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35D8710E59B;
	Tue, 15 Oct 2024 14:49:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GwBso3gn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25C7510E06C
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Oct 2024 14:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729001973; x=1760537973;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SPom8Nb3aqhKyodHzkRmVcURViJpkb7ihcyDpfdIZOo=;
 b=GwBso3gn4v8EeqKgXtXTKdPF34lLgkjAxRuQNxhskP4nyNmJ99o5GLGl
 B/n1Lns7KCE7T8hzEIKC1Y+Q/f0oOOMTt4ZeNgWn99zPUXZDIbrLvFMtA
 hFvLWQAyEzYl6UsIekJ0/OhGAs7NiwRoEFDd8uzuCTNDbzDPF4qBxdnAJ
 5hDKeabUFXGuKHM3INAt8iZHmDr6Bh6JOrh1jj82A533fHUJU/Zkv/ALF
 FmTFlaN/l+e5+XUL5tmwOMHHnq2UE6ITGGQ1DKPbvMu2NNaiUD/TWnOnX
 EDZLaDKgVRZGDpjwxEHrZDHKo8Exwl3gQjmsY7ZA6AuuIJeoySRPPWhgv A==;
X-CSE-ConnectionGUID: glIPTSUIROiE0tc7A3NtcA==
X-CSE-MsgGUID: 9wu9EwxmTRCVKvs4XbLDOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="45872724"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="45872724"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 07:19:31 -0700
X-CSE-ConnectionGUID: /wJdbJAaSWmg/9RhcU4AMA==
X-CSE-MsgGUID: yOB7uCUeQ5elbXjizxqQaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="108642471"
Received: from pgurram-desk.iind.intel.com ([10.145.169.87])
 by fmviesa001.fm.intel.com with ESMTP; 15 Oct 2024 07:19:29 -0700
From: Pravalika Gurram <pravalika.gurram@intel.com>
To: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 sai.gowtham.ch@intel.com, katarzyna.piecielska@intel.com
Cc: Pravalika Gurram <pravalika.gurram@intel.com>
Subject: [PATCH i-g-t 0/2] xe_find_engine_by_class helper
Date: Tue, 15 Oct 2024 19:48:24 +0530
Message-Id: <20241015141826.4186247-1-pravalika.gurram@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 15 Oct 2024 14:49:27 +0000
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

Added "xe_find_engine_by_class" helper function
to query with the required engine class
and get the engine info.

LR mode should be executed on compute or render command streamer.

Pravalika Gurram (2):
  lib/xe/xe_query: xe_find_engine_by_class helper
  tests/intel/xe_exec_compute_mode: LR mode should use command or render

 lib/xe/xe_query.c                  | 22 ++++++++++++++++++++++
 lib/xe/xe_query.h                  |  1 +
 tests/intel/xe_exec_compute_mode.c |  9 ++++++++-
 3 files changed, 31 insertions(+), 1 deletion(-)

-- 
2.34.1

