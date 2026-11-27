Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA26F606A31C
	for <igt-dev@archiver.kernel.org>; Fri, 27 Nov 2026 23:43:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9749510EB17;
	Fri, 27 Nov 2026 23:43:22 +0000 (UTC)
Received: from 8b00d9f022d5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29FFD10EB17;
 Fri, 27 Nov 2026 23:42:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8561050102693473586=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_Extended_multiple_planes_w?=
 =?utf-8?q?ith_multiple_pixel_formats?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Avandhica S R" <avandhica.s.r@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 27 Nov 2026 23:42:22 -0000
Message-ID: <179582294214.2999.16571855938690833172@8b00d9f022d5>
X-Patchwork-Hint: ignore
References: <20261127051010.937287-1-avandhica.s.r@intel.com>
In-Reply-To: <20261127051010.937287-1-avandhica.s.r@intel.com>
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
Reply-To: igt-dev@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-1.0 required=3.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8561050102693473586==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Extended multiple planes with multiple pixel formats
URL   : https://patchwork.freedesktop.org/series/179817/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_9206_FULL -> XEIGTPW_16228_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_16228_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_16228_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_16228_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv (NEW):
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][1] +6 other tests dmesg-fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-9/igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv.html

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010 (NEW):
    - shard-ptl:          NOTRUN -> [SKIP][2] +36 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-5/igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010.html

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-d-hdmi-a-3-pipe-c-dp-2 (NEW):
    - shard-bmg:          NOTRUN -> [FAIL][3] +33 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-d-hdmi-a-3-pipe-c-dp-2.html

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-yf (NEW):
    - shard-lnl:          NOTRUN -> [SKIP][4] +9 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-8/igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-yf.html

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-y (NEW):
    - shard-bmg:          NOTRUN -> [SKIP][5] +16 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-2/igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-y.html

  
New tests
---------

  New tests have been introduced between XEIGT_9206_FULL and XEIGTPW_16228_FULL:

### New IGT tests (545) ###

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.01, 58.06] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-a-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.23] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-a-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.14] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-a-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.10] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-a-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.17] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-a-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.12] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-a-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.22] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-b-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.17] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-b-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.25] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-b-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.34] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-b-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.14] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-b-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [3.09] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-b-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.81] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-c-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.14] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-c-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.17] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-c-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.89] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-c-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.13] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-c-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.89] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-c-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.12] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-d-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.19] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-d-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.19] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-d-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.97] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-d-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.15] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-d-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.15] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-d-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.08] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.02, 250.24] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-a-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [10.49] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-a-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [10.24] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-a-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [10.29] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-a-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.36] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-a-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.37] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-a-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.31] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-b-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [10.28] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-b-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [10.23] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-b-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [10.23] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-b-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.40] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-b-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.32] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-b-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.27] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-c-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [10.37] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-c-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [10.39] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-c-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [10.38] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-c-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.25] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-c-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.41] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-c-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.26] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-d-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [10.30] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-d-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [10.36] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-d-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [10.30] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-d-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.33] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-d-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.41] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-d-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.33] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.03, 18.87] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-a-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.78] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-a-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.70] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-a-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.66] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-a-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.69] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-a-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.67] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-a-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.73] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-b-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.70] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-b-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.73] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-b-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.77] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-b-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.69] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-b-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.67] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-b-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.65] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-c-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.74] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-c-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.70] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-c-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.72] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-c-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.68] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-c-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.69] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-c-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.62] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-d-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.73] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-d-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.68] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-d-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.70] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-d-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.72] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-d-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.69] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-d-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.63] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.02, 52.50] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-a-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.03] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-a-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.04] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-a-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.15] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-a-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.19] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-a-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.15] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-a-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.12] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-b-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.33] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-b-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.30] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-b-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.19] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-b-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.79] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-b-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.02] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-b-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.19] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-c-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.30] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-c-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.27] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-c-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.22] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-c-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.03] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-c-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.17] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-c-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.29] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-d-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.97] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-d-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.51] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-d-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.94] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-d-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.17] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-d-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.06] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-d-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.91] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv:
    - Statuses : 1 dmesg-fail(s) 2 skip(s)
    - Exec time: [0.02, 44.72] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-a-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.25] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-a-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 fail(s)
    - Exec time: [1.20] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-a-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-a-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.25] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-a-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-a-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 fail(s)
    - Exec time: [1.19] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-b-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 fail(s)
    - Exec time: [2.98] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-b-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 fail(s)
    - Exec time: [1.42] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-b-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [3.46] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-b-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.43] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-b-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.12] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-b-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 fail(s)
    - Exec time: [1.22] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-c-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [3.58] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-c-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 fail(s)
    - Exec time: [1.52] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-c-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 fail(s)
    - Exec time: [3.02] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-c-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-c-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.24] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-c-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 fail(s)
    - Exec time: [1.29] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-d-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 fail(s)
    - Exec time: [3.32] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-d-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.31] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-d-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 fail(s)
    - Exec time: [1.50] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-d-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.17] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-d-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 fail(s)
    - Exec time: [1.25] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-d-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 fail(s)
    - Exec time: [2.72] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.02, 63.95] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-a-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.21] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-a-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.21] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-a-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.13] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-a-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.42] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-a-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.72] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-a-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.42] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-b-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [3.70] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-b-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.22] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-b-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.09] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-b-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.14] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-b-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.09] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-b-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.10] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-c-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.20] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-c-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.19] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-c-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.47] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-c-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.15] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-c-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.13] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-c-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [3.56] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-d-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.27] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-d-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [3.72] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-d-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.15] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-d-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [3.59] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-d-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [3.28] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-d-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [3.60] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.03, 262.13] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-a-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [10.84] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-a-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [10.78] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-a-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [10.61] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-a-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.98] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-a-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.85] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-a-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.86] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-b-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [10.73] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-b-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [11.02] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-b-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [10.97] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-b-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.88] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-b-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.83] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-b-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.83] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-c-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [11.14] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-c-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [10.71] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-c-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [10.94] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-c-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.88] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-c-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.88] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-c-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.37] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-d-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [10.68] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-d-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [10.99] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-d-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [10.64] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-d-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.95] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-d-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.99] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-d-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.62] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb8888:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.02, 51.10] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-a-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.04] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-a-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.11] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-a-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.65] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-a-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.25] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-a-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.33] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-a-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.22] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-b-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.29] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-b-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.62] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-b-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.77] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-b-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.05] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-b-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.49] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-b-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.83] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-c-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.12] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-c-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.27] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-c-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.26] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-c-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.20] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-c-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.06] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-c-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.22] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-d-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.78] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-d-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.56] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-d-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.07] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-d-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.20] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-d-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.24] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-d-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.21] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv:
    - Statuses : 1 dmesg-fail(s) 2 skip(s)
    - Exec time: [0.02, 45.08] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-a-dp-1-pipe-b-hdmi-a-3:
    - Statuses : 1 fail(s)
    - Exec time: [1.68] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-a-dp-1-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.28] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-a-dp-1-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.53] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-a-hdmi-a-3-pipe-b-dp-1:
    - Statuses : 1 fail(s)
    - Exec time: [1.45] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-a-hdmi-a-3-pipe-c-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.12] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-a-hdmi-a-3-pipe-d-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.44] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-b-dp-1-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.55] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-b-dp-1-pipe-c-hdmi-a-3:
    - Statuses : 1 fail(s)
    - Exec time: [1.52] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-b-dp-1-pipe-d-hdmi-a-3:
    - Statuses : 1 fail(s)
    - Exec time: [3.55] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-b-hdmi-a-3-pipe-a-dp-1:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [3.88] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-b-hdmi-a-3-pipe-c-dp-1:
    - Statuses : 1 fail(s)
    - Exec time: [1.49] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-b-hdmi-a-3-pipe-d-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.46] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-c-dp-1-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.54] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-c-dp-1-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.26] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-c-dp-1-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.15] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-c-hdmi-a-3-pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.22] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-c-hdmi-a-3-pipe-b-dp-1:
    - Statuses : 1 fail(s)
    - Exec time: [1.26] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-c-hdmi-a-3-pipe-d-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.24] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-d-dp-1-pipe-a-hdmi-a-3:
    - Statuses : 1 fail(s)
    - Exec time: [1.43] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-d-dp-1-pipe-b-hdmi-a-3:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [3.94] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-d-dp-1-pipe-c-hdmi-a-3:
    - Statuses : 1 fail(s)
    - Exec time: [1.51] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-d-hdmi-a-3-pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.44] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-d-hdmi-a-3-pipe-b-dp-1:
    - Statuses : 1 fail(s)
    - Exec time: [1.39] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-d-hdmi-a-3-pipe-c-dp-1:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [3.57] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.02, 62.79] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-a-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [3.73] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-a-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [3.02] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-a-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.42] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-a-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.27] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-a-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.20] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-a-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.08] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-b-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.18] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-b-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [3.24] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-b-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.45] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-b-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.17] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-b-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.62] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-b-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.08] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-c-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.13] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-c-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.60] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-c-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.79] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-c-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.79] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-c-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.80] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-c-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.12] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-d-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.85] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-d-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.91] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-d-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.15] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-d-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.78] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-d-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.11] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-d-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.15] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.01, 251.91] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-a-dp-1-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [10.43] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-a-dp-1-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [10.43] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-a-dp-1-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [10.43] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-a-hdmi-a-3-pipe-b-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.41] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-a-hdmi-a-3-pipe-c-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.39] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-a-hdmi-a-3-pipe-d-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.37] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-b-dp-1-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [10.38] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-b-dp-1-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [10.49] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-b-dp-1-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [10.41] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-b-hdmi-a-3-pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.44] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-b-hdmi-a-3-pipe-c-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.39] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-b-hdmi-a-3-pipe-d-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.38] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-c-dp-1-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [10.51] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-c-dp-1-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [10.44] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-c-dp-1-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [10.25] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-c-hdmi-a-3-pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.31] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-c-hdmi-a-3-pipe-b-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.26] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-c-hdmi-a-3-pipe-d-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.22] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-d-dp-1-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [10.47] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-d-dp-1-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [10.49] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-d-dp-1-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [10.41] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-d-hdmi-a-3-pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.38] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-d-hdmi-a-3-pipe-b-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.46] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-d-hdmi-a-3-pipe-c-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.43] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.01, 18.74] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-a-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.68] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-a-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.71] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-a-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.66] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-a-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.69] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-a-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.68] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-a-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.68] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-b-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.74] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-b-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.69] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-b-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.69] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-b-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.74] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-b-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.70] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-b-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.67] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-c-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.71] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-c-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.71] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-c-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.72] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-c-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.66] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-c-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.71] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-c-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.65] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-d-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.75] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-d-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.68] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-d-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.68] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-d-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.70] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-d-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.70] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-d-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.67] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.02, 41.44] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-a-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.52] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-a-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.09] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-a-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.20] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-a-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.22] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-a-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.45] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-a-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.48] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-b-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.53] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-b-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.48] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-b-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.48] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-b-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.50] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-b-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.90] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-b-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.93] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-c-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.91] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-c-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.49] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-c-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.46] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-c-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.48] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-c-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.50] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-c-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.44] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-d-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.49] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-d-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.54] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-d-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.79] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-d-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.47] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-d-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.50] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-d-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.47] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.02, 34.02] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-a-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 fail(s)
    - Exec time: [1.21] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-a-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.22] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-a-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 fail(s)
    - Exec time: [1.29] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-a-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.51] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-a-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 fail(s)
    - Exec time: [1.13] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-a-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 fail(s)
    - Exec time: [1.13] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-b-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 fail(s)
    - Exec time: [1.20] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-b-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.26] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-b-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.28] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-b-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.55] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-b-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 fail(s)
    - Exec time: [1.15] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-b-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.27] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-c-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.49] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-c-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 fail(s)
    - Exec time: [1.40] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-c-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.42] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-c-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 fail(s)
    - Exec time: [1.31] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-c-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.47] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-c-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 fail(s)
    - Exec time: [1.42] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-d-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.42] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-d-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.43] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-d-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 fail(s)
    - Exec time: [1.45] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-d-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 fail(s)
    - Exec time: [1.49] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-d-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.15] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-d-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 fail(s)
    - Exec time: [1.26] s

  * igt@kms_plane_multiple@2x-tiling-y-and-drm_format_xrgb16161616f:
    - Statuses : 3 skip(s)
    - Exec time: [0.02, 0.04] s

  * igt@kms_plane_multiple@2x-tiling-y-and-drm_format_xrgb2101010:
    - Statuses : 3 skip(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_plane_multiple@2x-tiling-y-and-drm_format_xrgb8888:
    - Statuses : 3 skip(s)
    - Exec time: [0.01, 0.04] s

  * igt@kms_plane_multiple@2x-tiling-y-and-drm_format_xyuv8888:
    - Statuses : 3 skip(s)
    - Exec time: [0.02, 0.04] s

  * igt@kms_plane_multiple@2x-tiling-y-and-drm_format_yuyv:
    - Statuses : 3 skip(s)
    - Exec time: [0.02, 0.04] s

  * igt@kms_plane_multiple@2x-tiling-yf-and-drm_format_xrgb16161616f:
    - Statuses : 2 skip(s)
    - Exec time: [0.03, 0.04] s

  * igt@kms_plane_multiple@2x-tiling-yf-and-drm_format_xrgb2101010:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.04] s

  * igt@kms_plane_multiple@2x-tiling-yf-and-drm_format_xrgb8888:
    - Statuses : 3 skip(s)
    - Exec time: [0.02, 0.04] s

  * igt@kms_plane_multiple@2x-tiling-yf-and-drm_format_xyuv8888:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.04] s

  * igt@kms_plane_multiple@2x-tiling-yf-and-drm_format_yuyv:
    - Statuses : 3 skip(s)
    - Exec time: [0.01, 0.04] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-4:
    - Statuses : 3 pass(s)
    - Exec time: [13.32, 30.45] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-4@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [4.68] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-4@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [4.05, 4.38] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-4@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.65] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-4@pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [3.61] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-4@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [4.60, 4.64] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-4@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.70] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-4@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [3.84] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-4@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [4.64, 4.73] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-4@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [3.96] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-4@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [4.85] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-4@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.76] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-4@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [4.13] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-none:
    - Statuses : 3 pass(s)
    - Exec time: [13.39, 26.50] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-none@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.84] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-none@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [4.15, 4.41] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-none@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [3.57] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-none@pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [3.06] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-none@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [4.60, 4.75] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-none@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.66] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-none@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [3.63] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-none@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [4.61, 4.83] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-none@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.92] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-none@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [3.72] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-none@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.82] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-none@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [4.07] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-x:
    - Statuses : 2 pass(s)
    - Exec time: [13.42, 30.35] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-x@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [5.00] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-x@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.15] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-x@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [4.38] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-x@pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.83] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-x@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.60] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-x@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [3.50] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-x@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [3.09] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-x@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.64] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-x@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.68] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-x@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [4.55] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-x@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [4.30] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-y:
    - Statuses : 3 skip(s)
    - Exec time: [0.02, 0.04] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-yf:
    - Statuses : 3 skip(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-4:
    - Statuses : 3 pass(s)
    - Exec time: [16.65, 115.92] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-4@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [13.80] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-4@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [5.35, 6.02] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-4@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [14.48] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-4@pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [14.65] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-4@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [5.63, 6.11] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-4@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [14.81] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-4@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [14.36] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-4@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [5.62, 6.38] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-4@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [14.49] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-4@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [14.80] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-4@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.41] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-4@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [14.51] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-none:
    - Statuses : 3 pass(s)
    - Exec time: [16.81, 111.01] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-none@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [14.35] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-none@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [5.39, 6.03] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-none@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [13.60] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-none@pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [13.73] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-none@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [5.69, 6.25] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-none@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [13.71] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-none@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [13.72] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-none@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [5.68, 6.44] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-none@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [14.34] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-none@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [13.49] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-none@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.31] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-none@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [14.02] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-x:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.04, 112.31] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-x@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [13.79] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-x@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [5.25] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-x@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [14.07] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-x@pipe-b-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [13.99] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-x@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [5.61] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-x@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [14.53] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-x@pipe-c-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [13.99] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-x@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [5.58] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-x@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [13.95] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-x@pipe-d-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [13.98] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-x@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [13.95] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-y:
    - Statuses : 3 skip(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-yf:
    - Statuses : 3 skip(s)
    - Exec time: [0.01, 0.03] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-4:
    - Statuses : 3 pass(s)
    - Exec time: [7.89, 18.03] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-4@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.96] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-4@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [3.94, 4.05] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-4@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.95] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-4@pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.01] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-4@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [4.62, 4.70] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-4@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.95] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-4@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.09] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-4@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [4.60, 4.74] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-4@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.95] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-4@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.00] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-4@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.62] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-4@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.91] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-none:
    - Statuses : 3 pass(s)
    - Exec time: [7.02, 18.04] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-none@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.81] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-none@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [3.84, 4.04] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-none@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.89] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-none@pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.89] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-none@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [4.61, 4.62] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-none@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.81] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-none@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.91] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-none@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [4.64, 4.74] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-none@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.90] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-none@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.93] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-none@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.69] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-none@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.82] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-x:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.03, 13.09] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-x@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.99] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-x@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.82] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-x@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.88] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-x@pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.01] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-x@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.62] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-x@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.00] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-x@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.09] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-x@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.63] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-x@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.91] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-x@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.02] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-x@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.94] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-y:
    - Statuses : 3 skip(s)
    - Exec time: [0.02, 0.04] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-yf:
    - Statuses : 3 skip(s)
    - Exec time: [0.02, 0.04] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-4:
    - Statuses : 3 pass(s)
    - Exec time: [13.31, 19.72] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-4@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.29] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-4@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [4.03, 4.12] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-4@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.65] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-4@pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.14] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-4@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [4.61, 4.75] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-4@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.25] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-4@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.81] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-4@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [4.63, 4.73] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-4@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.61] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-4@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.78] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-4@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.81] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-4@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.16] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-none:
    - Statuses : 3 pass(s)
    - Exec time: [13.16, 18.46] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-none@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.98] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-none@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [3.98, 4.23] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-none@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.84] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-none@pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.92] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-none@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [4.63, 4.84] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-none@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.83] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-none@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.89] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-none@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [4.51, 4.79] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-none@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.83] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-none@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.44] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-none@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.55] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-none@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.99] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-x:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.01, 17.87] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-x@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.96] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-x@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.05] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-x@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.91] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-x@pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.89] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-x@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.51] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-x@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.83] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-x@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.92] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-x@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.53] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-x@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.82] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-x@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.23] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-x@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.28] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-y:
    - Statuses : 2 skip(s)
    - Exec time: [0.02] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-yf:
    - Statuses : 3 skip(s)
    - Exec time: [0.02, 0.04] s

  * igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-4:
    - Statuses : 2 pass(s)
    - Exec time: [13.23, 18.19] s

  * igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-4@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [3.92, 4.05] s

  * igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-4@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [4.62, 4.63] s

  * igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-4@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [4.63, 4.66] s

  * igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-4@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.81] s

  * igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-none:
    - Statuses : 3 pass(s)
    - Exec time: [12.96, 18.38] s

  * igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-none@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.99] s

  * igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-none@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [3.88, 4.06] s

  * igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-none@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.76] s

  * igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-none@pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.86] s

  * igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-none@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [4.50, 4.82] s

  * igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-none@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.61] s

  * igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-none@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.78] s

  * igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-none@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [4.52, 4.74] s

  * igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-none@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.80] s

  * igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-none@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.92] s

  * igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-none@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.71] s

  * igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-none@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.79] s

  * igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-x:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.03, 13.03] s

  * igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-x@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.97] s

  * igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-x@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.51] s

  * igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-x@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.52] s

  * igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-y:
    - Statuses : 3 skip(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-yf:
    - Statuses : 3 skip(s)
    - Exec time: [0.02, 0.03] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_16228_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotreplug:
    - shard-bmg:          [PASS][6] -> [ABORT][7] ([Intel XE#9841]) +1 other test abort
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9206/shard-bmg-1/igt@core_hotunplug@hotreplug.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-7/igt@core_hotunplug@hotreplug.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2233])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - shard-ptl:          NOTRUN -> [SKIP][9] ([Intel XE#5765])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-ptl:          NOTRUN -> [SKIP][10] ([Intel XE#5947]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2370])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-ptl:          NOTRUN -> [SKIP][12] ([Intel XE#6925])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2327]) +3 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-10/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-ptl:          NOTRUN -> [SKIP][14] ([Intel XE#5901])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-7/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-ptl:          NOTRUN -> [SKIP][15] ([Intel XE#7085])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-2/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#7059] / [Intel XE#7085])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-1/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#1124]) +2 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#1124]) +12 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - shard-ptl:          NOTRUN -> [SKIP][19] ([Intel XE#5808]) +6 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-3/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#607] / [Intel XE#7361])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#610] / [Intel XE#7387])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@connected-linear-tiling-2-displays-target-2560x1440p:
    - shard-ptl:          NOTRUN -> [SKIP][22] ([Intel XE#7679]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-3/igt@kms_bw@connected-linear-tiling-2-displays-target-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#7679])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-1/igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#7679]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-10/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#367]) +3 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-1/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#2887]) +2 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-8/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:
    - shard-ptl:          NOTRUN -> [SKIP][27] ([Intel XE#5822]) +6 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-1/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2652]) +26 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#3432]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#2669] / [Intel XE#7389]) +3 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2887]) +17 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_cdclk@plane-scaling:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2724] / [Intel XE#7449]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-10/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2325] / [Intel XE#7358]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-2/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#7358]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-6/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#7358]) +5 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-9/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-ptl:          NOTRUN -> [SKIP][36] ([Intel XE#2252]) +4 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-3/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2252]) +6 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-8/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@dp-hpd-fast:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#373])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-8/igt@kms_chamelium_hpd@dp-hpd-fast.html

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-c-plane-4:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#6969]) +5 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-2/igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-c-plane-4.html

  * igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-d-plane-4:
    - shard-ptl:          NOTRUN -> [SKIP][40] ([Intel XE#6969]) +7 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-2/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-d-plane-4.html

  * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-0:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#6969]) +26 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-5/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-0.html

  * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-4:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#6969] / [Intel XE#7006]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-5/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-4.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-ptl:          NOTRUN -> [SKIP][43] ([Intel XE#5832] / [Intel XE#6974])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-1/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2390] / [Intel XE#6974]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-5/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          NOTRUN -> [FAIL][45] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +7 other tests fail
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-1/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-1:
    - shard-bmg:          NOTRUN -> [FAIL][46] ([Intel XE#3304] / [Intel XE#7374])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-7/igt@kms_content_protection@lic-type-0@pipe-a-dp-1.html

  * igt@kms_content_protection@mei-interface:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#7642])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-6/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@uevent-hdcp14:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#7642])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-7/igt@kms_content_protection@uevent-hdcp14.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2320]) +8 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-ptl:          NOTRUN -> [SKIP][50] ([Intel XE#5846])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-4/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2321] / [Intel XE#7355]) +2 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-9/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#2321] / [Intel XE#7355]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-7/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-128x42:
    - shard-ptl:          NOTRUN -> [SKIP][53] ([Intel XE#5900]) +2 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-8/igt@kms_cursor_crc@cursor-sliding-128x42.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-ptl:          NOTRUN -> [SKIP][54] ([Intel XE#5962])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#309] / [Intel XE#7343]) +2 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-ptl:          NOTRUN -> [SKIP][56] ([Intel XE#6035])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2286] / [Intel XE#6035])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#1508])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-9/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#1340] / [Intel XE#7435])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html

  * igt@kms_dp_link_training@uhbr-mst-direct-train:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#9527])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-6/igt@kms_dp_link_training@uhbr-mst-direct-train.html
    - shard-ptl:          NOTRUN -> [SKIP][61] ([Intel XE#9527])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-6/igt@kms_dp_link_training@uhbr-mst-direct-train.html

  * igt@kms_dp_link_training@uhbr-mst-tbtalt-train:
    - shard-ptl:          NOTRUN -> [SKIP][62] ([Intel XE#9531])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-8/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html

  * igt@kms_dp_link_training@uhbr-sst-direct-train:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#9529])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-9/igt@kms_dp_link_training@uhbr-sst-direct-train.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#4331] / [Intel XE#7227])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-8/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp-bigjoiner:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#8265]) +6 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-3/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html

  * igt@kms_dsc@dsc-with-bpc-bigjoiner:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#8265])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-1/igt@kms_dsc@dsc-with-bpc-bigjoiner.html

  * igt@kms_dsc@dsc-with-formats-ultrajoiner:
    - shard-ptl:          NOTRUN -> [SKIP][67] ([Intel XE#5907])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-8/igt@kms_dsc@dsc-with-formats-ultrajoiner.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#4156] / [Intel XE#7425]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-9/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#8680])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-10/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@display-3x:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2373] / [Intel XE#7448])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-1/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@dsc:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#8586])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-3/igt@kms_feature_discovery@dsc.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2374] / [Intel XE#6128])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-8/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#1421]) +2 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-3/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-ptl:          NOTRUN -> [SKIP][74] ([Intel XE#2316]) +3 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-5/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [PASS][75] -> [FAIL][76] ([Intel XE#301]) +2 other tests fail
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9206/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#7178] / [Intel XE#7349]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#1397] / [Intel XE#1745] / [Intel XE#7385] / [Intel XE#9144])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#1397] / [Intel XE#7385] / [Intel XE#9144])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-ptl:          NOTRUN -> [SKIP][80] ([Intel XE#7178]) +3 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#7178] / [Intel XE#7351]) +4 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#7178] / [Intel XE#7351]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#7179])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-1/igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
    - shard-ptl:          NOTRUN -> [SKIP][84] ([Intel XE#5800] / [Intel XE#6312]) +5 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-7/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#6312]) +3 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-2/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#7061]) +2 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-3/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#4141]) +22 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#656] / [Intel XE#7905]) +7 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move:
    - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#6312] / [Intel XE#651])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:
    - shard-ptl:          NOTRUN -> [SKIP][90] ([Intel XE#5812]) +48 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#7061] / [Intel XE#7356])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-blt:
    - shard-ptl:          NOTRUN -> [SKIP][92] ([Intel XE#7061] / [Intel XE#7356])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-8/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-plflip-blt:
    - shard-ptl:          NOTRUN -> [SKIP][93] ([Intel XE#6312]) +7 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#2311]) +84 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#7061]) +8 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-6/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> [SKIP][96] ([Intel XE#7865]) +16 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-4/igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#2352] / [Intel XE#7399])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-render:
    - shard-ptl:          NOTRUN -> [SKIP][98] ([Intel XE#7061]) +2 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#7905]) +10 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-1/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#2313]) +85 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#7061] / [Intel XE#7356]) +3 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#7865]) +8 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-4/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:
    - shard-bmg:          NOTRUN -> [FAIL][103] ([Intel XE#9346])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-1/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#6901])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-3/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#6911] / [Intel XE#7466])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-5/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#4298] / [Intel XE#5873])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-1/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#6901])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-4/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-ptl:          NOTRUN -> [SKIP][108] ([Intel XE#6900])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-7/igt@kms_joiner@invalid-modeset-ultra-joiner.html
    - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#6911] / [Intel XE#7378])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-4/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-ptl:          NOTRUN -> [SKIP][110] ([Intel XE#7173])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-5/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#7591])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_stress@stress-xrgb8888-xtiled:
    - shard-ptl:          NOTRUN -> [SKIP][112] ([Intel XE#6912])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-1/igt@kms_pipe_stress@stress-xrgb8888-xtiled.html

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-5:
    - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#8303]) +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-9/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-5.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:
    - shard-lnl:          NOTRUN -> [SKIP][114] ([Intel XE#7283])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-3/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier:
    - shard-ptl:          NOTRUN -> [SKIP][115] ([Intel XE#7283]) +4 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-6/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][116] ([Intel XE#7283]) +4 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-2/igt@kms_plane@pixel-format-y-tiled-modifier.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#2393])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-9/igt@kms_plane_lowres@tiling-yf.html
    - shard-ptl:          NOTRUN -> [SKIP][118] ([Intel XE#5946])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-5/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010 (NEW):
    - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#4596]) +23 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-8/igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010.html

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-y-tiled:
    - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#9779])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-4/igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-y-tiled.html

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-yf-tiled:
    - shard-ptl:          NOTRUN -> [SKIP][121] ([Intel XE#9779])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-1/igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-yf-tiled.html

  * igt@kms_plane_scaling@plane-downscale-max-crc-yf-tiled:
    - shard-bmg:          NOTRUN -> [SKIP][122] ([Intel XE#9779]) +3 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-8/igt@kms_plane_scaling@plane-downscale-max-crc-yf-tiled.html

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-a-dp-2-p010:
    - shard-bmg:          NOTRUN -> [FAIL][123] ([Intel XE#9780]) +7 other tests fail
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-10/igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-a-dp-2-p010.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          NOTRUN -> [SKIP][124] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-2/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc3co-after-dc6@psr2-yuv420:
    - shard-bmg:          NOTRUN -> [SKIP][125] ([Intel XE#8396]) +5 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-8/igt@kms_pm_dc@dc3co-after-dc6@psr2-yuv420.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#8395] / [Intel XE#8396]) +5 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-9/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [PASS][127] -> [FAIL][128] ([Intel XE#8399]) +1 other test fail
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9206/shard-lnl-4/igt@kms_pm_dc@dc5-psr.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [PASS][129] -> [FAIL][130] ([Intel XE#2029] / [Intel XE#7395])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9206/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-2/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-lnl:          NOTRUN -> [SKIP][131] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-4/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][132] ([Intel XE#2893] / [Intel XE#7304])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-2/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-ptl:          NOTRUN -> [SKIP][133] ([Intel XE#7304]) +3 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-8/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][134] ([Intel XE#5858]) +1 other test skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-ptl:          NOTRUN -> [SKIP][135] ([Intel XE#5858] / [Intel XE#7304]) +3 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][136] ([Intel XE#1489]) +15 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-8/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-ptl:          NOTRUN -> [SKIP][137] ([Intel XE#7413])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-4/igt@kms_psr2_su@frontbuffer-xrgb8888.html
    - shard-bmg:          NOTRUN -> [SKIP][138] ([Intel XE#2387] / [Intel XE#7429])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-10/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][139] ([Intel XE#2234] / [Intel XE#2850]) +13 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-5/igt@kms_psr@fbc-pr-cursor-plane-onoff.html

  * igt@kms_psr@fbc-pr-primary-page-flip:
    - shard-lnl:          NOTRUN -> [SKIP][140] ([Intel XE#1406])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-1/igt@kms_psr@fbc-pr-primary-page-flip.html

  * igt@kms_psr@fbc-psr2-sprite-blt:
    - shard-lnl:          NOTRUN -> [SKIP][141] ([Intel XE#1406] / [Intel XE#7345])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-3/igt@kms_psr@fbc-psr2-sprite-blt.html

  * igt@kms_psr@fbc-psr2-sprite-blt@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][142] ([Intel XE#1406] / [Intel XE#4609] / [Intel XE#7345])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-3/igt@kms_psr@fbc-psr2-sprite-blt@edp-1.html

  * igt@kms_psr@pr-primary-page-flip:
    - shard-ptl:          NOTRUN -> [SKIP][143] ([Intel XE#1406]) +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-4/igt@kms_psr@pr-primary-page-flip.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-bmg:          NOTRUN -> [SKIP][144] ([Intel XE#3904] / [Intel XE#7342]) +4 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-10/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-bmg:          NOTRUN -> [SKIP][145] ([Intel XE#2330] / [Intel XE#5813])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-bmg:          NOTRUN -> [SKIP][146] ([Intel XE#2413])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:
    - shard-bmg:          NOTRUN -> [SKIP][147] ([Intel XE#6503]) +3 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-5/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          NOTRUN -> [SKIP][148] ([Intel XE#2426] / [Intel XE#5848])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@cmrr-video-mode:
    - shard-bmg:          NOTRUN -> [SKIP][149] ([Intel XE#9271])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-5/igt@kms_vrr@cmrr-video-mode.html

  * igt@kms_vrr@lobf-dc3co:
    - shard-bmg:          NOTRUN -> [SKIP][150] ([Intel XE#8397])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-9/igt@kms_vrr@lobf-dc3co.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          NOTRUN -> [SKIP][151] ([Intel XE#1499] / [Intel XE#9271])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-2/igt@kms_vrr@max-min.html

  * igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all:
    - shard-bmg:          NOTRUN -> [ABORT][152] ([Intel XE#8868])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-7/igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all.html
    - shard-ptl:          NOTRUN -> [ABORT][153] ([Intel XE#8868])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-5/igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-bmg:          NOTRUN -> [SKIP][154] ([Intel XE#6599])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-2/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_create@create-big-vram:
    - shard-ptl:          NOTRUN -> [SKIP][155] ([Intel XE#5853] / [Intel XE#7457])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-7/igt@xe_create@create-big-vram.html

  * igt@xe_err_injection@inject_core_compute_corr_error_threshold_one:
    - shard-bmg:          NOTRUN -> [SKIP][156] ([Intel XE#9769])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-9/igt@xe_err_injection@inject_core_compute_corr_error_threshold_one.html
    - shard-ptl:          NOTRUN -> [SKIP][157] ([Intel XE#9769]) +1 other test skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-7/igt@xe_err_injection@inject_core_compute_corr_error_threshold_one.html

  * igt@xe_evict@evict-beng-large-cm:
    - shard-ptl:          NOTRUN -> [SKIP][158] ([Intel XE#5764]) +4 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-3/igt@xe_evict@evict-beng-large-cm.html

  * igt@xe_evict@evict-cm-threads-small:
    - shard-lnl:          NOTRUN -> [SKIP][159] ([Intel XE#6540] / [Intel XE#688]) +1 other test skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-8/igt@xe_evict@evict-cm-threads-small.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
    - shard-ptl:          NOTRUN -> [SKIP][160] ([Intel XE#6144])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-5/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html

  * igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][161] ([Intel XE#7482]) +3 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-2/igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-invalidate.html

  * igt@xe_exec_balancer@twice-virtual-basic:
    - shard-ptl:          NOTRUN -> [SKIP][162] ([Intel XE#7482]) +8 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-5/igt@xe_exec_balancer@twice-virtual-basic.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][163] ([Intel XE#2322] / [Intel XE#7372]) +14 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [SKIP][164] ([Intel XE#1392])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-once-null:
    - shard-ptl:          NOTRUN -> [SKIP][165] ([Intel XE#5575] / [Intel XE#7484]) +4 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-5/igt@xe_exec_basic@multigpu-once-null.html

  * igt@xe_exec_fault_mode@many-multi-queue-userptr-imm:
    - shard-lnl:          NOTRUN -> [SKIP][166] ([Intel XE#8374]) +2 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-3/igt@xe_exec_fault_mode@many-multi-queue-userptr-imm.html

  * igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][167] ([Intel XE#8374]) +11 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-5/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_fault_mode@twice-multi-queue-invalid-userptr-fault:
    - shard-ptl:          NOTRUN -> [SKIP][168] ([Intel XE#8374]) +1 other test skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-6/igt@xe_exec_fault_mode@twice-multi-queue-invalid-userptr-fault.html

  * igt@xe_exec_mix_modes@exec-multi-queue-spinner-interrupted-lr:
    - shard-bmg:          NOTRUN -> [SKIP][169] ([Intel XE#9003])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-2/igt@xe_exec_mix_modes@exec-multi-queue-spinner-interrupted-lr.html

  * igt@xe_exec_multi_queue@few-execs-priority-smem:
    - shard-lnl:          NOTRUN -> [SKIP][170] ([Intel XE#8364]) +5 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-6/igt@xe_exec_multi_queue@few-execs-priority-smem.html

  * igt@xe_exec_multi_queue@sanity:
    - shard-ptl:          NOTRUN -> [SKIP][171] ([Intel XE#8364]) +16 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-7/igt@xe_exec_multi_queue@sanity.html

  * igt@xe_exec_multi_queue@two-queues-priority:
    - shard-bmg:          NOTRUN -> [SKIP][172] ([Intel XE#8364]) +38 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-8/igt@xe_exec_multi_queue@two-queues-priority.html

  * igt@xe_exec_reset@cm-multi-queue-cat-error:
    - shard-bmg:          NOTRUN -> [SKIP][173] ([Intel XE#8369]) +4 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-1/igt@xe_exec_reset@cm-multi-queue-cat-error.html

  * igt@xe_exec_reset@multi-queue-long-spin-reuse-many-queue-switch:
    - shard-ptl:          NOTRUN -> [SKIP][174] ([Intel XE#8369]) +2 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-7/igt@xe_exec_reset@multi-queue-long-spin-reuse-many-queue-switch.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-multi-vma:
    - shard-ptl:          NOTRUN -> [SKIP][175] ([Intel XE#6196])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-2/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-multi-vma.html

  * igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind:
    - shard-ptl:          NOTRUN -> [SKIP][176] ([Intel XE#8378]) +6 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-5/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][177] ([Intel XE#8378]) +13 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-mixed-rebind.html

  * igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][178] ([Intel XE#8378]) +2 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-3/igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr-invalidate.html

  * igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc:
    - shard-bmg:          NOTRUN -> [ABORT][179] ([Intel XE#9841]) +1 other test abort
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-3/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html

  * igt@xe_gpgpu_fill@offset-4x4:
    - shard-bmg:          NOTRUN -> [SKIP][180] ([Intel XE#7954])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-1/igt@xe_gpgpu_fill@offset-4x4.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-ptl:          NOTRUN -> [SKIP][181] ([Intel XE#7070])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-1/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - shard-bmg:          NOTRUN -> [SKIP][182] ([Intel XE#2229])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_madvise@atomic-device:
    - shard-lnl:          NOTRUN -> [SKIP][183] ([Intel XE#7980])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-2/igt@xe_madvise@atomic-device.html

  * igt@xe_mempage_offline@inject-duplicate-page:
    - shard-bmg:          NOTRUN -> [SKIP][184] ([Intel XE#9203])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-4/igt@xe_mempage_offline@inject-duplicate-page.html
    - shard-ptl:          NOTRUN -> [SKIP][185] ([Intel XE#9203])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-7/igt@xe_mempage_offline@inject-duplicate-page.html

  * igt@xe_mmap@vram:
    - shard-lnl:          NOTRUN -> [SKIP][186] ([Intel XE#1416])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-3/igt@xe_mmap@vram.html

  * igt@xe_multigpu_svm@mgpu-coherency-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][187] ([Intel XE#6964]) +6 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-8/igt@xe_multigpu_svm@mgpu-coherency-prefetch.html

  * igt@xe_multigpu_svm@mgpu-latency-basic:
    - shard-ptl:          NOTRUN -> [SKIP][188] ([Intel XE#6964]) +1 other test skip
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-2/igt@xe_multigpu_svm@mgpu-latency-basic.html

  * igt@xe_noexec_ping_pong@basic:
    - shard-ptl:          NOTRUN -> [SKIP][189] ([Intel XE#6259] / [Intel XE#7406])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-6/igt@xe_noexec_ping_pong@basic.html

  * igt@xe_page_reclaim@basic-mixed:
    - shard-ptl:          NOTRUN -> [SKIP][190] ([Intel XE#7793])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-1/igt@xe_page_reclaim@basic-mixed.html

  * igt@xe_page_reclaim@boundary-split:
    - shard-bmg:          NOTRUN -> [SKIP][191] ([Intel XE#7793]) +3 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-7/igt@xe_page_reclaim@boundary-split.html

  * igt@xe_pat@l2-flush-opt-svm-pat-restrict:
    - shard-ptl:          NOTRUN -> [SKIP][192] ([Intel XE#7590])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-6/igt@xe_pat@l2-flush-opt-svm-pat-restrict.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          NOTRUN -> [SKIP][193] ([Intel XE#2245] / [Intel XE#7590])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-5/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-lnl:          NOTRUN -> [SKIP][194] ([Intel XE#7590] / [Intel XE#979])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-1/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pat@pat-sw-hw-compare:
    - shard-bmg:          NOTRUN -> [FAIL][195] ([Intel XE#7695])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-7/igt@xe_pat@pat-sw-hw-compare.html

  * igt@xe_peer2peer@write:
    - shard-bmg:          NOTRUN -> [SKIP][196] ([Intel XE#2427] / [Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-1/igt@xe_peer2peer@write.html
    - shard-ptl:          NOTRUN -> [SKIP][197] ([Intel XE#6588])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-6/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-mocs:
    - shard-bmg:          NOTRUN -> [SKIP][198] ([Intel XE#2284] / [Intel XE#7370]) +2 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-4/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@d3hot-basic-exec:
    - shard-bmg:          [PASS][199] -> [INCOMPLETE][200] ([Intel XE#9782])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9206/shard-bmg-2/igt@xe_pm@d3hot-basic-exec.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-3/igt@xe_pm@d3hot-basic-exec.html

  * igt@xe_pm@d3hot-i2c:
    - shard-ptl:          NOTRUN -> [SKIP][201] ([Intel XE#5742] / [Intel XE#7400])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-3/igt@xe_pm@d3hot-i2c.html

  * igt@xe_pm@s3-exec-after:
    - shard-lnl:          NOTRUN -> [SKIP][202] ([Intel XE#584] / [Intel XE#7369])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-2/igt@xe_pm@s3-exec-after.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [PASS][203] -> [ABORT][204] ([Intel XE#9362]) +1 other test abort
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9206/shard-lnl-6/igt@xe_pm@s4-basic.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-6/igt@xe_pm@s4-basic.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-bmg:          NOTRUN -> [SKIP][205] ([Intel XE#579] / [Intel XE#7329] / [Intel XE#7517])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-3/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_prefetch_fault@prefetch-fault-svm:
    - shard-bmg:          NOTRUN -> [SKIP][206] ([Intel XE#7599])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-2/igt@xe_prefetch_fault@prefetch-fault-svm.html
    - shard-ptl:          NOTRUN -> [SKIP][207] ([Intel XE#7599])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-1/igt@xe_prefetch_fault@prefetch-fault-svm.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][208] ([Intel XE#4733] / [Intel XE#7417]) +3 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-bmg:          NOTRUN -> [SKIP][209] ([Intel XE#944]) +4 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-9/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-ptl:          NOTRUN -> [SKIP][210] ([Intel XE#6019]) +1 other test skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-5/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_query@multigpu-query-topology:
    - shard-lnl:          NOTRUN -> [SKIP][211] ([Intel XE#944])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-2/igt@xe_query@multigpu-query-topology.html

  * igt@xe_sriov_admin@bulk-exec-quantum-vfs-disabled:
    - shard-lnl:          NOTRUN -> [SKIP][212] ([Intel XE#7174])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-1/igt@xe_sriov_admin@bulk-exec-quantum-vfs-disabled.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][213] ([Intel XE#8963])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-8/igt@xe_wedged@wedged-at-any-timeout.html
    - shard-ptl:          NOTRUN -> [DMESG-WARN][214] ([Intel XE#8963])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-5/igt@xe_wedged@wedged-at-any-timeout.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotrebind-with-load:
    - shard-bmg:          [ABORT][215] ([Intel XE#9841]) -> [PASS][216] +5 other tests pass
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9206/shard-bmg-7/igt@core_hotunplug@hotrebind-with-load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-10/igt@core_hotunplug@hotrebind-with-load.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-ptl:          [FAIL][217] ([Intel XE#6078]) -> [PASS][218] +2 other tests pass
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9206/shard-ptl-2/igt@kms_async_flips@alternate-sync-async-flip.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-6/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-ptl:          [FAIL][219] ([Intel XE#3321]) -> [PASS][220] +1 other test pass
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9206/shard-ptl-5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
    - shard-lnl:          [FAIL][221] ([Intel XE#301]) -> [PASS][222]
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9206/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [FAIL][223] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][224]
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9206/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear:
    - shard-bmg:          [FAIL][225] ([Intel XE#9780]) -> [PASS][226] +9 other tests pass
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9206/shard-bmg-8/igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-4/igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear.html

  * igt@kms_pm_dc@dc5-psr-suspend-resume:
    - shard-lnl:          [FAIL][227] ([Intel XE#8399]) -> [PASS][228]
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9206/shard-lnl-8/igt@kms_pm_dc@dc5-psr-suspend-resume.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-1/igt@kms_pm_dc@dc5-psr-suspend-resume.html

  * igt@kms_vrr@flip-suspend@pipe-a-edp-1:
    - shard-ptl:          [FAIL][229] ([Intel XE#4227] / [Intel XE#7397]) -> [PASS][230] +1 other test pass
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9206/shard-ptl-4/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-2/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html

  * igt@xe_exec_reset@close-fd-no-exec:
    - shard-bmg:          [DMESG-WARN][231] ([Intel XE#7774]) -> [PASS][232]
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9206/shard-bmg-5/igt@xe_exec_reset@close-fd-no-exec.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-10/igt@xe_exec_reset@close-fd-no-exec.html

  * igt@xe_exec_reset@gt-stress-reset-concurrent-submit:
    - shard-bmg:          [DMESG-WARN][233] ([Intel XE#8652]) -> [PASS][234]
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9206/shard-bmg-6/igt@xe_exec_reset@gt-stress-reset-concurrent-submit.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-5/igt@xe_exec_reset@gt-stress-reset-concurrent-submit.html

  * igt@xe_pm@s4-mocs:
    - shard-lnl:          [DMESG-WARN][235] ([Intel XE#7727]) -> [PASS][236]
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9206/shard-lnl-8/igt@xe_pm@s4-mocs.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-3/igt@xe_pm@s4-mocs.html

  * igt@xe_pm_residency@gt-c6-freeze@gt0:
    - shard-bmg:          [FAIL][237] ([Intel XE#9254]) -> [PASS][238] +1 other test pass
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9206/shard-bmg-9/igt@xe_pm_residency@gt-c6-freeze@gt0.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-5/igt@xe_pm_residency@gt-c6-freeze@gt0.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-bmg:          [FAIL][239] ([Intel XE#6569]) -> [PASS][240]
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9206/shard-bmg-9/igt@xe_sriov_flr@flr-each-isolation.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-2/igt@xe_sriov_flr@flr-each-isolation.html

  
#### Warnings ####

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-lnl:          [SKIP][241] ([Intel XE#309] / [Intel XE#7343] / [Intel XE#7935]) -> [SKIP][242] ([Intel XE#309] / [Intel XE#7343])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9206/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-lnl:          [FAIL][243] ([Intel XE#301] / [Intel XE#3149]) -> [FAIL][244] ([Intel XE#301])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9206/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5742]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742
  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#5765]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5765
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#5800]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800
  [Intel XE#5808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808
  [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#5822]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822
  [Intel XE#5832]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5832
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#5846]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5846
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5853]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5853
  [Intel XE#5858]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858
  [Intel XE#5873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5873
  [Intel XE#5900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900
  [Intel XE#5901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5901
  [Intel XE#5907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907
  [Intel XE#5946]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5946
  [Intel XE#5947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5947
  [Intel XE#5962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962
  [Intel XE#6019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6019
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#6128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6128
  [Intel XE#6144]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6144
  [Intel XE#6196]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6196
  [Intel XE#6259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6259
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6588]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6588
  [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900
  [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
  [Intel XE#6925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6925
  [Intel XE#6953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7006]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7070]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7070
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7173
  [Intel XE#7174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7174
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7227
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326
  [Intel XE#7329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7329
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361
  [Intel XE#7369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7369
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7378
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385
  [Intel XE#7387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387
  [Intel XE#7389]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389
  [Intel XE#7395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7395
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7400
  [Intel XE#7406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7406
  [Intel XE#7413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7435
  [Intel XE#7448]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7448
  [Intel XE#7449]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449
  [Intel XE#7457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7457
  [Intel XE#7466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484
  [Intel XE#7517]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7517
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7591
  [Intel XE#7599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
  [Intel XE#7727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7774]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935
  [Intel XE#7954]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7954
  [Intel XE#7980]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7980
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8303]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395
  [Intel XE#8396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396
  [Intel XE#8397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8397
  [Intel XE#8399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399
  [Intel XE#8586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8586
  [Intel XE#8652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8652
  [Intel XE#8680]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8680
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#8868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8868
  [Intel XE#8963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963
  [Intel XE#9003]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9003
  [Intel XE#9144]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144
  [Intel XE#9203]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9203
  [Intel XE#9254]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9254
  [Intel XE#9271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271
  [Intel XE#9346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9346
  [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#9527]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9527
  [Intel XE#9529]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9529
  [Intel XE#9531]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9531
  [Intel XE#9769]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9769
  [Intel XE#9779]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9779
  [Intel XE#9780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9780
  [Intel XE#9782]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9782
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [Intel XE#9841]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9841


Build changes
-------------

  * IGT: IGT_9206 -> IGTPW_16228

  IGTPW_16228: 16228
  IGT_9206: 9206
  xe-6246-17f7eb2368b0eed1dfda22b10966fa181d9b2c83: 17f7eb2368b0eed1dfda22b10966fa181d9b2c83

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/index.html

--===============8561050102693473586==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Project List - Patchwork</title>
  <style id="css-table-select" type="text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>Extended multiple planes with multiple pixel formats</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/179817/">https://patchwork.freedesktop.org/series/179817/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9206_FULL -&gt; XEIGTPW_16228_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_16228_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_16228_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_16228_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv (NEW):</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-9/igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv.html">DMESG-FAIL</a> +6 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010 (NEW):</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-5/igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010.html">SKIP</a> +36 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-d-hdmi-a-3-pipe-c-dp-2 (NEW):</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-d-hdmi-a-3-pipe-c-dp-2.html">FAIL</a> +33 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-yf (NEW):</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-8/igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-yf.html">SKIP</a> +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-y (NEW):</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-2/igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-y.html">SKIP</a> +16 other tests skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_9206_FULL and XEIGTPW_16228_FULL:</p>
<h3>New IGT tests (545)</h3>
<ul>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.01, 58.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-a-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-a-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-a-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-a-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-a-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-a-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-b-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-b-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-b-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-b-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-b-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-b-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-c-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-c-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-c-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-c-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-c-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-c-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-d-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-d-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-d-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-d-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-d-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-d-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.02, 250.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-a-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-a-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-a-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-a-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-a-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-a-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-b-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-b-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-b-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-b-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-b-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-b-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-c-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-c-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-c-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-c-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-c-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-c-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-d-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-d-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-d-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-d-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-d-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-d-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.03, 18.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-a-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-a-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-a-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-a-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-a-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-a-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-b-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-b-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-b-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-b-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-b-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-b-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-c-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-c-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-c-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-c-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-c-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-c-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-d-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-d-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-d-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-d-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-d-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-d-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.02, 52.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-a-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-a-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-a-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-a-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-a-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-a-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-b-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-b-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-b-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-b-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-b-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-b-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-c-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-c-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-c-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-c-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-c-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-c-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-d-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-d-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-d-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-d-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-d-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-d-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s) 2 skip(s)</li>
<li>Exec time: [0.02, 44.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-a-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-a-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-a-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-a-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-a-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-a-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-b-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-b-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-b-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [3.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-b-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-b-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-b-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-c-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [3.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-c-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-c-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-c-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-c-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-c-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-d-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-d-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-d-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-d-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-d-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-d-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.02, 63.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-a-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-a-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-a-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-a-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-a-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-a-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-b-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-b-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-b-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-b-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-b-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-b-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-c-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-c-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-c-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-c-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-c-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-c-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-d-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-d-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-d-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-d-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-d-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-d-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.03, 262.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-a-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-a-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-a-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-a-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-a-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-a-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-b-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-b-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-b-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-b-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-b-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-b-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-c-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-c-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-c-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-c-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-c-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-c-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-d-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-d-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-d-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-d-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-d-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-d-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb8888:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.02, 51.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-a-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-a-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-a-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-a-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-a-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-a-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-b-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-b-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-b-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-b-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-b-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-b-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-c-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-c-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-c-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-c-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-c-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-c-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-d-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-d-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-d-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-d-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-d-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-d-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s) 2 skip(s)</li>
<li>Exec time: [0.02, 45.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-a-dp-1-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-a-dp-1-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-a-dp-1-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-a-hdmi-a-3-pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-a-hdmi-a-3-pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-a-hdmi-a-3-pipe-d-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-b-dp-1-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-b-dp-1-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-b-dp-1-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-b-hdmi-a-3-pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [3.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-b-hdmi-a-3-pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-b-hdmi-a-3-pipe-d-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-c-dp-1-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-c-dp-1-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-c-dp-1-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-c-hdmi-a-3-pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-c-hdmi-a-3-pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-c-hdmi-a-3-pipe-d-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-d-dp-1-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-d-dp-1-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [3.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-d-dp-1-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-d-hdmi-a-3-pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-d-hdmi-a-3-pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-d-hdmi-a-3-pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [3.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.02, 62.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-a-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-a-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-a-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-a-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-a-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-a-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-b-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-b-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-b-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-b-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-b-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-b-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-c-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-c-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-c-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-c-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-c-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-c-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-d-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-d-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-d-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-d-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-d-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-d-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.01, 251.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-a-dp-1-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-a-dp-1-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-a-dp-1-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-a-hdmi-a-3-pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-a-hdmi-a-3-pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-a-hdmi-a-3-pipe-d-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-b-dp-1-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-b-dp-1-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-b-dp-1-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-b-hdmi-a-3-pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-b-hdmi-a-3-pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-b-hdmi-a-3-pipe-d-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-c-dp-1-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-c-dp-1-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-c-dp-1-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-c-hdmi-a-3-pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-c-hdmi-a-3-pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-c-hdmi-a-3-pipe-d-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-d-dp-1-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-d-dp-1-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-d-dp-1-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-d-hdmi-a-3-pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-d-hdmi-a-3-pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-d-hdmi-a-3-pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.01, 18.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-a-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-a-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-a-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-a-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-a-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-a-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-b-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-b-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-b-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-b-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-b-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-b-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-c-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-c-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-c-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-c-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-c-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-c-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-d-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-d-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-d-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-d-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-d-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-d-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.02, 41.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-a-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-a-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-a-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-a-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-a-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-a-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-b-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-b-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-b-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-b-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-b-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-b-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-c-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-c-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-c-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-c-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-c-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-c-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-d-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-d-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-d-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-d-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-d-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-d-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.02, 34.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-a-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-a-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-a-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-a-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-a-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-a-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-b-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-b-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-b-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-b-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-b-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-b-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-c-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-c-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-c-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-c-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-c-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-c-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-d-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-d-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-d-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-d-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-d-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-d-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y-and-drm_format_xrgb16161616f:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y-and-drm_format_xrgb2101010:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y-and-drm_format_xrgb8888:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y-and-drm_format_xyuv8888:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y-and-drm_format_yuyv:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf-and-drm_format_xrgb16161616f:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf-and-drm_format_xrgb2101010:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf-and-drm_format_xrgb8888:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf-and-drm_format_xyuv8888:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf-and-drm_format_yuyv:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-4:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [13.32, 30.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-4@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-4@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.05, 4.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-4@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-4@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-4@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.60, 4.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-4@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-4@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-4@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.64, 4.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-4@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-4@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-4@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-4@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-none:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [13.39, 26.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-none@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-none@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.15, 4.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-none@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-none@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-none@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.60, 4.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-none@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-none@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-none@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.61, 4.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-none@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-none@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-none@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-none@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-x:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [13.42, 30.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-x@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-x@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-x@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-x@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-x@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-x@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-x@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-x@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-x@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-x@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-x@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-y:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-yf:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-4:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [16.65, 115.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-4@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [13.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-4@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [5.35, 6.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-4@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [14.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-4@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [14.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-4@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [5.63, 6.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-4@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [14.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-4@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [14.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-4@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [5.62, 6.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-4@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [14.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-4@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [14.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-4@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-4@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [14.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-none:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [16.81, 111.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-none@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [14.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-none@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [5.39, 6.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-none@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [13.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-none@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [13.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-none@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [5.69, 6.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-none@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [13.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-none@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [13.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-none@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [5.68, 6.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-none@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [14.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-none@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [13.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-none@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-none@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [14.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-x:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.04, 112.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-x@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [13.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-x@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-x@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [14.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-x@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [13.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-x@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-x@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [14.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-x@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [13.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-x@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-x@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [13.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-x@pipe-d-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [13.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-x@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [13.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-y:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-yf:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-4:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [7.89, 18.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-4@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-4@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.94, 4.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-4@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-4@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-4@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.62, 4.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-4@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-4@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-4@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.60, 4.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-4@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-4@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-4@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-4@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-none:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [7.02, 18.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-none@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-none@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.84, 4.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-none@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-none@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-none@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.61, 4.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-none@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-none@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-none@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.64, 4.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-none@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-none@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-none@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-none@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-x:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.03, 13.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-x@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-x@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-x@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-x@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-x@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-x@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-x@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-x@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-x@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-x@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-x@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-y:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-yf:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-4:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [13.31, 19.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-4@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-4@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.03, 4.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-4@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-4@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-4@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.61, 4.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-4@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-4@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-4@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.63, 4.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-4@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-4@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-4@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-4@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-none:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [13.16, 18.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-none@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-none@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.98, 4.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-none@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-none@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-none@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.63, 4.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-none@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-none@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-none@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.51, 4.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-none@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-none@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-none@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-none@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-x:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.01, 17.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-x@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-x@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-x@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-x@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-x@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-x@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-x@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-x@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-x@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-x@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-x@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-y:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-yf:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-4:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [13.23, 18.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-4@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.92, 4.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-4@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.62, 4.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-4@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.63, 4.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-4@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-none:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [12.96, 18.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-none@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-none@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.88, 4.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-none@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-none@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-none@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.50, 4.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-none@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-none@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-none@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.52, 4.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-none@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-none@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-none@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-none@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-x:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.03, 13.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-x@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-x@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-x@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-y:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-yf:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_16228_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9206/shard-bmg-1/igt@core_hotunplug@hotreplug.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-7/igt@core_hotunplug@hotreplug.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9841">Intel XE#9841</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233">Intel XE#2233</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5765">Intel XE#5765</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5947">Intel XE#5947</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6925">Intel XE#6925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-10/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-7/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5901">Intel XE#5901</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-2/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-1/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-3/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808">Intel XE#5808</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361">Intel XE#7361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387">Intel XE#7387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-target-2560x1440p:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-3/igt@kms_bw@connected-linear-tiling-2-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-1/igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-10/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-1/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-8/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-1/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822">Intel XE#5822</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389">Intel XE#7389</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-10/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449">Intel XE#7449</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-2/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-6/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-9/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-3/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-8/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-fast:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-8/igt@kms_chamelium_hpd@dp-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-c-plane-4:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-2/igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-c-plane-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-d-plane-4:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-2/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-d-plane-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-5/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-5/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-1/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5832">Intel XE#5832</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-5/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-1/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-7/igt@kms_content_protection@lic-type-0@pipe-a-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-6/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent-hdcp14:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-7/igt@kms_content_protection@uevent-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-4/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5846">Intel XE#5846</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-9/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-7/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-8/igt@kms_cursor_crc@cursor-sliding-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900">Intel XE#5900</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962">Intel XE#5962</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035">Intel XE#6035</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035">Intel XE#6035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-9/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340">Intel XE#1340</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7435">Intel XE#7435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst-direct-train:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-6/igt@kms_dp_link_training@uhbr-mst-direct-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9527">Intel XE#9527</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-6/igt@kms_dp_link_training@uhbr-mst-direct-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9527">Intel XE#9527</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst-tbtalt-train:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-8/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9531">Intel XE#9531</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst-direct-train:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-9/igt@kms_dp_link_training@uhbr-sst-direct-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9529">Intel XE#9529</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-8/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331">Intel XE#4331</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7227">Intel XE#7227</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-bigjoiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-3/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-bigjoiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-1/igt@kms_dsc@dsc-with-bpc-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats-ultrajoiner:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-8/igt@kms_dsc@dsc-with-formats-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907">Intel XE#5907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-9/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156">Intel XE#4156</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425">Intel XE#7425</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-10/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8680">Intel XE#8680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-1/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7448">Intel XE#7448</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dsc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-3/igt@kms_feature_discovery@dsc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8586">Intel XE#8586</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-8/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6128">Intel XE#6128</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-3/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-5/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9206/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#7349</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385">Intel XE#7385</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144">Intel XE#9144</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385">Intel XE#7385</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144">Intel XE#9144</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-1/igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-7/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800">Intel XE#5800</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-2/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-3/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812">Intel XE#5812</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-8/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +84 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-6/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-4/igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-render:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-1/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +85 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-4/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-1/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9346">Intel XE#9346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-3/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901">Intel XE#6901</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-5/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911">Intel XE#6911</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466">Intel XE#7466</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-1/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298">Intel XE#4298</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5873">Intel XE#5873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-4/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901">Intel XE#6901</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-7/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900">Intel XE#6900</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-4/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911">Intel XE#6911</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7378">Intel XE#7378</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-5/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7173">Intel XE#7173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7591">Intel XE#7591</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-xtiled:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-1/igt@kms_pipe_stress@stress-xrgb8888-xtiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912">Intel XE#6912</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-5:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-9/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303">Intel XE#8303</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-3/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-6/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-2/igt@kms_plane@pixel-format-y-tiled-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-9/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-5/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5946">Intel XE#5946</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010 (NEW):</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-8/igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-y-tiled:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-4/igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-y-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9779">Intel XE#9779</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-yf-tiled:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-1/igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-yf-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9779">Intel XE#9779</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-yf-tiled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-8/igt@kms_plane_scaling@plane-downscale-max-crc-yf-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9779">Intel XE#9779</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-a-dp-2-p010:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-10/igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-a-dp-2-p010.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9780">Intel XE#9780</a>) +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-2/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760">Intel XE#7760</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-after-dc6@psr2-yuv420:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-8/igt@kms_pm_dc@dc3co-after-dc6@psr2-yuv420.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-9/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395">Intel XE#8395</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9206/shard-lnl-4/igt@kms_pm_dc@dc5-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399">Intel XE#8399</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9206/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-2/igt@kms_pm_dc@deep-pkgc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029">Intel XE#2029</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7395">Intel XE#7395</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-4/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-2/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-8/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858">Intel XE#5858</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858">Intel XE#5858</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-8/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-4/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413">Intel XE#7413</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-10/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429">Intel XE#7429</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-5/igt@kms_psr@fbc-pr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-page-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-1/igt@kms_psr@fbc-pr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-3/igt@kms_psr@fbc-psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-blt@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-3/igt@kms_psr@fbc-psr2-sprite-blt@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609">Intel XE#4609</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-page-flip:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-4/igt@kms_psr@pr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-10/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-5/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr-video-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-5/igt@kms_vrr@cmrr-video-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271">Intel XE#9271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf-dc3co:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-9/igt@kms_vrr@lobf-dc3co.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8397">Intel XE#8397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-2/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271">Intel XE#9271</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-7/igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8868">Intel XE#8868</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-5/igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8868">Intel XE#8868</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-2/igt@xe_compute@ccs-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599">Intel XE#6599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-big-vram:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-7/igt@xe_create@create-big-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5853">Intel XE#5853</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7457">Intel XE#7457</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_err_injection@inject_core_compute_corr_error_threshold_one:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-9/igt@xe_err_injection@inject_core_compute_corr_error_threshold_one.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9769">Intel XE#9769</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-7/igt@xe_err_injection@inject_core_compute_corr_error_threshold_one.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9769">Intel XE#9769</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-cm:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-3/igt@xe_evict@evict-beng-large-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764">Intel XE#5764</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-small:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-8/igt@xe_evict@evict-cm-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-5/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6144">Intel XE#6144</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-2/igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-virtual-basic:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-5/igt@xe_exec_balancer@twice-virtual-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-5/igt@xe_exec_basic@multigpu-once-null.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484">Intel XE#7484</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-userptr-imm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-3/igt@xe_exec_fault_mode@many-multi-queue-userptr-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-5/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-invalid-userptr-fault:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-6/igt@xe_exec_fault_mode@twice-multi-queue-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-multi-queue-spinner-interrupted-lr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-2/igt@xe_exec_mix_modes@exec-multi-queue-spinner-interrupted-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9003">Intel XE#9003</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-priority-smem:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-6/igt@xe_exec_multi_queue@few-execs-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@sanity:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-7/igt@xe_exec_multi_queue@sanity.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-priority:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-8/igt@xe_exec_multi_queue@two-queues-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +38 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-cat-error:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-1/igt@xe_exec_reset@cm-multi-queue-cat-error.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-long-spin-reuse-many-queue-switch:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-7/igt@xe_exec_reset@multi-queue-long-spin-reuse-many-queue-switch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-multi-vma:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-2/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-multi-vma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6196">Intel XE#6196</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-5/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-mixed-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-3/igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-3/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9841">Intel XE#9841</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_gpgpu_fill@offset-4x4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-1/igt@xe_gpgpu_fill@offset-4x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7954">Intel XE#7954</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-1/igt@xe_gt_freq@freq_suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7070">Intel XE#7070</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_madvise@atomic-device:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-2/igt@xe_madvise@atomic-device.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7980">Intel XE#7980</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mempage_offline@inject-duplicate-page:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-4/igt@xe_mempage_offline@inject-duplicate-page.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9203">Intel XE#9203</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-7/igt@xe_mempage_offline@inject-duplicate-page.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9203">Intel XE#9203</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-3/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416">Intel XE#1416</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-coherency-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-8/igt@xe_multigpu_svm@mgpu-coherency-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-basic:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-2/igt@xe_multigpu_svm@mgpu-latency-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_noexec_ping_pong@basic:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-6/igt@xe_noexec_ping_pong@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6259">Intel XE#6259</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7406">Intel XE#7406</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@basic-mixed:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-1/igt@xe_page_reclaim@basic-mixed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@boundary-split:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-7/igt@xe_page_reclaim@boundary-split.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@l2-flush-opt-svm-pat-restrict:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-6/igt@xe_pat@l2-flush-opt-svm-pat-restrict.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-5/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-compare:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-7/igt@xe_pat@pat-sw-hw-compare.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695">Intel XE#7695</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-1/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">Intel XE#2427</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953">Intel XE#6953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326">Intel XE#7326</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353">Intel XE#7353</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-6/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6588">Intel XE#6588</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-4/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9206/shard-bmg-2/igt@xe_pm@d3hot-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-3/igt@xe_pm@d3hot-basic-exec.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9782">Intel XE#9782</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-i2c:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-3/igt@xe_pm@d3hot-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742">Intel XE#5742</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7400">Intel XE#7400</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-exec-after:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-2/igt@xe_pm@s3-exec-after.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7369">Intel XE#7369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9206/shard-lnl-6/igt@xe_pm@s4-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-6/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-3/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7329">Intel XE#7329</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7517">Intel XE#7517</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_prefetch_fault@prefetch-fault-svm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-2/igt@xe_prefetch_fault@prefetch-fault-svm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599">Intel XE#7599</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-1/igt@xe_prefetch_fault@prefetch-fault-svm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599">Intel XE#7599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-9/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-5/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6019">Intel XE#6019</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-2/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_admin@bulk-exec-quantum-vfs-disabled:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-1/igt@xe_sriov_admin@bulk-exec-quantum-vfs-disabled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7174">Intel XE#7174</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-8/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963">Intel XE#8963</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-5/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963">Intel XE#8963</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-with-load:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9206/shard-bmg-7/igt@core_hotunplug@hotrebind-with-load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9841">Intel XE#9841</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-10/igt@core_hotunplug@hotrebind-with-load.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9206/shard-ptl-2/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-6/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9206/shard-ptl-5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a> +1 other test pass</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9206/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9206/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9206/shard-bmg-8/igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9780">Intel XE#9780</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-4/igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr-suspend-resume:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9206/shard-lnl-8/igt@kms_pm_dc@dc5-psr-suspend-resume.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399">Intel XE#8399</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-1/igt@kms_pm_dc@dc5-psr-suspend-resume.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9206/shard-ptl-4/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-ptl-2/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@close-fd-no-exec:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9206/shard-bmg-5/igt@xe_exec_reset@close-fd-no-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774">Intel XE#7774</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-10/igt@xe_exec_reset@close-fd-no-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-stress-reset-concurrent-submit:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9206/shard-bmg-6/igt@xe_exec_reset@gt-stress-reset-concurrent-submit.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8652">Intel XE#8652</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-5/igt@xe_exec_reset@gt-stress-reset-concurrent-submit.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9206/shard-lnl-8/igt@xe_pm@s4-mocs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727">Intel XE#7727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-3/igt@xe_pm@s4-mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze@gt0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9206/shard-bmg-9/igt@xe_pm_residency@gt-c6-freeze@gt0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9254">Intel XE#9254</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-5/igt@xe_pm_residency@gt-c6-freeze@gt0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9206/shard-bmg-9/igt@xe_sriov_flr@flr-each-isolation.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-bmg-2/igt@xe_sriov_flr@flr-each-isolation.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9206/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935">Intel XE#7935</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9206/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16228/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9206 -&gt; IGTPW_16228</li>
</ul>
<p>IGTPW_16228: 16228<br />
  IGT_9206: 9206<br />
  xe-6246-17f7eb2368b0eed1dfda22b10966fa181d9b2c83: 17f7eb2368b0eed1dfda22b10966fa181d9b2c83</p>

</body>
</html>

--===============8561050102693473586==--
