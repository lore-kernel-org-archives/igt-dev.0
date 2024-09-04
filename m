Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0640CD3431
	for <igt-dev@archiver.kernel.org>; Wed,  4 Sep 2024 07:21:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55D0E10E692;
	Wed,  4 Sep 2024 07:21:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nKOUt7Ys";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3733E10E68F
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Sep 2024 07:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725434516; x=1756970516;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VYh2AKhtTdrYE/imM9iydZMMLbm1GE+tJoKqsBZ6ls4=;
 b=nKOUt7YsfSGAmV56ybQaQy2MlK9BERDChHYzDByNyHdtkXN2NMB6iT0l
 axDT1IgznJ/p6qaRld7EDvkotNppoRP2wzvLsP/N2a4X9oLLdT9zQL9Yw
 i0HWN2fLDho6coqD+wMIb8amo27KQxKslaok3pYdtH4cWh4QSSDgy7EeE
 hZBYR94OqSbgt8XsmA+t+mhcDP6pU3VZcsnBxrE9u+JV/72bGFipGYgRl
 iX4e2g4qQSAmVsNSmg2VLhIUBWQ0PDSvdp7bJRgksQgHYBkcMoUXF9+fw
 2oQ2UE0U461Olw6C6OsjA6mGfXIcZ/AvQ0E6ba2vpdNxkbpEl94b4axgg A==;
X-CSE-ConnectionGUID: Xu2LWmuSS5iF1yrcg4RObw==
X-CSE-MsgGUID: N/FyBF7VTGexHkXgNDvZaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23951606"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="23951606"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 00:21:56 -0700
X-CSE-ConnectionGUID: dtMAiLsgRZi3bcu2EUXJMA==
X-CSE-MsgGUID: kOGXCeWUSra5nk4uw8UxWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="65901786"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.130])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 00:21:54 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t v3,0/3] Add dsc+bigjoiner subtest
Date: Wed,  4 Sep 2024 12:54:22 +0530
Message-Id: <20240904072425.1022100-1-swati2.sharma@intel.com>
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

This series uses big joiner debugfs.
New subtest is added to validate dsc + big joiner use case.

Swati Sharma (3):
  tests/intel/kms_dsc: move restore funcs() to reset func()
  dsc: add dsc+big joiner helper func
  tests/intel/kms_dsc: add new subtest

 lib/igt_dsc.c                | 17 +++++++++++++++++
 lib/igt_dsc.h                |  1 +
 tests/intel/kms_dsc.c        | 28 ++++++++++++++++++++++++++--
 tests/intel/kms_dsc_helper.c | 33 +++++++++++++++++++++++++++++++++
 tests/intel/kms_dsc_helper.h |  3 +++
 5 files changed, 80 insertions(+), 2 deletions(-)

-- 
2.25.1

