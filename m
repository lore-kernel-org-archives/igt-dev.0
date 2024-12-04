Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D9FE7716D
	for <igt-dev@archiver.kernel.org>; Wed,  4 Dec 2024 10:07:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 822CD10ECB4;
	Wed,  4 Dec 2024 10:07:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MbHc1TN7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E387E10E2A4
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Dec 2024 10:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733306837; x=1764842837;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fyJ6z8aF9cHCHP6oO/60OqsPKKD44pfM3hhaJiIsEHc=;
 b=MbHc1TN7rZ5m+1y13xDI58lTm63mdNUBiQyn/NQ+HzqQWkzkycwLwO8+
 zKs4iNm3lOqPq2ezeDQ4Gs89qExRkBP8KS2Vw17uN3Y9GYnfRyEjNDx84
 KvpUpG74GSEyuZZzPhH4Lx3HcE4U4H2RyODLjXAaarxSKPAe4zCcub3RP
 7NGeqSxL6asGwnkkDbjTCUhUFIinvA299JXIrdG+U/c2xbOOOvSImUCLM
 7K0Jg0ssqY7m15+ibYKDVXl0mYPoP64yohLb9iosA4nrglxwUIGr3xgJz
 94oRCmkAIuthvXKUdk8lRmhFiplZGWuXFtjEpd+ARNJoD+a5enWQEahmy A==;
X-CSE-ConnectionGUID: bYNDEHsSRqC8lo+wCc/jyA==
X-CSE-MsgGUID: KNbSVFTwSVOV5h1nGwInhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="44041842"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="44041842"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 02:07:10 -0800
X-CSE-ConnectionGUID: hnCnFZvETAu72CWVUIOGCw==
X-CSE-MsgGUID: cSsFjH1pQj2QsV5bfQGn5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="93567673"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.246.198])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 02:07:08 -0800
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v2 i-g-t 0/1] tests/intel/xe_exec_store: Introduce long-shader
 tests
Date: Wed,  4 Dec 2024 11:06:11 +0100
Message-Id: <20241204100612.4773-1-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Introduce long-shader-bb-check test with dynamic subtests dependent on
available memory regions.

These dynamic subtests are core version of
xe_eudebug_online@writes-caching* tests.

Each dynamic subtest writes incrementing values to 2-page-long target
surface using long shader. The bb is searched for full shader, expecting
it to exist. The target surface is checked against written values. Each
dynamic subtest places bb and surface in different configuration of
memory regions in order to validate memory coherency.

v2:
- Change separate tests into dynamic subtests
- Don't use dangling hwe
- Use xe_get_memory_region_set and for_each_variation_r to iterate over
  all memory region pairs

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>

Dominik Karol Piątkowski (1):
  tests/intel/xe_exec_store: Introduce long-shader tests

 tests/intel/xe_exec_store.c | 100 ++++++++++++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

-- 
2.34.1

