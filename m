Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B032C54E58
	for <igt-dev@archiver.kernel.org>; Mon, 25 Mar 2024 20:11:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1AC810E7CA;
	Mon, 25 Mar 2024 20:11:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fsM/Znis";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A074E10E7CA
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Mar 2024 20:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711397508; x=1742933508;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VWYUMpbdokIaQSU1gyl99PhQH5UHIZ+pnCVTbk1LZL0=;
 b=fsM/Zniseg8r732szPgoQuEzZie0JZLqcxr605YLJLelkHFTlFgumIfv
 Fd+SsfXtw9JLNBaGjMggIPZaM0t0Mt8pJeONCVN5MCmCvlqInruR8VunP
 V4J0+veRLO/tvE0tQ1L00vP5UE2+J7tXOSdtrHO3/oFM7FsmTvMWn8lSi
 FrQte+FhY/cVeymd3lGrFTkg7QE4k2F8iQNNgpxFaP7Obbap7DlzXgndC
 kRKH+UJVQi1GU0DG1gyV2VAZAPtgbvayhpdysuV0WiL2tu5H54WJ6h+Xf
 Guooqz3JA9NaHVuz8GM4VNxNsPirmL1I0U4SoO2v43idEGk4IHqoUc1Y1 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6289289"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="6289289"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 13:11:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; d="scan'208";a="16400497"
Received: from gfx2.iind.intel.com ([10.145.169.154])
 by orviesa008.jf.intel.com with ESMTP; 25 Mar 2024 13:11:45 -0700
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org, sai.gowtham.ch@intel.com,
 rodrigo.vivi@intel.com
Subject: [PATCH i-g-t 0/3] tests/intel/xe_pm: Tests to validate vm-bind
Date: Tue, 26 Mar 2024 01:40:42 +0530
Message-Id: <20240325201045.25805-1-sai.gowtham.ch@intel.com>
X-Mailer: git-send-email 2.39.1
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

From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

This patch series has following changes:
1. Validate functionality of VM_BIND USERPTR/PREFETCH op with S&R
2. Test vm_unbind op by binding multiple va's to a vm and check the
functionality with S&R.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
 
Sai Gowtham Ch (3):
  tests/intel/xe_pm: Test validates vm-bind userptr flag with suspend
    and resume
  tests/intel/xe_pm: Validate vm-bind prefetch flag with suspend and
    resume
  tests/intel/xe_pm: Tests vm-unbind all flag functionality with s&R

 tests/intel/xe_pm.c | 125 +++++++++++++++++++++++++++++++++++++-------
 1 file changed, 106 insertions(+), 19 deletions(-)

-- 
2.39.1

