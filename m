Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17425C5321D
	for <igt-dev@archiver.kernel.org>; Mon, 26 Aug 2024 15:27:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBBA910E116;
	Mon, 26 Aug 2024 15:27:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HSLtzAIb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9AE310E080
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Aug 2024 15:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724686020; x=1756222020;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yLXxg3v1sY3KFP3A6GbMOtpa7pKXXepq91U6oAVX3ko=;
 b=HSLtzAIbcOf3jTg5xvhsUfsi605knxe/2UXKkY7mJHwPtF/GM8799gkD
 eEiWATypFOZ9/pDouy4NNl2BrE6AS85C6lH2YeJEwjGE1o+9qaghVrIko
 0ubhWQxIxlAGu6i068+31UxEaxXjdiOoyOKKL4NI0pTIbqm5zM6Y3fb2A
 WAPA1blmPnPPz360KqCECZIs65Sjpt/yZJMmsDgDNBTxojaHtJjxkxTqf
 f6em8dg769ixalytVeTFC3BOK4zeXmKb/DJt1m3CQdG1v/K+x0hCASM2i
 xRmx7GAiuUYH6wp0Es7qgbq1c8oMLfpjg+seXjgQ+Gvoa7xytcbUE4qnS g==;
X-CSE-ConnectionGUID: uvRBaFNSTAmcqjRNBhRArA==
X-CSE-MsgGUID: o0dW171JTwqe/IRxX1/4sQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="26013833"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208";a="26013833"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 08:26:59 -0700
X-CSE-ConnectionGUID: Uoq5n73pT6aYEsOGHEg3wg==
X-CSE-MsgGUID: jFnDWnlESKmhT2lTIkxKpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208";a="63074289"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 08:26:59 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v3 0/6] Parse GSC-based HuC firmware layout
Date: Mon, 26 Aug 2024 08:26:50 -0700
Message-ID: <20240826152656.1306490-1-lucas.demarchi@intel.com>
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

Lucas De Marchi (6):
  tools/intel-gfx-fw-info: Re-format with black
  tools/intel-gfx-fw-info: Annotate abstract method
  tools/intel-gfx-fw-info: Embed fw decoding
  tools/intel-gfx-fw-info: Override kernel types
  tools/intel-gfx-fw-info: do not use bare 'except'
  tools/intel-gfx-fw-info: Add proper HuC parser

 tools/intel-gfx-fw-info | 205 ++++++++++++++++++++++++++++++----------
 1 file changed, 155 insertions(+), 50 deletions(-)

-- 
2.43.0

