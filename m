Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A96B9D6ACE4
	for <igt-dev@archiver.kernel.org>; Thu, 18 Dec 2025 10:49:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 583E010E3C7;
	Thu, 18 Dec 2025 10:49:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hP5IWtRZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAA0210E3C7
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Dec 2025 10:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766054964; x=1797590964;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=p9V+wSXuL2EbWFKLeSsHpwfO3grKRTo5AhChF8OuVOg=;
 b=hP5IWtRZzg1gfscavOi8NcuUyBH5INUHDbxS0TgHrJqnQNGi5N96+8I4
 +al5YXnJOcjhfw1qPDlVcyHDMh72yUpyqFaC0YfUcbbHoMz7OwGoxK5Ml
 kFj5hH5yWCioX+moAAp7l2jBFHMvvmaW+haownt06h7+qZkf1GAAU+or9
 VnYzQSyCN03TpoFfzAqAfoc8lM10YPL5Dq47dcBSkc478pVjGTBITlqkt
 WIazg/lP21B3ZBKeE/cKLgkV+GcdTIEPau9povECFgIgyQQEzZkCDNzPt
 WiiniQll+4Vow60km6WrgQTlIoSe6NF5ayiH872zb4pd87THm8x7OVv9l Q==;
X-CSE-ConnectionGUID: +RjAwRPbQHGFDJBM1cUMGw==
X-CSE-MsgGUID: UbOG1FoxS1S3XTMnzy8RHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="67896854"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="67896854"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 02:49:23 -0800
X-CSE-ConnectionGUID: DxMV4SHbRcuS/hpzBT7H/w==
X-CSE-MsgGUID: jOJ4jFzkS8mk/WGvfkAHVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="199026097"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.244.48])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 02:49:21 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t, v3 0/3] Enhance SVM compute tests
Date: Thu, 18 Dec 2025 11:47:19 +0100
Message-ID: <20251218104907.117812-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
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

Add new tests used for SVM performance profiling.

v3:
- Keep existing semantics of array_size (Zbigniew Kempczyński)

v2:
- Add first patch to differentiate array_size and loop_count
- Drop aligned_size as it is unused later, the test is always called with a size
- Remove the drm_xe_engine_class_instance argument as it was unused (Zbigniew Kempczyński)

Francois Dugast (3):
  tests/intel/xe_exec_system_allocator: Cleanup compute test
  lib/intel_compute: Allow user to override compute kernel loop_count
  tests/intel/xe_exec_system_allocator: Add new SVM compute tests

 lib/intel_compute.c                    | 36 ++++++++------
 lib/intel_compute.h                    |  2 +
 tests/intel/xe_exec_system_allocator.c | 67 ++++++++++++++++++++------
 3 files changed, 74 insertions(+), 31 deletions(-)

-- 
2.43.0

