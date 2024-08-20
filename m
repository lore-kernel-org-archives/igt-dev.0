Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A81EC3DA4A
	for <igt-dev@archiver.kernel.org>; Tue, 20 Aug 2024 18:09:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB7BE10E4D8;
	Tue, 20 Aug 2024 18:09:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aPcPHk7f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B245A10E4D8
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Aug 2024 18:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724177392; x=1755713392;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Pso4k8Uo3FV9aLuEtOOJbfm/p3FBFZOIHNUHd9n6SPA=;
 b=aPcPHk7fcD70yY4zE3Zy1qPXjS5iBK2fm0+MnXV/m3nu5fSmgi5ocrVQ
 s9fc2uRrwoWeVYWj5kqyEIQdtove93hdXHdGh/mo+vNMnzik2q6JNmA4L
 uoQFw/y8uDk86S+VDlpVqdAMTWSjNSzP59/lKBKjaw1TGldX4fM6/nSjR
 l5IsKV/Hmi5wdgjTGIatpUe4Or5JXxYltgdwCnpdbjqFo7KMeWB7saAKg
 OItZ2OFR9drVhJEGNB7PX0vDuYyaModveXOfwVyKbMmFf6OrcsUrTLRWJ
 rnM4c2NFfpED9vUDVdrAiSTy7RjXP46pg553tLipWjqNeErNYJzEh4nTJ A==;
X-CSE-ConnectionGUID: 1+7GT+6EQMmrwagD8/vLcA==
X-CSE-MsgGUID: i1jGTqMzSROWnXyTqVDZ9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22633330"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="22633330"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 11:09:50 -0700
X-CSE-ConnectionGUID: mm2SMIRpTrO1SRdItVnpaQ==
X-CSE-MsgGUID: QmYMH1nsRP2+16V38omy9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="60666930"
Received: from sinjan-super-server.iind.intel.com ([10.145.169.153])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 11:09:46 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, rodrigo.vivi@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH i-g-t v4 0/2] tests/intel/xe_gt_freq: Add a wait after gt reset
Date: Tue, 20 Aug 2024 23:53:22 +0530
Message-Id: <20240820182324.3206155-1-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
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

After reset min and max takes sometime to get set.
So add a wait of 100ms after gt reset before reading
min and max frequencies.

v2:
 - Rename ACT_FREQ_LATENCY_US to SLPC_FREQ_LATENCY_US and use it
   instead of new macro. (Riana)

v3:
 - Split v2 patch into two patches.
   Move macro rename to separate patch. (Riana)

v4:
 - Fix couple of typos. (Riana)

Karthik Poosa (2):
  tests/intel/xe_gt_freq: Rename ACT_FREQ_LATENCY_US to
    SLPC_FREQ_LATENCY_US
  tests/intel/xe_gt_freq: Add a wait after gt reset

 tests/intel/xe_gt_freq.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

-- 
2.25.1

