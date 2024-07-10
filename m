Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72AB3C3DA41
	for <igt-dev@archiver.kernel.org>; Wed, 10 Jul 2024 15:24:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1763D10E81F;
	Wed, 10 Jul 2024 15:24:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WNB9AqFC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8A3B10E81F
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jul 2024 15:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720625093; x=1752161093;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WhrmtijAA1alOB23jTBLdOdhsd3NUEfkufy+53az03U=;
 b=WNB9AqFC7M+vP2eyuKmSCqJbFNMh5RULDzOxTvColtYaMlzy5h3AjbwQ
 y1nwxQDozRb+kjdCm1PJ4x9riCfI60dk1ZaJn45xMjluod4fMRJDNWqcc
 yYOAL0WEXkG9sKsrGqSDE7tEfwxA+KefifwvnDXh9fPKAQ6leac7D0sSM
 NTcefOA/dSZELjlh78DEarAcQ8+nI20ypdtku7297DxbmbW21xsxBfrLv
 U8CXpmdmx7m5/8VWUD9K705T4u8QIBGE6Xhin4Z9IXlMghK+M+uMFwMUi
 2pbZ//tN8ZguN1RS9AzJ2B0Nxb2ABzdfaL0Zr9Sftbt1k53LsqjpaITnH Q==;
X-CSE-ConnectionGUID: OKLuEiWxSZuJoefMHc5HEQ==
X-CSE-MsgGUID: 12Ff/wumSn63gdna0heZxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="35387265"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; d="scan'208";a="35387265"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 08:24:53 -0700
X-CSE-ConnectionGUID: c+KiCdjbTjuQaLj/a7X+fw==
X-CSE-MsgGUID: DXx1YPGARKeWozh2ynIFbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; d="scan'208";a="48007680"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.96.225])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 08:24:51 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Michal Wajdeczko <Michal.Wajdeczko@intel.com>
Subject: [PATCH i-g-t 0/2] Refactor sriov_basic test and blocklisting
Date: Wed, 10 Jul 2024 17:24:44 +0200
Message-Id: <20240710152446.827476-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
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

This patch series improves SR-IOV testing within the intel-ci environment.
The first patch blocklists SR-IOV tests identified as overly stressful
or time-consuming. The second patch extracts a specific subtest
to simplify blocklist management and control over dynamic subtest
execution.

Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Michal Wajdeczko <Michal.Wajdeczko@intel.com>

Marcin Bernatowicz (2):
  tests/intel-ci/xe.blocklist: Blocklist SR-IOV stress tests
  tests/sriov_basic: Extract enable-vfs-bind-unbind-each-numvfs-all
    subtest

 tests/intel-ci/xe.blocklist.txt |  6 ++++++
 tests/sriov_basic.c             | 15 +++++++++++----
 2 files changed, 17 insertions(+), 4 deletions(-)

-- 
2.31.1

