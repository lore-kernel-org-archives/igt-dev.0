Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2FFCCA6007
	for <igt-dev@archiver.kernel.org>; Thu,  8 Oct 2026 06:15:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1287610FC40;
	Thu,  8 Oct 2026 06:15:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j5xJhXPz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BFC610FC40
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Oct 2026 06:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791440080; x=1822976080;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=y+DjrstijfMs+8qx56jj6VHAaDDUxT0zWyt3ssqllQ0=;
 b=j5xJhXPzpZyznvrropn537QXpjcNIasvf3LnSUYGR3qDuWRkzh8KpRAx
 drVPBriEsjoaYe17DCeYYT7iPAmeVG/kQPQPX2xf1eOWSZplK96+IOK/8
 IVlNlXwaWU8ZFJLzqvGO23eAIdzXgeY1c0h9xYfQXa6nIh+odb2RVXe+B
 la8Sfqol7lXhBbIvDGu9y5mWnxHA6KTwinbzdgCnUyk5Abeva1zsFs/yK
 JzkI5aPTOist4vl6pSXnqV/HJ9sjORcymPZaV90tQ5amWdkk1u8rUAVGJ
 8QdOwR4JeVrGZejeTsNpVKeaqY4DnRI3zskUS5EKYSs2JPyVATLjkdFgr g==;
X-CSE-ConnectionGUID: UbPuha2JTNGqemQVCklXpw==
X-CSE-MsgGUID: TxbdcKQIS/6QS+uGssNxOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="210480"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="210480"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 23:14:17 -0700
X-CSE-ConnectionGUID: jmqPYItfTYyVh3f3N3T/Tw==
X-CSE-MsgGUID: U4jTtPnrQi2JFgzM+/EYJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="386460"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa010.fm.intel.com with ESMTP; 07 Oct 2026 23:14:16 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH i-g-t v2 0/2] EDITME: Update pipe joiner test to get free crtc
Date: Thu, 08 Oct 2026 11:42:51 +0530
Message-Id: <20261008-joiner-v2-0-693aed4be6a1@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGM0x2oC/2XMQQ7CIBCF4as0sxYDI8HGlfcwXdAy2DEKDTRE0
 3B3sVuX/8vLt0GmxJTh0m2QqHDmGFrgoYNptuFOgl1rQIlGSXkWj8iBkrCnUXt0Rju00M5LIs/
 vHboNrWfOa0yf3S3qt/4RRQkpRi17NFopb/srh5Wexym+YKi1fgEgfqi2nAAAAA==
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
Changes in v2:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v1: https://lore.kernel.org/r/20261007-joiner-v1-0-b40826411fa8@intel.com

---
Arun R Murthy (2):
      lib/igt_kms: Add igt_get_free_pipes_mask()
      tests/intel/kms_joiner: Use the CRTCs reported free before a modeset

 lib/igt_kms.c            | 69 ++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h            |  1 +
 meson.build              |  7 +++++
 tests/intel/kms_joiner.c | 75 ++++++++++++++++++++++++++++++++++++++++++++----
 4 files changed, 147 insertions(+), 5 deletions(-)
---
base-commit: 5e43e9df3a1581074f0de2bbeddd939ebd950b93
change-id: 20261007-joiner-a3b4f2d64d2a

Best regards,
-- 
Arun R Murthy <arun.r.murthy@intel.com>

