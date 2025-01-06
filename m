Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F859E77188
	for <igt-dev@archiver.kernel.org>; Mon,  6 Jan 2025 03:57:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A14A10E12B;
	Mon,  6 Jan 2025 03:57:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kov5/6ft";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0846A10E12B
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Jan 2025 03:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736135833; x=1767671833;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6gdY51oyrTP8aiP8guC/BI88ZrWKP/1YAVYICExuBGM=;
 b=kov5/6ftVAi4fuV9ULcLJJj63v84f7wBrNN8tG+OzTUjKx1UkgxiAUWp
 +lxoM+S33LgMq3jWoh/BqQPoSQA08xhFeSQ0+9hPzAqbanFi1Fi1MKlY6
 eYLgtpCsuC99Jqda4Piq88zLMgu5yPuONEvXHktaxz2YZfgItN71/Wh3h
 Xl2R4PRvLzTAno98eFJb+Vplkxr1CgixK1CgCPVHSSjkjGY+M4RQhdk+x
 HjXweBddIwnL9HPN0FWMIpLYlB9WmTXvgBxEMmrBl0HUd5S97VBYLpURo
 WU3tmWp9DyMjioKWjImm9uffTVd/ICCfbF7fYqtOrr9IYAwRJSmJjAisU g==;
X-CSE-ConnectionGUID: P4EOGVhES+mP5fD9bIJ/3w==
X-CSE-MsgGUID: lOmuEwx6S7C2TRdjVdxUYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="46858235"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; d="scan'208";a="46858235"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2025 19:57:13 -0800
X-CSE-ConnectionGUID: 8+xCWGdKTjKdpKGhVCLI6A==
X-CSE-MsgGUID: 4d+A50XKT4WPya7gCOBJag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="139669309"
Received: from spottumu-desk.iind.intel.com ([10.145.152.200])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2025 19:57:09 -0800
From: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com, sai.teja.pottumuttu@intel.com,
 lucas.demarchi@intel.com, jonathan.cavitt@intel.com
Subject: [PATCH i-g-t v2 0/2] Miscellaneous OA Refactors
Date: Mon,  6 Jan 2025 09:16:36 +0530
Message-Id: <20250106034638.1746051-1-sai.teja.pottumuttu@intel.com>
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

The patch series cleans up some unused arguments and also removes
hardcoded time heuristics.

Sai Teja Pottumuttu (2):
  tests/intel/xe_oa: Remove unused function arguments
  tests/intel/xe_oa: Remove hardcoded time heuristics

 tests/intel/xe_oa.c | 52 +++++++++++++++++++++++++++++++--------------
 1 file changed, 36 insertions(+), 16 deletions(-)

-- 
2.34.1

