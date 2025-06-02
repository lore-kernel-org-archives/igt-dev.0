Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E18C5AD49
	for <igt-dev@archiver.kernel.org>; Mon,  2 Jun 2025 16:25:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81F9810E566;
	Mon,  2 Jun 2025 16:25:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ne9QK7nz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD50310E566
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Jun 2025 16:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748881511; x=1780417511;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gfkGEWocJN/6xgjdSEbsNhKHkuoP8sc8FTJqx+uT+co=;
 b=Ne9QK7nz5QCINYqXH+dfoU+7RypXwgPtbqXSgC1Jh961FNE+2Xvwvf0z
 3Xa4E7HcLutg9vMM4uANSEes4kOH850Q3P1ZQt2it4dtCGTlgNTcDVynX
 v06/BDx4vyE57q3llR3FQ2QvilbMiJsu/jMMV4E45CVJW3LgPiMw9jl7e
 41HWEO6XahMMcVBcfPugi6IOAx8qGP5gvmKk+3kcMQfkPMHoxpZqhPz3N
 UYA7hLZDCkF864AGsXcD3w5xSvFdXkm4iu9NwxsHnP1+/MvFY0cEn/QIX
 +VhKciUpSzVC8iBCwqgRsUVA8o8939q0HTfi0YpzcSct2D5E2j7Tyk5OM A==;
X-CSE-ConnectionGUID: 02HfLZlMSniR9jUKmL8Nmg==
X-CSE-MsgGUID: YjzdPtpLTee/AZ+oj7WmbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="51042169"
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; d="scan'208";a="51042169"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 09:25:11 -0700
X-CSE-ConnectionGUID: kLaV8+vsR1ukief1cZHTmw==
X-CSE-MsgGUID: 2a4NM61zS/6/I7pS9QGopA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; d="scan'208";a="145527374"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 09:25:10 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v2 0/2] xe: Add test for engines_allowed in configfs
Date: Mon,  2 Jun 2025 09:24:43 -0700
Message-ID: <20250602-engines-allowed-v2-0-52bffe717766@intel.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20250528-engines-allowed-75d546df45ae
X-Mailer: b4 0.15-dev-d9694
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

Tested with the pending patch series:
https://lore.kernel.org/intel-xe/20250528-engine-mask-v4-5-f4636d2a890a@intel.com/

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
Changes in v2:
- Add missing hunk from second patch
- Link to v1: https://lore.kernel.org/r/20250528-engines-allowed-v1-0-d42708b3317e@intel.com
---
Lucas De Marchi (2):
      tests/intel/xe_configfs: Use openat to simplify check
      tests/intel/xe_configfs: Test engines_allowed

 tests/intel/xe_configfs.c | 61 +++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 57 insertions(+), 4 deletions(-)

base-commit: 5be9140fab5ba77b8d012ff763f61dce9a81c7bf
change-id: 20250528-engines-allowed-75d546df45ae

Lucas De Marchi

