Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB57D1D87B
	for <igt-dev@archiver.kernel.org>; Tue, 15 Oct 2024 15:31:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7630810E5AA;
	Tue, 15 Oct 2024 15:31:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZegX13YU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1E6410E5A9
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Oct 2024 15:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729006265; x=1760542265;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AAXbYkjB4+jfFn56rQaGHTHTF5VP0mUyhEuosamWv4k=;
 b=ZegX13YUPCNd9wlWus28c+PLqaGXnMqAMmAMzvtdd3DgQQn4RNlKlEFM
 Pm8vgqPt09c2PnFJF234GxVqftbhoAtyB66Iw1BIkNe9DAIrIg2RWFO+E
 yPDfz82dUV/Bi+64EOmfM/hBNTEx3DvCSgUy19RFIhyToD03y6WOAQLoP
 3k5jZqJi8kGWvvYzFyzjG7NMk8a2SMhtdZRNUoMQTpfNOoYqk177jAfaZ
 iCaFcmtCRSGn2XDNMfKmErVgx9ZWxXimJLlOgRlogRdLavVi7926RFt9I
 aUW8w/2uqM+++CcGDn2lVh3cvdaUU7xWzUlWJz5vyFPWBvJ0NW5yrt3vx w==;
X-CSE-ConnectionGUID: Nyc6IcmfTViiyHa4U8cxyA==
X-CSE-MsgGUID: RJ+ZDHVwTJec+6S/2xDwnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="28287219"
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="28287219"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 08:31:04 -0700
X-CSE-ConnectionGUID: ueZNlxTdTy2y0zooGkEkQw==
X-CSE-MsgGUID: m7b4iymITGGgU9+hi5pW2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="82496835"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa005.fm.intel.com with ESMTP; 15 Oct 2024 08:31:04 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>,
 Peter Senna Tschudin <peter.senna@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: [PATCH i-g-t v3 0/1] tests/intel/xe_exec_capture: Add xe_exec_capture
 test
Date: Tue, 15 Oct 2024 08:31:00 -0700
Message-Id: <20241015153101.4114544-1-zhanjun.dong@intel.com>
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

Test with GuC reset, check if devcoredump register dump is within the
range.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
Cc: Peter Senna Tschudin <peter.senna@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>

Changes from prior revs:
 v3:-  Remove call to bash and awk
       Add regular express parse
       Detect devcoredump through card index
       Add devcoredump removal check
 v2:-  Fix CI.build error
       Add multiple GPU card support

Zhanjun Dong (1):
  tests/intel/xe_exec_capture: Add xe_exec_capture test

 tests/intel/xe_exec_capture.c | 308 ++++++++++++++++++++++++++++++++++
 tests/meson.build             |   1 +
 2 files changed, 309 insertions(+)
 create mode 100644 tests/intel/xe_exec_capture.c

-- 
2.34.1

