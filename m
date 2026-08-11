Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F1CAC5B56A
	for <igt-dev@archiver.kernel.org>; Tue, 11 Aug 2026 14:38:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B209610EC50;
	Tue, 11 Aug 2026 14:38:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="DXh0fVss";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C03510EC50
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Aug 2026 14:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:From:Reply-To; bh=dX/Q9k0KLrwFOUDvWhzS09zr5hPjK0AKT88gAngsum0=; b=
 DXh0fVss/dDgCNlldmU6m6/p7qHsvmzq4pRwSVM9V24orPF2mrWSbzsoxAPAKt0avX5fj+UcmCe/s
 N93wfA3C0fgEjlzGdQjssJ0hdBo7UaECvphLqXZD5DGG93VC+htn52MvIc02BcJZxZEj3UgHF6/zd
 USjH3MchK7fM/GdKJu0ElXD46zfUzxFdl1kuhnEpmIJI3UI0c+Sp673i7HI6RY+vjnZAftIREm1xL
 LedTOD5p8n/dpuEBUyIfbOioRN4G8rq2B5Pextwk8DoYrxuiD2hnHXcyggD+WuWYdA+zFj2k0GXBe
 4WrZJjE95mLF3z/+Lho3zEYuyypsVqC3mQ==;
Received: from 154.red-79-147-121.dynamicip.rima-tde.net ([79.147.121.154]
 helo=killbill.Home) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wtnbN-00HCVy-L7; Tue, 11 Aug 2026 16:37:13 +0200
From: Melissa Wen <mwen@igalia.com>
To: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 igt-dev@lists.freedesktop.org, kernel-dev@igalia.com,
 Alex Hung <alex.hung@amd.com>, Swati Sharma <swati2.sharma@intel.com>,
 John Harrison <John.Harrison@Igalia.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, Simon Ser <contact@emersion.fr>,
 Xaver Hugl <xaver.hugl@kde.org>, Harry Wentland <harry.wentland@amd.com>,
 Uma Shankar <uma.shankar@intel.com>
Subject: [PATCH i-g-t v3 0/6] test/kms_colorop_helper: don't request colorop
 updates indefinitely
Date: Tue, 11 Aug 2026 16:23:00 +0200
Message-ID: <20260811143558.141813-1-mwen@igalia.com>
X-Mailer: git-send-email 2.53.0
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

After committing colorop settings, colorops are still flagged as
changed, even if there is no new request for updates. This v3 addresses
Chaitanya's comments [v2] to fix an extra space and split one commit
into three, as follows:

- Patch 1 clears colorop flag after commit so that the next patch
  doesn't try to re-submit changes on inactive color pipeline.

- Patch 2 prevents colorop to be marked as changed just because it was
  checking if a property enum value is supported. These changes are
  consistent with the current expetation of allowing property changes in
  colorop that are part of a current active color pipeline or a color
  pipeline that will be activated or deactived in the same atomic commit;
  but rejecting attempts to change inactive colorops.

- Patch 3 (new): was detached from previous-version patch 3 to only
  verify colorop properties in planes that support plane COLOR_PIPELINE
  property, i.e. planes that has a colorop pipeline, since not all planes
  have to support it.

- Patch 4 (new): was also detached from previous-version patch 3 and now
  it basically keeps a primary plane always active for a given CRTC,
  even though colorop properties of an overlay plane is under testing.

- Patch 5: is the main change of previous-version patch 3 that fixes
  kms_properties to match colorop update requirements of an active plane
  color pipeline.

- Patch 6 just ensure that kms_color_pipeline expects an intel device
  and will not run otherwise. As color validation works better with
  writeback then CRC, other devices should prefer kms_colorop if they have
  writeback support. If not, they should work on adapting
  kms_color_pipeline according to their specs.

[v1] https://lore.kernel.org/igt-dev/20260602211259.898147-1-mwen@igalia.com/

Lemme know your thought!

Melissa

Melissa Wen (6):
  lib/igt_kms: clear colorop-changed flag after commit
  test/kms_colorop_helper: only check if a given enum value exist
  tests/kms_properties: don't check colorop if no plane color pipeline prop
  tests/kms_properties: keep primary plane enabled for each CRTC
  tests/kms_properties: check colorop properties on active color pipelines
  tests/kms_color_pipeline: skip if not an intel device

 lib/igt_kms.c              | 41 ++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h              |  4 ++++
 tests/kms_color_pipeline.c |  1 +
 tests/kms_colorop_helper.c |  4 +++-
 tests/kms_properties.c     | 26 ++++++++++++++++++++++--
 5 files changed, 73 insertions(+), 3 deletions(-)

-- 
2.53.0

