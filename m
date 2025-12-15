Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E13BAD5B17D
	for <igt-dev@archiver.kernel.org>; Mon, 15 Dec 2025 15:09:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A26110E5D2;
	Mon, 15 Dec 2025 15:08:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i1ORHC+S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57A1810E5D8
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Dec 2025 15:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765811336; x=1797347336;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9SJGCvx7rJ4z5oiyRq/q6hoX4qS5DQFtJU9oeEXKFb8=;
 b=i1ORHC+SL5Hxab9/SDHbdNvpM4lZbRkTwneTN1uHXSoOby+Y2UjBSXP6
 vo5ObTDmanxC/2GS6INWF9iB0nKSwr6zyBCplWyoDRLizLUPXWqOSq7CP
 WQev0ghWt3SxlUl8xxAs++C01ZWU3UzZ8GBi7K3dc5wfhlzOOh3S31U40
 eCqQvg8VDMKqXcYytg7JA9KxZc6Lv65dD1Dkhe680Ay0JcudmTqySUmiD
 bsI14093BTARkMZipdnrSRHpovX3nsqzBHCfnhFvl7r/+1WWt0lznono0
 GFc4l4Au0W3Agyg/D6MdBPJs9MDodz3Vu+E/HrqmBiP8PtQxEOYdym6jY w==;
X-CSE-ConnectionGUID: OliVJ3xLRhSX1BfB7Jm0KA==
X-CSE-MsgGUID: ADgpf5SWQ7iZpXxjY1qweQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="79084805"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="79084805"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 07:08:55 -0800
X-CSE-ConnectionGUID: lQWI0l97SqKjWd+qZwHgsA==
X-CSE-MsgGUID: +CavPUa0TZ2LuYj+inOjiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="197633241"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 07:08:54 -0800
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, kunal1.joshi@intel.com, karthik.b.s@intel.com,
 sameer.lattannavar@intel.com, Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH i-g-t v4 0/2] Fix chamelium port allocation during igt_fixture
Date: Mon, 15 Dec 2025 20:37:13 +0530
Message-ID: <20251215150717.1190726-1-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
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

The current fixture implementation executes even for unrelated subtests,
causing false failures when expected inputs were not present.
Refactor the DP/HDMI/VGA hotplug tests to use a common
connector lookup pattern so that each test skips cleanly.

v3:
- Introduce a unified connector test macro (Sebastien)
- Remove unused variable (Sebastien)
- Drop per-connector fixture usage (Sebastien)
- Refactor DP/HDMI/VGA hotplug tests (Sebastien)

v4:
- Rename helper to igt_chamelium_get_port (Jeevan)
- Add documentation for helper and macro (Jeevan)
- Use lowercase name for test macro (Sebastien)

Mohammed Bilal (2):
  lib/igt_chamelium: Add igt_chamelium_get_port() helper and
    connector_test() macro
  tests/chamelium/kms_chamelium_hpd: use helper function for connector
    lookup in DP/HDMI/VGA tests

 lib/igt_chamelium.c                 |  22 +++
 lib/igt_chamelium.h                 |  26 +++
 tests/chamelium/kms_chamelium_hpd.c | 238 ++++++++++++----------------
 3 files changed, 145 insertions(+), 141 deletions(-)

-- 
2.48.1

