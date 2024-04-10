Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2552DCD1296
	for <igt-dev@archiver.kernel.org>; Wed, 10 Apr 2024 10:09:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B78AA10E353;
	Wed, 10 Apr 2024 10:09:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TdQhW/af";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59F5810E639
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2024 10:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712743761; x=1744279761;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Jx8xRT0ptENWUv1B5mHhIKW2Y4Nr0izXfSmbNGU4xQM=;
 b=TdQhW/afYhGFKhlZZ4v15joROpIYdEgyhJ9zew1HTHOxjIfOKFSZvZks
 XaDzEDqE95lIJ45dF/VRIqRklcgKsCGDC2BKuPKx0QDx82FuZWW0K8b0s
 7vEoAgzlOBBKM+m54wFbQfMk8v9pIKfS/hc6qrrJvmPmO3QwXCr5qFc7b
 IERP0YBHRhxZwIoP9RIPMK0TjcAY9Fa+L8wjXlTLmvmr4yF63lVcr8FxS
 /KytoAIUNJoSe6Y5GvzRFwqcdM/lOEUDu6JWFTK5YBCdSe2HEU2VVBvaA
 xL3tpS3NUedmonPFZ1psRVk/BvmdAtlbH4mBWdf1FDbu3eNI6trn/S6+E w==;
X-CSE-ConnectionGUID: fMCgKAcOTO2SzN9diyRaUw==
X-CSE-MsgGUID: 6QEhThuQSJCNE/UZpIMrww==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="18662357"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="18662357"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 03:09:20 -0700
X-CSE-ConnectionGUID: wc+xoyCAQRioEAji53gJCA==
X-CSE-MsgGUID: SSNLOvujTNG5rB47zGtg7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="25023306"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.142])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 03:09:19 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v2 0/2] Add surface flat ccs check
Date: Wed, 10 Apr 2024 12:09:13 +0200
Message-Id: <20240410100915.48541-1-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
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

Instead of guessing if surface is compressed use flat ccs check
function.

v2: Address review comments

Zbigniew Kempczyński (2):
  lib/intel_blt: Add functions which extract and check object ccs data
  tests/gem|xe_ccs: Check surface ccs data instead of naive comparison

 lib/intel_blt.c       | 122 ++++++++++++++++++++++++++++++++++++++++++
 lib/intel_blt.h       |  11 ++++
 tests/intel/gem_ccs.c |  16 ++++--
 tests/intel/xe_ccs.c  |  14 +++--
 4 files changed, 152 insertions(+), 11 deletions(-)

-- 
2.34.1

