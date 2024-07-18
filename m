Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE29C3DA63
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jul 2024 14:01:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF6DA10E89E;
	Thu, 18 Jul 2024 14:01:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XNFY0Hy1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4018F10E89E
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jul 2024 14:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721311299; x=1752847299;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vmisTOHCxMHuGxfTuvimfwqTxqb3VjbzmsnZt0ffNnA=;
 b=XNFY0Hy1BeCTPxoXVCYDQcAJzQKI1W++qlALjLo3R7uro9gQN6LlIVmE
 XGJMxteBtn1eM6ZqZ6Eg+Npl5M3lPRkjI7za78zX1nuHAedYlRG53ZskA
 tSjlJ6FGens65mDG8pwJx+GYxav47yfGOBKHodphAIK8mMrvfS+tza1o8
 f1z483hsssHa8uiFbh8h3oVJWzlbCYm7VQzoADYpDlPbYJqLb3s1HAqiu
 2dtKLDOWRiWXf3oZBWNavZsqIArl98ToSlMxKzDW/yBWJcq5WJoVbKoJU
 eRvBGL0UQ57HU5HrvIAu+Xeh+GbYlsLlQDxJbqI6IUXYO2SRQ/25ZsRV1 Q==;
X-CSE-ConnectionGUID: Po3JTnWkQ7+eWkeZU7Jobw==
X-CSE-MsgGUID: DOLFAwIfSUCXUscgANy1Ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="19005867"
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="19005867"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 07:01:38 -0700
X-CSE-ConnectionGUID: ybcimBkmRfCFFbyA3ZVD4Q==
X-CSE-MsgGUID: YOXcqpshS3ed93eEHYt7Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="55927279"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2024 07:01:36 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, kunal1.joshi@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v7 0/5] tests/kms_plane_scaling: Improvise the scaling
 BW issues.
Date: Thu, 18 Jul 2024 19:35:41 +0530
Message-ID: <20240718140546.676903-1-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
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

Find display mode fitting within bandwidth constraints for scaling
operations

Naladala Ramanaidu (5):
  tests/kms_plane_scaling: Update the single plane scaling function
    arguments
  tests/kms_plane_scaling: Update the multi plane scaling function
    arguments
  tests/kms_plane_scaling: Find display mode fitting in BW
  tests/kms_plane_scaling: Find display mode fitting in BW for rotations
  HAX patch do not merge

 tests/intel-ci/fast-feedback.testlist    | 201 ++++----------
 tests/intel-ci/xe-fast-feedback.testlist | 317 ++++-------------------
 tests/kms_plane_scaling.c                | 278 +++++++++++---------
 3 files changed, 256 insertions(+), 540 deletions(-)

-- 
2.43.0

