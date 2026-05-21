Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFFCECD4F3D
	for <igt-dev@archiver.kernel.org>; Thu, 21 May 2026 13:42:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84DFF10E4CD;
	Thu, 21 May 2026 13:42:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IODD3fHQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D07510E4CD
 for <igt-dev@lists.freedesktop.org>; Thu, 21 May 2026 13:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779370935; x=1810906935;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=givGJ/K0tvzJGak7SyL5+WN/LXGfO9DPpFit6h+26+I=;
 b=IODD3fHQIPD3TFBlkrlqx4FeRlQr1q2TkP45b8e42WL7LGJa9xGGMCf7
 i1IDlJ5FfpJHoshMYdhrHrEZXvMEkC0IicFgVr6r4q0xPkZDlHsAAqQqg
 pYWmxyTHwyATPesRCwndDeICRoWrv9Iwt1zydQoWnH2P5N2W0G6g1R697
 IZC+js7+brz2XOlD00Wrm+GXdFTUCEgZDY+RVDCVA/NNldPHftJHw6meO
 aDVxTCrpa1zMamk0VaeHsT/y5ATTMWlOv4xhJImIITmRvWaf2EyFUDW11
 RzANOlv+mUeeclUFMdNz6yg0ACH98Ykaza7JelpFd4OC4iuw3tGWwVPvL A==;
X-CSE-ConnectionGUID: 9LHi73CXT1iqZZNvqk8FLw==
X-CSE-MsgGUID: 8ez8AFLaRL+F1eD34zmTIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80321876"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="80321876"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 06:42:14 -0700
X-CSE-ConnectionGUID: UvnvfsKGRD6cbaTBod0cEQ==
X-CSE-MsgGUID: JS697dFUTVOX3nghoumCVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="239517285"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 06:42:13 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH v2 0/2] lib/intel_batchbuffer: prefetch fixes
Date: Thu, 21 May 2026 15:40:44 +0200
Message-Id: <20260521-ibb_fixes2-v2-0-a36d7a9e71e5@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFwLD2oC/22OQQ6CMBBFr0K6tloqFHXlPQwxbRlkjBTSKURDu
 Lstbl2+mTd//sIIPAKxS7YwDzMSDi6C3GXMdto9gGMTmUkhlShlztGYe4tvIMnFqVRaNUVVKGD
 xYPSwbaJ/q39Mk3mCDSkhGUYTcOO1s10aTSMFD7o/9JoC+GR0SGHwn63PnKekv6/nnAteiXOhV
 dseSymu6AK89nboWb2u6xcT0SJe2AAAAA==
X-Change-ID: 20260521-ibb_fixes2-0856a6d4746e
To: igt-dev@lists.freedesktop.org
Cc: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Jonathan Cavitt <jonathan.cavitt@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=755;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=givGJ/K0tvzJGak7SyL5+WN/LXGfO9DPpFit6h+26+I=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBqDwtq/qze/Y9WlCBOXyVB2gumyhBBkP0vVOu/p
 qEmmzbDGbSJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCag8LagAKCRAjYrKT3hD9
 11qhC/44y0gXk3hETElnBfN/x+/gxP1X+F26IN79jTy304XsdG6R/gi3LQF+88CaV24Ym3MoSFI
 nzOknWaPaRggfMdYPP1jj1BlahkEruPb8Oc4ejn8ENcprF09Xe1+68QF7/dhJRpGXHGS1ukDTAO
 3p3FKb+YeTAN0ru9Agx63yKfu0Up/dRkfQ6QzbMyQgJ794GAjD43q05zfgNz1JvVSZr63NiryBL
 qTbMSmZ86d7YZlARMwtEIg1YnBeyPqH1h4S3euon+g40F/mxlh72wLxI/4lUr/MGgRkB3zYln2U
 QYxZ27fE8+7FHSXNXWU2vcobnQlZeP2q6k16EqRTNFQ7HkoajqZpnu1n3XUxy33yRi6kHFBzTGa
 fVXc8YFHsf3zbPXzwDYIgeVtytcMrTsbuK4eovBJH4vzdAC+96dPcBITmRp5H3rmh+wVESTB3zn
 9ObP5AFN1Z+M2FBtDkJheSknmzKWkyJ3a2wp1aye2Yeh28+EmHMdwBv26fJBHCHK3KYpk=
X-Developer-Key: i=andrzej.hajda@intel.com; a=openpgp;
 fpr=FCA8443134DDBF5DE17F034D2362B293DE10FDD7
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

Two patches fixing batchbuffer prefetch handling.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
Changes in v2:
- Changed asserts to more informative (Kamil)
- Link to v1: https://patch.msgid.link/20260521-ibb_fixes2-v1-0-7094a6ff3520@intel.com

---
Andrzej Hajda (2):
      lib/intel_batchbuffer: assert on accessing prefetch area
      tests/intel/xe_exec_store: increase batchbuffer size

 lib/intel_batchbuffer.c     | 3 ++-
 lib/intel_batchbuffer.h     | 7 ++++---
 tests/intel/xe_exec_store.c | 2 +-
 3 files changed, 7 insertions(+), 5 deletions(-)
---
base-commit: f14172a92410b684c03518a77d864a46d5972e86
change-id: 20260521-ibb_fixes2-0856a6d4746e

Best regards,
--  
Andrzej Hajda <andrzej.hajda@intel.com>

