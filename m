Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE7F1CD4F54
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 19:36:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 615C710E976;
	Wed, 27 May 2026 19:36:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="EIXXgZD8";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E28CF10E975
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 19:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Yw8sY+cu/unEeFh+/QiztS8PFfnuq/2x2kae7ws7qL0=; b=EIXXgZD8WK0fDzPmyAPKAWgOI7
 Et3GNIfoP+zZ9sL7BcTXxdgZvEFXI12glA2umTI7vZP9i9TW8aUnYHL4NzPuIrOv+dvwnjKvRtM+A
 IcCbDggbNUSps6VuMRCbltlqffk3TYAaZIiZL/hnw6RsaT3JACpbyh1pPpYKI/BNgqfEp1MckbUFx
 oR7Z+VRRsh6KNU1oNAZs6mNaKrAykoVOvLDCTZ5i3InIhrr02VXlprbtQ35YgtQUTsyCIe+acTzQE
 7GuT3rQNc1Rwiw8/cm49jIpn4YDks+oTStOKHYez0UZh34i00lptK1SgHf7VCsIaO6XPGZolLToyi
 fMQXJqhg==;
Received: from c-73-157-168-91.hsd1.or.comcast.net ([73.157.168.91]
 helo=localhost.localdomain) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wSK3P-00935c-Cs; Wed, 27 May 2026 21:36:35 +0200
From: John Harrison <John.Harrison@Igalia.com>
To: igt-dev@lists.freedesktop.org
Cc: Suraj Kandpal <suraj.kandpal@intel.com>, Sowmiya S <sowmiya.s@intel.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>, kernel-dev@igalia.com
Subject: [PATCH i-g-t 0/5] tests/kms_colorop: Assorted fixes and support for
 i915/Xe
Date: Wed, 27 May 2026 12:36:07 -0700
Message-ID: <20260527193612.651624-1-John.Harrison@Igalia.com>
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

There seem to be two distinct colorop tests - kms_colorop and
kms_color_pipeline. The former requires writeback and so does not run
on Intel platforms, however the use of writeback means it can dump
failing framebuffers out as PNGs to make debug easier. The latter uses
hardware generated CRCs which have lots of caveats about how they can
(or more accurately, cannot) be uesd.

The i915/Xe drivers are in the process of gaining writeback support
(but BGR only, not RGB). That means they can start running the
kms_colorop tests. So add in BGR support and add an expected error
range for Intel platforms.

Also, add an unclean writeback shutdown test to ensure that the
current issues with the Intel work-in-progress implementation get
fixed and stay fixed.

Note that these patches are built on top of work by Sowmiya S. Those
patches are included as a squash at the start of this set so that CI
can apply my patches and test them.

Signed-off-by: John Harrison <John.Harrison@Igalia.com>
CC: Suraj Kandpal <suraj.kandpal@intel.com>
CC: Sowmiya S <sowmiya.s@intel.com>
CC: Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>
CC: Karthik B S <karthik.b.s@intel.com>
CC: Swati Sharma <swati2.sharma@intel.com>
CC: kernel-dev@igalia.com

John Harrison (4):
  tests/kms_writeback: Add unclean shutdown test
  lib/igt_color,igt_fb: Add more BGR support to various helpers
  tests/kms_colorop: Add BGR pixel formats
  tests/kms_colorop: Intel platforms seems to have an error range up to
    8

Sowmiya S (1):
  [SQUASH] Add writeback changes for intel-supported formats

 lib/igt_color.c       |  54 +++++-
 lib/igt_fb.c          |  42 ++++-
 lib/igt_fb.h          |   1 +
 tests/kms_colorop.c   |   7 +
 tests/kms_writeback.c | 382 +++++++++++++++++++++++++++---------------
 5 files changed, 345 insertions(+), 141 deletions(-)

-- 
2.43.0

