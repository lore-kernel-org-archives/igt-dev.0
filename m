Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C3A606A324
	for <igt-dev@archiver.kernel.org>; Tue,  3 Nov 2026 00:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kJcE0qr2
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8107D10E716;
	Tue,  3 Nov 2026 00:00:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 399CC10E716
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Nov 2026 23:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793663948; x=1825199948;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WlnE7nM4PqVpUy4xA7UpNhi+Z2UZOIN7Sn4/3YbAXmE=;
 b=kJcE0qr2J2k0kzzq+ueF07lOKBeVhMN87yjaV/BmVZxQtDyuVo72nQKT
 wleviEiFCBEB29wuO5gwBi1KInC699s+UcHxGRDSp4/dSGoRbDqwOXVA+
 VrcpwWgc4jqqFi6FcxRGR2Qpw7xgkt323etcQGYtUhfmepS4xkfbXPuzt
 y3/ff9VC+dCaeKApLNRUisdxeoTKA1kkcRyZ4AFJcgWlAodnQjuuXeFBT
 m/fzGn7YcDGfljjP9KAv5ttxtPPVSP0y9/7Oz8R4qVphi5I2Sdq8nDSNE
 qTgnb5PpY69lQ6nP5hkx6Bi688M+bZVn2orn/IUwIG/t9Vsz0qiq5lHBS w==;
X-CSE-ConnectionGUID: GFUYH4x0Ty6KWy4gUetIpg==
X-CSE-MsgGUID: f+dE/yEHTayrjxpE8W8lKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2391546"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2391546"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 15:59:08 -0800
X-CSE-ConnectionGUID: gETK7KBIQ4CbPUFKQfP2Ow==
X-CSE-MsgGUID: dBnlqukLQXmDpRSzZclZnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6595243"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 15:59:06 -0800
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Pranay Samala <pranay.samala@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
Subject: [PATCH i-g-t v7 0/7] Vswing / Pre-emphasis Override decoding
Date: Tue,  3 Nov 2026 00:58:46 +0100
Message-ID: <20261102235853.3437332-1-michal.grzelak@linux.intel.com>
X-Mailer: git-send-email 2.45.2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Next version of [1]. This series adds support of decoding LT's tables.

BR,
Michał

[1] https://lore.kernel.org/igt-dev/20260909183451.2630263-1-michal.grzelak@intel.com/

---
Changelog:
v6->v7
- reintroduce support for LT
- change layout of LT's VS/PE-O's tables

v5->v6
- read entry's offset properly (Pranay)
- rename table of rows' description (Pranay)
- add spaces around operators
- exclude LT PHY temporarily

v4->v5
- show all Combo's columns
- change shown format of Combo's tables

v3->v4
- rebase onto master

v2->v3
- show whole invalid DEVICE env var (Jani)
- return 16 rows on MTL instead of 10
- use Cx0 for Snps

v1->v2
- check platform basing on devid not VBT signature (Jani)

Michał Grzelak (7):
  tools/vbt_decode: fix tables' offset reading
  tools/vbt_decode: rename VBT#57 related vars
  tools/vbt_decode: validate DEVICE env var
  tools/vbt_decode: parse & dump VS/PE-O tables for Snps
  tools/vbt_decode: parse & dump VS/PE-O tables for Combo
  tools/vbt_decode: change VBT#57 Combo's layout
  tools/vbt_decode: parse & dump VS/PE-O tables for LT

 lib/intel_chipset.h      |   2 +
 tools/intel_vbt_decode.c | 182 +++++++++++++++++++++++++++++++++++----
 2 files changed, 168 insertions(+), 16 deletions(-)

-- 
2.45.2

