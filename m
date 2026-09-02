Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F074C624D3
	for <igt-dev@archiver.kernel.org>; Wed,  2 Sep 2026 18:06:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF2DE10F305;
	Wed,  2 Sep 2026 18:06:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="nPmn35qc";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B935310F30F
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Sep 2026 18:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:From:Reply-To; bh=OWQ5g96ZPIHxovGT0YKE70mLhTfedNSbSZ7z96GhQMI=; b=
 nPmn35qc4RMxJVvO2wXBHdy1QlGWG2SBAdjb34zmaP54zkWlR0XozLUOKcbPUyQnk33Gy0fTiChwv
 Aj7kHO6f08pKRUPxtxFLCIzCd7YqiLC0504KhAkmUxdMR8EXmXNLejcDnc5I6vKqhXiU3KPvMX6Pb
 BecSnZJM53raK+/4bZgBROiEl7iQUdOVpmF/jB+u3vYNjOdW3APIwGAFau1XKiJSNJbjLVHGqHnxl
 a/6i4MjRHRlZnFfniFZynh9/h4e7DYjfz5t00Z65We6KkKvfgn413x3fxle/KsSlmH5RuPGFYc2WI
 r9N5HEiETIKEqNJqqZ9gYx6z0G1HOUI84w==;
Received: from 113.red-79-144-92.dynamicip.rima-tde.net ([79.144.92.113]
 helo=killbill) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1x1pGE-00DxQx-Qb; Wed, 02 Sep 2026 20:00:34 +0200
From: Melissa Wen <mwen@igalia.com>
To: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org, kernel-dev@igalia.com,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Alex Hung <alex.hung@amd.com>, Swati Sharma <swati2.sharma@intel.com>,
 John Harrison <John.Harrison@Igalia.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, Simon Ser <contact@emersion.fr>,
 Xaver Hugl <xaver.hugl@kde.org>, Harry Wentland <harry.wentland@amd.com>,
 Uma Shankar <uma.shankar@intel.com>
Subject: [PATCH i-g-t v5 0/8] test/kms_colorop_helper: don't request colorop
 updates indefinitely
Date: Wed,  2 Sep 2026 19:58:00 +0200
Message-ID: <20260902180016.303482-1-mwen@igalia.com>
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

IGT currently lets colorop property changes be staged on color pipelines that
aren't active, which the uAPI will reject after some kernel fixes [1]:
colorop properties may only change on a currently active pipeline, or on one
activated or deactivated in the same atomic commit. This series fixes the
lib/igt_kms and colorop property tests to respect it.

- Patch 1 clears the colorop changed flag after a commit, so that later
  commits don't re-submit changes on an inactive color pipeline.

- Patch 2 prevents a colorop from being marked as changed just for checking
  whether a property enum value is supported. Together with patch 1, this
  matches the current expectation of allowing property changes on colorops
  that are part of a currently active color pipeline, or of a color pipeline
  that will be activated or deactivated in the same atomic commit, while
  rejecting attempts to change inactive colorops.

- Patch 3 restricts colorop property testing to planes that support the plane
  COLOR_PIPELINE property, i.e. planes that have a colorop pipeline, since not
  all planes have to support it.

- Patch 4 attaches a different framebuffer to non-primary planes so that the
  primary plane stays enabled and, with it, the CRTC under test: AMD requires
  an active primary plane to keep the CRTC active.

- Patch 5 extends igt_plane_set_color_pipeline() to accept NULL as the
  "Bypass" color pipeline and removes set_color_pipeline_bypass(), converting
  all its callers.

- Patch 6 fixes the kms_properties tests to match the colorop update
  requirement of only allowing changes to colorops that are part of an active
  plane color pipeline.

- Patch 7 move kms_color_pipeline to Intel's folder and make sure it only runs
  on Intel devices. As color validation works better with writeback than with
  CRC, other devices should run kms_colorop if they have writeback support.
  Currently, AMD and VKMS support colorop and writeback, and intel is the only
  one that still needs CRC-based test. If a new driver is in the same
  situation as intel, they can move kms_color_pipeline back to generic folder
  and work on adapting it to their specs. 

- Patch 8 adds macros for walking the colorops in a color pipeline, as
  well as all the color pipelines supported by a given plane.

[1] https://lore.kernel.org/dri-devel/20260811171011.184964-1-mwen@igalia.com/

Let me know your thoughts!

Melissa

[v1] https://lore.kernel.org/igt-dev/20260526140752.503380-1-mwen@igalia.com/
Changes:
- cover kms_properties (John H)
- add Alex H t-b tags

[v2] https://lore.kernel.org/igt-dev/20260602211259.898147-1-mwen@igalia.com/
Changes:
- split patch 3 into three: one that checks that the COLOR_PIPELINE property
  exists before testing colorops of a given plane; another to ensure an active
  primary plane for each CRTC to match AMD's requirement; and the last one to
  only check colorop properties if they're part of an active color pipeline
- extra space fix

[v3] https://lore.kernel.org/igt-dev/20260811143558.141813-1-mwen@igalia.com/
Changes:
- fix memory leak when enabling/disabling non-primary planes (Alex H/Chaitanya)
- fix type of variable to match igt_find_colorop (Alex H)
- fix typo and grammar in commit messages (Alex H)
- do the Intel device check earlier
- new patch extending igt_plane_set_color_pipeline() to accept NULL as
  "Bypass", replacing the open-coded setting in patch 6
- new patch adding macros for walking color pipelines and colorops (Jani)

[v4] https://lore.kernel.org/igt-dev/20260817150749.66509-1-mwen@igalia.com/
Changes:
- overall improvements on commit messages
- don't change plane->assigned_color_pipeline if setting to bypass to ensure no functional change
- commit changes when restoring color pipeline to bypass
- move kms_color_pipeline to intel's folder (Alex H and Harry)
- store next on colorop struct when discovering colorop since this is immutable
  and remove now unused igt_find_colorop and proposed igt_colorop_next
- use igt_unique to guard the iterator in a macro

Melissa Wen (8):
  lib/igt_kms: clear colorop-changed flag after commit
  tests/kms_colorop_helper: only check if a given enum value exists
  tests/kms_properties: don't check colorop if no plane color pipeline
    prop
  tests/kms_properties: give non-primary planes their own fb
  lib/igt_kms: extend igt_plane_set_color_pipeline to accept Bypass
  tests/kms_properties: check colorop properties on active color
    pipelines
  tests/intel/kms_color_pipeline: move driver-specific test to intel's
    folder
  lib/igt_kms: add macros to iterate color pipelines and colorops

 lib/igt_kms.c                                 | 122 +++++++++++-------
 lib/igt_kms.h                                 |  36 +++++-
 .../chamelium/kms_chamelium_color_pipeline.c  |   2 +-
 tests/{ => intel}/kms_color_pipeline.c        |   4 +-
 tests/kms_colorop.c                           |  23 ++--
 tests/kms_colorop_helper.c                    |  49 +++----
 tests/kms_colorop_helper.h                    |   1 -
 tests/kms_properties.c                        |  43 ++++--
 tests/meson.build                             |   2 +-
 9 files changed, 166 insertions(+), 116 deletions(-)
 rename tests/{ => intel}/kms_color_pipeline.c (98%)

-- 
2.53.0

