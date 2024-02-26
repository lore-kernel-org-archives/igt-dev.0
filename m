Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90102C54E51
	for <igt-dev@archiver.kernel.org>; Mon, 26 Feb 2024 23:59:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D3C010E833;
	Mon, 26 Feb 2024 23:59:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gB564Nlv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AC0610E577
 for <IGT-Dev@lists.freedesktop.org>; Mon, 26 Feb 2024 23:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708991981; x=1740527981;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=B/CuxzFfXHiZp5RgSQFJPf8DeRird7wgKROxqL1imjE=;
 b=gB564NlvS7tlcLYdQK+XhenXz7LHpNk6QFbFSjxrm3tNArT/rNoQoGMC
 HaTQmYF8wVgjXQw97Bmsf7jN7jcHeLzIrAo00c1xelgian82ZqeEZgjgl
 pj5Th61CXFum/RSJY/pUwri92Muz+5jqSZPscdINDpdmHJvOZMqRnOD17
 bZK0fxbVsh2IMd7EHj3K9AXBuvc3dXwjilFWRSL7poHDBretacXDCm9ob
 MkuLM8tcjI0CZxDH/pm+yfmKN1afkaXWD21GhT7WIBeyfYnxrNpho5z8h
 GjKnwC/6Rn9+kkFk8zKcQH2IkR1NtNOk1QPrY5lkwNDmR4cqzL4fwIxLm Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="3471585"
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="3471585"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 15:59:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="7050614"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa006.fm.intel.com with ESMTP; 26 Feb 2024 15:59:40 -0800
From: John.C.Harrison@Intel.com
To: IGT-Dev@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH i-g-t 0/2] More updates for MTL workarounds
Date: Mon, 26 Feb 2024 15:57:34 -0800
Message-ID: <20240226235737.2150915-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

Upate another test to not fail when a MTL workaround is enabled. Also
go back and add the w/a number to a previous one.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (1):
  tests/intel/gem_exec_schedule: Add w/a tag to prior update for MTL
    RCS/CCS w/a

johnharr (1):
  tests/intel/gem_spin_batch: Skip compute engines on MTL due to w/a

 tests/intel/gem_exec_schedule.c |  1 +
 tests/intel/gem_spin_batch.c    | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)

-- 
2.43.0

