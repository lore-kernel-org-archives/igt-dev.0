Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87F2CEDE998
	for <igt-dev@archiver.kernel.org>; Wed, 11 Sep 2024 07:24:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 032DD10E803;
	Wed, 11 Sep 2024 07:24:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EWzbHvse";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55CBF10E17C
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Sep 2024 07:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726039451; x=1757575451;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Jho2WnnRs98V6DxrBDYtLeUkJwkPlQoJAN5mx6lvuk0=;
 b=EWzbHvsegBhVfaGg6r6qUI0mZzsu72e4HRkSFo0DfUNe7zyehxhsO9sb
 yuy4y7I5k/gs262PIfTCjegrv1WcKXHd5zYQ6vSz4Xk9A/52kdN2xLvUh
 pdD9I24TSJl+v4B7rngrwK8HsZ3u0RUpBZyhZsoimCAV+vl4bI94OKfwn
 J1VJOiobvEgvbtheRu3N7FqDYPm7DmiYw/iY6KTOmLWyneY4+YuAxinaE
 AbtAHXKe2qBEn1YIHlauvvOVduWnqTrmS9dAzi8oBhSe/xl5cM1B+oOoa
 MJp5ND540th1czqdt6pDcYQnfCxt+d2JyC+qYOw0bROxrMJhdb8jZ+kOX w==;
X-CSE-ConnectionGUID: 0gaM4+5JQ6efhg/NerKAjA==
X-CSE-MsgGUID: g6+htCX4Rj+Dloe30QkN3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="13468082"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="13468082"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 00:24:10 -0700
X-CSE-ConnectionGUID: elAeF21eTTuxPWh9cZzo0w==
X-CSE-MsgGUID: EtMFO3avTOW/L2iOfGB/qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="67116420"
Received: from srr4-3-linux-124-kbs1.iind.intel.com ([10.190.238.68])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 00:24:08 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, santhosh.reddy.guddati@intel.com,
 kunal1.joshi@intel.com, bhanuprakash.modem@intel.com,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t v2 0/3] Add tests for ultrajoiner validation
Date: Wed, 11 Sep 2024 12:52:01 +0530
Message-Id: <20240911072204.22825-1-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.39.1
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

This series adds subtests to validate basic ultrajoiner modeset and
negative tests to validate invalid pipe configs on both ultrajoiner
capable display and on non ultrajoiner capable display using the force
joiner debugfs option.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>

Karthik B S (3):
  tests/kms_joiner: Add tests for Ultrajoiner validation
  lib/kms: Update force joiner helpers to accomodate Ultra joiner
  tests/kms_joiner: Add subtests for force ultra joiner validation

 lib/igt_kms.c                                 |  77 +++++-
 lib/igt_kms.h                                 |   5 +-
 .../intel/{kms_big_joiner.c => kms_joiner.c}  | 239 ++++++++++++++++--
 tests/meson.build                             |   2 +-
 4 files changed, 290 insertions(+), 33 deletions(-)
 rename tests/intel/{kms_big_joiner.c => kms_joiner.c} (63%)

-- 
2.39.1

