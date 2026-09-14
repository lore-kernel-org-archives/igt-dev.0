Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67940C88E50
	for <igt-dev@archiver.kernel.org>; Mon, 14 Sep 2026 09:45:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0A8A10E0B4;
	Mon, 14 Sep 2026 09:45:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kPt7fXvv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCEAD10E0B4
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Sep 2026 09:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789379063; x=1820915063;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KKwXRuVSbGvUZVxFCzQzDQofJJnqvQHp2PPA+KUYtN8=;
 b=kPt7fXvvTzkp0M5r28fgS2PFxYrzVjvIeX2QzIFuYSc7NL0aCfwUeNsW
 nLxdlv4TRo69xTf/2cILjnFB0ZVOjdfeMkYCLM+Gjj00ye0sU5ieBoMzl
 jJ4LXYSQrBmbsap7j6eS0MZx2trsK/FSuFrrYMp92U8sCsClA8Xsm02Q6
 krMBQot2Y/MeK4VCn7P+hc9TPXfUP3okICPPWITAs9LDV9MzmWV/mEoRa
 7j4t0NksjXVBwULeNGeW+Z7bgVKttbagH6b0NUEavbXs91BNGsmdboZ/m
 f0wH5gTnRK8meJJK5ZEHo21dhcxQlQKXSTjSRIIFgxkOnLg7Hg0l+FVB0 w==;
X-CSE-ConnectionGUID: RHrHXwiaSraa3IRdmnQ8UA==
X-CSE-MsgGUID: GhIwBra6QoqdJ7msgo7xlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="100390055"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; d="scan'208";a="100390055"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 02:44:22 -0700
X-CSE-ConnectionGUID: NqLRf02NSBedjC7UORIysQ==
X-CSE-MsgGUID: 2cZV+5fWRYOCDpPq+vTLcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; d="scan'208";a="271184131"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.104])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 02:44:20 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Pranay Samala <pranay.samala@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t v4 0/2] tests/kms_color: Add support for background
 color testing.
Date: Mon, 14 Sep 2026 11:44:12 +0200
Message-ID: <20260914094415.10899-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

      This is resend of patchset from https://patchwork.freedesktop.org/series/167119/
with dropped first patch for drm-uapi, as it was merged, for testing on new
kernel 7.3.0-rc3.


v4: resend of kms_color changes (Kamil)

v3: sync with most recent drm-next uapi change, fixed subject
  in second patch (removed dot from end), removed one non-needed
  empty line from last patch (Kamil)

Cc: Maarten Lankhorst <dev@lankhorst.se>
Cc: Adrián Larumbe <adrian.larumbe@collabora.com>
Cc: Pranay Samala <pranay.samala@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>

Maarten Lankhorst (2):
  lib/igt_kms: Add support for the BACKGROUND_COLOR property
  tests/kms_color: Add background-color subtest to test the
    BACKGROUND_COLOR property

 lib/igt_kms.c     |  6 ++++
 lib/igt_kms.h     |  1 +
 tests/kms_color.c | 71 +++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 78 insertions(+)

-- 
2.55.0

