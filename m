Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E0FE7716C
	for <igt-dev@archiver.kernel.org>; Thu,  5 Dec 2024 09:25:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 170BA10EE08;
	Thu,  5 Dec 2024 09:25:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aASvOE0q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F270C10E389
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Dec 2024 09:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733390750; x=1764926750;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nuK9IJV6fQJmhasRclIf9TU+OoKcD9DJt1JCGutzbik=;
 b=aASvOE0qrBk4dffkTcLw+ghBrlcldBMoiSLnz4BsThj1Qwd9i6bsrItJ
 OYA1mpuiazE/6/YnBzMcPHGKsdXd6tXl2N3CMvbtjsLcr1zymeLrwUiPR
 x1OOJDJYdWZRjpJXYUfFUwkVlFXzOdc9q3T5DJ51XPolmi4KdZDs9iljh
 ihnP0hoXfoDe1ruBtNVTaGugmQIxokkubyOp1soUI1tjY2oDCB9uEJ+nj
 srbuntRbAuhG8cTu/7n7S3ILcGTG3hT/0IBXEKxpESCI7IL8uZPjXwVNC
 YqDNaw3S0TU2me7BsU78Im85OJwAwvqp3MgXmPWEKh6E6qR4D9RSaWoSD A==;
X-CSE-ConnectionGUID: 2iYDD3bUSUewg/qKK24D9w==
X-CSE-MsgGUID: +2s0EOdCSLW4CGs9Iwlgpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33827974"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; d="scan'208";a="33827974"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 01:25:50 -0800
X-CSE-ConnectionGUID: GluVfdHyQSmWmyRuPbpnEQ==
X-CSE-MsgGUID: vcGdu7hKQrCrtxvVSw2ZdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; d="scan'208";a="99117513"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 01:25:48 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 0/2] prevent consecutive unplug
Date: Thu,  5 Dec 2024 15:10:50 +0530
Message-Id: <20241205094052.1259373-1-kunal1.joshi@intel.com>
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

chamelium_reset_state will unplug all the ports,
prevent unplugging multiple times

Kunal Joshi (2):
  tests/chamelium/kms_chamelium_hpd: don't unplug multiple times
  HAX: Please do not merge

 tests/chamelium/kms_chamelium_hpd.c      | 4 ----
 tests/intel-ci/fast-feedback.testlist    | 2 ++
 tests/intel-ci/xe-fast-feedback.testlist | 3 +++
 3 files changed, 5 insertions(+), 4 deletions(-)

-- 
2.25.1

