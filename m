Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F1DBC5B567
	for <igt-dev@archiver.kernel.org>; Mon, 10 Aug 2026 19:18:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF0BD10E985;
	Mon, 10 Aug 2026 19:18:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a0lJYXcs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBC4E10E985
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Aug 2026 19:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786389468; x=1817925468;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YAQIuJTL9ZfCcSqeguicldt1R7Y/8rAufCds94Iw4wg=;
 b=a0lJYXcs3PG3uZNgR980Hd7/IK4b0J4F8lY47kLlnl+wcQfVGsqME88u
 x2JY455G4QB1J7WkABdIjqCTkmuV44cVRXMMZbgpXBLxQS/LtKvZhdQ5s
 NNRQHcOqvyjQs7Q4dPVEpMmun57W/8E+aRxg6EBVNRDg0BmbAFvuxZCEk
 wn/Y4NZ6MgueY96kjEf2LC6GMCIlqdACJE8cfRDqJ/unRqMMDMiTKfaaW
 r0jZRW1DuY4HSOq+UziQ0VVHu94vTtsV4oNgyVef5uDw9VQcyGcvYjLuz
 2h9G+xzqgDJczbH9UxnvvdAENpw0sBJ1S/qv6giaLLu9zuC1vAwdLCZKV Q==;
X-CSE-ConnectionGUID: bNjIRIqWTeyVPYYH+VX+8A==
X-CSE-MsgGUID: bHNIRHy9Rs+3YGQsHU9cKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="86940404"
X-IronPort-AV: E=Sophos;i="6.25,216,1779174000"; d="scan'208";a="86940404"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 12:17:48 -0700
X-CSE-ConnectionGUID: tFLBJaksTxuyw4GsQYhB/Q==
X-CSE-MsgGUID: RqQ/bmm9QICro6vsQVLYyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,216,1779174000"; d="scan'208";a="262618718"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 12:17:47 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, mitulkumar.ajitkumar.golani@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v2 0/2] Add CMRR subtests
Date: Tue, 11 Aug 2026 00:47:56 +0530
Message-ID: <20260810191800.1076781-1-ramanaidu.naladala@intel.com>
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

Add a subtests to validate CMRR with video mode and fixed mode.

Naladala Ramanaidu (2):
  lib/igt_vrr:Add VRR helper library for display refresh rate testing
  tests/kms_vrr: add CMRR fixed and video mode subtests

 lib/igt_vrr.c   | 118 +++++++++++++++++++++++++++++
 lib/igt_vrr.h   |  46 ++++++++++++
 lib/meson.build |   1 +
 tests/kms_vrr.c | 194 ++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 359 insertions(+)
 create mode 100644 lib/igt_vrr.c
 create mode 100644 lib/igt_vrr.h

-- 
2.43.0

