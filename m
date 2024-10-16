Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B68B0D1AD41
	for <igt-dev@archiver.kernel.org>; Wed, 16 Oct 2024 10:20:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C08210E6F1;
	Wed, 16 Oct 2024 10:20:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xs398E4a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2057810E703
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Oct 2024 10:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729074040; x=1760610040;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Nq60YwS1ctZ9j2M1RCYpf+rcnE4xoEUz+jQyAvWwacY=;
 b=Xs398E4ain5mufoRWFQIR7ISQZ0FK2yRKaLZNvI4vtKEL2Lz/sR5HJm+
 DW/i46Ss92UO5jOtPYmxE7iu8i9LD1rAos71+0rtFlCvlSbORsVHAN3//
 sLjZO5FARp33Bp5MzpiAkT/rYTNrqpEgXvmr1WoqBiCk4m8Z/vZyZvo8c
 JHHPMUeYXGfrSjvsitqaeN4QRkL81sry0FFAph7zWMj3y9X/ykc4lTRXL
 CGzfp1o1sTBnYExowl33kAcOiTsDiw0wsda7CKjPpohtmnqottxslHcY6
 9KMcqikwo3wX+lVKBj5raX2UxO53uIottph0ilE7jjCOzRe2TkSfNuaBB A==;
X-CSE-ConnectionGUID: VmBRBOGASBiaIcmx5g189A==
X-CSE-MsgGUID: ouRkeZdXTM+UUL8v4yE+PQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="39091623"
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; d="scan'208";a="39091623"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 03:20:40 -0700
X-CSE-ConnectionGUID: FCoP1WBLTTKXjCgKl8undA==
X-CSE-MsgGUID: iReGUKKESD+y4w3iDqzNiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; d="scan'208";a="79018354"
Received: from pgurram-desk.iind.intel.com ([10.145.169.87])
 by orviesa008.jf.intel.com with ESMTP; 16 Oct 2024 03:20:38 -0700
From: Pravalika Gurram <pravalika.gurram@intel.com>
To: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 sai.gowtham.ch@intel.com, katarzyna.piecielska@intel.com
Cc: Pravalika Gurram <pravalika.gurram@intel.com>
Subject: [PATCH i-g-t 0/2] xe_find_engine_by_class helper
Date: Wed, 16 Oct 2024 15:49:31 +0530
Message-Id: <20241016101933.4191790-1-pravalika.gurram@intel.com>
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

Added "xe_find_engine_by_class" helper function to query with the required
engine class and get the engine info.

Use 'xe_find_engine_by_class' helper to get the engine info with the
required engine class.  Stop assuming engine id is equal to 1

Pravalika Gurram (2):
  lib/xe/xe_query: xe_find_engine_by_class helper
  tests/intel/xe_exec_compute_mode: Use xe_find_engine_by_class

 lib/xe/xe_query.c                  | 20 ++++++++++++++++++++
 lib/xe/xe_query.h                  |  1 +
 tests/intel/xe_exec_compute_mode.c |  5 ++++-
 3 files changed, 25 insertions(+), 1 deletion(-)

-- 
2.34.1

