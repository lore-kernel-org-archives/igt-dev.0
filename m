Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 428FFC35FFF
	for <igt-dev@archiver.kernel.org>; Fri, 21 Mar 2025 12:03:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEA3210E027;
	Fri, 21 Mar 2025 12:03:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CdL+S+gX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B84F10E027
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Mar 2025 12:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742558632; x=1774094632;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Jub9LdBDUFCL1POGFvWf2aL7ABF8a6vO2U2PPjQJbzs=;
 b=CdL+S+gXX7ROwJWWVG3sJpvMYdQyZ/MkBeMLdXo6M8eN0kt9eDD8XkoV
 +FaLjcySHo1Mge9fnSgnyfK46TmZGaUO+59C1gftHmeMMudRXMrlRm9Qa
 SMT4bswJJf8JQsHQShGfUNzjqorhuq1ocrVieRv13N2QHk4MbDuDkbsyp
 W9Oh+qinIdOVU5bHXsuSpxEawR1k4Omkd65l07o/07STI3ELt/lM94dg6
 frRNIEmdljf30m8fFZ4PvsckjlMtd9fHQjxhGbFxbmvra/ymiO3bhFtCg
 /+ZnHTdr12Dq+8b5qHFVdfnOWEiQQ+kFEu4roG9I4N8gRkYD9vZrqt/wB g==;
X-CSE-ConnectionGUID: PEVs4jvZQt2i5rUutEo9vw==
X-CSE-MsgGUID: KUQuLvoVTLWsg0v89eLc2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="43985494"
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; d="scan'208";a="43985494"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 05:03:52 -0700
X-CSE-ConnectionGUID: lbEPvZlkSWuJY0CS6XFOxA==
X-CSE-MsgGUID: ygTYEXfHSd+jgr5SR9Vx6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; d="scan'208";a="128439095"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 localhost) ([10.245.245.40])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 05:03:49 -0700
From: Pawel Sikora <pawel.sikora@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Zbigniew Kempczynski <zbigniew.kempczynski@intel.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v3 0/1] lib/igt_core: capture logs for child processes
Date: Fri, 21 Mar 2025 13:03:43 +0100
Message-Id: <20250321120344.737080-1-pawel.sikora@linux.intel.com>
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

Add a fix for proper log collection from child processes by the IGT runner.

This change addresses the issue of missing logs for child
processes in the IGT runner:
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2178

The '_igt_log_buffer_dump()' function is now called before
exiting child processes, ensuring that logs are properly
captured and not lost when IGT fails and child processes
dump logs before exiting.

Also, removing unnecessary comment about silent exit.

v2: Make the dump conditional based on active comms (Kamil)
v3: add info about closing issue 2178 in xe kernel

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2178

Pawel Sikora (1):
  lib/igt_core: capture logs for child processes

 lib/igt_core.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

-- 
2.34.1

