Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE852C61DBD
	for <igt-dev@archiver.kernel.org>; Wed, 26 Aug 2026 08:40:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 715CA10EC5A;
	Wed, 26 Aug 2026 08:40:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H07OoVfp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED10510EC49
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Aug 2026 08:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787733495; x=1819269495;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PgylEHvPIhMPUdCN+C9UXF7fRDNsrniljUyMf6kpDsI=;
 b=H07OoVfp7ACEHgNRErtwoqNdrIY+TnedXaGqwhqiITQUVeNzvIJYuI4n
 vRXEYWZcyXS8Hs25jVeDjsv/3POUhZBWHO8JyKm+UuaU+0eonY0GpjMjk
 nYW0SHR6rME/lWsmbIvO3vCLNwpcPG3gI59H4DVutoeld5ABuIWliyF2t
 d7ix4/g30kkFwQxq7985q62Top5lYp/aCcCwNZZGMXbJmqYSnDpDPDxuB
 D+DWwzFeNupbRhZmOvas1eLCVcX5euiNrbPKxMLuDXgnd1rQJa2WVZMoa
 muqaNLPCfF+m1OE7DI5RypwQRIavnixTfZ0HEho4V3oTCsJWUC5/GaR5X g==;
X-CSE-ConnectionGUID: veJ9aTd/QSegT++7DzaLvg==
X-CSE-MsgGUID: 82PH0rmxQsG1fb80T1jbCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="88088486"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="88088486"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 01:38:15 -0700
X-CSE-ConnectionGUID: K7GpJPHTQgW2SAz9SKSHGg==
X-CSE-MsgGUID: mBhgBe48SXqWjbNmQgDhHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="266940114"
Received: from dev-150.igk.intel.com (HELO localhost) ([10.91.214.40])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 01:37:49 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@intel.com,
	piotr.piorkowski@intel.com
Subject: [PATCH v1 3/3] intel-ci: Block igt@xe_sriov_mmio_regs.*
Date: Wed, 26 Aug 2026 10:37:30 +0200
Message-ID: <20260826083730.2750-4-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826083730.2750-1-lukasz.laguna@intel.com>
References: <20260826083730.2750-1-lukasz.laguna@intel.com>
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

This test is dedicated for HW checkout and it's not suited for recurring
CI runs.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index d0a2bf87d..116b0b93a 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -117,6 +117,7 @@ igt@sriov_basic@bind-unbind-vf$
 # SR-IOV tests for HW checkout, not suited for recurring CI runs
 ##################################################################
 igt@xe_sriov_ggtt.*
+igt@xe_sriov_mmio_regs.*
 ##################################################################
 # Chamelium V1 HDMI receiver supports a maximum resolution
 # of 4K @ 30Hz. This test enforces an EDID with 4K @ 60Hz,
-- 
2.43.0

