Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF248D12687
	for <igt-dev@archiver.kernel.org>; Tue,  5 Nov 2024 11:16:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87E2D10E574;
	Tue,  5 Nov 2024 11:16:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ChLLC1Up";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B0E810E572
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Nov 2024 11:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730805411; x=1762341411;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BFvI43HiIiz0cHDRgWFqX1Td5cPWnnW2nBkZ+BvTR/M=;
 b=ChLLC1UpK85rVrAhF+ckkCLQp1P21chYRNdnKgJ/jOLFMbJWSLK/rv7A
 jCiXD7oC6Ix8J1QwUJHTmDetnUCBMh4d5Evby3CSyEqbuZovWCK1RjLvM
 xc6+h1hLt2TzzbHDtFhMi3Zk25fiDaXxZjoSZyqMv0A/tKfYSVrwde18G
 KzqsNvdsEN2w6anj0O3rpd/7WwAHo1bQLlefrRtYpulTCCpWVkO5Ahe2A
 CStgd8Fssevz3/D4CZtCOuN6mj0RlEQc8ykPN8QUTw3K5azCy7ym65Gbv
 vyUyDCVkUdDkENwHc01C8OBrkedHOpe1LWY7OHfnOiwkajKo3BHRVWv44 Q==;
X-CSE-ConnectionGUID: GdgTEqxrQniElIbuoIguuA==
X-CSE-MsgGUID: qsCEpgO9Rle5dV8w4lyaOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30717624"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30717624"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 03:16:41 -0800
X-CSE-ConnectionGUID: tEUYTuUcS+GQjxmTtVCJ/g==
X-CSE-MsgGUID: mXIjOr2TSdq3tQEqCMhoRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208";a="114764721"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa001.fm.intel.com with ESMTP; 05 Nov 2024 03:16:39 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com, swati2.sharma@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v5 0/2] tests/chamelium: Reduce edid count to avoid
 timeout
Date: Tue,  5 Nov 2024 16:47:11 +0530
Message-Id: <20241105111713.1818803-1-pranay.samala@intel.com>
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

In kms_chamelium_edid test, it iterates through all the mentioned edids.
But due to CI timing limitation, the test couldn't iterate through all
the edids on CI.

This patch series reduces the number of edids when run on CI to avoid
timeout. This is done by using an extended flag. Hence CI will only run
some of the edids and when this flag is used then test will iterate
through all the edids.

Also shuffles one of the redundant edid with the non-redundant one to
cover all configs.

Changes in v2: Included HAX patch for CI results (Kunal)

Changes in v3: Shuffling of one of the edids (Kunal)

Changes in v4: Merging 2 patches into 1 (Kunal)

CHanges in v5: Add a condition to check whether its INTEL's 
	       driver or not (Kunal)
	       Include TODO to check whether an environment 
	       variable is present in the CI (Kunal)
Pranay Samala (2):
  tests/chamelium/kms_chamelium_edid: Use extended flag to reduce the
    number of edid
  HAX: Do not merge

 lib/monitor_edids/hdmi_edids.h           | 52 ++++++++++++------------
 tests/chamelium/kms_chamelium_edid.c     | 27 +++++++++++-
 tests/intel-ci/fast-feedback.testlist    |  2 +
 tests/intel-ci/xe-fast-feedback.testlist |  2 +
 4 files changed, 56 insertions(+), 27 deletions(-)

-- 
2.34.1

