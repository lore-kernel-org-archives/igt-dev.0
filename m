Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76324CD5BC9
	for <igt-dev@archiver.kernel.org>; Thu,  5 Sep 2024 14:51:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9023B10E8DD;
	Thu,  5 Sep 2024 14:51:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UR2uivNX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4352910E8DB
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Sep 2024 14:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725547893; x=1757083893;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ewjDU8eXnVsjO/+s3UzMBpOQtOQNy+OrSSHjHe8kI54=;
 b=UR2uivNXyVbzFdRcbC7VoFq19YoKBJENKlriqxhha38xDKsJoFlyCRjb
 DaaQC8pWLMoy7Ah+z0RptTNWEJdcP8p690vxVDoy96Tbo53jeHGTRetHj
 Ow+VLpYV15lGgr2Rj3r8MAjf4z1Tb5j62B6w2fWTopXFoyKEGkdHQ1Zfs
 nj1+7pv0DQey50Tm+m0oQHA3HyCDVf98d/oyyl+p3u2QEQbu8IKoo9jK5
 8AwL7bugq4IFsSPIzUJYuwdFqN2qG4OQcnY+WZy09DORA1DzcT1Ban0dI
 lQaP0JcwP53AMhdDIgHEti8dbi2x3QNacuKATULh1FDC9tt4i3Pqlo9GY Q==;
X-CSE-ConnectionGUID: 0eV5yEz5QEGQSPJUuY6RVg==
X-CSE-MsgGUID: H9gnJ29oT0GexF3vjwLpag==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="24145512"
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; d="scan'208";a="24145512"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 07:51:12 -0700
X-CSE-ConnectionGUID: fUu9xAjkQPSFL2N2OWl7uw==
X-CSE-MsgGUID: /NXQFCwfT7OyRQ3DoMdVuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; d="scan'208";a="88887164"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 07:51:10 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1 0/5] tests/kms_plane_scaling: Update scaling
 functions to retry on valid outputs
Date: Thu,  5 Sep 2024 20:20:33 +0530
Message-ID: <20240905145038.1569226-1-ramanaidu.naladala@intel.com>
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

It will retry scaling operation on next valid output if current output
is unsupported.

Naladala Ramanaidu (5):
  tests/kms_plane_scaling: Update scaling functions to return error
    codes
  tests/kms_plane_scaling: Add informative logs for single plane scaling
    operations
  tests/kms_plane_scaling: Return error code in
    test_planes_scaling_combo
  tests/kms_plane_scaling: Add debug logs for output scaling attempts
  HAX patch do not merge

 tests/intel-ci/fast-feedback.testlist    | 213 ++++-----------
 tests/intel-ci/xe-fast-feedback.testlist | 319 ++++------------------
 tests/kms_plane_scaling.c                | 322 +++++++++++++----------
 3 files changed, 280 insertions(+), 574 deletions(-)

-- 
2.43.0

