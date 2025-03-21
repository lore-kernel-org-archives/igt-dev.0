Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE5AC35FFF
	for <igt-dev@archiver.kernel.org>; Fri, 21 Mar 2025 11:54:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 980C18989E;
	Fri, 21 Mar 2025 11:54:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ebQxI9gW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B92FC8989E
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Mar 2025 11:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742558084; x=1774094084;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5Xos7pW3BbrcbRUOKEgu7FUQMqYrLP23yGMivKR7GeM=;
 b=ebQxI9gWtAK6GQs1jHsitXhY7RkeLfRQWOSQgisLiLg4L16j85Nwv7qt
 cwlBo/EFFBAW+/m2Qq5PBtXLf1uvrwHYcmIOZpHnMYOkhDchGFcGXVVTU
 pPb35lhyJF6433j4B7RkJSXxzFAdOmtLzkwDM7EWnai3HJYIoHayIT0+Q
 8PIycMY929gWCbQtRhtL4t3H9jjAIe77cPzCkjgw/Rb9lMscKolkipNIy
 aHHbqAVaWUKMYQW8UY2MqCWbtYGjEigE8QQU6fr9jyydqyv6pJwfTywRu
 yLqJkYcOYVlXfdyeIelG+iG7J7cbAa0lusfOt43Wul2Efa0Sl2Sy52On/ A==;
X-CSE-ConnectionGUID: JppR33+NSw6kXRYgWpmRcg==
X-CSE-MsgGUID: vgTCr26+SA2YQT8DipVR0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="69173436"
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; d="scan'208";a="69173436"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 04:54:44 -0700
X-CSE-ConnectionGUID: faIc/vH5TuS+lzfEjQO6ng==
X-CSE-MsgGUID: Vel7548cSBOj1vmkMvk/Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; d="scan'208";a="128062707"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 localhost) ([10.245.245.40])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 04:54:42 -0700
From: Pawel Sikora <pawel.sikora@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Zbigniew Kempczynski <zbigniew.kempczynski@intel.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v2 0/1] lib/igt_core: capture logs for child processes
Date: Fri, 21 Mar 2025 12:54:32 +0100
Message-Id: <20250321115433.736043-1-pawel.sikora@linux.intel.com>
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

Pawel Sikora (1):
  lib/igt_core: capture logs for child processes

 lib/igt_core.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

-- 
2.34.1

