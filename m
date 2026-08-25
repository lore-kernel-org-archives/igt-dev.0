Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F08A7C61DBD
	for <igt-dev@archiver.kernel.org>; Tue, 25 Aug 2026 18:34:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D9EC10E12B;
	Tue, 25 Aug 2026 18:34:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S6DWeVRv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67E2210E12B
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Aug 2026 18:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787682834; x=1819218834;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=m9gREBvwzWepXnoODMsZ9jRnrS1Dt5TfWx5HpTHOtjE=;
 b=S6DWeVRvyp1/s9rF+lGV7r+a3Ae/XP/8dQFF9ExBoLdb3zWL4XDayzWK
 RN3AvYwkqaUZXcLRgeCGY1I/shA1pL66JJTtlafAyULwnqCUBSop0rI5A
 Lsv5M05NUYQ9eiduiPKP+mXPvdEa9o+LPMTqAC8UacMbjI73vhgKkYJdD
 FPpF6LBvVEnqE0kEXEoqLC0K8jbUaZaHLT10AR+gzOZR+IQlCq2qns63c
 0E8TPkeFhxDmzUvkP2KPenJmLYEgXotL0wKs6Yp9rbDHI2WCJRi1QK3gX
 GjuNwn65U1uQ6KdTQiiSn/v+E7LgwqSdiUm/dBM9kTC05O4dR5Nerna8v Q==;
X-CSE-ConnectionGUID: 0lbYhO/ZTnCCuKPIvK+EuQ==
X-CSE-MsgGUID: vtGbSdnUTq+w8dOJMEB7CQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="113695205"
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; d="scan'208";a="113695205"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 11:33:54 -0700
X-CSE-ConnectionGUID: HoLkmBkST0GhFCeVnaoHRA==
X-CSE-MsgGUID: P/BPaSMQT1uEelBLPR/i5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; d="scan'208";a="270848934"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 11:33:53 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mitulkumar.ajitkumar.golani@intel.com, chaitanya.kumar.borah@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v5 0/3] Add CMRR subtests
Date: Wed, 26 Aug 2026 00:03:55 +0530
Message-ID: <20260825183359.2791891-1-ramanaidu.naladala@intel.com>
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

Add a subtests to validate CMRR with video mode and desktop mode.

Naladala Ramanaidu (3):
  lib/igt_kms: Add helper to return vblank timestamp and sequence
  lib/igt_vrr:Add VRR helper library for display refresh rate testing
  tests/kms_vrr: add CMRR fixed and video mode subtests

 lib/igt_kms.c   |  25 ++++++
 lib/igt_kms.h   |   1 +
 lib/igt_vrr.c   | 149 +++++++++++++++++++++++++++++++
 lib/igt_vrr.h   |  29 ++++++
 lib/meson.build |   1 +
 tests/kms_vrr.c | 231 ++++++++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 436 insertions(+)
 create mode 100644 lib/igt_vrr.c
 create mode 100644 lib/igt_vrr.h

-- 
2.43.0

