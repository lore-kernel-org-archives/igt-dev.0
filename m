Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D401C02183
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jan 2025 14:06:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50FB110E97D;
	Thu, 16 Jan 2025 14:06:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X4nmsczy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AFC810E97D
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jan 2025 14:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737036415; x=1768572415;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eXhzdbgXurR3cL4+OWF38SDiunkNEks77Lh56m1frWg=;
 b=X4nmsczysKFWhXMhv2Prz05dRkC4JfjA7448Ok0oMBwh5DoUG0dp2Xnv
 lEG9AERtHv29YSYC9S+mXQxkIKaynkPSGDHd02KBULFQmrAy20rCgmwPV
 c71Lmb1Cm59GjDF8XoBljUOIP2+AikF9lMYntL9MDPJ3GH1vsbUfxLq4S
 BU7RmP8pljcZTqn+Ns2VHk3MVOh3oLa2x4JsaaIiy4CTzxCYanSDNqOWY
 NbBynVcCziBygq4PJnyBbbuFWzLzZUpIceLqUMhMO5ke0kkleXaALqT1u
 8puvV0s1CJmICAtKL0KbAdfCPbgB39gPdTbgAiIG84mlyZ3GtyvVFA8Hw w==;
X-CSE-ConnectionGUID: TmBDunBZRG2UZ7/Y7kwFwQ==
X-CSE-MsgGUID: VmuroFhzT7KgM5g2uXNzCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="25023564"
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; d="scan'208";a="25023564"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 06:06:55 -0800
X-CSE-ConnectionGUID: ZkKOnROsS5i3DD6haySVdg==
X-CSE-MsgGUID: oZl1wjBqQCGwMzoRxPnpjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="105963583"
Received: from spottumu-desk.iind.intel.com ([10.145.152.200])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 06:06:53 -0800
From: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com,
	sai.teja.pottumuttu@intel.com
Subject: [PATCH i-g-t v2 0/1] Add test for configurable OA buffer size
Date: Thu, 16 Jan 2025 19:24:55 +0530
Message-Id: <20250116135456.4066677-1-sai.teja.pottumuttu@intel.com>
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

The patch series extends an existing test non-zero-reason to use/test
configurable OA buffer size capability. It adds dynamic tests under 
non-zero-reason test for 8,16,32MB OA buffer sizes.

Sai Teja Pottumuttu (1):
  tests/intel/xe_oa: Extend non-zero-reason test

 tests/intel/xe_oa.c | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

-- 
2.34.1

