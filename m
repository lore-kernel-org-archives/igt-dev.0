Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2294910F92E9
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 18:07:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B494A10E30A;
	Tue, 31 Mar 2026 18:07:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="InlGdxNz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F28610E787
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 18:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774980471; x=1806516471;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ok8OVnwZlHzi0Rif/1cfRNrRyT4gRAwdVkbkEcmECKw=;
 b=InlGdxNz6uQ/PGEr0w6l58TFOgxtF4oD9WTek+g6u0+93mX+pZuqkAlF
 ZjKASwqhVgcR86H17lSMZzlm+AvJWOcHe897a41caCZGbuCPUDy0LsRGD
 ru5Jece2B5mXltVc7a1TwxU7I71721Wtqv0aALh/Ntnv4p+HHzDCXb2vo
 ipR0Uhechipn0mKpQCFelyFYZvVfVhUSdM9ot+5HA1FAw4fKBCSLXIXYU
 IR3EIi+PuasfRhitZp4DYevRFpotg2ww683k9EVi2T+WHty3IaGEqMVk8
 AnWNHJxGaZmknWL+7Gt3qhL29G4qtrY7Lba+ftthu8cSihMGwNi6XtUWO A==;
X-CSE-ConnectionGUID: mEWiUvcJQmucMxoZ3ol4Aw==
X-CSE-MsgGUID: POSWxzspTNeZwOZJkMKz4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="79607759"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="79607759"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 11:07:50 -0700
X-CSE-ConnectionGUID: iQm9ViOhSzCsJCTWXV0Uag==
X-CSE-MsgGUID: /5T4Z7pPSO6W4kVNFskkTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="226306887"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 11:07:47 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 rodrigo.vivi@intel.com, matthew.auld@intel.com, raag.jadav@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH i-g-t v1 0/1] Update xe_pm test with high VRAM usage
Date: Tue, 31 Mar 2026 23:43:55 +0530
Message-Id: <20260331181356.4133309-1-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
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

Create high VRAM usage by allocating a large BO prior to system
suspend.
This increases eviction time, helping to expose any unknown issues
in the suspend‑resume flow.

Ex: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/4856

Karthik Poosa (1):
  drm/xe/xe_pm: Have high VRAM usage during system suspend

 tests/intel/xe_pm.c | 86 +++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 84 insertions(+), 2 deletions(-)

-- 
2.25.1

