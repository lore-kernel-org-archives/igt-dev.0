Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D11CAD2B944
	for <igt-dev@archiver.kernel.org>; Tue,  5 Nov 2024 16:09:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F43610E5EB;
	Tue,  5 Nov 2024 16:09:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MrUtXlZ/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D232510E5F2
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Nov 2024 16:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730822994; x=1762358994;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8jR4TDd1ewHAF5xLo1ESwCCBr5uXcWW8fZfkYUSrahI=;
 b=MrUtXlZ/H9H4WeyrLty/cYgYvQPbYlpx0an8UIPjrxV0OCSEgevlpcDU
 UGhntBakFLteSrwrcUwzqperpktjrdhS+NLvu5WhFN4Tr4Vio3gjbpON7
 T5PvDwJleoq4KO0MNf8Zh6bnoFcAiybtG9WCmYTIHZhXN7H1DTOjvd2LP
 rMelMr6h0OxwzutTtJ6KnlYGEuA+DWkvpWZ2j5kRH1Qe7FuAtCOmp2Do1
 q+Io5pNHJn1vweW61HqkgVO0D0g9a1Nq916VOVexwiDcvmaTouo/9EdD5
 +1n1CDNO95cMnXoY36amUqXVoLEIIl+RVq367V8uLcA02KsTIAGyV4GPP g==;
X-CSE-ConnectionGUID: 4FEY8WoGQ66JJvGgFgysmA==
X-CSE-MsgGUID: +7mOSos1QtKlit1detC5Nw==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="41175003"
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208";a="41175003"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 08:09:54 -0800
X-CSE-ConnectionGUID: XzZxzQUdSiuvD43+ZsdPaw==
X-CSE-MsgGUID: S7KiQ9myRHa18Bp18tt0uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208";a="83969444"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by orviesa009.jf.intel.com with ESMTP; 05 Nov 2024 08:09:52 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com, swati2.sharma@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v6 0/2] tests/chamelium: Reduce edid count to avoid
 timeout
Date: Tue,  5 Nov 2024 21:40:24 +0530
Message-Id: <20241105161026.1819884-1-pranay.samala@intel.com>
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
 tests/chamelium/kms_chamelium_edid.c     | 28 ++++++++++++-
 tests/intel-ci/fast-feedback.testlist    |  2 +
 tests/intel-ci/xe-fast-feedback.testlist |  2 +
 4 files changed, 57 insertions(+), 27 deletions(-)

-- 
2.34.1

