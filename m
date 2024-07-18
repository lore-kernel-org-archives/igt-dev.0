Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1683C3DA49
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jul 2024 11:07:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F5F410E780;
	Thu, 18 Jul 2024 11:07:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fJWoPcxV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A67610E780
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jul 2024 11:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721300856; x=1752836856;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZSd6OJmzg/VoopZ66TJNwoNhRbKEigenVCbQHeQ8dDo=;
 b=fJWoPcxV/yIwztexUo0y28I3EgaRqkgIREc7v4MoRRTSavCeL0rDpHuh
 UVsoxNMW7v6hpvJOrq4uZ5tK01RaMxCkFelcc7s0WFRRbT4gn6iuezWpN
 7F8vqbrxJ7bgztPmkRx8nZMGDwm38lNNeIZ4A5VReNIZ5GZfgLX85Ocf1
 IPTjmlrejYt/S9cGlVq6A3jjOzJhyH+aMGXSd+6lkQTP1/jxZ2ttdiau0
 RfSi+JkG/92QBAF2UWwpn7togrLL05+PaEwHI6U4gsrvnG6WlwS2TkgXc
 +C2DpGxoId7q489ILGQmXfNI9MuLicwygwj2thjdn5qjpmrxatCFd4925 Q==;
X-CSE-ConnectionGUID: ndhkQsewQnOOy/AZk1reuw==
X-CSE-MsgGUID: C0Uodm4JTZaD1eZI8Ffn7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="44277909"
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; d="scan'208";a="44277909"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 04:07:36 -0700
X-CSE-ConnectionGUID: uBN5/GC+RkS6pORanLIyrQ==
X-CSE-MsgGUID: 3Ov+DOhLT6CGihiqKYkBCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; d="scan'208";a="50678044"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2024 04:07:34 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, kunal1.joshi@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v6 0/5] tests/kms_plane_scaling: Improvise the scaling
 BW issues.
Date: Thu, 18 Jul 2024 16:41:41 +0530
Message-ID: <20240718111146.665240-1-ramanaidu.naladala@intel.com>
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

Find display mode fitting within bandwidth constraints for scaling
operations.

Naladala Ramanaidu (5):
  tests/kms_plane_scaling: Update the single plane scaling function
    arguments
  tests/kms_plane_scaling: Update the multi plane scaling function
    arguments
  tests/kms_plane_scaling: Find display mode fitting in BW
  tests/kms_plane_scaling: Find display mode fitting in BW for rotations
  HAX patch do not merge

 tests/intel-ci/fast-feedback.testlist    | 201 ++++----------
 tests/intel-ci/xe-fast-feedback.testlist | 317 ++++-------------------
 tests/kms_plane_scaling.c                | 283 +++++++++++---------
 3 files changed, 260 insertions(+), 541 deletions(-)

-- 
2.43.0

