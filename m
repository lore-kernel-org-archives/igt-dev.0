Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D52CAC592
	for <igt-dev@archiver.kernel.org>; Mon, 22 Sep 2025 07:28:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D54A10E3CC;
	Mon, 22 Sep 2025 07:28:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ghuXv4Rr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0FD910E3C7
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Sep 2025 07:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758526094; x=1790062094;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=u2C1VOgmKX9ju3Rsje0TNJ6SmNy9DpaY9Py8VrlRAWA=;
 b=ghuXv4RrA7JV9mg+6kipuGx4uP9tqkVv9Ntje+LrNV/32BqU+x4vmlRX
 g/ZZzRh22yROgum+K76d2WWw6in5Jiii9uAPZUk0WwyLjSX3U9lkH856d
 ny6fCoqr3ianc5BebbFMeNU8LcNL9A1IPn3AWHGBMDUstD4s3lbqQ+plH
 I/xD+QvwpfvdZD+d4K3500vuvHV1L5dD+B4So+VHlOwfNrsmhc9p7kgdg
 wzzdC6/SAHV8GbyjX3Eo/VeSyjlTAwWnvO8iqxn2CQLTpz68OhcwwwINc
 3OPaRBs341vEVvaOXODLnZzrquUmtvRQyCtgyvGen2Ip+unnhJkkY78nK w==;
X-CSE-ConnectionGUID: wUAfDjMwRlepOoT01c2Z7w==
X-CSE-MsgGUID: hsSpWxfgSqewg81XqHafAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="60708116"
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; d="scan'208";a="60708116"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 00:28:13 -0700
X-CSE-ConnectionGUID: NbCX6j9VS6qzkem1n0nnmw==
X-CSE-MsgGUID: 1nVUCCTbQDOpSxD30yM1Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; d="scan'208";a="176013535"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 00:28:12 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com,
	Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 0/3] extend lobf test for supported connectors
Date: Mon, 22 Sep 2025 13:13:58 +0530
Message-Id: <20250922074401.2494339-1-kunal1.joshi@intel.com>
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

Extend lobf test for all connectors that
exposes i915_edp_lobf_status debugfs

Kunal Joshi (3):
  lib/igt_kms: add helper to check presence of lobf debugfs
  tests/kms_vrr: extend lobf test for supported connectors
  tests/kms_vrr: remove check for PR support in sink

 lib/igt_kms.c   | 20 ++++++++++++++++++++
 lib/igt_kms.h   |  1 +
 tests/kms_vrr.c |  8 ++++----
 3 files changed, 25 insertions(+), 4 deletions(-)

-- 
2.25.1

