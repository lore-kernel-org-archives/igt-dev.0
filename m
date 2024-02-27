Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D4F9C54E41
	for <igt-dev@archiver.kernel.org>; Tue, 27 Feb 2024 09:23:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00DCC10F2E1;
	Tue, 27 Feb 2024 09:23:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nnnsmU5z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B9B110F2CD
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Feb 2024 09:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709025815; x=1740561815;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vt1YgpanY605IE6CafnE83bUsonkpiZh1r1VAUBDmyU=;
 b=nnnsmU5zeujFDS85ZgCbn+a1Cohcyhh2q40OBhd+78OkbCrMTTDKvQBc
 hTpFZiDoix3NmApf3Gq6VuwDQNWpXyEShnlyCPjVKISDOcbZHM35n261v
 nmWqoTyJPSlyTP1ji02AKZT8HqPGDuM+FZypU5k6VZVK6uPQpG+KN7630
 iRL6WKEuo2od/g2lYbZozphNjj1vxHZOOGQRQPSTpFK5rCV4kqEthatAj
 fCmNU1YB4li9MoqhHEPuiqkI/yQVi587YZWlfeLQ8OwIb1boPAaJCRthG
 AknjqAOjJCfc59BzoiZCO8nDLrW33jwnyWYS93WLRCaGpmYzXV+Cnrdsv Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="3201191"
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="3201191"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 01:23:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="7326220"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 01:23:32 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 aravind.iddamsetty@intel.com, badal.nilawar@intel.com,
 sujaritha.sundaresan@intel.com
Subject: [PATCH i-g-t 0/2] add freq exec tests
Date: Tue, 27 Feb 2024 15:03:35 +0530
Message-Id: <20240227093337.1151505-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
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

The tests freq_range_exec, freq_fixed_exec were removed due
to a design flaw which caused failure in tests. The workload execution
finished earlier before the frequency validation when gt was set to
run at a higher frequency.

These tests are being reintroduced with a spinner based approach
in this patch to avoid such failures.

Rev2: add tests to bat to get pre-merge results (Suja)

Riana Tauro (2):
  tests/intel/xe_gt_freq: re-introduce exec tests of xe_gt_freq
  HAX: Add freq tests to xe-fast-feedback.testlist

 tests/intel-ci/xe-fast-feedback.testlist |   2 +
 tests/intel/xe_gt_freq.c                 | 106 ++++++++++++++++++++++-
 2 files changed, 107 insertions(+), 1 deletion(-)

-- 
2.40.0

