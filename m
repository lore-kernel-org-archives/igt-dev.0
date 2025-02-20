Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59ECAC021B1
	for <igt-dev@archiver.kernel.org>; Thu, 20 Feb 2025 13:01:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B0F310E971;
	Thu, 20 Feb 2025 13:01:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wc1UyLTo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FC4010E960
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Feb 2025 13:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740056481; x=1771592481;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tfa8HafWcWxqVha/igKDjLAQnGIRu/pN2PKn8oCl8sE=;
 b=Wc1UyLTo4xxD1BJUM2tWrBWeb3oMgHHIuWxOGfr912tH5VLoaPDeQotN
 dNoM6ICcxqc6CkKGcwDbHYrr65fthdxqLA36dEtePLCpaRE7MUqgvSC4K
 GJIl8D3ioR1ZOQqpikzD7xQe5OIqjSQ4VOm7ixg3cWr4oZVk8D7sEkq0d
 DQFHMX9YlAasVgEGgk3TTiAx7AJ906X4ZgeJHYUA+AasuFGmGSumZW2La
 k1/WuFrgm3XjbK7Qiiu65yy8+ypahoOZnQp7JCCsVdsz6/3ILBoawNCBl
 qRmQk9SAtAaNr28PW3aqySSF+VxB9H9nyQfGPRvWFwuRlZwg4mlIINCts A==;
X-CSE-ConnectionGUID: bvajq2NyRBCxrkBGBZKeVA==
X-CSE-MsgGUID: gc130tqSTC+YFB9VnKl0og==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="44749334"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; d="scan'208";a="44749334"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 05:01:21 -0800
X-CSE-ConnectionGUID: QECoYwuOTMu0os/o6+qxEQ==
X-CSE-MsgGUID: votF835zTHWZwoz0j5TzEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="152232528"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.116.136])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 05:01:19 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t] tests/xe_oa: Skip when no OA units available
Date: Thu, 20 Feb 2025 14:01:05 +0100
Message-Id: <20250220130105.756157-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
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

Add a check to ensure at least one OA unit is available before
proceeding with the tests. This prevents unnecessary failures on
devices that do not support OA units.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_oa.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 0242fd594..6abf44128 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -4852,6 +4852,7 @@ igt_main
 
 		/* See xe_query_oa_units_new() */
 		igt_require(xe_dev->oa_units);
+		igt_require(xe_dev->oa_units->num_oa_units);
 		oau = nth_oa_unit(drm_fd, 0);
 
 		devid = intel_get_drm_devid(drm_fd);
-- 
2.31.1

