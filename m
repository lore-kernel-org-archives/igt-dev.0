Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD1BD711D7
	for <igt-dev@archiver.kernel.org>; Wed, 20 Nov 2024 18:32:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7E1F10E115;
	Wed, 20 Nov 2024 18:32:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MASPWl+o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D67410E115
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Nov 2024 18:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732127536; x=1763663536;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qSg9BQgB5khJL/fqWwIcTR5vjB5H7/PcSqNPHrh4OOk=;
 b=MASPWl+oDVzNOP1MR38KVpuhJ6c6bAnD0QraGUY/8UL++twgntfSTlRN
 arg/YqdFxmCnemhpxCgRUK+wS4wDSmwwFnBAFFrZ8LFPgnFoBo5PAGyD+
 paVurAS+UVjRoDnqxxdVk7H26W+uTw0bnjXvBjBa148vj9RtYFa7u4iYA
 +FTPJPwuDkmD/zHtD5OSYdUqEd2zagOm2Yh0y4ExkvgZXniZekNmwgCTu
 ZKJ9v/3wfLy+K7EcXq2aSU12UoW+icXkeUZNlV08tvVENm0BCWkGkhDmU
 3jj8ZVJHhVw828h1KEekCub5hDzKe3ybcGVt+KTLfuKcU9C62iU+9vlgC A==;
X-CSE-ConnectionGUID: TTEvRXYvTnewMgsX1m9/lQ==
X-CSE-MsgGUID: 5MnAeSVmRNiDH25hCD5gmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="54705890"
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; d="scan'208";a="54705890"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 10:32:15 -0800
X-CSE-ConnectionGUID: 4+5yVI0ZTtuPnF10yEA6aw==
X-CSE-MsgGUID: jOgCMeCFQY6sjIC1VBMBNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; d="scan'208";a="95067368"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.244.196])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 10:32:13 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Petri Latvala <adrinael@adrinael.net>, Karol Krol <karol.krol@intel.com>,
 Ewelina Musial <ewelina.musial@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: [PATCH i-g-t v2 0/4] runner: Allow limits at dumping dmesg
Date: Wed, 20 Nov 2024 19:32:04 +0100
Message-ID: <20241120183208.146299-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.47.0
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

There are few patches, first is a check for write error which could
happen at full disk, second is a revised solution to a problem with
dmesg dumping exeeding disk limit in runner. Also while at this
inform user when an actual disklimit occurred and correct one error
path.

Previous proposed solution: runner: check disk limit at dumping kmsg
https://patchwork.freedesktop.org/series/114353/

Gitlab issue: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/129

v2: correct size in case of no disk limits used,
  also correct one error path and inform user when an actual disk
  limiting could affect what is written in log (Kamil)

Cc: Petri Latvala <adrinael@adrinael.net>
Cc: Karol Krol <karol.krol@intel.com>
Cc: Ewelina Musial <ewelina.musial@intel.com>
Cc: Krzysztof Karas <krzysztof.karas@intel.com>

Kamil Konieczny (4):
  runner/executor: Check for error at writing dmesg dump
  runner/executor: Limit reading dmesg to chunks
  runner/executor: Fix error handling at terminating test
  runner/executor: Inform about terminating

 runner/executor.c | 107 +++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 92 insertions(+), 15 deletions(-)

-- 
2.47.0

