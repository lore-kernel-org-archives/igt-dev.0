Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D5D7EE645E
	for <igt-dev@archiver.kernel.org>; Wed, 31 Dec 2025 20:20:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47CBB10E7E6;
	Wed, 31 Dec 2025 20:20:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="av8NM4e/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2D0610E073
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Dec 2025 20:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767212413; x=1798748413;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=h6QO96+P/peITFuZcIg1hmfeoiEJQranLhP5dPGBQrE=;
 b=av8NM4e/r2pXd7lOKg7AJORBo/BlnNG/tEcdeMbnUPJQK3nw5/nexYLC
 UeCy5EkZtLtgZCP4J7xN5eObnHzScO5lihrTQJl4aNY2jVPCpVFjgGZrz
 nxK7AxWmAz8MKP1SLZT86IVMuXGox33v5rtWUDwtHNyavDNgkrecc3EYF
 aAR6+/FQ9vSzb8wcG0NYAkrdf3b9rTHRZ+7OZhw79otkOpNg80YcdggyS
 3J7ufKHI9S+OkXda9PUuzqz+Idn7qr47Oq6rP+gIekMXkQbeIMGFCpD6t
 ABnCdqb21wg8VmgK0WPj33sHB1BY2iXT0GVgEEv2eh7duBYc3wy46gkZ4 Q==;
X-CSE-ConnectionGUID: dtlKQYvCTU6N1Lp1VTLz8A==
X-CSE-MsgGUID: kHh8+ZLuSmW0xHpQfQlPGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="68844908"
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; d="scan'208";a="68844908"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2025 12:20:12 -0800
X-CSE-ConnectionGUID: DRVqbABIRVCdg5H3qwFFWw==
X-CSE-MsgGUID: 00vUMHd0TCW+BYc4VflieA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; d="scan'208";a="224998650"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.42])
 by fmviesa002.fm.intel.com with ESMTP; 31 Dec 2025 12:20:12 -0800
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>
Subject: [PATCH v10 0/5] tests/intel/xe_pat: add helper funtion to read PAT
 table
Date: Wed, 31 Dec 2025 20:20:05 +0000
Message-ID: <20251231202010.115619-1-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
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

Xin Wang (5):
  lib/intel_pat: add pat_sw_config debugfs parser
  include/linux_scaffold: add FIELD_GET() bitfield helper
  tests/xe_pat: add pat-sanity subtest for debugfs vs getters
  tests/xe_pat: use debugfs reserved flags
  intel-ci: add xe_pat pat-sanity

 include/linux_scaffold.h                 |  6 ++
 lib/intel_pat.c                          | 94 ++++++++++++++++++++++--
 lib/intel_pat.h                          | 20 +++++
 tests/intel-ci/xe.fast-feedback.testlist |  1 +
 tests/intel/xe_pat.c                     | 88 +++++++++++++++++++++-
 5 files changed, 198 insertions(+), 11 deletions(-)

-- 
2.43.0

