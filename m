Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 532BACA5FFF
	for <igt-dev@archiver.kernel.org>; Wed,  7 Oct 2026 09:42:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0184910E428;
	Wed,  7 Oct 2026 09:42:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M/kkx1DU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AEA010E419
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Oct 2026 09:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791366116; x=1822902116;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=nckqhg9bHHnROehFvaGchDczlbhh/0DGAExN0MHnk5w=;
 b=M/kkx1DULYewjUS1gYH2WHvxr1Nt8/Uq8HpdxrbNJTT9T1FiTDtEibuS
 noYmikIorM0wPcjVPfn7AERdLXDbu6wz+2wXd+WydOMqwJsbgfcPwSw4l
 tkZgMaREqyGx5ZfGDGrRu0WeD4a8FYp+8YH1U+Jt6LrhnCLEcUqjYyE2A
 Rc4bJ5aWZ0vF9iHAcEikLqZKNKEnACrtnaquqKz0ddpUFbmap8SH38MCk
 Kcx+kV9FI8t9qfKcuNcbua2ct41P+5vxrx2M7HhQyWBgNr7dBzltE5qH4
 GQxWAfoxxMCTKvIcOKLl+mkhtVt/3/L6m61ZioeyWmnDmmzuafDx6sm76 A==;
X-CSE-ConnectionGUID: 8p49ZcrKSUOZx+9hRJKjbw==
X-CSE-MsgGUID: PYWofZH0SPaXgdrjXTDVGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="230472"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="230472"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 02:41:56 -0700
X-CSE-ConnectionGUID: w2f1id7qQkuqUgomX1vgdg==
X-CSE-MsgGUID: usn/eOxLSrKklIKvxylJcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; d="scan'208";a="275195467"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa006.jf.intel.com with ESMTP; 07 Oct 2026 02:41:54 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH i-g-t 0/2] EDITME: Update pipe joiner test to get free crtc
Date: Wed, 07 Oct 2026 15:10:38 +0530
Message-Id: <20261007-joiner-v1-0-b40826411fa8@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJYTxmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAwNz3az8zLzUIt1E4ySTNKMUM5MUo0QloOKCotS0zAqwQdGxtbUAhrM
 aJFgAAAA=
X-Change-ID: 20261007-joiner-a3b4f2d64d2a
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com, 
 Arun R Murthy <arun.r.murthy@intel.com>
X-Mailer: b4 0.15-dev
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

Call a new API(drmModeGetCrtcList) exported by libdrm to get the list of
active crtc and then call modeset with the first freely available crtc.

The libdrm patch is still not merged and is floated for review @
https://gitlab.freedesktop.org/mesa/libdrm/-/merge_requests/490/

To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com
Cc: kunal1.joshi@intel.com

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
Arun R Murthy (2):
      tests/intel/kms_joiner_helper: Add igt_get_free_pipes_mask()
      tests/intel/kms_joiner: Use the CRTCs reported free before a modeset

 meson.build                     |  7 ++++
 tests/intel/kms_joiner.c        | 75 ++++++++++++++++++++++++++++++++++++++---
 tests/intel/kms_joiner_helper.c | 66 ++++++++++++++++++++++++++++++++++++
 tests/intel/kms_joiner_helper.h |  1 +
 4 files changed, 144 insertions(+), 5 deletions(-)
---
base-commit: 5e43e9df3a1581074f0de2bbeddd939ebd950b93
change-id: 20261007-joiner-a3b4f2d64d2a

Best regards,
-- 
Arun R Murthy <arun.r.murthy@intel.com>

