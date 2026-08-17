Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD3ABC5B572
	for <igt-dev@archiver.kernel.org>; Mon, 17 Aug 2026 15:09:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3033410E428;
	Mon, 17 Aug 2026 15:09:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="iTFHOJ1S";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5500010E82D
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Aug 2026 15:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:From:Reply-To; bh=PmWwgPsgHqiVjBbsE+rE3owLZtv7ZValILhHZ++1epU=; b=
 iTFHOJ1SM4tVUkGe0vrgjGbVjCB+k7YPlKOocBZ6XoEhxOhCdOoY9cRqRhUqoS2oLEmL7Bn6zpHjW
 /Zi7w2/PKFHAe+s0rfHgf2h3RJNCcTXoyoDLX9g3+uCu7rzvZnmWzeFlVI0lcT91tyVUCpqUUsNWE
 uEnsBVs4MJ0pZi3SN6H5UlCHY4m9CGH5VPefgVq4FHdEESeGW45hqc/JUONabXD7bpgADt5v8tG1e
 6G1a+Rpnk8xvC7cVWanqcWKsDAmBZtccNuwclps5+JfWQNVGufTQ0hyIGm1rmD9vwtj9o2S0FmdAq
 BCoz6jMspnDb2wUI+K6GPXV+B/ZHOmSSLw==;
Received: from 154.red-79-147-121.dynamicip.rima-tde.net ([79.147.121.154]
 helo=killbill) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wvywm-004dea-0D; Mon, 17 Aug 2026 17:08:20 +0200
From: Melissa Wen <mwen@igalia.com>
To: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Alex Hung <alex.hung@amd.com>, Swati Sharma <swati2.sharma@intel.com>,
 John Harrison <John.Harrison@Igalia.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, Simon Ser <contact@emersion.fr>,
 Xaver Hugl <xaver.hugl@kde.org>, Harry Wentland <harry.wentland@amd.com>,
 Uma Shankar <uma.shankar@intel.com>, Jani Nikula <jani.nikula@intel.com>,
 igt-dev@lists.freedesktop.org, kernel-dev@igalia.com
Subject: [PATCH i-g-t v4 0/8] tests/kms_colorop: don't request colorop updates
 indefinitely and other improvements
Date: Mon, 17 Aug 2026 17:07:41 +0200
Message-ID: <20260817150749.66509-1-mwen@igalia.com>
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

- Patch 5 (new) extends igt_plane_set_color_pipeline() to accept NULL as the
  "Bypass" color pipeline and removes set_color_pipeline_bypass(), converting
  all its callers.

- Patch 6 fixes the kms_properties tests to match the colorop update
  requirement of only allowing changes to colorops that are part of an active
  plane color pipeline.

- Patch 7 ensures kms_color_pipeline only runs on Intel devices. As color
  validation works better with writeback than with CRC, other devices should
  prefer kms_colorop if they have writeback support. If not, they should work
  on adapting kms_color_pipeline to their specs.

- Patch 8 (new) adds macros for walking the colorops in a color pipeline, as
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

Melissa Wen (8):
  lib/igt_kms: clear colorop-changed flag after commit
  tests/kms_colorop_helper: only check if a given enum value exists
  tests/kms_properties: don't check colorop if no plane color pipeline
    prop
  tests/kms_properties: give non-primary planes their own fb
  lib/igt_kms: extend igt_plane_set_color_pipeline to accept Bypass
  tests/kms_properties: check colorop properties on active color
    pipelines
  tests/kms_color_pipeline: skip if not an Intel device
  lib/igt_kms: add macros to iterate color pipelines and colorops

 lib/igt_kms.c                                 | 90 ++++++++++++++-----
 lib/igt_kms.h                                 | 13 +++
 .../chamelium/kms_chamelium_color_pipeline.c  |  2 +-
 tests/kms_color_pipeline.c                    |  4 +-
 tests/kms_colorop.c                           | 23 ++---
 tests/kms_colorop_helper.c                    | 49 ++++------
 tests/kms_colorop_helper.h                    |  1 -
 tests/kms_properties.c                        | 42 ++++++---
 8 files changed, 143 insertions(+), 81 deletions(-)

-- 
2.53.0

