Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EC4CC35FF6
	for <igt-dev@archiver.kernel.org>; Fri, 14 Mar 2025 00:21:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C894710E95B;
	Fri, 14 Mar 2025 00:21:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RGMKwNqm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6001310E23A
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Mar 2025 00:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741911666; x=1773447666;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cnE1Njd8CRawaajfNscLB48Oe+AQb6jq5YYAuVedPy8=;
 b=RGMKwNqm+d+9GAXk0c3sKLui0DhEPWmuqBV182aMuqE3VVoVtEDDMOw0
 JVHTzVQs/QmfLhfu/2JLJXv6UQ8942CZ/kMjGKyfF9iufBnLLU6Vj8asX
 ScFAgLNkzTyyZuBff4rQvUH6dpmcdU1Zcu+leF5kdhyuGYoVyxeRF28II
 wXtPRHvlnSpZmMZjwWoeLB7Pg1Sakw4CS9c9lLds0e/C9rF0awh2LmgNc
 1FecatmXNYys/+XiGyioV51pBitFadpePpuIVuZ3Q92Ff0o7laLZ4jpwQ
 n+Y/rELy4z0zeTZgK/TD+7KEYLa7VMaL7+2bcc1LTAurNj64kK+MtMG8y g==;
X-CSE-ConnectionGUID: EiGSR1nPShKMlqJym/lVJg==
X-CSE-MsgGUID: QcQiXGxvS5yPBKkRIYrgcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="46703105"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="46703105"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 17:21:06 -0700
X-CSE-ConnectionGUID: MYtiU6b8QV21oPqYoMFdNQ==
X-CSE-MsgGUID: 2W4odnb+RzOxY1X0CHswSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="126149581"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 17:21:06 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 0/3] tests/intel/xe_oa: Fix __for_one_render_engine
Date: Thu, 13 Mar 2025 17:20:55 -0700
Message-ID: <20250314002058.220854-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
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

Ashutosh Dixit (3):
  tests/intel/xe_oa: Fix __for_one_render_engine
  tests/intel/xe_oa: Don't limit sync tests to render engine
  tests/amdgpu/amd_hotplug: Fix compile on Ubuntu 24

 tests/amdgpu/amd_hotplug.c |  1 +
 tests/intel/xe_oa.c        | 29 +++++++++++++++++++----------
 2 files changed, 20 insertions(+), 10 deletions(-)

-- 
2.48.1

