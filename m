Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67F49CA0EFA
	for <igt-dev@archiver.kernel.org>; Tue, 26 Aug 2025 05:50:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD97310E2CF;
	Tue, 26 Aug 2025 05:50:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i4gv+hvw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2612B10E2C7
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Aug 2025 05:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756187457; x=1787723457;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nrb8LeP49INeN0RruH7Bu8fzcnZV1J9SAsGddSS0VrI=;
 b=i4gv+hvwLX26a8TTJxJpBMJ0SL6WPzFdR9Q/1lZAVdDJY/1JPBLOdXip
 gUWvgd990H7wWeROvturAjT9bFqaeEMvJ4I8Q9OkRH0VKmyGEFSf/A8Jj
 rN4kwy56+1W7+B9K32cblnlzjiQmkAyWq55wVVklTPyYpuOdy3bs0IJm6
 tVGof4D0mOxa+ZPDCuVmjHn41JiTMeJ7qusSeEFYbPxUmZYnQsCj3Q/aw
 2bZmrYd4NIrsgEJlf+cOhntbzEAhL2Bt3bxXShH0MmT4ef/LZqEB0fq1L
 rdp/lkkvblTiki0legKo769m4Dmacy2wimcwD3LNqd1yzimmfv4l64JOU A==;
X-CSE-ConnectionGUID: /a3bdANbQ8aGJicgJ3rVoA==
X-CSE-MsgGUID: pd0tT+I5Sn64GCs/Hn2uwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="69784394"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="69784394"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 22:50:57 -0700
X-CSE-ConnectionGUID: HmyVOTNlRr+nIIR13g1YYg==
X-CSE-MsgGUID: X1sc08nbQsmxGOEHtNSWmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="168989312"
Received: from dut6245dg2frd.fm.intel.com ([10.80.55.42])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 22:50:56 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com, zbigniew.kempczynski@intel.com,
 Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t v4 0/1] tests/xe_evict_ccs:Adjust object size as per VRAM
Date: Tue, 26 Aug 2025 05:50:48 +0000
Message-Id: <20250826055049.505047-1-sobin.thomas@intel.com>
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

v2: Adjusted the subject name

v3: Inco-operated review comments [kamil]

v4: Fixed typo.

Sobin Thomas (1):
  tests/xe_evict_ccs:Adjust object size as per VRAM

 tests/intel/xe_evict_ccs.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

-- 
2.34.1

