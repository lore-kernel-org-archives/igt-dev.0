Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E65606A319
	for <igt-dev@archiver.kernel.org>; Wed, 21 Oct 2026 15:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=QAImhd+s
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDDED10E031;
	Wed, 21 Oct 2026 15:22:45 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ECE610E321
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Oct 2026 15:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:From:Reply-To;
 bh=dtm7ilpux92CGj2unQ6woKF/dFO4R0O0fKH9EYIWzjQ=; b=QAImhd+se/oYox+F5Xt+Uq3Dlx
 T3QIcF8wQvdYf0xmV9OcrncxM6i/OZnZKjp6krgcxuly+CM9m1iu6So4IEFlgCxIKifviU+HSPkg9
 9fjxTVWlnvBry4KsZmbXnJnzIHGq6f8xi3iaNp2N+8Pz+bAQjSmEAY9Zgt4q3vaWCyQVRdTjLr0NS
 ZghYOHhrTRSMOuuKxdXEW5P1+VYSztwwavg4PgRKTOf3c/umLi9yYM7poxXLXDIGNzsiG/4ygLgH5
 CZTgc58Wjxy7bJgT3TbO1FAPvESjBGS69ykwRmEc1yquLffsuhQDDnKZZtd9eB7o3hbH79Xx/k5WY
 pfpz1idQ==;
Received: from 62-87-103-230.red-acceso.airtel.net ([62.87.103.230]
 helo=killbill.home) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1xJY6f-005l0E-Hs; Wed, 21 Oct 2026 17:19:57 +0200
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
Subject: [PATCH i-g-t v6 0/8] test/kms_colorop_helper: don't request colorop
 updates indefinitely
Date: Wed, 21 Oct 2026 17:18:24 +0200
Message-ID: <20261021151929.62529-1-mwen@igalia.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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

I hope I didn't forget to address all comments in the last version.
Basically I clarified commit message of patch 4 (Harry) and commit plane fb
changes (Chaitanya). I slighty changed commit 6 to balance the changes
in commit 4. Added r-b and a-b. The whole series is now accepted, but
I'll wait a week for any further review before applying it.

Melissa

Melissa Wen (8):
  lib/igt_kms: clear colorop-changed flag after commit
  tests/kms_colorop_helper: only check if a given enum value exists
  tests/kms_properties: don't check colorop if no plane color pipeline prop
  tests/kms_properties: give non-primary planes their own fb
  lib/igt_kms: extend igt_plane_set_color_pipeline to accept Bypass
  tests/kms_properties: check colorop properties on active color pipelines
  tests/intel/kms_color_pipeline: move driver-specific test to intel's folder
  lib/igt_kms: add macros to iterate color pipelines and colorops

 lib/igt_kms.c                                 | 122 +++++++++++-------
 lib/igt_kms.h                                 |  36 +++++-
 .../chamelium/kms_chamelium_color_pipeline.c  |   2 +-
 tests/{ => intel}/kms_color_pipeline.c        |   4 +-
 tests/kms_colorop.c                           |  23 ++--
 tests/kms_colorop_helper.c                    |  49 +++----
 tests/kms_colorop_helper.h                    |   1 -
 tests/kms_properties.c                        |  44 +++++--
 tests/meson.build                             |   2 +-
 9 files changed, 167 insertions(+), 116 deletions(-)
 rename tests/{ => intel}/kms_color_pipeline.c (99%)

-- 
2.53.0

