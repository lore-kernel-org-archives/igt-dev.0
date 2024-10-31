Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE43ED5CCAB
	for <igt-dev@archiver.kernel.org>; Thu, 31 Oct 2024 00:32:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7038410E076;
	Thu, 31 Oct 2024 00:32:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aLKL00CT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40A2910E076
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Oct 2024 00:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730334725; x=1761870725;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=W6JKh+t5YGOFq6gSO5qZgzD0ajWOraswTKmMyUXoPDY=;
 b=aLKL00CTQf94YPHW9idIZkKW6c7xpBKFlQz4Y4STjBFu0DYWTEsOB7NE
 4e6/roH4pZ8aHgJAtffryM8jnvaHo7zrS5kmqATdM/5WNKd/5o9ZKf44t
 O7+uBllCJROP3PkZFMCM+xEV6BGAM7cH/jkfo4VKXiznvO4sKWarWiOpc
 RCy1uVaDfkXWH8lLiueIT72pSiIaPuCcfCic8uxVXnqAqYyoMFyB0DY3n
 WVwmJH36YTdok6enAsp2stsg1udxbkAra3cYq22aZOlS6CmFJ5Y4qG1Un
 nCdIV2Alpa3vD1QKjbucm9WbBtcIWcTeLdMOQNIFJ6joV53EvZ/PLJdeq w==;
X-CSE-ConnectionGUID: z8hTMwVFSMGu4/Ou5f58HQ==
X-CSE-MsgGUID: iShAEbWKR2aNNfyIPaEDZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="47537561"
X-IronPort-AV: E=Sophos;i="6.11,246,1725346800"; d="scan'208";a="47537561"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2024 17:32:04 -0700
X-CSE-ConnectionGUID: YnAaqM4CTNCNrAU8ooITBA==
X-CSE-MsgGUID: ZvRQxIRAQ/q9b/RMp7u+hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="87262189"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2024 17:32:04 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 0/2] lib/igt_kmod: Drop legacy kunit integration
Date: Wed, 30 Oct 2024 17:31:40 -0700
Message-ID: <20241031003142.863437-1-lucas.demarchi@intel.com>
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

Drop the legacy path with the minimum amount of conversion. There's
still a lot of room for simplification in handling the debugfs path/dir,
but that can be done later.

Lucas De Marchi (2):
  lib/igt_kmod: Drop legacy kunit fallback
  lib/igt_kmod: Simplify kunit_set_filtering()

 lib/igt_kmod.c | 318 +++----------------------------------------------
 1 file changed, 15 insertions(+), 303 deletions(-)

-- 
2.47.0

