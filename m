Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D03D11183
	for <igt-dev@archiver.kernel.org>; Mon,  4 Nov 2024 06:19:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58DEB10E0CB;
	Mon,  4 Nov 2024 06:19:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JdZAdYPj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 976CA10E0CB
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Nov 2024 06:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730701170; x=1762237170;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Y+sYmy4572fgYHAQHYYcdEi/hPSXWgIlAmKET9Cwkoo=;
 b=JdZAdYPjsk27UpAW2Jphog5ZbTZKzJCZbl43bn+RR8q4skzq1PVdd+Ct
 Kp2BzBtBwWvKXBC3Vp7su+2qFoCpvkaWkN6boOZq2WQb9+N0p8DhdHbw0
 IyoLPFFHtbU6Upzkwlq66dEt/stlh9JrXllft1Oi4WmhEXt80ObKM0miS
 lDnU1msBqmCQCUgj+PerOoSS54KxRfPXiCKMiztiWHo934zrfUGizLtwC
 5Bbb2vPP3McLCr+ZSltkQbrhr3neOhw77iiUn6o1LiBm4DTj9wUu47ECj
 NIFS4uDsG1G1A+AV+GhTnx9a8f0C6JVJUpyXDmRRuY/Fy3BB1NvitYun2 A==;
X-CSE-ConnectionGUID: eDxNegYKTJOAtRQXWdXIhg==
X-CSE-MsgGUID: fi2YfqiyTGGapnNM7KnmeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11245"; a="41017545"
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; d="scan'208";a="41017545"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2024 22:19:29 -0800
X-CSE-ConnectionGUID: B9A7J0hgQW+aIhFER6CanA==
X-CSE-MsgGUID: 958r/9ylSYqRV9xowyb7dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; d="scan'208";a="83082979"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa006.fm.intel.com with ESMTP; 03 Nov 2024 22:19:27 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com, swati2.sharma@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v4 0/2] tests/chamelium: Reduce edid count to avoid
 timeout
Date: Mon,  4 Nov 2024 11:49:59 +0530
Message-Id: <20241104062001.1813180-1-pranay.samala@intel.com>
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

Changes in v4: Merging 2 patches into 1.

Pranay Samala (2):
  tests/chamelium/kms_chamelium_edid: Use extended flag to reduce the
    number of edid
  HAX: Do not merge

 lib/monitor_edids/hdmi_edids.h           | 52 ++++++++++++------------
 tests/chamelium/kms_chamelium_edid.c     | 21 +++++++++-
 tests/intel-ci/fast-feedback.testlist    |  2 +
 tests/intel-ci/xe-fast-feedback.testlist |  2 +
 4 files changed, 50 insertions(+), 27 deletions(-)

-- 
2.34.1

