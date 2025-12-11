Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A0CD3E79E
	for <igt-dev@archiver.kernel.org>; Thu, 11 Dec 2025 07:27:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B5D610E733;
	Thu, 11 Dec 2025 07:27:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MSxeOxlk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FA7810E6DE
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Dec 2025 07:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765438052; x=1796974052;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cP8BxuhLgVuR6dhHm3DF2TKNFqoL937dBQr4TCdN8+4=;
 b=MSxeOxlkCMxBsLciK2tqh5g1JcqpzWqyt5d1s//7fhUHSv70s2vy6X0q
 5tqU8HWWZs/FfBpcaD1Y5+JuflNnBKT5rz54QUDzMJ3//8e0lIWV5sjBH
 d23AeXXN8ic8e6mB3u2dktoiZpFeas+Gnei4NGUmxdoKxWRKCR/RV6rHG
 bStngYOertaaoSQC7tzUZdp/oB/u+b+VwOxqzftumpH8B63NpJRxN8UZS
 uk7GakV3R5cOCS+qp6tSkDHNSNZfS1rFF3YeXzr+uxEjt6TRJ4k265iT1
 p9Pqnc4+YuSl8NTmAa83K47WovqFYB1DehFsvqXWrprV2jKi89vqO27RQ g==;
X-CSE-ConnectionGUID: r6f7/Ab6QNmMPviuTA9BaA==
X-CSE-MsgGUID: faOSLG6MQyGvqhwK9o03tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="70000125"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; d="scan'208";a="70000125"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 23:27:32 -0800
X-CSE-ConnectionGUID: yg336LdZQ+qTH+ADjinWkw==
X-CSE-MsgGUID: 9oObVesoTay9wzZI/GitkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; d="scan'208";a="195989628"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.69])
 by orviesa010.jf.intel.com with ESMTP; 10 Dec 2025 23:27:32 -0800
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: alex.zuo@intel.com,
	Xin Wang <x.wang@intel.com>
Subject: [PATCH v4 0/2] tests/intel/xe_pat: add helper funtion to read PAT
 table
Date: Thu, 11 Dec 2025 07:27:26 +0000
Message-ID: <20251211072730.178836-1-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210052327.149365-1-x.wang@intel.com>
References: <20251210052327.149365-1-x.wang@intel.com>
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



Xin Wang (2):
  lib/intel_pat: read Xe PAT config from debugfs
  tests/intel/xe_pat: sync with Xe PAT debugfs parser

 lib/intel_pat.c      | 113 ++++++++++++++++++++++++++++++++++---------
 lib/intel_pat.h      |  20 ++++++++
 lib/xe/xe_query.c    |   4 ++
 lib/xe/xe_query.h    |   4 ++
 tests/intel/xe_pat.c |  38 ++++++++++++++-
 5 files changed, 154 insertions(+), 25 deletions(-)

-- 
2.43.0

