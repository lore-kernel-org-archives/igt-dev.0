Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491AE606A32E
	for <igt-dev@archiver.kernel.org>; Mon,  2 Nov 2026 09:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ievLqQjb
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7F1F10EC73;
	Mon,  2 Nov 2026 09:59:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6749010E5ED
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Nov 2026 09:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793613530; x=1825149530;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5h8bP8AXaQ2cJ1Ry/vVJ4bL8ANtzlrgyazIe5v7fU0g=;
 b=ievLqQjbvcNs7MzXiASihSCnK57gvwuPhYBggqoKzRHGTxf9j3fv9HeJ
 rh7yOoJgcfhitasQm9nexy9ske9VmsW0L4t12I64UFb8dXkSM4Sf3BRKX
 V2y4D3Nf6MeUCQY9NIg6P3n8yXkFgr2LuAZfci1Y5tCjg4ZbCJg/wxBDx
 w5g1jrVcQLpsykyJIETUPvzPF56vHGpVv29f2AbBjBd8ZhxPJQHOnYxP9
 UfrxkMHL6IB2vriYt++It8IFGDqq3dU4AGybCvzDoIsSCNVXqljmGOdUV
 LPpjdaeH7lL3R4ZOL7nw3y3FQ6Ij6qeHecEKY/GIDPe8LmnM6FQAM7+KU Q==;
X-CSE-ConnectionGUID: GuPuRnP7SCir22nymHa2JA==
X-CSE-MsgGUID: HtXDqJyrRJaVr1xtQ7nxvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2185782"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2185782"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 01:58:50 -0800
X-CSE-ConnectionGUID: 6t/dMyaURMuZs5VNRJgEDw==
X-CSE-MsgGUID: xkg2yD5YRzmx0WMN6r2ONQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6403790"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 01:58:47 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 ravi.kishore.koppuravuri@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH i-g-t 0/1] tests/intel/xe_pm: Check root-port D3cold entry
Date: Mon,  2 Nov 2026 15:28:01 +0530
Message-Id: <20261102095802.3419285-1-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Existing Xe runtime-PM tests verify root-port D3cold by polling the ACPI
firmware node's real_power_state. This approach cannot verify the state
during system suspend: userspace cannot read sysfs while suspended, and
reading it after resume only reports the post-resume state.

This patch adds ACPI transition-log checking to the system-suspend tests.
It looks for the root port's D0 -> D3cold message in /dev/kmsg across
suspend/resume, deriving the expected ACPI path from the root port's
firmware node and accounting for kmsg escaping.

The relevant ACPI dynamic-debug call site is enabled when needed and
disabled on process exit only if enabled by the test. Validation requires
D3cold support and d3cold_allowed=1. If the root port is already in D3cold
at suspend entry, suspend/resume runs without asserting a new transition.

The check covers basic, execution, VM-bind and MOCS system-suspend tests.
Runtime-PM validation remains unchanged, and explicit D3hot tests retain
their existing behavior.

The log window spans the suspend/resume operation; a runtime D3cold
transition within that window can also satisfy the check. The check
therefore detects a transition within the window rather than uniquely
attributing it to system suspend.

Karthik Poosa (1):
  tests/intel/xe_pm: Validate root-port D3cold entry on system suspend

 tests/intel/xe_pm.c | 234 +++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 221 insertions(+), 13 deletions(-)

-- 
2.25.1

