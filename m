Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1929BC3DA63
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jul 2024 14:39:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9DBC10E6FC;
	Wed, 24 Jul 2024 14:39:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fJ7Utm+K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C93D10E6FC
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jul 2024 14:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721831969; x=1753367969;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Bt4BX6abvhsl/oT5CWZAP1+vuS8I/vuTM+T7yNoWJD8=;
 b=fJ7Utm+KoNWoMReXV9tsBMfdPlSgaWOnop3uX2K4mMQAccC1SRydoPNG
 Fki0NXQPb952WfyyMgM3T3dFg+Cwxevu66vjeKzN4TyEUzivJXa9at7hT
 964nv9/EEcMvyXrAZyMRFuxU6e1VPfNHYrNe866RjH3Bom/uJnDawC66H
 GmvxYMKL+thavFtOW7F1c3eJGJTOGIHGay0BZAIyVfHf1ieC56dA9O1l0
 drQXwru3sR4Vr6ckTm3yFzDu3jgHLTWk57AzBIgQaDW4ZD25PYtqak/f2
 zwtGIqhcWpg1KElQPteBvbnEwiRXpaoQLvi83ZFoS9Hqn+FYtxx6qRAIV Q==;
X-CSE-ConnectionGUID: X8ZOXaHST3Cr7H4LJm9s2A==
X-CSE-MsgGUID: YNSJrDcpSv6Aq0LWjPc5Rg==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="19476685"
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; d="scan'208";a="19476685"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 07:39:29 -0700
X-CSE-ConnectionGUID: X895P13OQ4StQnRJ3R/cdg==
X-CSE-MsgGUID: j7nHJyQtQPmPyDnEEnxYFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; d="scan'208";a="52828251"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 07:39:26 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>,
 Kamil Konieczny <kamil.konieczny@intel.com>
Subject: [PATCH i-g-t 0/1] Add i915_selftest@wip selftests to execution
Date: Wed, 24 Jul 2024 14:39:16 +0000
Message-Id: <20240724143917.3405163-1-katarzyna.piecielska@intel.com>
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

Those tests are skipping in CI execution as those were not added to
i915_selftest test in IGT. So let's do that.

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Chris Wilson <chris.p.wilson@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@intel.com>

Katarzyna Piecielska (1):
  Add i915_selftest@wip selftests to execution

 tests/intel/i915_selftest.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

-- 
2.34.1

