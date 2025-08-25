Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6656CCA0EED
	for <igt-dev@archiver.kernel.org>; Mon, 25 Aug 2025 06:35:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F4F610E343;
	Mon, 25 Aug 2025 06:35:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Alb1RWMU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADDC010E343
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Aug 2025 06:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756103718; x=1787639718;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mVpEXRpjogtZbU1EsBDuQgH0otgX4RctMFUhesLIOps=;
 b=Alb1RWMUMQDJDA3WaLV+7H6zGIHke8B1HyBZL6ihLM0n+us6rnfP7qqf
 iZ6kV8MrbJt0lFDhVvV73xPeIpf1WcAzWsBakH7+UK4owVNenQbSNdqD4
 7rbrwuAr8+Ck/LE4+SxKNB00M4UzZ0KeC5H2AVt66qVg9wSKJfaJfjfce
 DGKzaausJGggwJWq8jOb7B6KEGGwDHNE2lbUlCIfUKEcvbE6YdpP8tRTL
 iHJQqW1DFbjRKgJxmDcNdaChEqnLq6hhzt1eV4DA1Z4mzJ5D0QvBgoacY
 vauYbcDo7CcRwWfpTtM+8JR8wqO9O0ufeMYJPpf1FKu8mQQgfScDK/A3P A==;
X-CSE-ConnectionGUID: jv64HYf/T6yI819iMa+/jw==
X-CSE-MsgGUID: ZcxerYSISjeEteogGYZEUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="75904278"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="75904278"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2025 23:35:11 -0700
X-CSE-ConnectionGUID: XXr0zqyZRlG4S4Uy2cAoXQ==
X-CSE-MsgGUID: 2t8CF10rSIWP9hKwcayP4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="173397062"
Received: from dut6245dg2frd.fm.intel.com ([10.80.55.42])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2025 23:35:11 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com, zbigniew.kempczynski@intel.com,
 Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t v3 0/1] tests/xe_evict_ccs:Adjust object size as per VRAM
Date: Mon, 25 Aug 2025 06:35:02 +0000
Message-Id: <20250825063503.484501-1-sobin.thomas@intel.com>
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

Some BIOS configurations do not support or enable resizable BAR,
resulting in a maximum VRAM size of 256MB. This patch adjusts the
maximum object size used in test conditions based on the available
VRAM.

Sobin Thomas (1):
  tests/xe_evict_ccs:Adjust object size as per VRAM

 tests/intel/xe_evict_ccs.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

-- 
2.34.1

