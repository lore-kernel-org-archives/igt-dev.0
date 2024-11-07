Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D2DBD5AE7C
	for <igt-dev@archiver.kernel.org>; Thu,  7 Nov 2024 09:52:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C378E10E7DE;
	Thu,  7 Nov 2024 09:52:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N/mUNp3U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D66E510E7DC
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Nov 2024 09:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730973174; x=1762509174;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yjLfqm3bQwsLiLDr8Y/WxzyfdzG7SwY+kezxyEFBnkE=;
 b=N/mUNp3UNCJF/sK5E+JwONKIK0fQtYL20OkneVQzfmvNot6EQYItg+sc
 6MpAtupB/8VczQWUiorefGPO0naOYa+Mpubis9hF8KFIk4vrxqL8qcxkg
 3JRxkOw61D1eMyyez34akA5gcknxWYi3z0lOh0Oifg56aKKQEsWvD7Fz5
 kRyC+nUGn79w11XKw6mPbExfzxe7d/5gZ3qv7wyGRy7nA8DckSzUk3Jqp
 RXdeGhxa9OD3wCvEJjTOgbdUGxXBCuI6DSmuBBsUJAuf58/OZwN+BbzFP
 vIa1gg81iiVqNKLaJLgjdAUe4tgEgZ9cbXE7KIZhUJyO6EBCch29DwOXz w==;
X-CSE-ConnectionGUID: 6XoPqSQOTQaFFhgA0P8vwA==
X-CSE-MsgGUID: RIFNs8j4SNG8UoigcciCeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="30229362"
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; d="scan'208";a="30229362"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 01:52:53 -0800
X-CSE-ConnectionGUID: hhBrCdqmS6CTdIQQGPffVQ==
X-CSE-MsgGUID: ODfi5//wRem+dElB2PjzLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; d="scan'208";a="89844710"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by orviesa005.jf.intel.com with ESMTP; 07 Nov 2024 01:52:50 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com, swati2.sharma@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com,
 Mark Yacoub <markyacoub@chromium.org>, Mark Yacoub <markyacoub@google.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH i-g-t v8 0/3] tests/chamelium: Reduce edid count to avoid
 timeout
Date: Thu,  7 Nov 2024 15:23:23 +0530
Message-Id: <20241107095326.1842621-1-pranay.samala@intel.com>
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
Cc: Louis Chauvet <louis.chauvet@bootlin.com>

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

