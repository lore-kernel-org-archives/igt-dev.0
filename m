Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5216FD41D53
	for <igt-dev@archiver.kernel.org>; Tue, 12 Nov 2024 05:04:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E166F10E233;
	Tue, 12 Nov 2024 05:04:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TROSwyL7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA33F10E233
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Nov 2024 05:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731387848; x=1762923848;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JoEw7khNrxVcwYOb981BCvCotxhE6Loiefb+ny/T/JA=;
 b=TROSwyL7Oat58b58KawCIe+/npk70DZVAnMltT2KuEZPfAG8i6wlQ4yJ
 fg1IPuKpmlvoujh0Wmg/qh7E8zKlp+yX5tF5oYj2WOxKlR0NsQ0zNirWz
 eKCllPucJeJfiDbrbFBq/Kk3zl8lz1d3kq5uYMtAyatB0UVMpuQHJ06Qc
 mfWJeDjCObzhsGMxAOKYEDIF1akzoIZeUyunOhOUl0DrKUmOn19xnzYw4
 hY/Cw9u9EJogE9w3x8YYLVw2+IrN83YMzaH0n3Mdv/PlxuhsVFpF9bcmv
 UV/6qAJLdx16QxoxTGR0PUnfxRpU1O4jt+VHfFzNoLyzsdam2BkVAiHIA w==;
X-CSE-ConnectionGUID: /XJjyRoJSaGRsXfdEz800g==
X-CSE-MsgGUID: gr2KdS+zSHWIqnfXcDAyrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="35137101"
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; d="scan'208";a="35137101"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2024 21:04:08 -0800
X-CSE-ConnectionGUID: ft9SBmB3SyWrvZY4v8gTAg==
X-CSE-MsgGUID: kvaLivVUQXqAuegDeHvP5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; d="scan'208";a="86836176"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa006.fm.intel.com with ESMTP; 11 Nov 2024 21:04:05 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com, swati2.sharma@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v9 0/3] tests/chamelium: Reduce edid count to avoid
 timeout
Date: Tue, 12 Nov 2024 10:34:39 +0530
Message-Id: <20241112050442.1854319-1-pranay.samala@intel.com>
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

Changes in v7: Add cc to the lines edited by someone (Kamil)

Changes in v8: Edit the condition and move TODO before that (Kunal)

Pranay Samala (3):
  tests/chamelium/kms_chamelium_edid: Use extended flag to reduce the
    number of edid
  HAX: Do not merge
  lib/monitor_edids/hdmi_edids: Shuffle edid with the redundant one

 lib/monitor_edids/hdmi_edids.h           | 52 ++++++++++++------------
 tests/chamelium/kms_chamelium_edid.c     | 26 +++++++++++-
 tests/intel-ci/fast-feedback.testlist    |  2 +
 tests/intel-ci/xe-fast-feedback.testlist |  2 +
 4 files changed, 55 insertions(+), 27 deletions(-)

-- 
2.34.1

