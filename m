Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A7C8D10377
	for <igt-dev@archiver.kernel.org>; Wed, 26 Nov 2025 03:50:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45FE510E4FF;
	Wed, 26 Nov 2025 03:50:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HsdCjUn2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E54D310E0F7
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Nov 2025 03:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764129019; x=1795665019;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HayMMWIyicZdGbuLdpyWre7iORU4YZI01jBeOFeOcPg=;
 b=HsdCjUn2t76s3kONwD2jNDzcCP9wahZX4+m5bW45MoxosMu1z4RMzQZN
 rxoZkZWNa9yf2SMw9ikULQZR6AUAktdmTE12rx+pl9qD1JmHY/cwzJE+i
 stOyWOwz1g9JqAAb6QXMpoTZZGBXCOvAl0szgBAg8pVvpiKI15zq2wtdB
 JpCVOWWFoZf5pItQNmUkZ3wxHtyaAvtmfaL1eVfVgXHTRJEnpNd59JS3i
 hG9iej4QcDY53A52MLtkCKUW21UYcyEBoPVDAZ1hLaJn6bozBYaHRQmzc
 /XgUf2m0TITcUyZjFekpNrYIvK2WdulU097lnauu7QP5TVpfStsBQept3 A==;
X-CSE-ConnectionGUID: nPaubDqtQJe1Lmc/9s04Rw==
X-CSE-MsgGUID: OvY7MbRcTsKyovX9WX147A==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="76840035"
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; d="scan'208";a="76840035"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 19:50:19 -0800
X-CSE-ConnectionGUID: A/1S0yhDTfCqTRA7ruL+ew==
X-CSE-MsgGUID: y8h1yA3tTwKZXS26MDVNlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; d="scan'208";a="193639485"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 19:50:18 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 0/5] OA: Run MMIO trigger tests on all OA units
Date: Tue, 25 Nov 2025 19:50:07 -0800
Message-ID: <20251126035012.12967-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
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

Ashutosh Dixit (5):
  tests/intel/xe_oa: Drop oa-unit-exclusive-stream-exec-q
  drm-uapi/xe: Sync with DRM_XE_OA_CAPS_OA_UNIT_GT_ID definition
  tests/intel/xe_oa: Return hwe from same gt from oa_unit_engine()
  tests/intel/xe_oa: Run mmio-trigger tests on all OA units
  tests/intel/xe_oa: Use separate oa unit variables for caps and
    iterator

 include/drm-uapi/xe_drm.h |  27 ++++-
 tests/intel/xe_oa.c       | 205 ++++++++++++++++++++++----------------
 2 files changed, 146 insertions(+), 86 deletions(-)

-- 
2.48.1

