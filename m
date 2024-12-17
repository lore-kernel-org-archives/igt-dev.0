Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D09E7716A
	for <igt-dev@archiver.kernel.org>; Tue, 17 Dec 2024 06:50:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7098110E42F;
	Tue, 17 Dec 2024 06:50:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jfPiVdn/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADF7F10E414
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Dec 2024 06:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734418225; x=1765954225;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JrtUInUGGyAscSniVrjg4nAIfWuYEtZovz4ezK7nb3I=;
 b=jfPiVdn/GTES/HQYu+73YtdJtzI1luWLnpr8UeZ7ndAIiR3OFGfiv/b0
 BhaQjgVbDY2/GgMefsnoNX1sR5csqt9J6oAO7e16QYkT8ekQ8USzow74k
 WVrXuFQwyLN5sdiglDZsIU9dyi+RfgO2qdbZjsNlQG2gdoHczZR14lb1p
 ZUT/TBryCw3Cld0QHtppdr1Z1RSeMrZepLsyGbj7ihKWNCRQ2luG1kv3b
 d8mnIyhnqPg0ZpykalukxZIWv0+x68nwdbR6N46EMO+Ptn4TKX9pIdbgO
 mVO/YHZpllwvXgHGV4SwDsN/MM7wriNy+HeROb3x8HHxl1ngofWQkUMUI A==;
X-CSE-ConnectionGUID: 0FksLp3hRGeZYsGp8kS0ig==
X-CSE-MsgGUID: UW16WlcVSy+Jcpjc+6YI3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="45523653"
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; d="scan'208";a="45523653"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 22:50:25 -0800
X-CSE-ConnectionGUID: esiZnIFqQqG95Ndjyg8+5Q==
X-CSE-MsgGUID: QXORPJcNQXSKTSYEcE0Aag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; d="scan'208";a="97337476"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 22:50:23 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: arun.r.murthy@intel.com, karthik.b.s@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: RFC Async modifiers 'IN_FORMATS_ASYNC' support
Date: Tue, 17 Dec 2024 12:14:11 +0530
Message-Id: <20241217064413.2301301-1-santhosh.reddy.guddati@intel.com>
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

The new rfc igt changes are wrt the below RFC implementation in KMD.
https://patchwork.freedesktop.org/series/141475/

The idea is to consume the new property exposed to user space and get
the list of supported async modifiers.

Santhosh Reddy Guddati (2):
  lib/igt_kms: Add support to retrieve async modifiers
  tests/kms_async_flips: use in_formats_async for async modifiers

 lib/igt_kms.c           | 39 ++++++++++++++++++++++++++++++++++++++-
 lib/igt_kms.h           |  7 ++++++-
 tests/kms_async_flips.c |  4 ++--
 3 files changed, 46 insertions(+), 4 deletions(-)

-- 
2.34.1

