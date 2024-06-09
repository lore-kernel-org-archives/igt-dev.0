Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAF60C27C5E
	for <igt-dev@archiver.kernel.org>; Sun,  9 Jun 2024 21:13:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A48610E2BD;
	Sun,  9 Jun 2024 21:13:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FBiHWPJ4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E7BD10E2AE
 for <igt-dev@lists.freedesktop.org>; Sun,  9 Jun 2024 21:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717967622; x=1749503622;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ujGmkl9c7L5dMOj/H1FZgEi+waeAKSbRJiR6zrxeVjA=;
 b=FBiHWPJ4GIk2csxIgPOUKXGWSvakrUJ8DZm1r8THnocuo7q/4iROgvFl
 KwBZpj10T7Wm06d+jwtyWRZJIy0kta8JYd6fcpVgY87G3V6A5VadONZIv
 E46/fZrk5ybVvzxzAMzciz9xbvObge1EG9DJMDtzCRb+jBjYZ1u1lMnK+
 Vg6D0JjjX9cS5dA7dFFTit/QecI0MPZsbcLeBBFjgVW7H3xQTDmBJaC2X
 ReWareoT81ifhMPgTWJ8zM0kIlFdNHYr+qv0Po+x9IQhtCQen357yZ7Ry
 QyYEpYj4jQqRDEFVc7jgWr4qSq3028z5WLp5GHInk/M+BTtxq9Fj0n5uB g==;
X-CSE-ConnectionGUID: xBZdkgUdQM6BAdjeZa6g4Q==
X-CSE-MsgGUID: gm3l0JMrQ0u87NFYfaMxHA==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="26037475"
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; d="scan'208";a="26037475"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2024 14:13:41 -0700
X-CSE-ConnectionGUID: 1up3BIbnQ7CbEVeKLDb12g==
X-CSE-MsgGUID: 0S7qJYrgSHmRUjy5IN5UvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; d="scan'208";a="38990999"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2024 14:13:39 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 0/9] add test to validate fallback
Date: Mon, 10 Jun 2024 02:55:26 +0530
Message-Id: <20240609212535.868832-1-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
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

[1] provides debugfs interfaces to force link training
failures, retrain link, set/get current/max link rate/lane count.

add new test using newly exposed interfaces to validate fallback.

[1] https://patchwork.freedesktop.org/series/133624/

Kunal Joshi (9):
  lib/igt_kms: add data structures for link rate,lane count and training
    info
  lib/igt_kms: add function to get/set a target link rate/lane count
  lib/igt_kms: add function to get max link rate/lane count
  lib/igt_kms: add function to force link training failure
  lib/igt_kms: add function to force link retrain
  lib/igt_kms: add function to get link training info
  lib/igt_kms: add function to check force link training failure support
  tests/intel/kms_dp_fallback: add test for validating fallback
  HAX: do not merge

 lib/igt_kms.c                         | 375 ++++++++++++++++++++++++++
 lib/igt_kms.h                         |  47 ++++
 tests/intel-ci/fast-feedback.testlist |   2 +-
 tests/intel/kms_dp_fallback.c         | 207 ++++++++++++++
 tests/meson.build                     |   1 +
 5 files changed, 631 insertions(+), 1 deletion(-)
 create mode 100644 tests/intel/kms_dp_fallback.c

-- 
2.43.0

