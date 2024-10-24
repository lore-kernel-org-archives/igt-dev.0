Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C600D0BB6F
	for <igt-dev@archiver.kernel.org>; Thu, 24 Oct 2024 08:26:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D24FA10E8CF;
	Thu, 24 Oct 2024 08:26:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nUSKfAcg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBC4B10E8CE
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Oct 2024 08:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729758394; x=1761294394;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5khPd/bdIR7DHdms95KZFOiaRVnZmX0aNu3rBVHnVNs=;
 b=nUSKfAcgdbk5NdWT5Ljdi3H7QM6EHbBG0De2NGFvlxvpFtTSqucAPwsd
 WJ9aN3Sj2bLKlhuO4dCdpUIcxaQcuhc+fdNS4C1ZIKeAoxM8wwuI4FSek
 G7/X2t/WF4IRoAtrOk+5pkdNK3EdlvljOgBUQeCEA0jHKR6Zs9DfDq3xW
 QnJA4NhiKjpxTdZa85stcOKNNPpXnujM3XvAYi/HF+N/m+QzyZCea/kDH
 O4LS/658ZXL5KMd43f2xdKLbgfuZe5/NJBs2SA8tNuRoc6R5YATmxTnKk
 dMi12E0zwzOB2mVyNRBJ4mWc9uC8myaMcM0czdTvRRr3HZ0be3jRVfDcw w==;
X-CSE-ConnectionGUID: uWozsERlTvuvdCnAQMAeeg==
X-CSE-MsgGUID: Tl8ygmrGQSKIHV8qbLt3Tw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="33063165"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="33063165"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 01:26:33 -0700
X-CSE-ConnectionGUID: hLieJ+rRRRq1Xyj2u/dvsw==
X-CSE-MsgGUID: dsrZ0nnTS5SVPgnl6hGEYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; d="scan'208";a="80828612"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa010.fm.intel.com with ESMTP; 24 Oct 2024 01:26:31 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com, swati2.sharma@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v3 0/3] tests/chamelium: Reduce edid count to avoid
 timeout
Date: Thu, 24 Oct 2024 13:57:01 +0530
Message-Id: <20241024082704.1746746-1-pranay.samala@intel.com>
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

Changes in v2: Included HAX patch for CI results.

Changes in v3: Shuffling of one of the edids.

Pranay Samala (3):
  tests/chamelium/kms_chamelium_edid: Use extended flag to reduce the
    number of edid
  HAX: Do not merge
  lib/monitor_edids/hdmi_edids: Shuffle edid with the redundant one

 lib/monitor_edids/hdmi_edids.h           | 52 ++++++++++++------------
 tests/chamelium/kms_chamelium_edid.c     | 20 ++++++++-
 tests/intel-ci/fast-feedback.testlist    |  2 +
 tests/intel-ci/xe-fast-feedback.testlist |  2 +
 4 files changed, 49 insertions(+), 27 deletions(-)

-- 
2.34.1

