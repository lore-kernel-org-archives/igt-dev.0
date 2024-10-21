Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C61D3E18D
	for <igt-dev@archiver.kernel.org>; Mon, 21 Oct 2024 07:25:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 188BF10E424;
	Mon, 21 Oct 2024 07:25:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N9+HYUL7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36E8E10E424
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Oct 2024 07:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729495533; x=1761031533;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=c54jbjDKmFCFyOEMqxaB93CFj4oNyIkcSL4jw8mrBIE=;
 b=N9+HYUL7AnLX3weFGaJTuzjxhL40udgO3+/hI+bMhseKYJCbUk+iGBsK
 kCEWEhv/tQamBZnNupWn20fPvsHNKbU0CWpMrzLR3NFcShZGy5TY1itE5
 viuzQ0lAj+2AjxRSwU0pkkmoPdzcJ6gb+kh6YU1rPrDKMIuGjF7JcKGef
 V+I/jnjNMo1QoQdUngcAvzKWFEDNqjmyF2GTOWtBXA87WjAnLpJ2InpPX
 gVfpbGnM4GI5WsPNaBgn95VpqP//K9CuT4g/WLKfXK4paDqwOTGqvYcmx
 AfX8cyrtYI70oY67SI1dv5+ptsz7jYeD2pknL9juDMEDuql/2XY7Vcy7G Q==;
X-CSE-ConnectionGUID: P5nnU+xuT52LpDy8I3ZjPw==
X-CSE-MsgGUID: tK/lh8VTQm+joKFzqVBdrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="40355101"
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; d="scan'208";a="40355101"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 00:25:33 -0700
X-CSE-ConnectionGUID: sT2pw93pSU+50NxEde6Hhg==
X-CSE-MsgGUID: y9JhNoa4QcCfmqngR+M1ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; d="scan'208";a="79787329"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.145.169.150])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 00:25:30 -0700
From: sk.anirban@intel.com
To: igt-dev@lists.freedesktop.org,
	anshuman.gupta@intel.com
Cc: sk.anirban@intel.com,
	riana.tauro@intel.com
Subject: [i-g-t, v3,
 0/2] tests/xe: Add tests to validate GT coarse power gating status
 and toggle coarse power gating states
Date: Mon, 21 Oct 2024 12:49:00 +0530
Message-Id: <20241021071902.2086909-1-sk.anirban@intel.com>
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

From: Sk Anirban <sk.anirban@intel.com>

Implement test cpg-basic to validate coarse power gating status
after S3 cycle.
Add test cpg-gt-toggle to check if GT coarse power gating is up when
forcewake is acquired and down when released.

v2: Address cosmetic review comments (Riana)
    Fix suspend state (Riana)
    Add exit handler for test cpg-gt-toggle (Riana)

v3: Address cosmetic review comments (Riana)
    Fix commit message & test name (Konieczny)


Sk Anirban (2):
  tests/intel/xe_pm_residency: Add GT coarse power gating validation
  HAX: Add Coarse power gating tests to fast feedback list

 tests/intel-ci/xe-fast-feedback.testlist |  2 +
 tests/intel/xe_pm_residency.c            | 92 ++++++++++++++++++++++++
 2 files changed, 94 insertions(+)

-- 
2.34.1

