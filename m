Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C94EA4E22
	for <igt-dev@archiver.kernel.org>; Mon,  2 Mar 2026 15:18:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F1EE10E521;
	Mon,  2 Mar 2026 15:18:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LhlI/k8e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C85B510E141
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Mar 2026 15:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772464700; x=1804000700;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eQPjMf00JPqa9TwxQrLXN9JXo9g8CW/EhL+QahGnG6g=;
 b=LhlI/k8eH/EJlwkMpQwwRheGAvdloy8KLVWwKhskTJNqmG84hr7Drti9
 6OsMVzCwhSi1SzRk3OIYjs0lxYtKt2cHGMfrveTPnNShQxT2si4R8sazo
 0zEFRBynDz/BHnwfliJPNYW6ABaQoCIdxpYPyjplNVTrURjWWRIkBpnlJ
 X+5nRDFTpZ8ZQfTEUj9owAQRyORgfI2an+QB6TFT+8ID/lJ7sZIvoI+XG
 UJ3wg7JBIqKiqgIJGUxtQ25VGaZmg3YIjMY6gGFHsqc4b9MI7ttXsLHau
 iNY2f4VFzufk9VfDPi2eCl2LZHdzlO4SI6cGgDMFvTVTNPSSCq2fMXiH8 Q==;
X-CSE-ConnectionGUID: a1IoPS3RTZud6Rg+hdH/6Q==
X-CSE-MsgGUID: wTujBKvGRlSIkeP8iS6c0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="77337547"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="77337547"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 07:18:19 -0800
X-CSE-ConnectionGUID: MrF7SJJvQlyj8nkyYjXFWw==
X-CSE-MsgGUID: WEVbehF1SYmECnYDxVlIYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="217699902"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 07:18:18 -0800
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, kunal1.joshi@intel.com, sebastian.brzezinka@intel.com,
 Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH i-g-t v3 0/1] tests/kms_vrr: Skip LOBF test when aux-less ALPM
 is not enabled
Date: Mon,  2 Mar 2026 20:45:40 +0530
Message-ID: <20260302151547.3041214-1-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=yes
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

This patch series restricts LOBF test execution based on the observed
support behavior across eDP and DP 2.1 configurations.
From our analysis, LOBF is supported on both eDP and DP 2.1
only when the display version is > 35. For display versions between 20-35,
LOBF support is limited to eDP. Additionally, either Aux-less or Aux-wake
mode must be enabled for LOBF execution.

LOBF support may also depend on the eDP version
(e.g., valid only for eDP ≥ 1.5). Confirming this would require reading
DPCD registers via IGT, which is not preferred at this stage. To avoid
unintended failures and ensure proper skip behavior on unsupported
connectors, the test is now restricted to execute only when Aux-less mode
is enabled, preventing false negatives and improving stability.

-v2:

-Update commit message (Jeevan)
-Remove additional check for connector type filtering (Jeevan)
-Update commit message for LOBF/ALPM clarification (Kamil)
-Rename function to igt_is_aux_less_alpm_enabled (Sebastien)
-Add explicit null-termination (Sebastien)
-Add igt_info() log (Sowmiya)

v3:

-Rebase

Mohammed Bilal (1):
  tests/kms_vrr: Skip LOBF test when aux-less ALPM is not enabled

 lib/igt_kms.c   | 32 ++++++++++++++++++++++++++++++++
 lib/igt_kms.h   |  1 +
 tests/kms_vrr.c |  4 ++++
 3 files changed, 37 insertions(+)

-- 
2.48.1

