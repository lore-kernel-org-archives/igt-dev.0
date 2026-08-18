Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD19C5DF7D
	for <igt-dev@archiver.kernel.org>; Tue, 18 Aug 2026 17:13:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9979210E4F2;
	Tue, 18 Aug 2026 17:13:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U2qwyrAP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C9E110E4F2
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Aug 2026 17:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787073171; x=1818609171;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=urYchkSzCrt0GGJCXfn3cb56312I8R+e614tGbjMe1Y=;
 b=U2qwyrAPodcKLW3Ss7huo6TFpXG4RDk6THvtUQMEQNCduODkMq4T7CTK
 O6JTu1AVeo3u9Xp0hS4OFEeKwSJVGDNLIFIqzr6ONTc1L6wKlZw6x3B/E
 bsDRf1B4nP56Cb+YMpO9ciguSZXCOACvVL0lME2U5sfodJ0NfpmwHPueW
 czl6sPjH1XKWNRfqbWA14LYXTzy/41SKCOUGbw+UE3DUYBKgi2nC8MWKg
 hlX4E9ocpycuI/Bd8b1JxY9TKLzDnmGXw80d4LbanbDYuh4V5MG8TGpSr
 bcqwEEN146+xD95vW3xJw/CuXne8c02ziky8FF4ynMNo0stAQHD8DgP57 Q==;
X-CSE-ConnectionGUID: g/n1LB6cQZ6GfvNyCXqlxw==
X-CSE-MsgGUID: RzyQrmGdSIe2jge8/OH/Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="91256993"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="91256993"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 10:12:50 -0700
X-CSE-ConnectionGUID: HKhf6h4NQnu7EYqNUybZ3g==
X-CSE-MsgGUID: oidmXyyySoS+c72RB7Jg7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="263968101"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 10:12:50 -0700
From: Varun Gupta <varun.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: priyanka.dandamudi@intel.com,
	andrzej.hajda@intel.com
Subject: [PATCH i-g-t v3 0/2] tests/intel/xe_prefetch_fault: Add L2 prefetch
 fault tests
Date: Tue, 18 Aug 2026 22:42:40 +0530
Message-ID: <20260818171239.277897-4-varun.gupta@intel.com>
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

Add coverage for L2 prefetch faults in the xe_prefetch_fault test.

The existing test framework is first refactored to support different
prefetch shader configurations. The second patch then adds coverage for
L2 prefetch faults in both regular and SVM modes.

v2:
  - Include generated iga64 codes for the new shader to fix compilation
    failures (Kamil)
v3:
  - Drop the gpgpu_shader__l2_prefetch_fault helper and inline the shader
    generation directly into get_l2_prefetch_shader (Andrzej)
  - Simplify the assembly by removing handcrafted dependencies and using
    the standard load.ugm.d64t.a64.uc.ca.uc syntax (Andrzej)
  - Drop unnecessary IGA64_FLAGS define and GFX_VER >= 4000 check (Andrzej)
  - Remove overly verbose message descriptor comments (Andrzej)

Varun Gupta (2):
  tests/intel/xe_prefetch_fault: refactor test to accept shader function
    pointer
  tests/intel/xe_prefetch_fault: add L2 prefetch fault subtests

 tests/intel/xe_prefetch_fault.c               | 96 +++++++++++++++++--
 .../xe_prefetch_fault.c.gen.iga64_codes.c     | 17 +++-
 2 files changed, 104 insertions(+), 9 deletions(-)

-- 
2.43.0

