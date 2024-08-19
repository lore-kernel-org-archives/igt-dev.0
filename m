Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3741C5321D
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 19:56:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1030410E357;
	Mon, 19 Aug 2024 19:56:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DHzhGenD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82CEE10E355
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 19:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724097374; x=1755633374;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ifxUOA5R5QKHSELgN0Z6JCe8JDq3IwHS6b4f81e2D3o=;
 b=DHzhGenDCeQOS6+zVOup1D76loiJfnn5gq1o60uUC527p50KCrin61rO
 F9c3IoM5guOIf5kwLVoWBpyqQDqlfQOEW3NUKwdSkWrmUtvcXg7i3hAQP
 PDlLDV8kQsMUuclcYMG17MiwLGFOm6zUmL9umvzZBYVXVTnnSlxfmCGBs
 Pbsc8xmsPolBoaZ/j316oganrz5FMQGS0nBCy9IH2142U/VdvU4+NBGLh
 V/8AXYR4yTeQZPp0/YT7J9WRr73gkKN/IS7UYglrFcDO2IgTQX1Foy2di
 sRcvsMc9RVxQGCwwONypwK5x0oqzdU0nj8dKvfKgBYjvxZU9gr4M2afPz A==;
X-CSE-ConnectionGUID: veXOfz5BRMqzB6wqCdwOYQ==
X-CSE-MsgGUID: TUvZEZAbTGK0L9uV0EdQoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="22251045"
X-IronPort-AV: E=Sophos;i="6.10,160,1719903600"; d="scan'208";a="22251045"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 12:56:13 -0700
X-CSE-ConnectionGUID: 7Tv9s6uBRgePEBSdtljnPA==
X-CSE-MsgGUID: 1GNvNIpTRvWEgI6shyUHSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,160,1719903600"; d="scan'208";a="60315543"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 12:56:13 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 0/4] Parse GSC-based HuC firmware layout
Date: Mon, 19 Aug 2024 12:55:56 -0700
Message-ID: <20240819195600.242767-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
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

We previously assumed the manifest entry would be in a fixed position in
the file, which is not correct. This fixes the version reported for
LNL's HuC firmware. It also prepares it to be able to parse GSC's
headers, but there's still some code missing.

Lucas De Marchi (4):
  tools/intel-gfx-fw-info: Annotate abstract method
  tools/intel-gfx-fw-info: Embed fw decoding
  tools/intel-gfx-fw-info: Override kernel types
  tools/intel-gfx-fw-info: Add proper HuC parser

 tools/intel-gfx-fw-info | 191 +++++++++++++++++++++++++++++++---------
 1 file changed, 147 insertions(+), 44 deletions(-)

-- 
2.43.0

