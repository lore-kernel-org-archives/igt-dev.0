Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D8DC83F1A
	for <igt-dev@archiver.kernel.org>; Wed, 23 Jul 2025 15:05:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEFF789452;
	Wed, 23 Jul 2025 15:05:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XobAwV5v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E430989452
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Jul 2025 15:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753283123; x=1784819123;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4cVf00xZUW8M5Wn31vvaco+GtlzF5D2xMuUz922TTcQ=;
 b=XobAwV5vwUkB+O0yUcS4snZBcrVQz9IGPggyMbGIPYvAVA5K2O5TI220
 57BuuTV2iAuFE908NlQPrrVWWMQ9QAIDydPEHJYlaL9lsSg55OHj1kx8g
 vjOq4JOeY9bOE/r6436iH+mQjqog+7JguVhUTG6VXklpXVmE7elmXovmV
 IlwGYR2FdvGAJDGnlML/CoXJZS0p9/LAZedL66YTU+MF/A3G6qK1kq9Cm
 SIHF2mXcZ1Sb8InhfPT3iS7S9AmdLaYSA2xL1f/rq1LP9ebtHiOklJDTM
 NfD5gKbkPf6xnnrcdowA2qk6gwHB6NXVqZrT2FzxltFf1GqHB/DTpieva w==;
X-CSE-ConnectionGUID: bJXGsCkvRlOCIZD0uZOIzw==
X-CSE-MsgGUID: 6ZXk2J8qQe+0AaUZsILaew==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="73149468"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="73149468"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 08:05:14 -0700
X-CSE-ConnectionGUID: xCxPAOkmRdG7KoOBjzfGIw==
X-CSE-MsgGUID: 6KXLFvk5RyCTLPtiNXBz7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="163816751"
Received: from dut6245dg2frd.fm.intel.com ([10.80.55.42])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 08:05:14 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com,
	Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t 0/1] tests/xe_evict_ccs:Add check to update object param
Date: Wed, 23 Jul 2025 15:05:07 +0000
Message-Id: <20250723150508.552862-1-sobin.thomas@intel.com>
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

This change will modify the parameters for the test based on the
available visible ram and update the max object size that is calculated
based on the existing method
This change is needed to dynamically change the object size as per the 
visible RAM size of the platform.

Sobin Thomas (1):
  tests/xe_evict_ccs:Add check to update object param as per visible RAM

 tests/intel/xe_evict_ccs.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

-- 
2.34.1

