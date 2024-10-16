Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 264BAD1AD46
	for <igt-dev@archiver.kernel.org>; Wed, 16 Oct 2024 11:01:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1AFC10E10B;
	Wed, 16 Oct 2024 11:01:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TquUv4/v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5457010E10B
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Oct 2024 11:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729076511; x=1760612511;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dFb8D6t+2+wkpknWakZfCTT6W8Xs3R9Ux897F0sBFzU=;
 b=TquUv4/vEuQzCPsKcOC8zcjPNqsbsOVxO+c6l4i2oYnnbxNp4f4zfnA1
 BniGHCj+HWUI+8cICrTL3lF4IrVwrncsoMEBX6gWgF4PnyJeaDG10Nbrc
 IuA7i4st0g6H9Or00rg3R4moI1vuAr2/5CZA9ldMyZswIKwraSDGNpF+E
 dMC6oCpfMP6ZqoDMOPsoSIE3WqJtMMOMmsAPHzIehHo4t2dQWeWAjK2B0
 m+IW4KMKQcLRr4nuxDB20fkUHIj5PdYHFesXWOB015iIKOlu1onrVvZAF
 9/mIjh2xjNJsj5d59aDI2fjX+LwohrfmfRLmwBUsh31KZvrisRGgol7UN g==;
X-CSE-ConnectionGUID: X7UKE3/5Qp+vq5Auplrzgw==
X-CSE-MsgGUID: WW6L8MO6SN2nt1jO3U5/PA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39065021"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="39065021"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 04:01:51 -0700
X-CSE-ConnectionGUID: Id2TyjtgRK6OEmw8se/F+A==
X-CSE-MsgGUID: dP/gpptlSUu3xl2MBjGA3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="83002147"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.139])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 04:01:50 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t 0/1] rename drm_fdinfo into i915_fdinfo
Date: Wed, 16 Oct 2024 13:01:43 +0200
Message-ID: <20241016110144.87187-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.47.0
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

This test opens i915 drm card and will not work for other drivers.
Hence rename it to avoid confusion.

Kamil Konieczny (1):
  tests/intel: rename drm_fdinfo into i915_fdinfo

 tests/intel/{drm_fdinfo.c => i915_fdinfo.c} | 2 +-
 tests/meson.build                           | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename tests/intel/{drm_fdinfo.c => i915_fdinfo.c} (99%)

-- 
2.47.0

