Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5ED5C5472F
	for <igt-dev@archiver.kernel.org>; Fri, 23 Aug 2024 23:03:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86CF210E161;
	Fri, 23 Aug 2024 23:03:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RqcXaYHc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C32E910E14B
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Aug 2024 23:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724454177; x=1755990177;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gkoJ48NgzY9MV92UXLoetDWBdAAMyEFlPn6TK7XM9zo=;
 b=RqcXaYHcGsZg/7hTE+HThSTTEYRPvTD4oxgLv9VkRmg/w714/Qvx1L/M
 ItZeB2VAJy9xtoO3jo6ZTLeEquJcKTpsYvhoXN4dDsSOa8G4+HI6GbwhQ
 hd+GvFWq1fbdHf46JaD0dbpPPhu2aJFDlFCMKak/xInwrKGuS6scoaaxQ
 n+65l5jWYwL4MDO9JS33rKWGA7op3zl/c6ocoFcXNxGdMCiEfUKGnKYNB
 lTGQy7+8EMCRPAjr9BbvabtGT/5ACPVOs3/nY2YhnDiyUnsRGtFIDSxQ8
 1bEDCpjkuDVfCewNwDDyAuEglm/AgT1uI+s6Py48rE8Zc9HYE2+5DTnfI Q==;
X-CSE-ConnectionGUID: jeDt9NEIQBaQbk0FgFrmzQ==
X-CSE-MsgGUID: Xev4dAXFQt2TTPDuegwa1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11173"; a="25844096"
X-IronPort-AV: E=Sophos;i="6.10,171,1719903600"; d="scan'208";a="25844096"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 16:02:57 -0700
X-CSE-ConnectionGUID: lMOe/jL9R1C7h11cmYZiJw==
X-CSE-MsgGUID: LKB+bZRTQJCuAUfCt0WB2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,171,1719903600"; d="scan'208";a="61799819"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 16:02:58 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 0/2] tests/intel/xe_drm_fdinfo: concurrent spinners
Date: Fri, 23 Aug 2024 16:02:48 -0700
Message-ID: <20240823230250.1090900-1-lucas.demarchi@intel.com>
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

Setup spinners on multiple classes concurrently and make sure the load
makes sense, 100% idle or 100% busy. Also make sure engine utilization
is correctly recorded when queue is destroyed.

Umesh Nerlige Ramappa (2):
  tests/intel/xe_drm_fdinfo: Add tests to verify all class utilization
  tests/intel/xe_drm_fdinfo: Ensure queue destroy records load correctly

 tests/intel/xe_drm_fdinfo.c | 172 +++++++++++++++++++++++++++++++++++-
 1 file changed, 171 insertions(+), 1 deletion(-)

-- 
2.43.0

