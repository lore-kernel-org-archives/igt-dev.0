Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55355C48BC3
	for <igt-dev@archiver.kernel.org>; Wed, 14 Feb 2024 04:47:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9CC610E2A4;
	Wed, 14 Feb 2024 04:47:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eRfd8532";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B77C210E1E5
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Feb 2024 04:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707886047; x=1739422047;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xecD7ipsTL2Ug3MnU7R98jw3DdqtjvmNUfBYzOGQnjE=;
 b=eRfd8532DPmgCoXHBFVgg4npEyZfs8ZnKTUKIM42AGukUqiZTsjt4rX8
 nI5nOW908TPe+mBlUIO7uV77hY3tIHxw8fRaZTjZrkKMaDqsVSSv9yxCV
 domFKtM+SSuwGjVWcfQASDkZlKtWFLaKpQ6o09FhLHfRl3Oz0Mcr7Pkdr
 Wg8f88iNmIkl75pBkPvpempODn43VRY+Vw+BQYk7WUDh0FggldV8u9ODp
 skgbMlwQ8yJ+wSvz69h1MqFJLOsyCTaevivQqs0WcXPs/Iv3KjQAcgERH
 TX/wzWRk3EbM+GuKFKpL4BCuJ5HTl9wOIm9I0W4zf5+JHdemaEmSUyPFC g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="13307852"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; d="scan'208";a="13307852"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 20:47:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="912002402"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; d="scan'208";a="912002402"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmsmga002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 20:47:24 -0800
From: "Samala, Pranay" <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
	jeevan.b@intel.com,
	pranay.samala@intel.com
Subject: [PATCH 0/1] tests/kms_plane: Reducing the execution time in simulation
Date: Wed, 14 Feb 2024 10:17:31 +0530
Message-Id: <20240214044732.24186-1-pranay.samala@intel.com>
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

Samala, Pranay (1):
  xtests/kms_plane: Restricting number of pixel formats for simulation

 tests/intel-pre-si-ci/blocklist/display.blocklist | 1 -
 tests/kms_plane.c                                 | 3 +++
 2 files changed, 3 insertions(+), 1 deletion(-)

-- 
2.34.1

