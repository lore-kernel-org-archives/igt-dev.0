Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF9A8D58CD1
	for <igt-dev@archiver.kernel.org>; Mon, 23 Mar 2026 05:21:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 658B810E097;
	Mon, 23 Mar 2026 05:21:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="grn9WchF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A09E710E097
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2026 05:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774243295; x=1805779295;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ohamaTd7oZf94U5vSzi6mXkzASJv8WbmaJxV9SXWUnw=;
 b=grn9WchFjH+5jP0D3F8kwZSUiqn3LeNt5frSU++ZrIsBNALM7xX9XKvR
 j4a3U8ng2iYLl1kFSYF1qpgjYrNGxoMfd9B31gkxxgO+VZFf4jAsHNezD
 ILW4/lLdzGxqFwlBlWfXbQY+sm9tz8TZtdzFBWZ2r/b6rfNg09RocSbLZ
 i7WFch0/X1RM4Q8f85P9ZcMyv+BKoolGtMpucEf+CF0uwxoDlgaF01RX6
 7phM1Flb5JuW93kSaV/WCftzH5e/uD/WxIiNpnzf0Zv6osXCZRZ6Y7WEA
 kOVSoPDHQyQuipHE3Lw7bvngC5HmIZ1mXT+FhtDowPUqMvyr6SmTKQPIJ g==;
X-CSE-ConnectionGUID: T2WzNTMTSLaCfo8GDPNXmA==
X-CSE-MsgGUID: Kn92eTI0Q+C5h8Zo48Mnhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75304089"
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; d="scan'208";a="75304089"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2026 22:21:32 -0700
X-CSE-ConnectionGUID: 4915a0PkQjaGEUvkd1tr7Q==
X-CSE-MsgGUID: slTb7+TYQpG1qJ9MFj7mog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; d="scan'208";a="220670718"
Received: from nakshtra-system-product-name.iind.intel.com ([10.190.238.69])
 by fmviesa007.fm.intel.com with ESMTP; 22 Mar 2026 22:21:31 -0700
From: nakshtra.goyal@intel.com
To: igt-dev@lists.freedesktop.org
Cc: tejas.upadhyay@intel.com, priyanka.dandamudi@intel.com,
 kamil.konieczny@intel.com
Subject: [PATCH i-g-t 0/1] tests/intel/xe_pat: Add negative subtest for PAT
 index
Date: Mon, 23 Mar 2026 10:51:29 +0530
Message-Id: <20260323052130.1627555-1-nakshtra.goyal@intel.com>
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

From: Nakshtra Goyal <nakshtra.goyal@intel.com>

This series adds a patch for negative test to validate pat index restrictions, extending tests in
userptr_coh_none and prime_export for  (XA + UC) and adding new svm test
to validate for diff indexes ,  (XA + UC + 1WAY) will pass in all cases , (XA + UC)
will fail with EINVAL

v2: Adding validation checks directly inside subtest call instead
    of different functions   (Priyanka)

v3 : Correcting subject as per requirement and addressing nits (kamil)

This series is a continuation of the series sent earlier with slightly
different subject https://patchwork.freedesktop.org/series/163507/

Nakshtra Goyal (1):
  tests/intel/xe_pat: Add negative subtest for PAT index

 tests/intel/xe_pat.c | 67 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

-- 
2.34.1

