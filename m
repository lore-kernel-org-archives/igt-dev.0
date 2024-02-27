Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7727C54798
	for <igt-dev@archiver.kernel.org>; Tue, 27 Feb 2024 09:23:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C9E710F2D7;
	Tue, 27 Feb 2024 09:23:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HdhgNYeY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64A4510F2E8
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Feb 2024 09:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709025819; x=1740561819;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GcvzL5Hbw3nBHAllELljaw/h1FqHr3vT6QM9qrrWtEg=;
 b=HdhgNYeYSFiJuu5IenuhllaS6aXDdmCSiYIyVEXWVHA8V+FojglmadiU
 BZm8/4Pf1rbbbJFCOzoXLJRJlUveUdtjm9Vs234Mxvie+G2T1Dxw73OPg
 dZgExF3uKCX/bw7zGxUWQxZaf4ERGI0tBK97Hs0IpQQOsR2uLdbmiBIrK
 7BDUIz1o3iaywLxblYwM3R1ihHcZWdLZLIoZ/fRzaRAJ9kAcJ9HGfuxbG
 NmSP5d3AMaDyGacUFevWYy8FbxC/mBjN+jFQd0ddEDv9fFtm91tZ7PaYd
 lnC7pdODuKVkoEGgTuPyVLktr/QNpKLWM8ouqXtazdWYhGJ6cdAAYbXZy g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="3201195"
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="3201195"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 01:23:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="7326226"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 01:23:37 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 aravind.iddamsetty@intel.com, badal.nilawar@intel.com,
 sujaritha.sundaresan@intel.com
Subject: [PATCH i-g-t 2/2] HAX: Add freq tests to xe-fast-feedback.testlist
Date: Tue, 27 Feb 2024 15:03:37 +0530
Message-Id: <20240227093337.1151505-3-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20240227093337.1151505-1-riana.tauro@intel.com>
References: <20240227093337.1151505-1-riana.tauro@intel.com>
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

Add freq_fixed_exec and freq_range_exec to fast feedback
testlist.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 17863b6b1..b1e769e56 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -87,6 +87,8 @@ igt@xe_exec_threads@threads-mixed-fd-basic
 igt@xe_exec_threads@threads-mixed-userptr-invalidate
 igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race
 igt@xe_gpgpu_fill@basic
+igt@xe_gt_freq@freq_fixed_exec
+igt@xe_gt_freq@freq_range_exec
 igt@xe_gt_freq@freq_basic_api
 igt@xe_gt_freq@freq_fixed_idle
 igt@xe_gt_freq@freq_range_idle
-- 
2.40.0

