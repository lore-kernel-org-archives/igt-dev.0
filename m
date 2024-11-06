Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2359DD29FBE
	for <igt-dev@archiver.kernel.org>; Wed,  6 Nov 2024 09:07:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D927B10E694;
	Wed,  6 Nov 2024 09:07:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NDCkkk2I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9BF610E694
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Nov 2024 09:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730884069; x=1762420069;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cc4MrMP+RbYBzuaRiTCLrrGJfZuIHCCgzkzHiAOxCBU=;
 b=NDCkkk2I95CAjff5KsXKxqZw9RHevwRpnoQZSXmrojrJUbdjI75RA1Dv
 qa/5G9mfogXA11XZzBeU8kbt4PCMOqYa5hm/nrajGp3i6zqIlA2X9PGqR
 QVAXDlkwZWrul2uTP/nTF/6A6irP98rMtrS4QFruQJ5MQrLC4J8dGXmSy
 NQ7km7xea5Wu9vldekL/xPXefK3C/KNkKS3GPHwhzIUeLsy+Ot1t9zbMQ
 2pKB2MMVxJmgPVndYTUdM1yeaZTXVOBmangFarOd09FGa/9T2zj/XlZSM
 NS+k859xAQWgaefgveUPvrcQG1oWuvIYZ06t9CRjFPqvyRnJBl9sR+83K g==;
X-CSE-ConnectionGUID: r1VeVUjSRA2b0GYufnWCIQ==
X-CSE-MsgGUID: igv5aE7BSgaQs9Yhtc6/gw==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="30778098"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; d="scan'208";a="30778098"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 01:07:49 -0800
X-CSE-ConnectionGUID: /F5/mQJaQNmIjtRJolvi6Q==
X-CSE-MsgGUID: 0N2zWzlyRVCefsbX+uAr/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; d="scan'208";a="84542556"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa008.fm.intel.com with ESMTP; 06 Nov 2024 01:07:46 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com, swati2.sharma@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com,
 Mark Yacoub <markyacoub@chromium.org>, Mark Yacoub <markyacoub@google.com>
Subject: [PATCH i-g-t v7 0/3] tests/chamelium: Reduce edid count to avoid
 timeout
Date: Wed,  6 Nov 2024 14:38:17 +0530
Message-Id: <20241106090820.1831321-1-pranay.samala@intel.com>
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

Changes in v6: Split the patches (Kamil)

Cc: Mark Yacoub <markyacoub@chromium.org>
Cc: Mark Yacoub <markyacoub@google.com>

Pranay Samala (3):
  tests/chamelium/kms_chamelium_edid: Use extended flag to reduce the
    number of edid
  HAX: Do not merge
  lib/monitor_edids/hdmi_edids: Shuffle edid with the redundant one

 lib/monitor_edids/hdmi_edids.h           | 52 ++++++++++++------------
 tests/chamelium/kms_chamelium_edid.c     | 28 ++++++++++++-
 tests/intel-ci/fast-feedback.testlist    |  2 +
 tests/intel-ci/xe-fast-feedback.testlist |  2 +
 4 files changed, 57 insertions(+), 27 deletions(-)

-- 
2.34.1

