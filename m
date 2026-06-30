Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC89C43458
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jun 2026 12:02:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 720FD10EC43;
	Tue, 30 Jun 2026 12:02:06 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B660410EC53;
 Tue, 30 Jun 2026 12:01:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6867552107562840342=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_Add_maximum_downscaling_?=
 =?utf-8?q?test_on_kms=5Fplane=5Fscaling?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 30 Jun 2026 12:01:18 -0000
Message-ID: <178282087871.133065.14171177414626031168@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260629180003.3215052-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20260629180003.3215052-1-juhapekka.heikkila@gmail.com>
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
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

--===============6867552107562840342==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add maximum downscaling test on kms_plane_scaling
URL   : https://patchwork.freedesktop.org/series/169446/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_18726_full -> IGTPW_15452_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_15452_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_15452_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/index.html

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_15452_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled} (NEW):
    - shard-dg1:          NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-16/igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled.html

  * {igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-3-nv12-horizontal} (NEW):
    - shard-dg2:          NOTRUN -> [SKIP][2] +9 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-10/igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-3-nv12-horizontal.html

  * {igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-3-xrgb8888-horizontal} (NEW):
    - shard-dg2:          NOTRUN -> [DMESG-FAIL][3] +36 other tests dmesg-fail
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-10/igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-3-xrgb8888-horizontal.html

  * {igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-2-p010-horizontal} (NEW):
    - shard-rkl:          NOTRUN -> [FAIL][4] +17 other tests fail
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-7/igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-2-p010-horizontal.html

  * {igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-1-p010-horizontal} (NEW):
    - shard-dg1:          NOTRUN -> [FAIL][5] +26 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-15/igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-1-p010-horizontal.html

  * {igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-1-p010-vertical} (NEW):
    - shard-dg2:          NOTRUN -> [FAIL][6] +21 other tests fail
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-4/igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-1-p010-vertical.html

  * {igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-1-xrgb16161616f-horizontal} (NEW):
    - shard-tglu:         NOTRUN -> [SKIP][7] +49 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-6/igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-1-xrgb16161616f-horizontal.html

  * {igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-2-xrgb8888-vertical} (NEW):
    - shard-glk10:        NOTRUN -> [FAIL][8] +14 other tests fail
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk10/igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-2-xrgb8888-vertical.html

  * {igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled} (NEW):
    - shard-mtlp:         NOTRUN -> [SKIP][9] +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-2/igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled.html

  * {igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-1-p010-vertical} (NEW):
    - shard-tglu:         NOTRUN -> [FAIL][10] +14 other tests fail
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-5/igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-1-p010-vertical.html

  * {igt@kms_plane_scaling@plane-downscale-max-crc-yf-tiled} (NEW):
    - shard-rkl:          NOTRUN -> [SKIP][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-4/igt@kms_plane_scaling@plane-downscale-max-crc-yf-tiled.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-mtlp:         [PASS][12] -> [FAIL][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-mtlp-4/igt@kms_pm_rpm@system-suspend-modeset.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-3/igt@kms_pm_rpm@system-suspend-modeset.html

  
New tests
---------

  New tests have been introduced between CI_DRM_18726_full and IGTPW_15452_full:

### New IGT tests (975) ###

  * igt@kms_cursor_crc@cursor-alpha-transparent@pipe-a-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.54] s

  * igt@kms_cursor_crc@cursor-alpha-transparent@pipe-c-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.43] s

  * igt@kms_cursor_crc@cursor-suspend@pipe-c-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [4.46] s

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.89] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled:
    - Statuses : 1 fail(s) 1 pass(s) 3 skip(s)
    - Exec time: [0.03, 123.96] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-nv12-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-nv12-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-p010-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.31] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-p010-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.35] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-rgb565-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-rgb565-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.28] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-xrgb16161616f-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.26] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-xrgb16161616f-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-xrgb2101010-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.31] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-xrgb2101010-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.30] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-xrgb8888-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-xrgb8888-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-xv30-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-xv30-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-xv36-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-xv36-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-xyuv8888-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-xyuv8888-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-y210-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-y210-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-yuyv-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-yuyv-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-hdmi-a-3-nv12-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.22] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-hdmi-a-3-nv12-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.31] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-hdmi-a-3-p010-horizontal:
    - Statuses : 1 fail(s)
    - Exec time: [1.37] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-hdmi-a-3-p010-vertical:
    - Statuses : 1 fail(s)
    - Exec time: [1.45] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-hdmi-a-3-rgb565-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-hdmi-a-3-rgb565-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-hdmi-a-3-xrgb16161616f-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-hdmi-a-3-xrgb16161616f-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.46] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-hdmi-a-3-xrgb2101010-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [2.06] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-hdmi-a-3-xrgb2101010-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.91] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-hdmi-a-3-xrgb8888-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.35] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-hdmi-a-3-xrgb8888-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.35] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-hdmi-a-3-xv30-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.41] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-hdmi-a-3-xv30-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-hdmi-a-3-xv36-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.44] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-hdmi-a-3-xv36-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.48] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-hdmi-a-3-xyuv8888-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.41] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-hdmi-a-3-xyuv8888-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-hdmi-a-3-y210-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-hdmi-a-3-y210-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-hdmi-a-3-yuyv-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.24] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-hdmi-a-3-yuyv-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-edp-1-nv12-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-edp-1-nv12-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.35] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-edp-1-p010-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-edp-1-p010-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-edp-1-rgb565-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.27] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-edp-1-rgb565-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.35] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-edp-1-xrgb16161616f-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.28] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-edp-1-xrgb16161616f-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.28] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-edp-1-xrgb2101010-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-edp-1-xrgb2101010-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-edp-1-xrgb8888-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-edp-1-xrgb8888-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.37] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-edp-1-xv30-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-edp-1-xv30-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-edp-1-xv36-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.85] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-edp-1-xv36-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.35] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-edp-1-xyuv8888-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-edp-1-xyuv8888-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-edp-1-y210-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.31] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-edp-1-y210-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-edp-1-yuyv-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.30] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-edp-1-yuyv-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.24] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-hdmi-a-3-nv12-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.24] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-hdmi-a-3-nv12-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.30] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-hdmi-a-3-p010-horizontal:
    - Statuses : 1 fail(s)
    - Exec time: [1.38] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-hdmi-a-3-p010-vertical:
    - Statuses : 1 fail(s)
    - Exec time: [1.42] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-hdmi-a-3-rgb565-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.27] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-hdmi-a-3-rgb565-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.28] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-hdmi-a-3-xrgb16161616f-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-hdmi-a-3-xrgb16161616f-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.46] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-hdmi-a-3-xrgb2101010-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [2.05] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-hdmi-a-3-xrgb2101010-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.92] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-hdmi-a-3-xrgb8888-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.22] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-hdmi-a-3-xrgb8888-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.26] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-hdmi-a-3-xv30-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-hdmi-a-3-xv30-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-hdmi-a-3-xv36-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.45] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-hdmi-a-3-xv36-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.46] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-hdmi-a-3-xyuv8888-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-hdmi-a-3-xyuv8888-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.35] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-hdmi-a-3-y210-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.37] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-hdmi-a-3-y210-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.40] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-hdmi-a-3-yuyv-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.25] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-hdmi-a-3-yuyv-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.30] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-edp-1-nv12-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-edp-1-nv12-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.31] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-edp-1-p010-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.24] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-edp-1-p010-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.24] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-edp-1-rgb565-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-edp-1-rgb565-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.25] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-edp-1-xrgb16161616f-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.24] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-edp-1-xrgb16161616f-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.23] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-edp-1-xrgb2101010-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.24] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-edp-1-xrgb2101010-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.25] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-edp-1-xrgb8888-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-edp-1-xrgb8888-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.30] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-edp-1-xv30-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.30] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-edp-1-xv30-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.22] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-edp-1-xv36-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.24] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-edp-1-xv36-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.26] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-edp-1-xyuv8888-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-edp-1-xyuv8888-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-edp-1-y210-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-edp-1-y210-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.28] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-edp-1-yuyv-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.23] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-edp-1-yuyv-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.25] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-hdmi-a-3-nv12-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.25] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-hdmi-a-3-nv12-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-hdmi-a-3-p010-horizontal:
    - Statuses : 1 fail(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-hdmi-a-3-p010-vertical:
    - Statuses : 1 fail(s)
    - Exec time: [1.45] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-hdmi-a-3-rgb565-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.24] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-hdmi-a-3-rgb565-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.28] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-hdmi-a-3-xrgb16161616f-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-hdmi-a-3-xrgb16161616f-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.53] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-hdmi-a-3-xrgb2101010-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [2.07] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-hdmi-a-3-xrgb2101010-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.89] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-hdmi-a-3-xrgb8888-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.22] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-hdmi-a-3-xrgb8888-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.28] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-hdmi-a-3-xv30-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-hdmi-a-3-xv30-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-hdmi-a-3-xv36-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.44] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-hdmi-a-3-xv36-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.46] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-hdmi-a-3-xyuv8888-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-hdmi-a-3-xyuv8888-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-hdmi-a-3-y210-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-hdmi-a-3-y210-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.41] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-hdmi-a-3-yuyv-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.25] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-hdmi-a-3-yuyv-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-edp-1-nv12-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.25] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-edp-1-nv12-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-edp-1-p010-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-edp-1-p010-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.31] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-edp-1-rgb565-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.22] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-edp-1-rgb565-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.23] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-edp-1-xrgb16161616f-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.23] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-edp-1-xrgb16161616f-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.25] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-edp-1-xrgb2101010-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.24] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-edp-1-xrgb2101010-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.23] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-edp-1-xrgb8888-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.23] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-edp-1-xrgb8888-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.26] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-edp-1-xv30-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.35] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-edp-1-xv30-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-edp-1-xv36-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-edp-1-xv36-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.25] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-edp-1-xyuv8888-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.24] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-edp-1-xyuv8888-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.26] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-edp-1-y210-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.30] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-edp-1-y210-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.25] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-edp-1-yuyv-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.31] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-edp-1-yuyv-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.25] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-hdmi-a-3-nv12-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.21] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-hdmi-a-3-nv12-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.44] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-hdmi-a-3-p010-horizontal:
    - Statuses : 1 fail(s)
    - Exec time: [1.36] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-hdmi-a-3-p010-vertical:
    - Statuses : 1 fail(s)
    - Exec time: [1.44] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-hdmi-a-3-rgb565-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.27] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-hdmi-a-3-rgb565-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.28] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-hdmi-a-3-xrgb16161616f-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.30] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-hdmi-a-3-xrgb16161616f-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.46] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-hdmi-a-3-xrgb2101010-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [2.06] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-hdmi-a-3-xrgb2101010-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.87] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-hdmi-a-3-xrgb8888-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.24] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-hdmi-a-3-xrgb8888-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-hdmi-a-3-xv30-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-hdmi-a-3-xv30-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.40] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-hdmi-a-3-xv36-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.44] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-hdmi-a-3-xv36-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.46] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-hdmi-a-3-xyuv8888-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-hdmi-a-3-xyuv8888-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.40] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-hdmi-a-3-y210-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-hdmi-a-3-y210-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-hdmi-a-3-yuyv-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.30] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-hdmi-a-3-yuyv-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear:
    - Statuses : 1 dmesg-fail(s) 3 fail(s) 2 pass(s) 1 skip(s)
    - Exec time: [0.04, 123.02] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-3-nv12-horizontal:
    - Statuses : 1 skip(s)
    - Exec time: [0.45] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-3-nv12-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.09] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-3-p010-horizontal:
    - Statuses : 1 skip(s)
    - Exec time: [0.42] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-3-p010-vertical:
    - Statuses : 1 fail(s)
    - Exec time: [1.09] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-3-rgb565-horizontal:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [1.23] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-3-rgb565-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.23] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-3-xrgb16161616f-horizontal:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [1.21] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-3-xrgb16161616f-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.31] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-3-xrgb2101010-horizontal:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [2.00] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-3-xrgb2101010-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.70] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-3-xrgb8888-horizontal:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [1.24] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-3-xrgb8888-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.16] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-3-xv30-horizontal:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [1.30] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-3-xv30-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.26] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-3-xv36-horizontal:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [1.44] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-3-xv36-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-3-xyuv8888-horizontal:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [1.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-3-xyuv8888-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.28] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-3-y210-horizontal:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [1.24] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-3-y210-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.25] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-3-yuyv-horizontal:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [1.25] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-3-yuyv-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.20] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-edp-1-nv12-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.35] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-edp-1-nv12-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.30] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-edp-1-p010-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-edp-1-p010-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-edp-1-rgb565-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-edp-1-rgb565-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-edp-1-xrgb16161616f-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.28] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-edp-1-xrgb16161616f-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.35] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-edp-1-xrgb2101010-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-edp-1-xrgb2101010-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.28] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-edp-1-xrgb8888-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-edp-1-xrgb8888-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-edp-1-xv30-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.31] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-edp-1-xv30-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-edp-1-xv36-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.27] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-edp-1-xv36-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.28] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-edp-1-xyuv8888-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-edp-1-xyuv8888-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-edp-1-y210-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.28] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-edp-1-y210-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.37] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-edp-1-yuyv-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-edp-1-yuyv-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-1-nv12-horizontal:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.35, 1.26] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-1-nv12-vertical:
    - Statuses : 3 pass(s)
    - Exec time: [1.32, 1.74] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-1-p010-horizontal:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.36, 1.28] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-1-p010-vertical:
    - Statuses : 2 fail(s) 1 pass(s)
    - Exec time: [1.36, 1.44] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-1-rgb565-horizontal:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [1.06, 1.45] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-1-rgb565-vertical:
    - Statuses : 3 pass(s)
    - Exec time: [1.39, 1.41] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-1-xrgb16161616f-horizontal:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.39, 1.34] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-1-xrgb16161616f-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.34, 1.43] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-1-xrgb2101010-horizontal:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [1.24, 1.68] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-1-xrgb2101010-vertical:
    - Statuses : 3 pass(s)
    - Exec time: [1.44, 1.88] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-1-xrgb8888-horizontal:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [1.23, 1.40] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-1-xrgb8888-vertical:
    - Statuses : 3 pass(s)
    - Exec time: [1.36, 2.23] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-1-xv30-horizontal:
    - Statuses : 2 pass(s)
    - Exec time: [1.30, 1.35] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-1-xv30-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.35, 1.40] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-1-xv36-horizontal:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.39, 1.39] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-1-xv36-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.29, 1.46] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-1-xyuv8888-horizontal:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [1.02, 1.36] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-1-xyuv8888-vertical:
    - Statuses : 3 pass(s)
    - Exec time: [1.37, 2.06] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-1-y210-horizontal:
    - Statuses : 2 pass(s)
    - Exec time: [1.28, 1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-1-y210-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.39, 1.43] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-1-yuyv-horizontal:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.87, 1.34] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-1-yuyv-vertical:
    - Statuses : 3 pass(s)
    - Exec time: [1.30, 1.37] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-2-nv12-horizontal:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.92, 1.71] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-2-nv12-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.66, 1.74] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-2-p010-horizontal:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.80, 1.70] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-2-p010-vertical:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [1.36, 1.73] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-2-rgb565-horizontal:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [1.48, 1.91] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-2-rgb565-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.82, 2.07] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-2-xrgb16161616f-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.73] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-2-xrgb16161616f-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.75] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-2-xrgb2101010-horizontal:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [1.35, 1.74] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-2-xrgb2101010-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.43, 1.76] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-2-xrgb8888-horizontal:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [1.07, 1.92] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-2-xrgb8888-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.57, 1.83] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-2-xv30-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.74] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-2-xv30-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.75] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-2-xv36-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.74] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-2-xv36-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.74] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-2-xyuv8888-horizontal:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.92, 1.72] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-2-xyuv8888-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.42, 1.74] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-2-y210-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.70] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-2-y210-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.74] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-2-yuyv-horizontal:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [1.38, 1.69] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-2-yuyv-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.60, 1.74] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-3-nv12-horizontal:
    - Statuses : 1 skip(s)
    - Exec time: [0.40] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-3-nv12-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.10] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-3-p010-horizontal:
    - Statuses : 1 skip(s)
    - Exec time: [0.42] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-3-p010-vertical:
    - Statuses : 1 fail(s)
    - Exec time: [1.17] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-3-rgb565-horizontal:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [1.21] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-3-rgb565-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.18] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-3-xrgb16161616f-horizontal:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [1.22] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-3-xrgb16161616f-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.31] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-3-xrgb2101010-horizontal:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [1.94] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-3-xrgb2101010-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.71] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-3-xrgb8888-horizontal:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [1.18] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-3-xrgb8888-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.19] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-3-xv30-horizontal:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-3-xv30-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.24] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-3-xv36-horizontal:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [1.41] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-3-xv36-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-3-xyuv8888-horizontal:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [1.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-3-xyuv8888-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.26] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-3-y210-horizontal:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [1.31] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-3-y210-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.31] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-3-yuyv-horizontal:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [1.24] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-3-yuyv-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.23] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-edp-1-nv12-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-edp-1-nv12-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.28] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-edp-1-p010-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-edp-1-p010-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.37] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-edp-1-rgb565-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-edp-1-rgb565-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-edp-1-xrgb16161616f-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.25] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-edp-1-xrgb16161616f-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-edp-1-xrgb2101010-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.26] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-edp-1-xrgb2101010-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-edp-1-xrgb8888-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-edp-1-xrgb8888-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-edp-1-xv30-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-edp-1-xv30-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-edp-1-xv36-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.31] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-edp-1-xv36-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-edp-1-xyuv8888-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-edp-1-xyuv8888-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.35] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-edp-1-y210-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-edp-1-y210-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.30] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-edp-1-yuyv-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.30] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-edp-1-yuyv-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-1-nv12-horizontal:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.38, 1.28] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-1-nv12-vertical:
    - Statuses : 3 pass(s)
    - Exec time: [1.28, 1.68] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-1-p010-horizontal:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.32, 1.31] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-1-p010-vertical:
    - Statuses : 2 fail(s) 1 pass(s)
    - Exec time: [1.35, 1.42] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-1-rgb565-horizontal:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.90, 1.38] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-1-rgb565-vertical:
    - Statuses : 3 pass(s)
    - Exec time: [1.35, 2.20] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-1-xrgb16161616f-horizontal:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.34, 1.31] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-1-xrgb16161616f-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.32, 1.45] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-1-xrgb2101010-horizontal:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.96, 1.68] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-1-xrgb2101010-vertical:
    - Statuses : 3 pass(s)
    - Exec time: [1.41, 1.87] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-1-xrgb8888-horizontal:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [1.09, 1.30] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-1-xrgb8888-vertical:
    - Statuses : 3 pass(s)
    - Exec time: [1.33, 1.71] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-1-xv30-horizontal:
    - Statuses : 2 pass(s)
    - Exec time: [1.28, 1.36] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-1-xv30-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.35, 1.42] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-1-xv36-horizontal:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.38, 1.42] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-1-xv36-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.34, 1.44] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-1-xyuv8888-horizontal:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.84, 1.36] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-1-xyuv8888-vertical:
    - Statuses : 3 pass(s)
    - Exec time: [1.36, 2.07] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-1-y210-horizontal:
    - Statuses : 2 pass(s)
    - Exec time: [1.30, 1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-1-y210-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.37] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-1-yuyv-horizontal:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [1.26, 1.40] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-1-yuyv-vertical:
    - Statuses : 3 pass(s)
    - Exec time: [1.35, 1.99] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-2-nv12-horizontal:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [1.08, 1.73] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-2-nv12-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.52, 1.73] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-2-p010-horizontal:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [1.12, 1.70] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-2-p010-vertical:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [1.52, 1.74] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-2-rgb565-horizontal:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [1.12, 1.72] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-2-rgb565-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.72, 1.73] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-2-xrgb16161616f-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.72] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-2-xrgb16161616f-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.74] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-2-xrgb2101010-horizontal:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [1.32, 1.71] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-2-xrgb2101010-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.42, 1.77] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-2-xrgb8888-horizontal:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [1.02, 1.70] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-2-xrgb8888-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.73, 2.27] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-2-xv30-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.72] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-2-xv30-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.77] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-2-xv36-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.73] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-2-xv36-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.75] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-2-xyuv8888-horizontal:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [1.17, 1.70] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-2-xyuv8888-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.60, 1.74] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-2-y210-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.69] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-2-y210-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.75] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-2-yuyv-horizontal:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [1.02, 1.71] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-2-yuyv-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.74, 2.22] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-dp-3-nv12-horizontal:
    - Statuses : 1 skip(s)
    - Exec time: [0.42] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-dp-3-nv12-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.06] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-dp-3-p010-horizontal:
    - Statuses : 1 skip(s)
    - Exec time: [0.42] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-dp-3-p010-vertical:
    - Statuses : 1 fail(s)
    - Exec time: [1.15] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-dp-3-rgb565-horizontal:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [1.20] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-dp-3-rgb565-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.17] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-dp-3-xrgb16161616f-horizontal:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [1.22] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-dp-3-xrgb16161616f-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-dp-3-xrgb2101010-horizontal:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [1.93] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-dp-3-xrgb2101010-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.75] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-dp-3-xrgb8888-horizontal:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [1.22] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-dp-3-xrgb8888-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.18] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-dp-3-xv30-horizontal:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [1.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-dp-3-xv30-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.24] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-dp-3-xv36-horizontal:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [1.43] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-dp-3-xv36-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-dp-3-xyuv8888-horizontal:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [1.36] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-dp-3-xyuv8888-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.26] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-dp-3-y210-horizontal:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-dp-3-y210-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.25] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-dp-3-yuyv-horizontal:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [1.31] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-dp-3-yuyv-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.21] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-edp-1-nv12-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.23] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-edp-1-nv12-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.27] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-edp-1-p010-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-edp-1-p010-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.25] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-edp-1-rgb565-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.30] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-edp-1-rgb565-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.23] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-edp-1-xrgb16161616f-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.26] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-edp-1-xrgb16161616f-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-edp-1-xrgb2101010-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.25] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-edp-1-xrgb2101010-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-edp-1-xrgb8888-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.23] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-edp-1-xrgb8888-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.23] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-edp-1-xv30-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.31] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-edp-1-xv30-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.24] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-edp-1-xv36-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.23] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-edp-1-xv36-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.27] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-edp-1-xyuv8888-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.23] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-edp-1-xyuv8888-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.27] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-edp-1-y210-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-edp-1-y210-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.23] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-edp-1-yuyv-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.23] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-edp-1-yuyv-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.22] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-1-nv12-horizontal:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.36, 1.27] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-1-nv12-vertical:
    - Statuses : 3 pass(s)
    - Exec time: [1.32, 2.01] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-1-p010-horizontal:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.35, 1.36] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-1-p010-vertical:
    - Statuses : 2 fail(s) 1 pass(s)
    - Exec time: [1.31, 2.19] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-1-rgb565-horizontal:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [1.08, 1.34] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-1-rgb565-vertical:
    - Statuses : 3 pass(s)
    - Exec time: [1.33, 1.96] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-1-xrgb16161616f-horizontal:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.38, 1.34] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-1-xrgb16161616f-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.31, 1.38] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-1-xrgb2101010-horizontal:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [1.29, 1.65] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-1-xrgb2101010-vertical:
    - Statuses : 3 pass(s)
    - Exec time: [1.43, 2.21] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-1-xrgb8888-horizontal:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [1.03, 1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-1-xrgb8888-vertical:
    - Statuses : 3 pass(s)
    - Exec time: [1.35, 1.57] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-1-xv30-horizontal:
    - Statuses : 2 pass(s)
    - Exec time: [1.29, 1.51] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-1-xv30-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.35, 1.36] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-1-xv36-horizontal:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.36, 1.47] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-1-xv36-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.30, 1.43] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-1-xyuv8888-horizontal:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [1.30, 1.51] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-1-xyuv8888-vertical:
    - Statuses : 3 pass(s)
    - Exec time: [1.37, 2.02] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-1-y210-horizontal:
    - Statuses : 2 pass(s)
    - Exec time: [1.31, 1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-1-y210-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.37, 1.41] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-1-yuyv-horizontal:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [1.14, 1.31] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-1-yuyv-vertical:
    - Statuses : 3 pass(s)
    - Exec time: [1.36, 2.19] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-2-nv12-horizontal:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [1.02, 1.71] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-2-nv12-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.72, 1.73] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-2-p010-horizontal:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.86, 1.72] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-2-p010-vertical:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [1.74, 2.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-2-rgb565-horizontal:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [1.01, 1.72] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-2-rgb565-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.35, 1.76] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-2-xrgb16161616f-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.70] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-2-xrgb16161616f-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.76] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-2-xrgb2101010-horizontal:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [1.00, 1.75] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-2-xrgb2101010-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.40, 1.76] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-2-xrgb8888-horizontal:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [1.35, 1.71] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-2-xrgb8888-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.63, 1.73] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-2-xv30-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.72] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-2-xv30-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.76] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-2-xv36-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.71] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-2-xv36-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.76] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-2-xyuv8888-horizontal:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [1.34, 1.72] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-2-xyuv8888-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.74, 2.27] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-2-y210-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.68] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-2-y210-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.76] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-2-yuyv-horizontal:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [1.33, 1.71] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-2-yuyv-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.68, 1.73] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-dp-3-nv12-horizontal:
    - Statuses : 1 skip(s)
    - Exec time: [0.44] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-dp-3-nv12-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.04] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-dp-3-p010-horizontal:
    - Statuses : 1 skip(s)
    - Exec time: [0.43] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-dp-3-p010-vertical:
    - Statuses : 1 fail(s)
    - Exec time: [1.13] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-dp-3-rgb565-horizontal:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [1.21] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-dp-3-rgb565-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.12] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-dp-3-xrgb16161616f-horizontal:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [1.21] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-dp-3-xrgb16161616f-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.31] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-dp-3-xrgb2101010-horizontal:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [1.96] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-dp-3-xrgb2101010-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.73] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-dp-3-xrgb8888-horizontal:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [1.19] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-dp-3-xrgb8888-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.18] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-dp-3-xv30-horizontal:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-dp-3-xv30-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.31] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-dp-3-xv36-horizontal:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [1.40] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-dp-3-xv36-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-dp-3-xyuv8888-horizontal:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-dp-3-xyuv8888-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.24] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-dp-3-y210-horizontal:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [1.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-dp-3-y210-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.22] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-dp-3-yuyv-horizontal:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [1.18] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-dp-3-yuyv-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.21] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-edp-1-nv12-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.30] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-edp-1-nv12-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.25] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-edp-1-p010-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-edp-1-p010-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-edp-1-rgb565-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-edp-1-rgb565-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.23] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-edp-1-xrgb16161616f-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.28] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-edp-1-xrgb16161616f-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.30] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-edp-1-xrgb2101010-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.22] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-edp-1-xrgb2101010-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.23] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-edp-1-xrgb8888-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.22] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-edp-1-xrgb8888-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.25] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-edp-1-xv30-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.31] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-edp-1-xv30-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.26] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-edp-1-xv36-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.22] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-edp-1-xv36-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.25] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-edp-1-xyuv8888-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.25] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-edp-1-xyuv8888-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.26] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-edp-1-y210-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.31] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-edp-1-y210-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.24] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-edp-1-yuyv-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.22] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-edp-1-yuyv-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-hdmi-a-1-nv12-horizontal:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.33, 1.23] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-hdmi-a-1-nv12-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.27, 1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-hdmi-a-1-p010-horizontal:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.36, 1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-hdmi-a-1-p010-vertical:
    - Statuses : 2 fail(s)
    - Exec time: [1.38, 1.39] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-hdmi-a-1-rgb565-horizontal:
    - Statuses : 2 pass(s)
    - Exec time: [1.30, 1.37] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-hdmi-a-1-rgb565-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.33, 1.37] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-hdmi-a-1-xrgb16161616f-horizontal:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.34, 1.39] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-hdmi-a-1-xrgb16161616f-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.30, 1.36] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-hdmi-a-1-xrgb2101010-horizontal:
    - Statuses : 2 pass(s)
    - Exec time: [1.45, 1.66] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-hdmi-a-1-xrgb2101010-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.44, 1.61] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-hdmi-a-1-xrgb8888-horizontal:
    - Statuses : 2 pass(s)
    - Exec time: [1.26, 1.27] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-hdmi-a-1-xrgb8888-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.36, 1.41] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-hdmi-a-1-xv30-horizontal:
    - Statuses : 2 pass(s)
    - Exec time: [1.30, 1.36] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-hdmi-a-1-xv30-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.35, 1.38] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-hdmi-a-1-xv36-horizontal:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.37, 1.43] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-hdmi-a-1-xv36-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.38, 1.42] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-hdmi-a-1-xyuv8888-horizontal:
    - Statuses : 2 pass(s)
    - Exec time: [1.30, 1.40] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-hdmi-a-1-xyuv8888-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.36, 1.38] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-hdmi-a-1-y210-horizontal:
    - Statuses : 2 pass(s)
    - Exec time: [1.31, 1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-hdmi-a-1-y210-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.34, 1.37] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-hdmi-a-1-yuyv-horizontal:
    - Statuses : 2 pass(s)
    - Exec time: [1.26, 1.38] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-hdmi-a-1-yuyv-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.36, 1.38] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled:
    - Statuses : 5 fail(s) 1 pass(s) 1 skip(s)
    - Exec time: [0.03, 125.27] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-nv12-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-nv12-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-p010-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-p010-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-rgb565-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.28] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-rgb565-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-xrgb16161616f-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-xrgb16161616f-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-xrgb2101010-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-xrgb2101010-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-xrgb8888-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-xrgb8888-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.37] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-xv30-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-xv30-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-xv36-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-xv36-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-xyuv8888-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-xyuv8888-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-y210-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-y210-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-yuyv-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.30] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-yuyv-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.37] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-1-nv12-horizontal:
    - Statuses : 3 pass(s) 2 skip(s)
    - Exec time: [0.32, 1.74] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-1-nv12-vertical:
    - Statuses : 5 pass(s)
    - Exec time: [1.30, 1.74] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-1-p010-horizontal:
    - Statuses : 3 fail(s) 2 skip(s)
    - Exec time: [0.35, 1.75] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-1-p010-vertical:
    - Statuses : 4 fail(s) 1 pass(s)
    - Exec time: [1.36, 1.73] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-1-rgb565-horizontal:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.97, 1.91] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-1-rgb565-vertical:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [1.33, 1.86] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-1-xrgb16161616f-horizontal:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.36, 1.73] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-1-xrgb16161616f-vertical:
    - Statuses : 4 pass(s)
    - Exec time: [1.39, 1.76] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-1-xrgb2101010-horizontal:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.80, 1.92] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-1-xrgb2101010-vertical:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [1.43, 1.89] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-1-xrgb8888-horizontal:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.76, 1.91] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-1-xrgb8888-vertical:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [1.35, 1.84] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-1-xv30-horizontal:
    - Statuses : 4 pass(s)
    - Exec time: [1.34, 1.73] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-1-xv30-vertical:
    - Statuses : 4 pass(s)
    - Exec time: [1.40, 1.74] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-1-xv36-horizontal:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.37, 1.73] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-1-xv36-vertical:
    - Statuses : 4 pass(s)
    - Exec time: [1.36, 1.77] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-1-xyuv8888-horizontal:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.83, 1.73] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-1-xyuv8888-vertical:
    - Statuses : 5 pass(s)
    - Exec time: [1.38, 1.76] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-1-y210-horizontal:
    - Statuses : 4 pass(s)
    - Exec time: [1.34, 1.73] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-1-y210-vertical:
    - Statuses : 4 pass(s)
    - Exec time: [1.40, 1.76] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-1-yuyv-horizontal:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.79, 1.71] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-1-yuyv-vertical:
    - Statuses : 5 pass(s)
    - Exec time: [1.32, 1.74] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-2-nv12-horizontal:
    - Statuses : 1 skip(s)
    - Exec time: [0.80] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-2-nv12-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-2-p010-horizontal:
    - Statuses : 1 skip(s)
    - Exec time: [0.74] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-2-p010-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-2-rgb565-horizontal:
    - Statuses : 1 skip(s)
    - Exec time: [0.78] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-2-rgb565-vertical:
    - Statuses : 1 fail(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-2-xrgb2101010-horizontal:
    - Statuses : 1 skip(s)
    - Exec time: [0.84] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-2-xrgb2101010-vertical:
    - Statuses : 1 fail(s)
    - Exec time: [1.50] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-2-xrgb8888-horizontal:
    - Statuses : 1 skip(s)
    - Exec time: [0.82] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-2-xrgb8888-vertical:
    - Statuses : 1 fail(s)
    - Exec time: [1.38] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-2-xyuv8888-horizontal:
    - Statuses : 1 skip(s)
    - Exec time: [0.82] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-2-xyuv8888-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-2-yuyv-horizontal:
    - Statuses : 1 skip(s)
    - Exec time: [0.77] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-2-yuyv-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-edp-1-nv12-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-edp-1-nv12-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-edp-1-p010-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-edp-1-p010-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-edp-1-rgb565-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.31] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-edp-1-rgb565-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-edp-1-xrgb16161616f-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.27] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-edp-1-xrgb16161616f-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-edp-1-xrgb2101010-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.35] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-edp-1-xrgb2101010-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.27] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-edp-1-xrgb8888-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-edp-1-xrgb8888-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.31] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-edp-1-xv30-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-edp-1-xv30-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-edp-1-xv36-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.30] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-edp-1-xv36-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-edp-1-xyuv8888-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.30] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-edp-1-xyuv8888-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-edp-1-y210-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-edp-1-y210-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-edp-1-yuyv-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.26] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-edp-1-yuyv-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.30] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-1-nv12-horizontal:
    - Statuses : 3 pass(s) 2 skip(s)
    - Exec time: [0.35, 1.71] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-1-nv12-vertical:
    - Statuses : 5 pass(s)
    - Exec time: [1.31, 1.75] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-1-p010-horizontal:
    - Statuses : 3 fail(s) 2 skip(s)
    - Exec time: [0.33, 1.76] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-1-p010-vertical:
    - Statuses : 4 fail(s) 1 pass(s)
    - Exec time: [1.30, 1.75] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-1-rgb565-horizontal:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.84, 1.73] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-1-rgb565-vertical:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [1.29, 1.76] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-1-xrgb16161616f-horizontal:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.36, 1.75] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-1-xrgb16161616f-vertical:
    - Statuses : 4 pass(s)
    - Exec time: [1.30, 1.78] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-1-xrgb2101010-horizontal:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.77, 1.96] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-1-xrgb2101010-vertical:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [1.51, 1.89] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-1-xrgb8888-horizontal:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.81, 1.72] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-1-xrgb8888-vertical:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [1.26, 1.76] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-1-xv30-horizontal:
    - Statuses : 4 pass(s)
    - Exec time: [1.33, 1.73] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-1-xv30-vertical:
    - Statuses : 4 pass(s)
    - Exec time: [1.38, 1.75] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-1-xv36-horizontal:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.36, 1.75] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-1-xv36-vertical:
    - Statuses : 4 pass(s)
    - Exec time: [1.32, 1.78] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-1-xyuv8888-horizontal:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.80, 1.75] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-1-xyuv8888-vertical:
    - Statuses : 5 pass(s)
    - Exec time: [1.35, 1.77] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-1-y210-horizontal:
    - Statuses : 4 pass(s)
    - Exec time: [1.32, 1.71] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-1-y210-vertical:
    - Statuses : 4 pass(s)
    - Exec time: [1.37, 1.79] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-1-yuyv-horizontal:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.73, 1.72] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-1-yuyv-vertical:
    - Statuses : 5 pass(s)
    - Exec time: [1.36, 1.78] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-2-nv12-horizontal:
    - Statuses : 1 skip(s)
    - Exec time: [0.77] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-2-nv12-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.26] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-2-p010-horizontal:
    - Statuses : 1 skip(s)
    - Exec time: [0.78] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-2-p010-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.23] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-2-rgb565-horizontal:
    - Statuses : 1 skip(s)
    - Exec time: [0.76] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-2-rgb565-vertical:
    - Statuses : 1 fail(s)
    - Exec time: [1.39] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-2-xrgb2101010-horizontal:
    - Statuses : 1 skip(s)
    - Exec time: [0.77] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-2-xrgb2101010-vertical:
    - Statuses : 1 fail(s)
    - Exec time: [1.40] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-2-xrgb8888-horizontal:
    - Statuses : 1 skip(s)
    - Exec time: [0.76] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-2-xrgb8888-vertical:
    - Statuses : 1 fail(s)
    - Exec time: [1.38] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-2-xyuv8888-horizontal:
    - Statuses : 1 skip(s)
    - Exec time: [0.80] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-2-xyuv8888-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-2-yuyv-horizontal:
    - Statuses : 1 skip(s)
    - Exec time: [0.75] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-2-yuyv-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-edp-1-nv12-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-edp-1-nv12-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-edp-1-p010-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-edp-1-p010-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-edp-1-rgb565-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.27] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-edp-1-rgb565-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.35] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-edp-1-xrgb16161616f-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.25] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-edp-1-xrgb16161616f-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.25] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-edp-1-xrgb2101010-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.25] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-edp-1-xrgb2101010-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.25] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-edp-1-xrgb8888-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.31] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-edp-1-xrgb8888-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-edp-1-xv30-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.35] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-edp-1-xv30-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.30] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-edp-1-xv36-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-edp-1-xv36-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.35] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-edp-1-xyuv8888-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-edp-1-xyuv8888-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-edp-1-y210-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-edp-1-y210-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-edp-1-yuyv-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-edp-1-yuyv-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-1-nv12-horizontal:
    - Statuses : 3 pass(s) 2 skip(s)
    - Exec time: [0.15, 1.71] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-1-nv12-vertical:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.12, 1.75] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-1-p010-horizontal:
    - Statuses : 3 fail(s) 2 skip(s)
    - Exec time: [0.16, 1.76] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-1-p010-vertical:
    - Statuses : 4 fail(s) 1 skip(s)
    - Exec time: [0.12, 1.74] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-1-rgb565-horizontal:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.80, 1.73] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-1-rgb565-vertical:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.92, 1.75] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-1-xrgb16161616f-horizontal:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.36, 1.76] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-1-xrgb16161616f-vertical:
    - Statuses : 4 pass(s)
    - Exec time: [1.32, 1.77] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-1-xrgb2101010-horizontal:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.63, 1.97] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-1-xrgb2101010-vertical:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [1.07, 1.89] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-1-xrgb8888-horizontal:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.69, 1.73] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-1-xrgb8888-vertical:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.98, 1.78] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-1-xv30-horizontal:
    - Statuses : 4 pass(s)
    - Exec time: [1.34, 1.73] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-1-xv30-vertical:
    - Statuses : 4 pass(s)
    - Exec time: [1.36, 1.75] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-1-xv36-horizontal:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.42, 1.75] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-1-xv36-vertical:
    - Statuses : 4 pass(s)
    - Exec time: [1.36, 1.78] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-1-xyuv8888-horizontal:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.65, 1.75] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-1-xyuv8888-vertical:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.87, 1.77] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-1-y210-horizontal:
    - Statuses : 4 pass(s)
    - Exec time: [1.30, 1.71] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-1-y210-vertical:
    - Statuses : 4 pass(s)
    - Exec time: [1.38, 1.77] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-1-yuyv-horizontal:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.61, 1.72] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-1-yuyv-vertical:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.91, 1.77] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-2-nv12-horizontal:
    - Statuses : 1 skip(s)
    - Exec time: [0.15] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-2-nv12-vertical:
    - Statuses : 1 skip(s)
    - Exec time: [0.13] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-2-p010-horizontal:
    - Statuses : 1 skip(s)
    - Exec time: [0.15] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-2-p010-vertical:
    - Statuses : 1 skip(s)
    - Exec time: [0.12] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-2-rgb565-horizontal:
    - Statuses : 1 skip(s)
    - Exec time: [0.63] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-2-rgb565-vertical:
    - Statuses : 1 skip(s)
    - Exec time: [0.91] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-2-xrgb2101010-horizontal:
    - Statuses : 1 skip(s)
    - Exec time: [0.61] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-2-xrgb2101010-vertical:
    - Statuses : 1 skip(s)
    - Exec time: [1.03] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-2-xrgb8888-horizontal:
    - Statuses : 1 skip(s)
    - Exec time: [0.68] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-2-xrgb8888-vertical:
    - Statuses : 1 skip(s)
    - Exec time: [0.93] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-2-xyuv8888-horizontal:
    - Statuses : 1 skip(s)
    - Exec time: [0.67] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-2-xyuv8888-vertical:
    - Statuses : 1 skip(s)
    - Exec time: [0.85] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-2-yuyv-horizontal:
    - Statuses : 1 skip(s)
    - Exec time: [0.62] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-2-yuyv-vertical:
    - Statuses : 1 skip(s)
    - Exec time: [0.91] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-edp-1-nv12-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-edp-1-nv12-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-edp-1-p010-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-edp-1-p010-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.35] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-edp-1-rgb565-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.31] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-edp-1-rgb565-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.24] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-edp-1-xrgb16161616f-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-edp-1-xrgb16161616f-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-edp-1-xrgb2101010-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.25] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-edp-1-xrgb2101010-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.26] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-edp-1-xrgb8888-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-edp-1-xrgb8888-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.25] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-edp-1-xv30-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-edp-1-xv30-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-edp-1-xv36-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-edp-1-xv36-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-edp-1-xyuv8888-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-edp-1-xyuv8888-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.31] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-edp-1-y210-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.31] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-edp-1-y210-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-edp-1-yuyv-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-edp-1-yuyv-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-hdmi-a-1-nv12-horizontal:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.36, 1.28] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-hdmi-a-1-nv12-vertical:
    - Statuses : 3 pass(s)
    - Exec time: [1.29, 1.42] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-hdmi-a-1-p010-horizontal:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.32, 1.36] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-hdmi-a-1-p010-vertical:
    - Statuses : 3 fail(s)
    - Exec time: [1.31, 1.49] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-hdmi-a-1-rgb565-horizontal:
    - Statuses : 3 pass(s)
    - Exec time: [1.22, 1.36] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-hdmi-a-1-rgb565-vertical:
    - Statuses : 3 pass(s)
    - Exec time: [1.29, 1.40] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-hdmi-a-1-xrgb16161616f-horizontal:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.35, 1.43] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-hdmi-a-1-xrgb16161616f-vertical:
    - Statuses : 3 pass(s)
    - Exec time: [1.30, 1.47] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-hdmi-a-1-xrgb2101010-horizontal:
    - Statuses : 3 pass(s)
    - Exec time: [1.68, 1.96] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-hdmi-a-1-xrgb2101010-vertical:
    - Statuses : 3 pass(s)
    - Exec time: [1.60, 1.81] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-hdmi-a-1-xrgb8888-horizontal:
    - Statuses : 3 pass(s)
    - Exec time: [1.25, 1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-hdmi-a-1-xrgb8888-vertical:
    - Statuses : 3 pass(s)
    - Exec time: [1.30, 1.36] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-hdmi-a-1-xv30-horizontal:
    - Statuses : 3 pass(s)
    - Exec time: [1.32, 1.39] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-hdmi-a-1-xv30-vertical:
    - Statuses : 3 pass(s)
    - Exec time: [1.39, 1.42] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-hdmi-a-1-xv36-horizontal:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.35, 1.46] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-hdmi-a-1-xv36-vertical:
    - Statuses : 3 pass(s)
    - Exec time: [1.31, 1.50] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-hdmi-a-1-xyuv8888-horizontal:
    - Statuses : 3 pass(s)
    - Exec time: [1.31, 1.35] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-hdmi-a-1-xyuv8888-vertical:
    - Statuses : 3 pass(s)
    - Exec time: [1.39, 1.42] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-hdmi-a-1-y210-horizontal:
    - Statuses : 3 pass(s)
    - Exec time: [1.31, 1.37] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-hdmi-a-1-y210-vertical:
    - Statuses : 3 pass(s)
    - Exec time: [1.35, 1.42] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-hdmi-a-1-yuyv-horizontal:
    - Statuses : 3 pass(s)
    - Exec time: [1.29, 1.35] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-hdmi-a-1-yuyv-vertical:
    - Statuses : 3 pass(s)
    - Exec time: [1.31, 1.44] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled:
    - Statuses : 3 fail(s) 1 pass(s) 3 skip(s)
    - Exec time: [0.03, 124.55] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-1-nv12-horizontal:
    - Statuses : 2 skip(s)
    - Exec time: [0.36, 0.99] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-1-nv12-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.32, 1.66] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-1-p010-horizontal:
    - Statuses : 2 skip(s)
    - Exec time: [0.35, 1.19] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-1-p010-vertical:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [1.28, 2.06] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-1-rgb565-horizontal:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [1.09, 1.41] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-1-rgb565-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.47, 1.71] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-1-xrgb16161616f-horizontal:
    - Statuses : 1 skip(s)
    - Exec time: [0.36] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-1-xrgb16161616f-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.27] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-1-xrgb2101010-horizontal:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [1.01, 1.36] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-1-xrgb2101010-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.33, 1.57] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-1-xrgb8888-horizontal:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.92, 1.39] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-1-xrgb8888-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.41, 1.42] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-1-xv30-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.41] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-1-xv30-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-1-xv36-horizontal:
    - Statuses : 1 skip(s)
    - Exec time: [0.37] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-1-xv36-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-1-xyuv8888-horizontal:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.99, 1.38] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-1-xyuv8888-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.40, 1.41] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-1-y210-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-1-y210-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.37] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-1-yuyv-horizontal:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.92, 1.30] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-1-yuyv-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.39, 2.08] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-2-nv12-horizontal:
    - Statuses : 2 skip(s)
    - Exec time: [0.28, 0.97] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-2-nv12-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [0.68, 2.16] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-2-p010-horizontal:
    - Statuses : 2 skip(s)
    - Exec time: [0.27, 0.81] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-2-p010-vertical:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [0.74, 1.34] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-2-rgb565-horizontal:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.82, 0.87] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-2-rgb565-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [0.78, 1.42] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-2-xrgb16161616f-horizontal:
    - Statuses : 1 skip(s)
    - Exec time: [0.26] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-2-xrgb16161616f-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [0.69] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-2-xrgb2101010-horizontal:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.76, 1.06] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-2-xrgb2101010-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [0.77, 2.19] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-2-xrgb8888-horizontal:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.78, 1.30] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-2-xrgb8888-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [0.79, 1.71] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-2-xv30-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [0.78] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-2-xv30-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [0.80] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-2-xv36-horizontal:
    - Statuses : 1 skip(s)
    - Exec time: [0.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-2-xv36-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [0.70] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-2-xyuv8888-horizontal:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.79, 0.90] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-2-xyuv8888-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [0.79, 1.40] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-2-y210-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [0.76] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-2-y210-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [0.78] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-2-yuyv-horizontal:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.75, 1.24] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-2-yuyv-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [0.78, 2.04] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-4-nv12-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.27] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-4-nv12-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.40] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-4-p010-horizontal:
    - Statuses : 1 fail(s)
    - Exec time: [1.36] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-4-p010-vertical:
    - Statuses : 1 fail(s)
    - Exec time: [1.43] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-4-rgb565-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.49] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-4-rgb565-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.42] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-4-xrgb16161616f-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.47] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-4-xrgb16161616f-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.44] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-4-xrgb2101010-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.71] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-4-xrgb2101010-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.66] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-4-xrgb8888-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.41] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-4-xrgb8888-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.48] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-4-xv30-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.35] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-4-xv30-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.40] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-4-xv36-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.51] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-4-xv36-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.46] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-4-xyuv8888-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.31] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-4-xyuv8888-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.41] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-4-y210-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.35] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-4-y210-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-4-yuyv-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-4-yuyv-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.42] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-1-nv12-horizontal:
    - Statuses : 2 skip(s)
    - Exec time: [0.35, 0.86] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-1-nv12-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.26, 1.34] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-1-p010-horizontal:
    - Statuses : 2 skip(s)
    - Exec time: [0.34, 0.89] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-1-p010-vertical:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [1.30, 1.41] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-1-rgb565-horizontal:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [1.34, 1.39] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-1-rgb565-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.37, 2.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-1-xrgb16161616f-horizontal:
    - Statuses : 1 skip(s)
    - Exec time: [0.37] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-1-xrgb16161616f-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-1-xrgb2101010-horizontal:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [1.12, 1.34] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-1-xrgb2101010-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.37, 1.72] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-1-xrgb8888-horizontal:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.84, 1.36] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-1-xrgb8888-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.36, 1.41] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-1-xv30-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.37] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-1-xv30-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.43] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-1-xv36-horizontal:
    - Statuses : 1 skip(s)
    - Exec time: [0.38] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-1-xv36-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-1-xyuv8888-horizontal:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [1.04, 1.38] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-1-xyuv8888-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.38, 1.77] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-1-y210-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-1-y210-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-1-yuyv-horizontal:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [1.18, 1.35] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-1-yuyv-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.41, 1.42] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-2-nv12-horizontal:
    - Statuses : 2 skip(s)
    - Exec time: [0.30, 0.90] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-2-nv12-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [0.70, 1.26] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-2-p010-horizontal:
    - Statuses : 2 skip(s)
    - Exec time: [0.26, 0.99] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-2-p010-vertical:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [0.68, 1.34] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-2-rgb565-horizontal:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.73, 1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-2-rgb565-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [0.78, 2.07] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-2-xrgb16161616f-horizontal:
    - Statuses : 1 skip(s)
    - Exec time: [0.31] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-2-xrgb16161616f-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [0.70] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-2-xrgb2101010-horizontal:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.77, 0.97] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-2-xrgb2101010-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [0.76, 1.55] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-2-xrgb8888-horizontal:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.77, 1.06] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-2-xrgb8888-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [0.75, 1.52] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-2-xv30-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [0.83] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-2-xv30-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [0.79] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-2-xv36-horizontal:
    - Statuses : 1 skip(s)
    - Exec time: [0.31] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-2-xv36-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [0.71] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-2-xyuv8888-horizontal:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.77, 1.15] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-2-xyuv8888-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [0.81, 1.82] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-2-y210-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [0.73] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-2-y210-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [0.80] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-2-yuyv-horizontal:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.74, 0.89] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-2-yuyv-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [0.79, 1.35] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-4-nv12-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.28] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-4-nv12-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.42] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-4-p010-horizontal:
    - Statuses : 1 fail(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-4-p010-vertical:
    - Statuses : 1 fail(s)
    - Exec time: [1.42] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-4-rgb565-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.30] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-4-rgb565-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-4-xrgb16161616f-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.43] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-4-xrgb16161616f-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.45] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-4-xrgb2101010-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.73] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-4-xrgb2101010-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.66] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-4-xrgb8888-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.30] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-4-xrgb8888-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-4-xv30-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-4-xv30-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.42] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-4-xv36-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.48] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-4-xv36-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.46] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-4-xyuv8888-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-4-xyuv8888-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.40] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-4-y210-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-4-y210-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-4-yuyv-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-4-yuyv-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.40] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-1-nv12-horizontal:
    - Statuses : 2 skip(s)
    - Exec time: [0.36, 1.20] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-1-nv12-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.27, 2.16] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-1-p010-horizontal:
    - Statuses : 2 skip(s)
    - Exec time: [0.31, 0.86] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-1-p010-vertical:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [1.34, 1.38] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-1-rgb565-horizontal:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.94, 1.34] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-1-rgb565-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.36] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-1-xrgb16161616f-horizontal:
    - Statuses : 1 skip(s)
    - Exec time: [0.35] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-1-xrgb16161616f-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.28] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-1-xrgb2101010-horizontal:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [1.09, 1.38] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-1-xrgb2101010-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.39, 1.65] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-1-xrgb8888-horizontal:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.81, 1.36] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-1-xrgb8888-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.29, 1.38] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-1-xv30-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-1-xv30-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.41] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-1-xv36-horizontal:
    - Statuses : 1 skip(s)
    - Exec time: [0.42] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-1-xv36-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-1-xyuv8888-horizontal:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.92, 1.36] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-1-xyuv8888-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.40, 1.41] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-1-y210-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.37] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-1-y210-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-1-yuyv-horizontal:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [1.10, 1.36] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-1-yuyv-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.39, 2.14] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-2-nv12-horizontal:
    - Statuses : 2 skip(s)
    - Exec time: [0.27, 0.89] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-2-nv12-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [0.69, 1.43] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-2-p010-horizontal:
    - Statuses : 2 skip(s)
    - Exec time: [0.27, 0.98] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-2-p010-vertical:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [0.72, 2.06] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-2-rgb565-horizontal:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.76, 0.94] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-2-rgb565-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [0.74, 1.57] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-2-xrgb16161616f-horizontal:
    - Statuses : 1 skip(s)
    - Exec time: [0.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-2-xrgb16161616f-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [0.70] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-2-xrgb2101010-horizontal:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.75, 1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-2-xrgb2101010-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [0.77, 1.79] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-2-xrgb8888-horizontal:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.74, 1.02] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-2-xrgb8888-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [0.78, 1.67] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-2-xv30-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [0.77] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-2-xv30-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [0.81] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-2-xv36-horizontal:
    - Statuses : 1 skip(s)
    - Exec time: [0.30] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-2-xv36-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [0.71] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-2-xyuv8888-horizontal:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.78, 1.27] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-2-xyuv8888-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [0.78, 2.20] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-2-y210-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [0.73] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-2-y210-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [0.78] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-2-yuyv-horizontal:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.76, 1.22] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-2-yuyv-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [0.77, 1.71] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-4-nv12-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-4-nv12-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.40] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-4-p010-horizontal:
    - Statuses : 1 fail(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-4-p010-vertical:
    - Statuses : 1 fail(s)
    - Exec time: [1.48] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-4-rgb565-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.28] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-4-rgb565-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.37] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-4-xrgb16161616f-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.41] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-4-xrgb16161616f-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.45] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-4-xrgb2101010-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.71] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-4-xrgb2101010-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.66] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-4-xrgb8888-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.31] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-4-xrgb8888-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-4-xv30-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-4-xv30-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.43] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-4-xv36-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.49] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-4-xv36-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.49] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-4-xyuv8888-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-4-xyuv8888-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-4-y210-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-4-y210-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.42] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-4-yuyv-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.31] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-4-yuyv-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-1-nv12-horizontal:
    - Statuses : 1 skip(s)
    - Exec time: [0.34] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-1-nv12-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.31] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-1-p010-horizontal:
    - Statuses : 1 skip(s)
    - Exec time: [0.34] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-1-p010-vertical:
    - Statuses : 1 fail(s)
    - Exec time: [1.31] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-1-rgb565-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-1-rgb565-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-1-xrgb16161616f-horizontal:
    - Statuses : 1 skip(s)
    - Exec time: [0.35] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-1-xrgb16161616f-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.30] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-1-xrgb2101010-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-1-xrgb2101010-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-1-xrgb8888-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-1-xrgb8888-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-1-xv30-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.35] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-1-xv30-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-1-xv36-horizontal:
    - Statuses : 1 skip(s)
    - Exec time: [0.38] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-1-xv36-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.26] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-1-xyuv8888-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-1-xyuv8888-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.40] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-1-y210-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.30] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-1-y210-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-1-yuyv-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-1-yuyv-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-4-nv12-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.27] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-4-nv12-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.40] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-4-p010-horizontal:
    - Statuses : 1 fail(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-4-p010-vertical:
    - Statuses : 1 fail(s)
    - Exec time: [1.49] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-4-rgb565-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-4-rgb565-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-4-xrgb16161616f-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.42] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-4-xrgb16161616f-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.47] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-4-xrgb2101010-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.71] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-4-xrgb2101010-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.68] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-4-xrgb8888-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.31] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-4-xrgb8888-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.37] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-4-xv30-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-4-xv30-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.41] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-4-xv36-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.47] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-4-xv36-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.50] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-4-xyuv8888-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-4-xyuv8888-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-4-y210-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-4-y210-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.41] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-4-yuyv-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.31] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-4-yuyv-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-yf-tiled:
    - Statuses : 5 skip(s)
    - Exec time: [0.02, 0.06] s

  

Known issues
------------

  Here are the changes found in IGTPW_15452_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@crc32:
    - shard-rkl:          NOTRUN -> [SKIP][14] ([i915#6230])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-3/igt@api_intel_bb@crc32.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-rkl:          NOTRUN -> [SKIP][15] ([i915#11078] / [i915#14544])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@dmabuf@all-tests:
    - shard-tglu:         NOTRUN -> [SKIP][16] ([i915#15931])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-3/igt@dmabuf@all-tests.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-rkl:          NOTRUN -> [SKIP][17] ([i915#3555] / [i915#9323])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-2/igt@gem_ccs@block-copy-compressed.html
    - shard-tglu-1:       NOTRUN -> [SKIP][18] ([i915#3555] / [i915#9323])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-rkl:          NOTRUN -> [SKIP][19] ([i915#9323])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-5/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@large-ctrl-surf-copy:
    - shard-rkl:          NOTRUN -> [SKIP][20] ([i915#13008])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-1/igt@gem_ccs@large-ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume:
    - shard-tglu:         NOTRUN -> [SKIP][21] ([i915#9323])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-3/igt@gem_ccs@suspend-resume.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-rkl:          NOTRUN -> [SKIP][22] ([i915#6335])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-3/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-glk:          NOTRUN -> [INCOMPLETE][23] ([i915#13356] / [i915#16466]) +1 other test incomplete
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk8/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_ctx_persistence@engines-hang:
    - shard-snb:          NOTRUN -> [SKIP][24] ([i915#1099]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-snb7/igt@gem_ctx_persistence@engines-hang.html

  * igt@gem_ctx_persistence@heartbeat-hang:
    - shard-dg2:          NOTRUN -> [SKIP][25] ([i915#8555])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-8/igt@gem_ctx_persistence@heartbeat-hang.html
    - shard-mtlp:         NOTRUN -> [SKIP][26] ([i915#8555])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-7/igt@gem_ctx_persistence@heartbeat-hang.html

  * igt@gem_ctx_sseu@engines:
    - shard-tglu:         NOTRUN -> [SKIP][27] ([i915#280])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-5/igt@gem_ctx_sseu@engines.html

  * igt@gem_eio@in-flight-suspend:
    - shard-rkl:          NOTRUN -> [ABORT][28] ([i915#15131])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-1/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-rkl:          NOTRUN -> [SKIP][29] ([i915#4525]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-2/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-tglu:         NOTRUN -> [SKIP][30] ([i915#4525])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-8/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_big@single:
    - shard-mtlp:         [PASS][31] -> [FAIL][32] ([i915#15871])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-mtlp-3/igt@gem_exec_big@single.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-7/igt@gem_exec_big@single.html

  * igt@gem_exec_capture@capture:
    - shard-mtlp:         NOTRUN -> [FAIL][33] ([i915#11965]) +1 other test fail
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-7/igt@gem_exec_capture@capture.html

  * igt@gem_exec_capture@capture-invisible:
    - shard-glk10:        NOTRUN -> [SKIP][34] ([i915#6334]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk10/igt@gem_exec_capture@capture-invisible.html

  * igt@gem_exec_capture@capture@vecs0-lmem0:
    - shard-dg2:          NOTRUN -> [FAIL][35] ([i915#11965]) +4 other tests fail
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-6/igt@gem_exec_capture@capture@vecs0-lmem0.html
    - shard-dg1:          NOTRUN -> [FAIL][36] ([i915#11965]) +2 other tests fail
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-15/igt@gem_exec_capture@capture@vecs0-lmem0.html

  * igt@gem_exec_flush@basic-wb-ro-before-default:
    - shard-dg2:          NOTRUN -> [SKIP][37] ([i915#3539] / [i915#4852])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-4/igt@gem_exec_flush@basic-wb-ro-before-default.html

  * igt@gem_exec_reloc@basic-cpu-noreloc:
    - shard-dg2:          NOTRUN -> [SKIP][38] ([i915#3281]) +3 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-1/igt@gem_exec_reloc@basic-cpu-noreloc.html

  * igt@gem_exec_reloc@basic-gtt-cpu-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][39] ([i915#3281]) +2 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-3/igt@gem_exec_reloc@basic-gtt-cpu-noreloc.html

  * igt@gem_exec_reloc@basic-range-active:
    - shard-rkl:          NOTRUN -> [SKIP][40] ([i915#3281]) +7 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-2/igt@gem_exec_reloc@basic-range-active.html
    - shard-dg1:          NOTRUN -> [SKIP][41] ([i915#3281]) +2 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-13/igt@gem_exec_reloc@basic-range-active.html

  * igt@gem_exec_reloc@basic-write-read:
    - shard-rkl:          NOTRUN -> [SKIP][42] ([i915#14544] / [i915#3281])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@gem_exec_reloc@basic-write-read.html

  * igt@gem_exec_suspend@basic-s3-devices:
    - shard-dg1:          [PASS][43] -> [DMESG-WARN][44] ([i915#4423]) +2 other tests dmesg-warn
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-dg1-15/igt@gem_exec_suspend@basic-s3-devices.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-13/igt@gem_exec_suspend@basic-s3-devices.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][45] ([i915#4860])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-8/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html

  * igt@gem_lmem_swapping@heavy-random:
    - shard-tglu:         NOTRUN -> [SKIP][46] ([i915#4613]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-8/igt@gem_lmem_swapping@heavy-random.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-glk:          NOTRUN -> [SKIP][47] ([i915#4613]) +3 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk9/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@massive-random:
    - shard-rkl:          NOTRUN -> [SKIP][48] ([i915#4613]) +2 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-3/igt@gem_lmem_swapping@massive-random.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-tglu-1:       NOTRUN -> [SKIP][49] ([i915#4613]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_madvise@dontneed-before-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][50] ([i915#3282]) +3 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-5/igt@gem_madvise@dontneed-before-pwrite.html

  * igt@gem_media_vme:
    - shard-rkl:          NOTRUN -> [SKIP][51] ([i915#284])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-7/igt@gem_media_vme.html

  * igt@gem_mmap_gtt@basic-short:
    - shard-mtlp:         NOTRUN -> [SKIP][52] ([i915#4077]) +6 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-6/igt@gem_mmap_gtt@basic-short.html

  * igt@gem_mmap_gtt@cpuset-big-copy-odd:
    - shard-dg1:          NOTRUN -> [SKIP][53] ([i915#4077]) +6 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-13/igt@gem_mmap_gtt@cpuset-big-copy-odd.html

  * igt@gem_mmap_wc@bad-object:
    - shard-dg2:          NOTRUN -> [SKIP][54] ([i915#4083]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-7/igt@gem_mmap_wc@bad-object.html
    - shard-mtlp:         NOTRUN -> [SKIP][55] ([i915#4083]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-7/igt@gem_mmap_wc@bad-object.html

  * igt@gem_pread@snoop:
    - shard-dg2:          NOTRUN -> [SKIP][56] ([i915#3282])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-5/igt@gem_pread@snoop.html
    - shard-dg1:          NOTRUN -> [SKIP][57] ([i915#3282]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-13/igt@gem_pread@snoop.html
    - shard-mtlp:         NOTRUN -> [SKIP][58] ([i915#3282])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-4/igt@gem_pread@snoop.html

  * igt@gem_pxp@hw-rejects-pxp-context:
    - shard-tglu:         NOTRUN -> [SKIP][59] ([i915#13398])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-7/igt@gem_pxp@hw-rejects-pxp-context.html

  * igt@gem_pxp@verify-pxp-stale-ctx-execution:
    - shard-dg2:          NOTRUN -> [SKIP][60] ([i915#4270]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-5/igt@gem_pxp@verify-pxp-stale-ctx-execution.html
    - shard-dg1:          NOTRUN -> [SKIP][61] ([i915#4270]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-13/igt@gem_pxp@verify-pxp-stale-ctx-execution.html

  * igt@gem_render_copy@y-tiled-ccs-to-x-tiled:
    - shard-snb:          NOTRUN -> [SKIP][62] +65 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-snb4/igt@gem_render_copy@y-tiled-ccs-to-x-tiled.html
    - shard-mtlp:         NOTRUN -> [SKIP][63] ([i915#8428]) +3 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-7/igt@gem_render_copy@y-tiled-ccs-to-x-tiled.html

  * igt@gem_render_copy@yf-tiled-ccs-to-linear:
    - shard-dg2:          NOTRUN -> [SKIP][64] ([i915#5190] / [i915#8428]) +4 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-1/igt@gem_render_copy@yf-tiled-ccs-to-linear.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-tglu-1:       NOTRUN -> [SKIP][65] ([i915#3297]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-dg2:          NOTRUN -> [SKIP][66] ([i915#3297] / [i915#4880])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-8/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
    - shard-mtlp:         NOTRUN -> [SKIP][67] ([i915#3297])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-8/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@gem_userptr_blits@readonly-unsync:
    - shard-rkl:          NOTRUN -> [SKIP][68] ([i915#3297])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-3/igt@gem_userptr_blits@readonly-unsync.html

  * igt@gem_userptr_blits@unsync-overlap:
    - shard-tglu:         NOTRUN -> [SKIP][69] ([i915#3297]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-5/igt@gem_userptr_blits@unsync-overlap.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-dg2:          NOTRUN -> [SKIP][70] ([i915#3297])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-1/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gem_workarounds@suspend-resume:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][71] ([i915#13356] / [i915#14586])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk11/igt@gem_workarounds@suspend-resume.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-glk:          [PASS][72] -> [INCOMPLETE][73] ([i915#13356])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-glk6/igt@gem_workarounds@suspend-resume-context.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk1/igt@gem_workarounds@suspend-resume-context.html

  * igt@gen9_exec_parse@batch-invalid-length:
    - shard-dg2:          NOTRUN -> [SKIP][74] ([i915#2856]) +2 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-6/igt@gen9_exec_parse@batch-invalid-length.html
    - shard-dg1:          NOTRUN -> [SKIP][75] ([i915#2527])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-17/igt@gen9_exec_parse@batch-invalid-length.html
    - shard-mtlp:         NOTRUN -> [SKIP][76] ([i915#2856])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-7/igt@gen9_exec_parse@batch-invalid-length.html

  * igt@gen9_exec_parse@bb-oversize:
    - shard-tglu:         NOTRUN -> [SKIP][77] ([i915#2527] / [i915#2856]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-4/igt@gen9_exec_parse@bb-oversize.html

  * igt@gen9_exec_parse@bb-start-far:
    - shard-rkl:          NOTRUN -> [SKIP][78] ([i915#2527]) +6 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-7/igt@gen9_exec_parse@bb-start-far.html

  * igt@gen9_exec_parse@secure-batches:
    - shard-tglu-1:       NOTRUN -> [SKIP][79] ([i915#2527] / [i915#2856]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@gen9_exec_parse@secure-batches.html

  * igt@i915_module_load@fault-injection@intel_connector_register:
    - shard-glk:          NOTRUN -> [ABORT][80] ([i915#15342]) +1 other test abort
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk1/igt@i915_module_load@fault-injection@intel_connector_register.html

  * igt@i915_module_load@reload-no-display:
    - shard-tglu-1:       NOTRUN -> [DMESG-WARN][81] ([i915#13029] / [i915#14545])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@i915_module_load@reload-no-display.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][82] ([i915#8399]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-10/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_freq_api@freq-suspend@gt0:
    - shard-dg2:          [PASS][83] -> [INCOMPLETE][84] ([i915#13356] / [i915#13820]) +1 other test incomplete
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-dg2-8/igt@i915_pm_freq_api@freq-suspend@gt0.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-10/igt@i915_pm_freq_api@freq-suspend@gt0.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-tglu-1:       NOTRUN -> [SKIP][85] ([i915#16080] / [i915#16166])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][86] ([i915#13356])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk3/igt@i915_pm_rpm@system-suspend.html

  * igt@i915_pm_rps@waitboost:
    - shard-mtlp:         [PASS][87] -> [FAIL][88] ([i915#15365] / [i915#16503])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-mtlp-4/igt@i915_pm_rps@waitboost.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-6/igt@i915_pm_rps@waitboost.html

  * igt@i915_pm_sseu@full-enable:
    - shard-rkl:          NOTRUN -> [SKIP][89] ([i915#4387])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-3/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@hwconfig_table:
    - shard-dg1:          NOTRUN -> [SKIP][90] ([i915#6245])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-18/igt@i915_query@hwconfig_table.html

  * igt@i915_query@query-topology-unsupported:
    - shard-rkl:          NOTRUN -> [SKIP][91] ([i915#16079])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-5/igt@i915_query@query-topology-unsupported.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-rkl:          NOTRUN -> [SKIP][92] ([i915#5723])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-5/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-glk:          [PASS][93] -> [INCOMPLETE][94] ([i915#16182] / [i915#4817])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-glk2/igt@i915_suspend@fence-restore-tiled2untiled.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk8/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-rkl:          [PASS][95] -> [INCOMPLETE][96] ([i915#4817]) +1 other test incomplete
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-2/igt@i915_suspend@fence-restore-untiled.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-3/igt@i915_suspend@fence-restore-untiled.html

  * igt@i915_suspend@forcewake:
    - shard-glk:          NOTRUN -> [INCOMPLETE][97] ([i915#16182] / [i915#4817])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk8/igt@i915_suspend@forcewake.html

  * igt@intel_hwmon@hwmon-write:
    - shard-tglu:         NOTRUN -> [SKIP][98] ([i915#7707])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-5/igt@intel_hwmon@hwmon-write.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-mtlp:         NOTRUN -> [SKIP][99] ([i915#1769] / [i915#3555])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-tglu-1:       NOTRUN -> [SKIP][100] ([i915#1769] / [i915#3555])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-glk:          NOTRUN -> [SKIP][101] ([i915#1769])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk9/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][102] ([i915#14544] / [i915#5286])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][103] ([i915#5286]) +4 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-5/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-tglu-1:       NOTRUN -> [SKIP][104] ([i915#5286]) +2 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
    - shard-tglu:         NOTRUN -> [SKIP][105] ([i915#5286]) +2 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-2/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-dg1:          NOTRUN -> [SKIP][106] ([i915#4538] / [i915#5286]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-14/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][107] ([i915#3638]) +3 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-3/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-tglu-1:       NOTRUN -> [SKIP][108] ([i915#3828])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-rkl:          NOTRUN -> [SKIP][109] ([i915#3828]) +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][110] ([i915#3638])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-15/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-mtlp:         NOTRUN -> [SKIP][111] +4 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-2/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-dg2:          NOTRUN -> [SKIP][112] ([i915#4538] / [i915#5190]) +3 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-7/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-dg2:          NOTRUN -> [SKIP][113] ([i915#5190]) +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-5/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][114] ([i915#4538])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-12/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][115] ([i915#6095]) +240 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-16/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][116] ([i915#10307] / [i915#10434] / [i915#6095]) +2 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-4/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][117] ([i915#6095]) +24 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-4/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-edp-1.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][118] ([i915#4423] / [i915#6095])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-12/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][119] ([i915#14098] / [i915#14544] / [i915#6095]) +1 other test skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][120] ([i915#6095]) +69 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-4/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][121] ([i915#12313])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-8/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
    - shard-tglu-1:       NOTRUN -> [SKIP][122] ([i915#12313]) +2 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][123] ([i915#12313])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-5/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][124] ([i915#6095]) +44 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:
    - shard-tglu:         NOTRUN -> [SKIP][125] ([i915#6095]) +54 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][126] ([i915#10307] / [i915#6095]) +70 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][127] ([i915#15582]) +1 other test incomplete
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][128] ([i915#6095]) +7 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-3.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][129] ([i915#12313])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][130] ([i915#14098] / [i915#6095]) +46 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-4/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][131] ([i915#14544] / [i915#6095]) +3 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-mtlp:         NOTRUN -> [SKIP][132] ([i915#11151] / [i915#7828]) +2 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-4/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_color_pipeline@plane-ctm3x4:
    - shard-mtlp:         NOTRUN -> [SKIP][133] ([i915#16464] / [i915#16471])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-2/igt@kms_chamelium_color_pipeline@plane-ctm3x4.html
    - shard-dg2:          NOTRUN -> [SKIP][134] ([i915#16471])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-3/igt@kms_chamelium_color_pipeline@plane-ctm3x4.html
    - shard-rkl:          NOTRUN -> [SKIP][135] ([i915#14544] / [i915#16471])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-ctm3x4.html
    - shard-dg1:          NOTRUN -> [SKIP][136] ([i915#16471])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-16/igt@kms_chamelium_color_pipeline@plane-ctm3x4.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d:
    - shard-tglu-1:       NOTRUN -> [SKIP][137] ([i915#16471])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@kms_chamelium_color_pipeline@plane-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:
    - shard-tglu:         NOTRUN -> [SKIP][138] ([i915#16471]) +1 other test skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-6/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:
    - shard-rkl:          NOTRUN -> [SKIP][139] ([i915#16471]) +1 other test skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-4/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-tglu-1:       NOTRUN -> [SKIP][140] ([i915#11151] / [i915#7828]) +4 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_frames@hdmi-cmp-planar-formats:
    - shard-dg1:          NOTRUN -> [SKIP][141] ([i915#11151] / [i915#7828]) +3 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-18/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-dg2:          NOTRUN -> [SKIP][142] ([i915#11151] / [i915#7828]) +3 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-7/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-glk11:        NOTRUN -> [SKIP][143] +26 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk11/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html
    - shard-rkl:          NOTRUN -> [SKIP][144] ([i915#11151] / [i915#14544] / [i915#7828])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-rkl:          NOTRUN -> [SKIP][145] ([i915#11151] / [i915#7828]) +7 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-4/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_chamelium_hpd@vga-hpd-without-ddc:
    - shard-tglu:         NOTRUN -> [SKIP][146] ([i915#11151] / [i915#7828]) +4 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-9/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html

  * igt@kms_color@deep-color:
    - shard-tglu-1:       NOTRUN -> [SKIP][147] ([i915#3555] / [i915#9979])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@kms_color@deep-color.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][148] ([i915#15330] / [i915#3116] / [i915#3299])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-rkl:          NOTRUN -> [SKIP][149] ([i915#15330] / [i915#3116]) +1 other test skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-8/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg2:          NOTRUN -> [SKIP][150] ([i915#15865]) +1 other test skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-3/igt@kms_content_protection@mei-interface.html
    - shard-tglu:         NOTRUN -> [SKIP][151] ([i915#15865]) +1 other test skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-5/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm:
    - shard-tglu-1:       NOTRUN -> [SKIP][152] ([i915#15865]) +1 other test skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@type1:
    - shard-rkl:          NOTRUN -> [SKIP][153] ([i915#15865]) +4 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-8/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-tglu:         NOTRUN -> [SKIP][154] ([i915#3555]) +2 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-7/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-tglu-1:       NOTRUN -> [SKIP][155] ([i915#13049])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-offscreen-64x21:
    - shard-mtlp:         NOTRUN -> [SKIP][156] ([i915#8814]) +1 other test skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-2/igt@kms_cursor_crc@cursor-offscreen-64x21.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-dg1:          NOTRUN -> [SKIP][157] ([i915#3555])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-12/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [FAIL][158] ([i915#13566]) +3 other tests fail
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-random-32x10:
    - shard-tglu-1:       NOTRUN -> [SKIP][159] ([i915#3555]) +2 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@kms_cursor_crc@cursor-random-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-rkl:          NOTRUN -> [SKIP][160] ([i915#3555]) +5 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-7/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1:
    - shard-rkl:          [PASS][161] -> [FAIL][162] ([i915#13566]) +2 other tests fail
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html
    - shard-tglu:         [PASS][163] -> [FAIL][164] ([i915#13566]) +3 other tests fail
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-tglu-10/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-4/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-sliding-256x85@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [FAIL][165] ([i915#13566])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-2/igt@kms_cursor_crc@cursor-sliding-256x85@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][166] ([i915#13049])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-7/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][167] ([i915#12358] / [i915#14152] / [i915#7882])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk2/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][168] ([i915#12358] / [i915#14152])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk2/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-mtlp:         NOTRUN -> [SKIP][169] ([i915#9809]) +1 other test skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-4/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-rkl:          NOTRUN -> [SKIP][170] ([i915#4103])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][171] ([i915#13046] / [i915#5354]) +1 other test skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-7/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-tglu-1:       NOTRUN -> [SKIP][172] ([i915#4103])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-tglu-1:       NOTRUN -> [SKIP][173] ([i915#1769] / [i915#3555] / [i915#3804])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][174] ([i915#3804])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html
    - shard-tglu-1:       NOTRUN -> [SKIP][175] ([i915#3804])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_dp_aux_dev@basic:
    - shard-rkl:          NOTRUN -> [SKIP][176] ([i915#1257])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-7/igt@kms_dp_aux_dev@basic.html
    - shard-tglu:         NOTRUN -> [SKIP][177] ([i915#1257])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-10/igt@kms_dp_aux_dev@basic.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-rkl:          NOTRUN -> [SKIP][178] ([i915#13749])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-4/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-rkl:          NOTRUN -> [SKIP][179] ([i915#13707])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-5/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-basic:
    - shard-rkl:          NOTRUN -> [SKIP][180] ([i915#16361]) +3 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-8/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-tglu-1:       NOTRUN -> [SKIP][181] ([i915#16361]) +2 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-dg1:          NOTRUN -> [SKIP][182] ([i915#16361])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-12/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-formats-bigjoiner:
    - shard-tglu:         NOTRUN -> [SKIP][183] ([i915#16361]) +1 other test skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-8/igt@kms_dsc@dsc-with-formats-bigjoiner.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2:          NOTRUN -> [SKIP][184] ([i915#16361]) +1 other test skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-8/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
    - shard-mtlp:         NOTRUN -> [SKIP][185] ([i915#16361])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-7/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][186] ([i915#9878])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk11/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-tglu-1:       NOTRUN -> [SKIP][187] ([i915#3469])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-2x:
    - shard-dg2:          NOTRUN -> [SKIP][188] ([i915#16081])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-8/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@psr1:
    - shard-rkl:          NOTRUN -> [SKIP][189] ([i915#658])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-4/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][190] ([i915#3637] / [i915#9934]) +3 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - shard-rkl:          NOTRUN -> [SKIP][191] ([i915#9934]) +6 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-8/igt@kms_flip@2x-flip-vs-dpms-on-nop.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-dg1:          NOTRUN -> [SKIP][192] ([i915#9934])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-14/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][193] ([i915#9934]) +2 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-4/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html
    - shard-tglu:         NOTRUN -> [SKIP][194] ([i915#3637] / [i915#9934]) +2 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-4/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-rkl:          NOTRUN -> [SKIP][195] ([i915#14544] / [i915#9934])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@blocking-wf_vblank@c-hdmi-a1:
    - shard-dg1:          NOTRUN -> [FAIL][196] ([i915#14600])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-14/igt@kms_flip@blocking-wf_vblank@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-rkl:          [PASS][197] -> [INCOMPLETE][198] ([i915#16276] / [i915#6113])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-2/igt@kms_flip@flip-vs-suspend.html
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-3/igt@kms_flip@flip-vs-suspend.html
    - shard-glk:          NOTRUN -> [INCOMPLETE][199] ([i915#12745] / [i915#4839] / [i915#6113])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk3/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-glk:          NOTRUN -> [INCOMPLETE][200] ([i915#12314] / [i915#12745] / [i915#4839] / [i915#6113])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk5/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][201] ([i915#12314] / [i915#12745])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk5/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][202] ([i915#12745] / [i915#6113])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk3/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a2:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][203] ([i915#16276] / [i915#6113])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-3/igt@kms_flip@flip-vs-suspend@a-hdmi-a2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][204] ([i915#15643]) +1 other test skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][205] ([i915#15643])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][206] ([i915#15643]) +4 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][207] ([i915#15643]) +2 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][208] ([i915#3555] / [i915#8810] / [i915#8813]) +1 other test skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][209] ([i915#15643] / [i915#5190]) +1 other test skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:
    - shard-dg2:          NOTRUN -> [SKIP][210] ([i915#15991] / [i915#5354]) +9 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][211] ([i915#1825]) +2 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-rkl:          [PASS][212] -> [INCOMPLETE][213] ([i915#10056])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-suspend.html
    - shard-glk10:        NOTRUN -> [INCOMPLETE][214] ([i915#10056])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk10/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-tglu:         NOTRUN -> [SKIP][215] ([i915#5439])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-5/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff:
    - shard-rkl:          [PASS][216] -> [SKIP][217] ([i915#15989]) +3 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-1/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff.html
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-7/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-shrfb-plflip-blt:
    - shard-tglu:         NOTRUN -> [SKIP][218] +56 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-10/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-farfromfence-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][219] ([i915#15990]) +10 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-16/igt@kms_frontbuffer_tracking@fbchdr-farfromfence-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][220] ([i915#15989]) +7 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-7/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-suspend:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][221] ([i915#16056])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk10/igt@kms_frontbuffer_tracking@fbchdr-suspend.html

  * igt@kms_frontbuffer_tracking@fbchdr-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][222] ([i915#5439]) +1 other test skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-7/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][223] ([i915#14544] / [i915#15102] / [i915#3023])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][224] ([i915#15104] / [i915#15990])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt:
    - shard-rkl:          NOTRUN -> [SKIP][225] ([i915#15102]) +23 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][226] ([i915#15104] / [i915#15990])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt:
    - shard-tglu:         NOTRUN -> [SKIP][227] ([i915#15102]) +21 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
    - shard-dg1:          NOTRUN -> [SKIP][228] +22 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
    - shard-tglu-1:       NOTRUN -> [SKIP][229] +76 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][230] ([i915#14544] / [i915#1825]) +1 other test skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][231] ([i915#15991] / [i915#1825]) +8 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][232] ([i915#15990] / [i915#8708]) +4 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-tglu-1:       NOTRUN -> [SKIP][233] ([i915#5439])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
    - shard-dg1:          NOTRUN -> [SKIP][234] ([i915#5439])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][235] ([i915#15990]) +9 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-plflip-blt:
    - shard-dg1:          NOTRUN -> [SKIP][236] ([i915#15102]) +12 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte:
    - shard-tglu-1:       NOTRUN -> [SKIP][237] ([i915#15102]) +24 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-mtlp:         NOTRUN -> [SKIP][238] ([i915#15991]) +11 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-tglu:         NOTRUN -> [SKIP][239] ([i915#15989]) +8 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-shrfb-plflip-blt:
    - shard-dg1:          NOTRUN -> [SKIP][240] ([i915#15989]) +3 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-18/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][241] ([i915#15990]) +6 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-8/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-glk:          [PASS][242] -> [SKIP][243] +11 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-glk8/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-mmap-cpu.html
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk4/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-glk:          NOTRUN -> [SKIP][244] +498 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk9/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-indfb-scaledprimary:
    - shard-tglu-1:       NOTRUN -> [SKIP][245] ([i915#15989]) +15 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@kms_frontbuffer_tracking@hdr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][246] ([i915#15989]) +20 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-2/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][247] ([i915#15102]) +10 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt.html
    - shard-rkl:          NOTRUN -> [SKIP][248] ([i915#14544] / [i915#15102]) +5 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][249] ([i915#15990] / [i915#8708]) +4 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][250] ([i915#15102] / [i915#3023]) +22 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-pgflip-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][251] ([i915#15989]) +10 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-8/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move:
    - shard-rkl:          NOTRUN -> [SKIP][252] +90 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-3/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][253] ([i915#15991]) +9 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-8/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-dg1:          NOTRUN -> [SKIP][254] ([i915#3555] / [i915#8228])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-16/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-toggle:
    - shard-rkl:          NOTRUN -> [SKIP][255] ([i915#3555] / [i915#8228])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-5/igt@kms_hdr@static-toggle.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-tglu-1:       NOTRUN -> [SKIP][256] ([i915#3555] / [i915#8228]) +1 other test skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][257] ([i915#15458])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][258] ([i915#13688])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-10/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][259] ([i915#15458])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-4/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_mst@mst-suspend-read-crc:
    - shard-tglu:         NOTRUN -> [SKIP][260] ([i915#16451])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-6/igt@kms_mst@mst-suspend-read-crc.html

  * igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:
    - shard-dg2:          NOTRUN -> [SKIP][261] +5 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-3/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-rkl:          [PASS][262] -> [INCOMPLETE][263] ([i915#12756] / [i915#13476])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-4/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-4/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-2:
    - shard-rkl:          [PASS][264] -> [INCOMPLETE][265] ([i915#13476])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-2.html
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-2.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][266] ([i915#13409] / [i915#13476])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-2.html

  * igt@kms_pipe_stress@stress-xrgb8888-4tiled:
    - shard-tglu-1:       NOTRUN -> [SKIP][267] ([i915#14712])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-rkl:          NOTRUN -> [SKIP][268] ([i915#14712])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-5/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:
    - shard-dg1:          NOTRUN -> [SKIP][269] ([i915#15709])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-15/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier:
    - shard-tglu-1:       NOTRUN -> [SKIP][270] ([i915#15709]) +2 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping:
    - shard-rkl:          NOTRUN -> [SKIP][271] ([i915#15709]) +2 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-5/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier:
    - shard-mtlp:         NOTRUN -> [SKIP][272] ([i915#15709])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-4/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-a-plane-5:
    - shard-rkl:          NOTRUN -> [SKIP][273] ([i915#16386]) +1 other test skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-2/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-a-plane-5.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-7:
    - shard-tglu-1:       NOTRUN -> [SKIP][274] ([i915#16386]) +1 other test skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-7.html
    - shard-dg1:          NOTRUN -> [SKIP][275] ([i915#16386]) +1 other test skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-13/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-7.html

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:
    - shard-tglu:         NOTRUN -> [SKIP][276] ([i915#15709]) +2 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-2/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html
    - shard-dg2:          NOTRUN -> [SKIP][277] ([i915#15709]) +1 other test skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-8/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][278] ([i915#13026]) +1 other test incomplete
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk11/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb:
    - shard-glk:          NOTRUN -> [FAIL][279] ([i915#10647] / [i915#12177])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk9/igt@kms_plane_alpha_blend@alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][280] ([i915#10647]) +1 other test fail
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk9/igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1.html

  * igt@kms_plane_alpha_blend@constant-alpha-max:
    - shard-glk10:        NOTRUN -> [FAIL][281] ([i915#10647] / [i915#12169])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk10/igt@kms_plane_alpha_blend@constant-alpha-max.html

  * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-a-hdmi-a-1:
    - shard-glk10:        NOTRUN -> [FAIL][282] ([i915#10647]) +1 other test fail
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk10/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-a-hdmi-a-1.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-rkl:          NOTRUN -> [SKIP][283] ([i915#14544] / [i915#3555])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][284] ([i915#13958])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-7/igt@kms_plane_multiple@2x-tiling-4.html
    - shard-dg1:          NOTRUN -> [SKIP][285] ([i915#13958])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-14/igt@kms_plane_multiple@2x-tiling-4.html
    - shard-tglu:         NOTRUN -> [SKIP][286] ([i915#13958])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-10/igt@kms_plane_multiple@2x-tiling-4.html
    - shard-mtlp:         NOTRUN -> [SKIP][287] ([i915#13958])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-3/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@tiling-4:
    - shard-tglu:         NOTRUN -> [SKIP][288] ([i915#14259])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-9/igt@kms_plane_multiple@tiling-4.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-mtlp:         NOTRUN -> [SKIP][289] ([i915#14259])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-2/igt@kms_plane_multiple@tiling-yf.html
    - shard-dg2:          NOTRUN -> [SKIP][290] ([i915#14259])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-4/igt@kms_plane_multiple@tiling-yf.html

  * {igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-2-yuyv-horizontal} (NEW):
    - shard-glk10:        NOTRUN -> [SKIP][291] +145 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk10/igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-2-yuyv-horizontal.html

  * {igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-2-p010-horizontal} (NEW):
    - shard-rkl:          NOTRUN -> [SKIP][292] ([i915#14544]) +18 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-2-p010-horizontal.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d:
    - shard-tglu-1:       NOTRUN -> [SKIP][293] ([i915#15329]) +4 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:
    - shard-mtlp:         NOTRUN -> [SKIP][294] ([i915#15329] / [i915#6953])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-b:
    - shard-mtlp:         NOTRUN -> [SKIP][295] ([i915#15329]) +3 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-b.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-tglu:         NOTRUN -> [SKIP][296] ([i915#12343] / [i915#9812])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-7/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-tglu-1:       NOTRUN -> [SKIP][297] ([i915#12343] / [i915#9812])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][298] ([i915#12343] / [i915#5354]) +1 other test skip
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-6/igt@kms_pm_backlight@fade-with-suspend.html
    - shard-rkl:          NOTRUN -> [SKIP][299] ([i915#12343] / [i915#5354])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-3/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-pageflip-negative:
    - shard-rkl:          NOTRUN -> [SKIP][300] ([i915#14544] / [i915#9685])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_pm_dc@dc5-pageflip-negative.html

  * igt@kms_pm_rpm@fences-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][301] ([i915#4077]) +6 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-5/igt@kms_pm_rpm@fences-dpms.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg1:          [PASS][302] -> [SKIP][303] ([i915#15073])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-dg1-15/igt@kms_pm_rpm@modeset-lpsp.html
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-18/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-dg2:          [PASS][304] -> [SKIP][305] ([i915#15073])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-dg2-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
    - shard-rkl:          NOTRUN -> [SKIP][306] ([i915#15073])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@package-g7:
    - shard-tglu:         NOTRUN -> [SKIP][307] ([i915#15403])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-8/igt@kms_pm_rpm@package-g7.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-rkl:          NOTRUN -> [SKIP][308] ([i915#6524])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-8/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-dg1:          NOTRUN -> [SKIP][309] ([i915#6524])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-19/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-rkl:          NOTRUN -> [SKIP][310] ([i915#11520]) +5 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-5/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:
    - shard-snb:          NOTRUN -> [SKIP][311] ([i915#11520]) +1 other test skip
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-snb4/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html
    - shard-dg1:          NOTRUN -> [SKIP][312] ([i915#11520]) +3 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-16/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][313] ([i915#11520]) +6 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-mtlp:         NOTRUN -> [SKIP][314] ([i915#12316]) +2 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-2/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
    - shard-glk11:        NOTRUN -> [SKIP][315] ([i915#11520])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk11/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - shard-dg2:          NOTRUN -> [SKIP][316] ([i915#11520]) +4 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-4/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html
    - shard-tglu:         NOTRUN -> [SKIP][317] ([i915#11520]) +5 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-6/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html
    - shard-glk10:        NOTRUN -> [SKIP][318] ([i915#11520]) +2 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk10/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][319] ([i915#11520]) +6 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk6/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-rkl:          NOTRUN -> [SKIP][320] ([i915#9683])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-5/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-cursor-plane-onoff:
    - shard-tglu:         NOTRUN -> [SKIP][321] ([i915#9732]) +13 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-6/igt@kms_psr@fbc-psr-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr-sprite-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][322] ([i915#1072] / [i915#9732]) +9 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-5/igt@kms_psr@fbc-psr-sprite-mmap-gtt.html

  * igt@kms_psr@fbc-psr-sprite-plane-move:
    - shard-rkl:          NOTRUN -> [SKIP][323] ([i915#1072] / [i915#14544] / [i915#9732]) +1 other test skip
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_psr@fbc-psr-sprite-plane-move.html

  * igt@kms_psr@fbc-psr2-primary-mmap-cpu:
    - shard-mtlp:         NOTRUN -> [SKIP][324] ([i915#9688]) +6 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-2/igt@kms_psr@fbc-psr2-primary-mmap-cpu.html

  * igt@kms_psr@psr-cursor-render:
    - shard-dg1:          NOTRUN -> [SKIP][325] ([i915#1072] / [i915#9732]) +8 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-14/igt@kms_psr@psr-cursor-render.html

  * igt@kms_psr@psr-sprite-mmap-cpu:
    - shard-tglu-1:       NOTRUN -> [SKIP][326] ([i915#9732]) +14 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@kms_psr@psr-sprite-mmap-cpu.html

  * igt@kms_psr@psr-sprite-mmap-gtt@edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][327] ([i915#4077] / [i915#9688]) +1 other test skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-4/igt@kms_psr@psr-sprite-mmap-gtt@edp-1.html

  * igt@kms_psr@psr2-sprite-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][328] ([i915#1072] / [i915#9732]) +19 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-3/igt@kms_psr@psr2-sprite-mmap-cpu.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-tglu:         NOTRUN -> [SKIP][329] ([i915#15949])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
    - shard-dg2:          NOTRUN -> [SKIP][330] ([i915#15949])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-mtlp:         NOTRUN -> [SKIP][331] ([i915#12755] / [i915#15867])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-7/igt@kms_rotation_crc@primary-rotation-90.html
    - shard-dg2:          NOTRUN -> [SKIP][332] ([i915#12755] / [i915#15867])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-6/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-rkl:          NOTRUN -> [SKIP][333] ([i915#5289]) +1 other test skip
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
    - shard-tglu-1:       NOTRUN -> [SKIP][334] ([i915#5289]) +1 other test skip
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
    - shard-dg1:          NOTRUN -> [SKIP][335] ([i915#5289])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-13/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
    - shard-mtlp:         NOTRUN -> [SKIP][336] ([i915#5289])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][337] ([i915#15243] / [i915#3555])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-6/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@max-min:
    - shard-rkl:          NOTRUN -> [SKIP][338] ([i915#14544] / [i915#9906])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_vrr@max-min.html

  * igt@kms_vrr@negative-basic:
    - shard-rkl:          NOTRUN -> [SKIP][339] ([i915#3555] / [i915#9906])
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-5/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-tglu-1:       NOTRUN -> [SKIP][340] ([i915#9906])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-rkl:          NOTRUN -> [SKIP][341] ([i915#2435])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-8/igt@perf@per-context-mode-unprivileged.html

  * igt@perf_pmu@semaphore-busy:
    - shard-dg2:          [PASS][342] -> [FAIL][343] ([i915#4349]) +1 other test fail
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-dg2-8/igt@perf_pmu@semaphore-busy.html
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-7/igt@perf_pmu@semaphore-busy.html

  * igt@perf_pmu@semaphore-busy@bcs0:
    - shard-mtlp:         [PASS][344] -> [FAIL][345] ([i915#4349]) +2 other tests fail
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-mtlp-5/igt@perf_pmu@semaphore-busy@bcs0.html
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-8/igt@perf_pmu@semaphore-busy@bcs0.html

  * igt@prime_udl@share-import-addfb:
    - shard-rkl:          NOTRUN -> [SKIP][346] ([i915#16420])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-5/igt@prime_udl@share-import-addfb.html

  * igt@prime_vgem@basic-write:
    - shard-rkl:          NOTRUN -> [SKIP][347] ([i915#3291] / [i915#3708]) +1 other test skip
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-5/igt@prime_vgem@basic-write.html

  * igt@sriov_basic@bind-unbind-vf:
    - shard-rkl:          NOTRUN -> [SKIP][348] ([i915#9917])
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-8/igt@sriov_basic@bind-unbind-vf.html

  
#### Possible fixes ####

  * igt@gem_ctx_freq@sysfs@gt0:
    - shard-dg2:          [FAIL][349] ([i915#9561]) -> [PASS][350] +1 other test pass
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-dg2-5/igt@gem_ctx_freq@sysfs@gt0.html
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-5/igt@gem_ctx_freq@sysfs@gt0.html

  * igt@gem_softpin@noreloc-s3:
    - shard-rkl:          [ABORT][351] ([i915#15131]) -> [PASS][352]
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-1/igt@gem_softpin@noreloc-s3.html
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-7/igt@gem_softpin@noreloc-s3.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-rkl:          [INCOMPLETE][353] ([i915#13356]) -> [PASS][354]
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-3/igt@gem_workarounds@suspend-resume-context.html
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-4/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_pm_rpm@reg-read-ioctl:
    - shard-dg1:          [DMESG-WARN][355] ([i915#4391] / [i915#4423]) -> [PASS][356]
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-dg1-15/igt@i915_pm_rpm@reg-read-ioctl.html
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-17/igt@i915_pm_rpm@reg-read-ioctl.html

  * igt@i915_selftest@live@gt_engines:
    - shard-mtlp:         [INCOMPLETE][357] ([i915#16229]) -> [PASS][358] +1 other test pass
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-mtlp-5/igt@i915_selftest@live@gt_engines.html
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-3/igt@i915_selftest@live@gt_engines.html

  * igt@i915_suspend@debugfs-reader:
    - shard-rkl:          [ABORT][359] ([i915#15131] / [i915#15140]) -> [PASS][360]
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-1/igt@i915_suspend@debugfs-reader.html
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-2/igt@i915_suspend@debugfs-reader.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          [INCOMPLETE][361] ([i915#14694] / [i915#15582]) -> [PASS][362] +1 other test pass
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2.html
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-tglu:         [FAIL][363] ([i915#13566]) -> [PASS][364] +3 other tests pass
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-tglu-6/igt@kms_cursor_crc@cursor-onscreen-256x85.html
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-9/igt@kms_cursor_crc@cursor-onscreen-256x85.html
    - shard-rkl:          [FAIL][365] ([i915#13566]) -> [PASS][366]
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-256x85.html
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-8/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-onoff:
    - shard-rkl:          [SKIP][367] ([i915#15989]) -> [PASS][368] +5 other tests pass
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-4/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-onoff.html
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-rte:
    - shard-dg2:          [SKIP][369] ([i915#15989]) -> [PASS][370]
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-dg2-6/igt@kms_frontbuffer_tracking@fbchdr-1p-rte.html
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-10/igt@kms_frontbuffer_tracking@fbchdr-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-pwrite:
    - shard-glk:          [SKIP][371] -> [PASS][372] +3 other tests pass
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-glk1/igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-pwrite.html
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-pwrite.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-rkl:          [SKIP][373] ([i915#3555] / [i915#8228]) -> [PASS][374]
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-8/igt@kms_hdr@invalid-metadata-sizes.html
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
    - shard-glk:          [INCOMPLETE][375] ([i915#12756] / [i915#13409] / [i915#13476]) -> [PASS][376]
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-glk8/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg2:          [SKIP][377] ([i915#15073]) -> [PASS][378] +1 other test pass
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-dg2-7/igt@kms_pm_rpm@dpms-lpsp.html
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-4/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-rkl:          [SKIP][379] ([i915#15073]) -> [PASS][380]
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@i2c:
    - shard-dg1:          [DMESG-WARN][381] ([i915#4423]) -> [PASS][382] +2 other tests pass
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-dg1-16/igt@kms_pm_rpm@i2c.html
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-12/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg1:          [SKIP][383] ([i915#15073]) -> [PASS][384] +1 other test pass
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-dg1-15/igt@kms_pm_rpm@modeset-non-lpsp.html
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-13/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@perf_pmu@all-busy-idle-check-all:
    - shard-dg2:          [FAIL][385] ([i915#15453]) -> [PASS][386]
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-dg2-6/igt@perf_pmu@all-busy-idle-check-all.html
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-7/igt@perf_pmu@all-busy-idle-check-all.html
    - shard-mtlp:         [FAIL][387] ([i915#15453]) -> [PASS][388]
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-mtlp-5/igt@perf_pmu@all-busy-idle-check-all.html
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-8/igt@perf_pmu@all-busy-idle-check-all.html

  
#### Warnings ####

  * igt@gem_ctx_sseu@engines:
    - shard-rkl:          [SKIP][389] ([i915#280]) -> [SKIP][390] ([i915#14544] / [i915#280])
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-2/igt@gem_ctx_sseu@engines.html
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@gem_ctx_sseu@engines.html

  * igt@gem_exec_reloc@basic-gtt-read:
    - shard-rkl:          [SKIP][391] ([i915#14544] / [i915#3281]) -> [SKIP][392] ([i915#3281]) +2 other tests skip
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-read.html
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-2/igt@gem_exec_reloc@basic-gtt-read.html

  * igt@gem_exec_reloc@basic-write-read-active:
    - shard-rkl:          [SKIP][393] ([i915#3281]) -> [SKIP][394] ([i915#14544] / [i915#3281]) +1 other test skip
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-4/igt@gem_exec_reloc@basic-write-read-active.html
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@gem_exec_reloc@basic-write-read-active.html

  * igt@gem_huc_copy@huc-copy:
    - shard-rkl:          [SKIP][395] ([i915#2190]) -> [SKIP][396] ([i915#14544] / [i915#2190])
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-8/igt@gem_huc_copy@huc-copy.html
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-rkl:          [SKIP][397] ([i915#14544] / [i915#4613]) -> [SKIP][398] ([i915#4613]) +1 other test skip
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-6/igt@gem_lmem_swapping@verify-random.html
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-8/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_pread@display:
    - shard-rkl:          [SKIP][399] ([i915#14544] / [i915#3282]) -> [SKIP][400] ([i915#3282])
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-6/igt@gem_pread@display.html
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-5/igt@gem_pread@display.html

  * igt@gem_softpin@evict-snoop:
    - shard-rkl:          [SKIP][401] ([i915#14544]) -> [SKIP][402] +27 other tests skip
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-6/igt@gem_softpin@evict-snoop.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-4/igt@gem_softpin@evict-snoop.html

  * igt@gen9_exec_parse@basic-rejected-ctx-param:
    - shard-rkl:          [SKIP][403] ([i915#2527]) -> [SKIP][404] ([i915#14544] / [i915#2527])
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-8/igt@gen9_exec_parse@basic-rejected-ctx-param.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@gen9_exec_parse@basic-rejected-ctx-param.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-rkl:          [SKIP][405] ([i915#14544] / [i915#2527]) -> [SKIP][406] ([i915#2527])
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-6/igt@gen9_exec_parse@bb-start-out.html
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-5/igt@gen9_exec_parse@bb-start-out.html

  * igt@i915_pm_freq_api@freq-reset:
    - shard-rkl:          [SKIP][407] ([i915#14544] / [i915#8399]) -> [SKIP][408] ([i915#8399])
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-6/igt@i915_pm_freq_api@freq-reset.html
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-8/igt@i915_pm_freq_api@freq-reset.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-rkl:          [SKIP][409] ([i915#6590]) -> [SKIP][410] ([i915#14544] / [i915#6590]) +1 other test skip
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-7/igt@i915_pm_freq_mult@media-freq@gt0.html
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-rkl:          [SKIP][411] ([i915#14544] / [i915#5286]) -> [SKIP][412] ([i915#5286]) +1 other test skip
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-7/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-rkl:          [SKIP][413] ([i915#5286]) -> [SKIP][414] ([i915#14544] / [i915#5286])
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - shard-dg1:          [SKIP][415] ([i915#4538]) -> [SKIP][416] ([i915#4423] / [i915#4538])
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-dg1-13/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-16/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs:
    - shard-dg1:          [SKIP][417] ([i915#6095]) -> [SKIP][418] ([i915#4423] / [i915#6095])
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-dg1-19/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs.html
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-12/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:
    - shard-rkl:          [SKIP][419] ([i915#14098] / [i915#6095]) -> [SKIP][420] ([i915#14098] / [i915#14544] / [i915#6095]) +7 other tests skip
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-2/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-rkl:          [SKIP][421] ([i915#12313]) -> [SKIP][422] ([i915#12313] / [i915#14544])
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-8/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2:
    - shard-rkl:          [SKIP][423] ([i915#14544] / [i915#6095]) -> [SKIP][424] ([i915#6095]) +1 other test skip
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-glk:          [INCOMPLETE][425] ([i915#14694] / [i915#15582]) -> [INCOMPLETE][426] ([i915#15582]) +1 other test incomplete
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-glk1/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk4/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          [SKIP][427] ([i915#6095]) -> [SKIP][428] ([i915#14544] / [i915#6095]) +4 other tests skip
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-2.html
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc:
    - shard-rkl:          [SKIP][429] ([i915#14098] / [i915#14544] / [i915#6095]) -> [SKIP][430] ([i915#14098] / [i915#6095]) +5 other tests skip
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc.html
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-rkl:          [SKIP][431] ([i915#12313] / [i915#14544]) -> [SKIP][432] ([i915#12313]) +1 other test skip
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-4/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-rkl:          [SKIP][433] ([i915#3742]) -> [SKIP][434] ([i915#14544] / [i915#3742])
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-2/igt@kms_cdclk@mode-transition-all-outputs.html
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_frames@hdmi-frame-dump:
    - shard-rkl:          [SKIP][435] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][436] ([i915#11151] / [i915#7828]) +4 other tests skip
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-6/igt@kms_chamelium_frames@hdmi-frame-dump.html
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-4/igt@kms_chamelium_frames@hdmi-frame-dump.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-rkl:          [SKIP][437] ([i915#11151] / [i915#7828]) -> [SKIP][438] ([i915#11151] / [i915#14544] / [i915#7828])
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-7/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_content_protection@content-type-change:
    - shard-dg2:          [ABORT][439] ([i915#13562]) -> [SKIP][440] ([i915#15865])
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-dg2-8/igt@kms_content_protection@content-type-change.html
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-6/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-rkl:          [SKIP][441] ([i915#15330] / [i915#3116]) -> [SKIP][442] ([i915#14544] / [i915#15330] / [i915#3116])
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-5/igt@kms_content_protection@dp-mst-lic-type-1.html
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@mei-interface:
    - shard-rkl:          [SKIP][443] ([i915#15865]) -> [SKIP][444] ([i915#14544] / [i915#15865]) +2 other tests skip
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-4/igt@kms_content_protection@mei-interface.html
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_content_protection@mei-interface.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-rkl:          [SKIP][445] ([i915#3555]) -> [SKIP][446] ([i915#14544] / [i915#3555])
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-1/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-rkl:          [SKIP][447] ([i915#4103]) -> [SKIP][448] ([i915#14544] / [i915#4103])
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-rkl:          [SKIP][449] ([i915#13748] / [i915#14544]) -> [SKIP][450] ([i915#13748])
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-6/igt@kms_dp_link_training@uhbr-sst.html
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-7/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dsc@dsc-basic-ultrajoiner:
    - shard-rkl:          [SKIP][451] ([i915#16361]) -> [SKIP][452] ([i915#14544] / [i915#16361]) +1 other test skip
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-7/igt@kms_dsc@dsc-basic-ultrajoiner.html
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_dsc@dsc-basic-ultrajoiner.html

  * igt@kms_fbcon_fbt@psr:
    - shard-rkl:          [SKIP][453] ([i915#3955]) -> [SKIP][454] ([i915#14544] / [i915#3955])
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-4/igt@kms_fbcon_fbt@psr.html
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_fbcon_fbt@psr.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-rkl:          [SKIP][455] ([i915#9934]) -> [SKIP][456] ([i915#14544] / [i915#9934])
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-5/igt@kms_flip@2x-blocking-wf_vblank.html
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-plain-flip:
    - shard-rkl:          [SKIP][457] ([i915#14544] / [i915#9934]) -> [SKIP][458] ([i915#9934]) +2 other tests skip
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-6/igt@kms_flip@2x-plain-flip.html
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-5/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-rkl:          [SKIP][459] ([i915#15643]) -> [SKIP][460] ([i915#14544] / [i915#15643]) +2 other tests skip
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu:
    - shard-dg1:          [SKIP][461] -> [SKIP][462] ([i915#4423])
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-dg1-15/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu.html
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-13/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-rkl:          [SKIP][463] ([i915#5439]) -> [SKIP][464] ([i915#14544] / [i915#5439])
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-pwrite:
    - shard-rkl:          [SKIP][465] -> [SKIP][466] ([i915#14544]) +19 other tests skip
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-4/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-pwrite.html
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-cpu:
    - shard-rkl:          [SKIP][467] ([i915#14544] / [i915#15102]) -> [SKIP][468] ([i915#15102]) +4 other tests skip
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-cpu.html
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite:
    - shard-rkl:          [SKIP][469] ([i915#14544] / [i915#15102] / [i915#3023]) -> [SKIP][470] ([i915#15102] / [i915#3023]) +2 other tests skip
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite.html
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:
    - shard-dg2:          [SKIP][471] ([i915#15102]) -> [SKIP][472] ([i915#10433] / [i915#15102]) +3 other tests skip
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-rkl:          [SKIP][473] ([i915#1825]) -> [SKIP][474] ([i915#14544] / [i915#1825]) +3 other tests skip
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-blt:
    - shard-rkl:          [SKIP][475] ([i915#15102]) -> [SKIP][476] ([i915#14544] / [i915#15102]) +3 other tests skip
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-blt.html
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg1:          [SKIP][477] ([i915#15990]) -> [SKIP][478] ([i915#15990] / [i915#4423])
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
    - shard-dg2:          [SKIP][479] ([i915#10433] / [i915#15102]) -> [SKIP][480] ([i915#15102]) +2 other tests skip
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-rkl:          [SKIP][481] ([i915#14544] / [i915#1825]) -> [SKIP][482] ([i915#1825]) +2 other tests skip
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
    - shard-rkl:          [SKIP][483] ([i915#15102] / [i915#3023]) -> [SKIP][484] ([i915#14544] / [i915#15102] / [i915#3023]) +4 other tests skip
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-rkl:          [SKIP][485] ([i915#12713]) -> [SKIP][486] ([i915#1187] / [i915#12713])
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-5/igt@kms_hdr@brightness-with-hdr.html
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-3/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-rkl:          [INCOMPLETE][487] ([i915#15436]) -> [SKIP][488] ([i915#3555] / [i915#8228])
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-6/igt@kms_hdr@static-toggle-suspend.html
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-2/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-rkl:          [SKIP][489] ([i915#14544] / [i915#15460]) -> [SKIP][490] ([i915#15460])
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-6/igt@kms_joiner@basic-big-joiner.html
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-4/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier:
    - shard-rkl:          [SKIP][491] ([i915#15709]) -> [SKIP][492] ([i915#14544] / [i915#15709])
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-2/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier.html
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-rkl:          [SKIP][493] ([i915#12343] / [i915#5354]) -> [SKIP][494] ([i915#12343] / [i915#14544] / [i915#5354])
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-4/igt@kms_pm_backlight@bad-brightness.html
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-rkl:          [SKIP][495] ([i915#14544] / [i915#15073]) -> [SKIP][496] ([i915#15073])
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-6/igt@kms_pm_rpm@dpms-lpsp.html
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-4/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-rkl:          [SKIP][497] ([i915#11520] / [i915#14544]) -> [SKIP][498] ([i915#11520])
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-rkl:          [SKIP][499] ([i915#11520]) -> [SKIP][500] ([i915#11520] / [i915#14544]) +3 other tests skip
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-8/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-sprite-plane-onoff:
    - shard-rkl:          [SKIP][501] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][502] ([i915#1072] / [i915#9732]) +4 other tests skip
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-6/igt@kms_psr@fbc-pr-sprite-plane-onoff.html
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-3/igt@kms_psr@fbc-pr-sprite-plane-onoff.html

  * igt@kms_psr@psr-sprite-plane-move:
    - shard-rkl:          [SKIP][503] ([i915#1072] / [i915#9732]) -> [SKIP][504] ([i915#1072] / [i915#14544] / [i915#9732]) +3 other tests skip
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-2/igt@kms_psr@psr-sprite-plane-move.html
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_psr@psr-sprite-plane-move.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-rkl:          [SKIP][505] ([i915#14544] / [i915#15949]) -> [SKIP][506] ([i915#15949])
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-rkl:          [SKIP][507] ([i915#14544] / [i915#3555]) -> [SKIP][508] ([i915#3555]) +2 other tests skip
   [507]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-6/igt@kms_setmode@basic-clone-single-crtc.html
   [508]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-3/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_vrr@flip-suspend:
    - shard-rkl:          [SKIP][509] ([i915#14544] / [i915#15243] / [i915#3555]) -> [SKIP][510] ([i915#15243] / [i915#3555])
   [509]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-6/igt@kms_vrr@flip-suspend.html
   [510]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-8/igt@kms_vrr@flip-suspend.html

  * igt@perf_pmu@module-unload:
    - shard-dg2:          [ABORT][511] ([i915#15778]) -> [ABORT][512] ([i915#13029] / [i915#15778])
   [511]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-dg2-5/igt@perf_pmu@module-unload.html
   [512]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-8/igt@perf_pmu@module-unload.html
    - shard-dg1:          [ABORT][513] ([i915#15778]) -> [ABORT][514] ([i915#13029] / [i915#15778])
   [513]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-dg1-13/igt@perf_pmu@module-unload.html
   [514]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-18/igt@perf_pmu@module-unload.html
    - shard-tglu:         [ABORT][515] ([i915#13029] / [i915#15778]) -> [ABORT][516] ([i915#15778])
   [515]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-tglu-9/igt@perf_pmu@module-unload.html
   [516]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-3/igt@perf_pmu@module-unload.html

  * igt@prime_vgem@coherency-gtt:
    - shard-rkl:          [SKIP][517] ([i915#3708]) -> [SKIP][518] ([i915#14544] / [i915#3708])
   [517]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-2/igt@prime_vgem@coherency-gtt.html
   [518]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@prime_vgem@coherency-gtt.html

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - shard-rkl:          [SKIP][519] ([i915#9917]) -> [SKIP][520] ([i915#14544] / [i915#9917])
   [519]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-2/igt@sriov_basic@enable-vfs-autoprobe-on.html
   [520]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@sriov_basic@enable-vfs-autoprobe-on.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10056]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#10647]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
  [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#1187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187
  [i915#11965]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11965
  [i915#12169]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12169
  [i915#12177]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12177
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12314]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
  [i915#12358]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358
  [i915#1257]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12756]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756
  [i915#13008]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008
  [i915#13026]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13026
  [i915#13029]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029
  [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13398]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398
  [i915#13409]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13409
  [i915#13476]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476
  [i915#13562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13562
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13688
  [i915#13707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707
  [i915#13748]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748
  [i915#13749]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749
  [i915#13820]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13820
  [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14152]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152
  [i915#14259]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259
  [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
  [i915#14545]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545
  [i915#14586]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14586
  [i915#14600]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14600
  [i915#14694]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14694
  [i915#14712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712
  [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
  [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
  [i915#15104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104
  [i915#15131]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131
  [i915#15140]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15140
  [i915#15243]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243
  [i915#15329]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329
  [i915#15330]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330
  [i915#15342]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342
  [i915#15365]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15365
  [i915#15403]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15403
  [i915#15436]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15436
  [i915#15453]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15453
  [i915#15458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458
  [i915#15460]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460
  [i915#15582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582
  [i915#15643]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643
  [i915#15709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709
  [i915#15778]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15778
  [i915#15865]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865
  [i915#15867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867
  [i915#15871]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15871
  [i915#15931]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15931
  [i915#15949]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949
  [i915#15989]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989
  [i915#15990]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990
  [i915#15991]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991
  [i915#16056]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16056
  [i915#16079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16079
  [i915#16080]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16080
  [i915#16081]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081
  [i915#16166]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16166
  [i915#16182]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182
  [i915#16229]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16229
  [i915#16276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16276
  [i915#16361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361
  [i915#16386]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386
  [i915#16420]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16420
  [i915#16451]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16451
  [i915#16464]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16464
  [i915#16466]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16466
  [i915#16471]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471
  [i915#16503]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16503
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#2435]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2435
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
  [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
  [i915#3469]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3469
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
  [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
  [i915#3955]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
  [i915#4387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387
  [i915#4391]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4391
  [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
  [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
  [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
  [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
  [i915#4880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
  [i915#5723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6113]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113
  [i915#6230]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230
  [i915#6245]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245
  [i915#6334]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334
  [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658
  [i915#6590]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#7882]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7882
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8810]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810
  [i915#8813]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813
  [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9561]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9561
  [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
  [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809
  [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
  [i915#9878]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9878
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934
  [i915#9979]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9979


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8988 -> IGTPW_15452
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_18726: 03288b34f48c3fe60055353c30da4aacab572cdc @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15452: 50ab2a8b1f77b74c6721fa31c14372b1aa3060b0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8988: 8988
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/index.html

--===============6867552107562840342==
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
<tr><td><b>Series:</b></td><td>Add maximum downscaling test on kms_plane_scaling</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/169446/">https://patchwork.freedesktop.org/series/169446/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_18726_full -&gt; IGTPW_15452_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_15452_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_15452_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/index.html</p>
<h2>Participating hosts (10 -&gt; 10)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_15452_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled} (NEW):</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-16/igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled.html">SKIP</a></li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-3-nv12-horizontal} (NEW):</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-10/igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-3-nv12-horizontal.html">SKIP</a> +9 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-3-xrgb8888-horizontal} (NEW):</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-10/igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-3-xrgb8888-horizontal.html">DMESG-FAIL</a> +36 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-2-p010-horizontal} (NEW):</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-7/igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-2-p010-horizontal.html">FAIL</a> +17 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-1-p010-horizontal} (NEW):</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-15/igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-1-p010-horizontal.html">FAIL</a> +26 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-1-p010-vertical} (NEW):</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-4/igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-1-p010-vertical.html">FAIL</a> +21 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-1-xrgb16161616f-horizontal} (NEW):</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-6/igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-1-xrgb16161616f-horizontal.html">SKIP</a> +49 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-2-xrgb8888-vertical} (NEW):</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk10/igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-2-xrgb8888-vertical.html">FAIL</a> +14 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled} (NEW):</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-2/igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-1-p010-vertical} (NEW):</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-5/igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-1-p010-vertical.html">FAIL</a> +14 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@plane-downscale-max-crc-yf-tiled} (NEW):</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-4/igt@kms_plane_scaling@plane-downscale-max-crc-yf-tiled.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-mtlp-4/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-3/igt@kms_pm_rpm@system-suspend-modeset.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_18726_full and IGTPW_15452_full:</p>
<h3>New IGT tests (975)</h3>
<ul>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-transparent@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-transparent@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.03, 123.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-nv12-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-nv12-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-p010-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-p010-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-rgb565-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-rgb565-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-xrgb16161616f-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-xrgb16161616f-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-xrgb2101010-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-xrgb2101010-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-xrgb8888-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-xrgb8888-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-xv30-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-xv30-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-xv36-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-xv36-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-xyuv8888-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-xyuv8888-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-y210-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-y210-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-yuyv-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-yuyv-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-hdmi-a-3-nv12-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-hdmi-a-3-nv12-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-hdmi-a-3-p010-horizontal:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-hdmi-a-3-p010-vertical:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-hdmi-a-3-rgb565-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-hdmi-a-3-rgb565-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-hdmi-a-3-xrgb16161616f-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-hdmi-a-3-xrgb16161616f-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-hdmi-a-3-xrgb2101010-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-hdmi-a-3-xrgb2101010-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-hdmi-a-3-xrgb8888-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-hdmi-a-3-xrgb8888-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-hdmi-a-3-xv30-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-hdmi-a-3-xv30-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-hdmi-a-3-xv36-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-hdmi-a-3-xv36-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-hdmi-a-3-xyuv8888-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-hdmi-a-3-xyuv8888-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-hdmi-a-3-y210-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-hdmi-a-3-y210-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-hdmi-a-3-yuyv-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-hdmi-a-3-yuyv-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-edp-1-nv12-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-edp-1-nv12-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-edp-1-p010-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-edp-1-p010-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-edp-1-rgb565-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-edp-1-rgb565-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-edp-1-xrgb16161616f-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-edp-1-xrgb16161616f-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-edp-1-xrgb2101010-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-edp-1-xrgb2101010-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-edp-1-xrgb8888-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-edp-1-xrgb8888-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-edp-1-xv30-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-edp-1-xv30-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-edp-1-xv36-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-edp-1-xv36-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-edp-1-xyuv8888-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-edp-1-xyuv8888-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-edp-1-y210-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-edp-1-y210-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-edp-1-yuyv-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-edp-1-yuyv-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-hdmi-a-3-nv12-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-hdmi-a-3-nv12-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-hdmi-a-3-p010-horizontal:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-hdmi-a-3-p010-vertical:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-hdmi-a-3-rgb565-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-hdmi-a-3-rgb565-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-hdmi-a-3-xrgb16161616f-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-hdmi-a-3-xrgb16161616f-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-hdmi-a-3-xrgb2101010-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-hdmi-a-3-xrgb2101010-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-hdmi-a-3-xrgb8888-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-hdmi-a-3-xrgb8888-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-hdmi-a-3-xv30-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-hdmi-a-3-xv30-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-hdmi-a-3-xv36-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-hdmi-a-3-xv36-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-hdmi-a-3-xyuv8888-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-hdmi-a-3-xyuv8888-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-hdmi-a-3-y210-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-hdmi-a-3-y210-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-hdmi-a-3-yuyv-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-hdmi-a-3-yuyv-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-edp-1-nv12-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-edp-1-nv12-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-edp-1-p010-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-edp-1-p010-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-edp-1-rgb565-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-edp-1-rgb565-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-edp-1-xrgb16161616f-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-edp-1-xrgb16161616f-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-edp-1-xrgb2101010-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-edp-1-xrgb2101010-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-edp-1-xrgb8888-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-edp-1-xrgb8888-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-edp-1-xv30-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-edp-1-xv30-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-edp-1-xv36-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-edp-1-xv36-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-edp-1-xyuv8888-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-edp-1-xyuv8888-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-edp-1-y210-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-edp-1-y210-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-edp-1-yuyv-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-edp-1-yuyv-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-hdmi-a-3-nv12-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-hdmi-a-3-nv12-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-hdmi-a-3-p010-horizontal:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-hdmi-a-3-p010-vertical:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-hdmi-a-3-rgb565-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-hdmi-a-3-rgb565-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-hdmi-a-3-xrgb16161616f-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-hdmi-a-3-xrgb16161616f-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-hdmi-a-3-xrgb2101010-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-hdmi-a-3-xrgb2101010-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-hdmi-a-3-xrgb8888-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-hdmi-a-3-xrgb8888-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-hdmi-a-3-xv30-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-hdmi-a-3-xv30-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-hdmi-a-3-xv36-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-hdmi-a-3-xv36-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-hdmi-a-3-xyuv8888-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-hdmi-a-3-xyuv8888-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-hdmi-a-3-y210-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-hdmi-a-3-y210-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-hdmi-a-3-yuyv-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-hdmi-a-3-yuyv-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-edp-1-nv12-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-edp-1-nv12-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-edp-1-p010-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-edp-1-p010-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-edp-1-rgb565-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-edp-1-rgb565-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-edp-1-xrgb16161616f-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-edp-1-xrgb16161616f-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-edp-1-xrgb2101010-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-edp-1-xrgb2101010-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-edp-1-xrgb8888-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-edp-1-xrgb8888-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-edp-1-xv30-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-edp-1-xv30-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-edp-1-xv36-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-edp-1-xv36-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-edp-1-xyuv8888-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-edp-1-xyuv8888-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-edp-1-y210-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-edp-1-y210-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-edp-1-yuyv-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-edp-1-yuyv-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-hdmi-a-3-nv12-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-hdmi-a-3-nv12-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-hdmi-a-3-p010-horizontal:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-hdmi-a-3-p010-vertical:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-hdmi-a-3-rgb565-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-hdmi-a-3-rgb565-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-hdmi-a-3-xrgb16161616f-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-hdmi-a-3-xrgb16161616f-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-hdmi-a-3-xrgb2101010-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-hdmi-a-3-xrgb2101010-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-hdmi-a-3-xrgb8888-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-hdmi-a-3-xrgb8888-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-hdmi-a-3-xv30-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-hdmi-a-3-xv30-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-hdmi-a-3-xv36-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-hdmi-a-3-xv36-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-hdmi-a-3-xyuv8888-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-hdmi-a-3-xyuv8888-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-hdmi-a-3-y210-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-hdmi-a-3-y210-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-hdmi-a-3-yuyv-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-hdmi-a-3-yuyv-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s) 3 fail(s) 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.04, 123.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-3-nv12-horizontal:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-3-nv12-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-3-p010-horizontal:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-3-p010-vertical:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-3-rgb565-horizontal:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [1.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-3-rgb565-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-3-xrgb16161616f-horizontal:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [1.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-3-xrgb16161616f-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-3-xrgb2101010-horizontal:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [2.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-3-xrgb2101010-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-3-xrgb8888-horizontal:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [1.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-3-xrgb8888-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-3-xv30-horizontal:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [1.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-3-xv30-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-3-xv36-horizontal:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-3-xv36-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-3-xyuv8888-horizontal:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [1.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-3-xyuv8888-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-3-y210-horizontal:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [1.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-3-y210-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-3-yuyv-horizontal:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [1.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-3-yuyv-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-edp-1-nv12-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-edp-1-nv12-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-edp-1-p010-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-edp-1-p010-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-edp-1-rgb565-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-edp-1-rgb565-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-edp-1-xrgb16161616f-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-edp-1-xrgb16161616f-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-edp-1-xrgb2101010-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-edp-1-xrgb2101010-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-edp-1-xrgb8888-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-edp-1-xrgb8888-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-edp-1-xv30-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-edp-1-xv30-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-edp-1-xv36-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-edp-1-xv36-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-edp-1-xyuv8888-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-edp-1-xyuv8888-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-edp-1-y210-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-edp-1-y210-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-edp-1-yuyv-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-edp-1-yuyv-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-1-nv12-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.35, 1.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-1-nv12-vertical:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.32, 1.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-1-p010-horizontal:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.36, 1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-1-p010-vertical:</p>
<ul>
<li>Statuses : 2 fail(s) 1 pass(s)</li>
<li>Exec time: [1.36, 1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-1-rgb565-horizontal:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [1.06, 1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-1-rgb565-vertical:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.39, 1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-1-xrgb16161616f-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.39, 1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-1-xrgb16161616f-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.34, 1.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-1-xrgb2101010-horizontal:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [1.24, 1.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-1-xrgb2101010-vertical:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.44, 1.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-1-xrgb8888-horizontal:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [1.23, 1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-1-xrgb8888-vertical:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.36, 2.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-1-xv30-horizontal:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.30, 1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-1-xv30-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.35, 1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-1-xv36-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.39, 1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-1-xv36-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.29, 1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-1-xyuv8888-horizontal:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [1.02, 1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-1-xyuv8888-vertical:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.37, 2.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-1-y210-horizontal:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.28, 1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-1-y210-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.39, 1.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-1-yuyv-horizontal:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.87, 1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-1-yuyv-vertical:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.30, 1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-2-nv12-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.92, 1.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-2-nv12-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.66, 1.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-2-p010-horizontal:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.80, 1.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-2-p010-vertical:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [1.36, 1.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-2-rgb565-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [1.48, 1.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-2-rgb565-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.82, 2.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-2-xrgb16161616f-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-2-xrgb16161616f-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-2-xrgb2101010-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [1.35, 1.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-2-xrgb2101010-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.43, 1.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-2-xrgb8888-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [1.07, 1.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-2-xrgb8888-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.57, 1.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-2-xv30-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-2-xv30-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-2-xv36-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-2-xv36-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-2-xyuv8888-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.92, 1.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-2-xyuv8888-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.42, 1.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-2-y210-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-2-y210-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-2-yuyv-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [1.38, 1.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-hdmi-a-2-yuyv-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.60, 1.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-3-nv12-horizontal:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-3-nv12-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-3-p010-horizontal:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-3-p010-vertical:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-3-rgb565-horizontal:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [1.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-3-rgb565-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-3-xrgb16161616f-horizontal:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-3-xrgb16161616f-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-3-xrgb2101010-horizontal:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [1.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-3-xrgb2101010-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-3-xrgb8888-horizontal:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [1.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-3-xrgb8888-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-3-xv30-horizontal:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-3-xv30-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-3-xv36-horizontal:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-3-xv36-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-3-xyuv8888-horizontal:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [1.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-3-xyuv8888-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-3-y210-horizontal:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-3-y210-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-3-yuyv-horizontal:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [1.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-3-yuyv-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-edp-1-nv12-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-edp-1-nv12-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-edp-1-p010-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-edp-1-p010-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-edp-1-rgb565-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-edp-1-rgb565-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-edp-1-xrgb16161616f-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-edp-1-xrgb16161616f-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-edp-1-xrgb2101010-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-edp-1-xrgb2101010-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-edp-1-xrgb8888-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-edp-1-xrgb8888-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-edp-1-xv30-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-edp-1-xv30-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-edp-1-xv36-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-edp-1-xv36-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-edp-1-xyuv8888-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-edp-1-xyuv8888-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-edp-1-y210-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-edp-1-y210-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-edp-1-yuyv-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-edp-1-yuyv-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-1-nv12-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.38, 1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-1-nv12-vertical:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.28, 1.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-1-p010-horizontal:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.32, 1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-1-p010-vertical:</p>
<ul>
<li>Statuses : 2 fail(s) 1 pass(s)</li>
<li>Exec time: [1.35, 1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-1-rgb565-horizontal:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.90, 1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-1-rgb565-vertical:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.35, 2.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-1-xrgb16161616f-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.34, 1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-1-xrgb16161616f-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.32, 1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-1-xrgb2101010-horizontal:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.96, 1.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-1-xrgb2101010-vertical:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.41, 1.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-1-xrgb8888-horizontal:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [1.09, 1.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-1-xrgb8888-vertical:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.33, 1.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-1-xv30-horizontal:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.28, 1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-1-xv30-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.35, 1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-1-xv36-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.38, 1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-1-xv36-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.34, 1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-1-xyuv8888-horizontal:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.84, 1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-1-xyuv8888-vertical:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.36, 2.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-1-y210-horizontal:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.30, 1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-1-y210-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-1-yuyv-horizontal:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [1.26, 1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-1-yuyv-vertical:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.35, 1.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-2-nv12-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [1.08, 1.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-2-nv12-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.52, 1.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-2-p010-horizontal:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [1.12, 1.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-2-p010-vertical:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [1.52, 1.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-2-rgb565-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [1.12, 1.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-2-rgb565-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.72, 1.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-2-xrgb16161616f-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-2-xrgb16161616f-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-2-xrgb2101010-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [1.32, 1.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-2-xrgb2101010-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.42, 1.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-2-xrgb8888-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [1.02, 1.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-2-xrgb8888-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.73, 2.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-2-xv30-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-2-xv30-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-2-xv36-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-2-xv36-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-2-xyuv8888-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [1.17, 1.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-2-xyuv8888-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.60, 1.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-2-y210-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-2-y210-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-2-yuyv-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [1.02, 1.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-hdmi-a-2-yuyv-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.74, 2.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-dp-3-nv12-horizontal:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-dp-3-nv12-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-dp-3-p010-horizontal:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-dp-3-p010-vertical:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-dp-3-rgb565-horizontal:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [1.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-dp-3-rgb565-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-dp-3-xrgb16161616f-horizontal:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-dp-3-xrgb16161616f-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-dp-3-xrgb2101010-horizontal:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [1.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-dp-3-xrgb2101010-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-dp-3-xrgb8888-horizontal:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-dp-3-xrgb8888-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-dp-3-xv30-horizontal:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [1.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-dp-3-xv30-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-dp-3-xv36-horizontal:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [1.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-dp-3-xv36-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-dp-3-xyuv8888-horizontal:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-dp-3-xyuv8888-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-dp-3-y210-horizontal:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-dp-3-y210-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-dp-3-yuyv-horizontal:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-dp-3-yuyv-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-edp-1-nv12-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-edp-1-nv12-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-edp-1-p010-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-edp-1-p010-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-edp-1-rgb565-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-edp-1-rgb565-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-edp-1-xrgb16161616f-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-edp-1-xrgb16161616f-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-edp-1-xrgb2101010-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-edp-1-xrgb2101010-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-edp-1-xrgb8888-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-edp-1-xrgb8888-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-edp-1-xv30-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-edp-1-xv30-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-edp-1-xv36-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-edp-1-xv36-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-edp-1-xyuv8888-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-edp-1-xyuv8888-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-edp-1-y210-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-edp-1-y210-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-edp-1-yuyv-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-edp-1-yuyv-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-1-nv12-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.36, 1.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-1-nv12-vertical:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.32, 2.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-1-p010-horizontal:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.35, 1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-1-p010-vertical:</p>
<ul>
<li>Statuses : 2 fail(s) 1 pass(s)</li>
<li>Exec time: [1.31, 2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-1-rgb565-horizontal:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [1.08, 1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-1-rgb565-vertical:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.33, 1.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-1-xrgb16161616f-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.38, 1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-1-xrgb16161616f-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.31, 1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-1-xrgb2101010-horizontal:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [1.29, 1.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-1-xrgb2101010-vertical:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.43, 2.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-1-xrgb8888-horizontal:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [1.03, 1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-1-xrgb8888-vertical:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.35, 1.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-1-xv30-horizontal:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.29, 1.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-1-xv30-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.35, 1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-1-xv36-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.36, 1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-1-xv36-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.30, 1.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-1-xyuv8888-horizontal:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [1.30, 1.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-1-xyuv8888-vertical:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.37, 2.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-1-y210-horizontal:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.31, 1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-1-y210-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.37, 1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-1-yuyv-horizontal:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [1.14, 1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-1-yuyv-vertical:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.36, 2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-2-nv12-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [1.02, 1.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-2-nv12-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.72, 1.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-2-p010-horizontal:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.86, 1.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-2-p010-vertical:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [1.74, 2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-2-rgb565-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [1.01, 1.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-2-rgb565-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.35, 1.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-2-xrgb16161616f-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-2-xrgb16161616f-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-2-xrgb2101010-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [1.00, 1.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-2-xrgb2101010-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.40, 1.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-2-xrgb8888-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [1.35, 1.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-2-xrgb8888-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.63, 1.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-2-xv30-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-2-xv30-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-2-xv36-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-2-xv36-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-2-xyuv8888-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [1.34, 1.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-2-xyuv8888-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.74, 2.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-2-y210-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-2-y210-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-2-yuyv-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [1.33, 1.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-2-yuyv-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.68, 1.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-dp-3-nv12-horizontal:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-dp-3-nv12-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-dp-3-p010-horizontal:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-dp-3-p010-vertical:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-dp-3-rgb565-horizontal:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [1.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-dp-3-rgb565-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-dp-3-xrgb16161616f-horizontal:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [1.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-dp-3-xrgb16161616f-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-dp-3-xrgb2101010-horizontal:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [1.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-dp-3-xrgb2101010-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-dp-3-xrgb8888-horizontal:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [1.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-dp-3-xrgb8888-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-dp-3-xv30-horizontal:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-dp-3-xv30-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-dp-3-xv36-horizontal:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-dp-3-xv36-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-dp-3-xyuv8888-horizontal:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-dp-3-xyuv8888-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-dp-3-y210-horizontal:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [1.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-dp-3-y210-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-dp-3-yuyv-horizontal:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [1.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-dp-3-yuyv-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-edp-1-nv12-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-edp-1-nv12-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-edp-1-p010-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-edp-1-p010-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-edp-1-rgb565-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-edp-1-rgb565-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-edp-1-xrgb16161616f-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-edp-1-xrgb16161616f-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-edp-1-xrgb2101010-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-edp-1-xrgb2101010-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-edp-1-xrgb8888-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-edp-1-xrgb8888-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-edp-1-xv30-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-edp-1-xv30-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-edp-1-xv36-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-edp-1-xv36-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-edp-1-xyuv8888-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-edp-1-xyuv8888-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-edp-1-y210-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-edp-1-y210-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-edp-1-yuyv-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-edp-1-yuyv-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-hdmi-a-1-nv12-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.33, 1.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-hdmi-a-1-nv12-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.27, 1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-hdmi-a-1-p010-horizontal:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.36, 1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-hdmi-a-1-p010-vertical:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [1.38, 1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-hdmi-a-1-rgb565-horizontal:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.30, 1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-hdmi-a-1-rgb565-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.33, 1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-hdmi-a-1-xrgb16161616f-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.34, 1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-hdmi-a-1-xrgb16161616f-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.30, 1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-hdmi-a-1-xrgb2101010-horizontal:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.45, 1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-hdmi-a-1-xrgb2101010-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.44, 1.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-hdmi-a-1-xrgb8888-horizontal:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.26, 1.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-hdmi-a-1-xrgb8888-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.36, 1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-hdmi-a-1-xv30-horizontal:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.30, 1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-hdmi-a-1-xv30-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.35, 1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-hdmi-a-1-xv36-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.37, 1.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-hdmi-a-1-xv36-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.38, 1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-hdmi-a-1-xyuv8888-horizontal:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.30, 1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-hdmi-a-1-xyuv8888-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.36, 1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-hdmi-a-1-y210-horizontal:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.31, 1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-hdmi-a-1-y210-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.34, 1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-hdmi-a-1-yuyv-horizontal:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.26, 1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-hdmi-a-1-yuyv-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.36, 1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled:</p>
<ul>
<li>Statuses : 5 fail(s) 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.03, 125.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-nv12-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-nv12-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-p010-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-p010-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-rgb565-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-rgb565-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-xrgb16161616f-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-xrgb16161616f-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-xrgb2101010-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-xrgb2101010-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-xrgb8888-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-xrgb8888-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-xv30-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-xv30-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-xv36-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-xv36-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-xyuv8888-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-xyuv8888-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-y210-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-y210-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-yuyv-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-yuyv-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-1-nv12-horizontal:</p>
<ul>
<li>Statuses : 3 pass(s) 2 skip(s)</li>
<li>Exec time: [0.32, 1.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-1-nv12-vertical:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.30, 1.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-1-p010-horizontal:</p>
<ul>
<li>Statuses : 3 fail(s) 2 skip(s)</li>
<li>Exec time: [0.35, 1.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-1-p010-vertical:</p>
<ul>
<li>Statuses : 4 fail(s) 1 pass(s)</li>
<li>Exec time: [1.36, 1.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-1-rgb565-horizontal:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.97, 1.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-1-rgb565-vertical:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [1.33, 1.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-1-xrgb16161616f-horizontal:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.36, 1.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-1-xrgb16161616f-vertical:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.39, 1.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-1-xrgb2101010-horizontal:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.80, 1.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-1-xrgb2101010-vertical:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [1.43, 1.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-1-xrgb8888-horizontal:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.76, 1.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-1-xrgb8888-vertical:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [1.35, 1.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-1-xv30-horizontal:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.34, 1.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-1-xv30-vertical:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.40, 1.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-1-xv36-horizontal:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.37, 1.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-1-xv36-vertical:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.36, 1.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-1-xyuv8888-horizontal:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.83, 1.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-1-xyuv8888-vertical:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.38, 1.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-1-y210-horizontal:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.34, 1.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-1-y210-vertical:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.40, 1.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-1-yuyv-horizontal:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.79, 1.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-1-yuyv-vertical:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.32, 1.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-2-nv12-horizontal:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-2-nv12-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-2-p010-horizontal:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-2-p010-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-2-rgb565-horizontal:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-2-rgb565-vertical:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-2-xrgb2101010-horizontal:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-2-xrgb2101010-vertical:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-2-xrgb8888-horizontal:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-2-xrgb8888-vertical:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-2-xyuv8888-horizontal:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-2-xyuv8888-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-2-yuyv-horizontal:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-2-yuyv-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-edp-1-nv12-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-edp-1-nv12-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-edp-1-p010-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-edp-1-p010-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-edp-1-rgb565-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-edp-1-rgb565-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-edp-1-xrgb16161616f-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-edp-1-xrgb16161616f-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-edp-1-xrgb2101010-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-edp-1-xrgb2101010-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-edp-1-xrgb8888-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-edp-1-xrgb8888-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-edp-1-xv30-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-edp-1-xv30-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-edp-1-xv36-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-edp-1-xv36-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-edp-1-xyuv8888-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-edp-1-xyuv8888-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-edp-1-y210-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-edp-1-y210-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-edp-1-yuyv-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-edp-1-yuyv-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-1-nv12-horizontal:</p>
<ul>
<li>Statuses : 3 pass(s) 2 skip(s)</li>
<li>Exec time: [0.35, 1.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-1-nv12-vertical:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.31, 1.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-1-p010-horizontal:</p>
<ul>
<li>Statuses : 3 fail(s) 2 skip(s)</li>
<li>Exec time: [0.33, 1.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-1-p010-vertical:</p>
<ul>
<li>Statuses : 4 fail(s) 1 pass(s)</li>
<li>Exec time: [1.30, 1.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-1-rgb565-horizontal:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.84, 1.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-1-rgb565-vertical:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [1.29, 1.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-1-xrgb16161616f-horizontal:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.36, 1.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-1-xrgb16161616f-vertical:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.30, 1.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-1-xrgb2101010-horizontal:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.77, 1.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-1-xrgb2101010-vertical:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [1.51, 1.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-1-xrgb8888-horizontal:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.81, 1.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-1-xrgb8888-vertical:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [1.26, 1.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-1-xv30-horizontal:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.33, 1.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-1-xv30-vertical:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.38, 1.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-1-xv36-horizontal:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.36, 1.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-1-xv36-vertical:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.32, 1.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-1-xyuv8888-horizontal:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.80, 1.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-1-xyuv8888-vertical:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.35, 1.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-1-y210-horizontal:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.32, 1.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-1-y210-vertical:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.37, 1.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-1-yuyv-horizontal:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.73, 1.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-1-yuyv-vertical:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.36, 1.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-2-nv12-horizontal:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-2-nv12-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-2-p010-horizontal:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-2-p010-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-2-rgb565-horizontal:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-2-rgb565-vertical:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-2-xrgb2101010-horizontal:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-2-xrgb2101010-vertical:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-2-xrgb8888-horizontal:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-2-xrgb8888-vertical:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-2-xyuv8888-horizontal:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-2-xyuv8888-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-2-yuyv-horizontal:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-hdmi-a-2-yuyv-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-edp-1-nv12-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-edp-1-nv12-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-edp-1-p010-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-edp-1-p010-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-edp-1-rgb565-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-edp-1-rgb565-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-edp-1-xrgb16161616f-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-edp-1-xrgb16161616f-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-edp-1-xrgb2101010-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-edp-1-xrgb2101010-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-edp-1-xrgb8888-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-edp-1-xrgb8888-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-edp-1-xv30-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-edp-1-xv30-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-edp-1-xv36-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-edp-1-xv36-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-edp-1-xyuv8888-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-edp-1-xyuv8888-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-edp-1-y210-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-edp-1-y210-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-edp-1-yuyv-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-edp-1-yuyv-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-1-nv12-horizontal:</p>
<ul>
<li>Statuses : 3 pass(s) 2 skip(s)</li>
<li>Exec time: [0.15, 1.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-1-nv12-vertical:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.12, 1.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-1-p010-horizontal:</p>
<ul>
<li>Statuses : 3 fail(s) 2 skip(s)</li>
<li>Exec time: [0.16, 1.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-1-p010-vertical:</p>
<ul>
<li>Statuses : 4 fail(s) 1 skip(s)</li>
<li>Exec time: [0.12, 1.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-1-rgb565-horizontal:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.80, 1.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-1-rgb565-vertical:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.92, 1.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-1-xrgb16161616f-horizontal:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.36, 1.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-1-xrgb16161616f-vertical:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.32, 1.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-1-xrgb2101010-horizontal:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.63, 1.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-1-xrgb2101010-vertical:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [1.07, 1.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-1-xrgb8888-horizontal:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.69, 1.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-1-xrgb8888-vertical:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.98, 1.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-1-xv30-horizontal:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.34, 1.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-1-xv30-vertical:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.36, 1.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-1-xv36-horizontal:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.42, 1.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-1-xv36-vertical:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.36, 1.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-1-xyuv8888-horizontal:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.65, 1.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-1-xyuv8888-vertical:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.87, 1.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-1-y210-horizontal:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.30, 1.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-1-y210-vertical:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.38, 1.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-1-yuyv-horizontal:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.61, 1.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-1-yuyv-vertical:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.91, 1.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-2-nv12-horizontal:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-2-nv12-vertical:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-2-p010-horizontal:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-2-p010-vertical:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-2-rgb565-horizontal:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-2-rgb565-vertical:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-2-xrgb2101010-horizontal:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-2-xrgb2101010-vertical:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [1.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-2-xrgb8888-horizontal:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-2-xrgb8888-vertical:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-2-xyuv8888-horizontal:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-2-xyuv8888-vertical:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-2-yuyv-horizontal:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-hdmi-a-2-yuyv-vertical:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-edp-1-nv12-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-edp-1-nv12-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-edp-1-p010-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-edp-1-p010-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-edp-1-rgb565-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-edp-1-rgb565-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-edp-1-xrgb16161616f-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-edp-1-xrgb16161616f-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-edp-1-xrgb2101010-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-edp-1-xrgb2101010-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-edp-1-xrgb8888-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-edp-1-xrgb8888-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-edp-1-xv30-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-edp-1-xv30-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-edp-1-xv36-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-edp-1-xv36-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-edp-1-xyuv8888-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-edp-1-xyuv8888-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-edp-1-y210-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-edp-1-y210-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-edp-1-yuyv-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-edp-1-yuyv-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-hdmi-a-1-nv12-horizontal:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.36, 1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-hdmi-a-1-nv12-vertical:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.29, 1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-hdmi-a-1-p010-horizontal:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.32, 1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-hdmi-a-1-p010-vertical:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [1.31, 1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-hdmi-a-1-rgb565-horizontal:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.22, 1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-hdmi-a-1-rgb565-vertical:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.29, 1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-hdmi-a-1-xrgb16161616f-horizontal:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.35, 1.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-hdmi-a-1-xrgb16161616f-vertical:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.30, 1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-hdmi-a-1-xrgb2101010-horizontal:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.68, 1.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-hdmi-a-1-xrgb2101010-vertical:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.60, 1.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-hdmi-a-1-xrgb8888-horizontal:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.25, 1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-hdmi-a-1-xrgb8888-vertical:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.30, 1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-hdmi-a-1-xv30-horizontal:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.32, 1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-hdmi-a-1-xv30-vertical:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.39, 1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-hdmi-a-1-xv36-horizontal:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.35, 1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-hdmi-a-1-xv36-vertical:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.31, 1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-hdmi-a-1-xyuv8888-horizontal:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.31, 1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-hdmi-a-1-xyuv8888-vertical:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.39, 1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-hdmi-a-1-y210-horizontal:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.31, 1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-hdmi-a-1-y210-vertical:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.35, 1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-hdmi-a-1-yuyv-horizontal:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.29, 1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-hdmi-a-1-yuyv-vertical:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.31, 1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled:</p>
<ul>
<li>Statuses : 3 fail(s) 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.03, 124.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-1-nv12-horizontal:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.36, 0.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-1-nv12-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.32, 1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-1-p010-horizontal:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.35, 1.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-1-p010-vertical:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [1.28, 2.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-1-rgb565-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [1.09, 1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-1-rgb565-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.47, 1.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-1-xrgb16161616f-horizontal:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-1-xrgb16161616f-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-1-xrgb2101010-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [1.01, 1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-1-xrgb2101010-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.33, 1.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-1-xrgb8888-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.92, 1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-1-xrgb8888-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.41, 1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-1-xv30-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-1-xv30-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-1-xv36-horizontal:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-1-xv36-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-1-xyuv8888-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.99, 1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-1-xyuv8888-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.40, 1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-1-y210-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-1-y210-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-1-yuyv-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.92, 1.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-1-yuyv-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.39, 2.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-2-nv12-horizontal:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.28, 0.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-2-nv12-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.68, 2.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-2-p010-horizontal:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.27, 0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-2-p010-vertical:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [0.74, 1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-2-rgb565-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.82, 0.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-2-rgb565-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.78, 1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-2-xrgb16161616f-horizontal:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-2-xrgb16161616f-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-2-xrgb2101010-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.76, 1.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-2-xrgb2101010-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.77, 2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-2-xrgb8888-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.78, 1.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-2-xrgb8888-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.79, 1.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-2-xv30-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-2-xv30-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-2-xv36-horizontal:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-2-xv36-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-2-xyuv8888-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.79, 0.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-2-xyuv8888-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.79, 1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-2-y210-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-2-y210-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-2-yuyv-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.75, 1.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-2-yuyv-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.78, 2.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-4-nv12-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-4-nv12-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-4-p010-horizontal:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-4-p010-vertical:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-4-rgb565-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-4-rgb565-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-4-xrgb16161616f-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-4-xrgb16161616f-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-4-xrgb2101010-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-4-xrgb2101010-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-4-xrgb8888-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-4-xrgb8888-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-4-xv30-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-4-xv30-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-4-xv36-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-4-xv36-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-4-xyuv8888-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-4-xyuv8888-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-4-y210-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-4-y210-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-4-yuyv-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-a-hdmi-a-4-yuyv-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-1-nv12-horizontal:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.35, 0.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-1-nv12-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.26, 1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-1-p010-horizontal:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.34, 0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-1-p010-vertical:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [1.30, 1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-1-rgb565-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [1.34, 1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-1-rgb565-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.37, 2.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-1-xrgb16161616f-horizontal:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-1-xrgb16161616f-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-1-xrgb2101010-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [1.12, 1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-1-xrgb2101010-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.37, 1.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-1-xrgb8888-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.84, 1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-1-xrgb8888-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.36, 1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-1-xv30-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-1-xv30-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-1-xv36-horizontal:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-1-xv36-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-1-xyuv8888-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [1.04, 1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-1-xyuv8888-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.38, 1.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-1-y210-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-1-y210-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-1-yuyv-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [1.18, 1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-1-yuyv-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.41, 1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-2-nv12-horizontal:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.30, 0.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-2-nv12-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.70, 1.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-2-p010-horizontal:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.26, 0.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-2-p010-vertical:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [0.68, 1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-2-rgb565-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.73, 1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-2-rgb565-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.78, 2.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-2-xrgb16161616f-horizontal:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-2-xrgb16161616f-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-2-xrgb2101010-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.77, 0.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-2-xrgb2101010-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.76, 1.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-2-xrgb8888-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.77, 1.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-2-xrgb8888-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.75, 1.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-2-xv30-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-2-xv30-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-2-xv36-horizontal:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-2-xv36-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-2-xyuv8888-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.77, 1.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-2-xyuv8888-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.81, 1.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-2-y210-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-2-y210-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-2-yuyv-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.74, 0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-2-yuyv-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.79, 1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-4-nv12-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-4-nv12-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-4-p010-horizontal:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-4-p010-vertical:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-4-rgb565-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-4-rgb565-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-4-xrgb16161616f-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-4-xrgb16161616f-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-4-xrgb2101010-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-4-xrgb2101010-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-4-xrgb8888-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-4-xrgb8888-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-4-xv30-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-4-xv30-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-4-xv36-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-4-xv36-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-4-xyuv8888-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-4-xyuv8888-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-4-y210-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-4-y210-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-4-yuyv-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-4-yuyv-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-1-nv12-horizontal:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.36, 1.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-1-nv12-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.27, 2.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-1-p010-horizontal:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.31, 0.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-1-p010-vertical:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [1.34, 1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-1-rgb565-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.94, 1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-1-rgb565-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-1-xrgb16161616f-horizontal:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-1-xrgb16161616f-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-1-xrgb2101010-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [1.09, 1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-1-xrgb2101010-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.39, 1.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-1-xrgb8888-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.81, 1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-1-xrgb8888-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.29, 1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-1-xv30-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-1-xv30-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-1-xv36-horizontal:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-1-xv36-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-1-xyuv8888-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.92, 1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-1-xyuv8888-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.40, 1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-1-y210-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-1-y210-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-1-yuyv-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [1.10, 1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-1-yuyv-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.39, 2.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-2-nv12-horizontal:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.27, 0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-2-nv12-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.69, 1.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-2-p010-horizontal:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.27, 0.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-2-p010-vertical:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [0.72, 2.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-2-rgb565-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.76, 0.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-2-rgb565-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.74, 1.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-2-xrgb16161616f-horizontal:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-2-xrgb16161616f-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-2-xrgb2101010-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.75, 1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-2-xrgb2101010-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.77, 1.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-2-xrgb8888-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.74, 1.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-2-xrgb8888-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.78, 1.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-2-xv30-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-2-xv30-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-2-xv36-horizontal:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-2-xv36-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-2-xyuv8888-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.78, 1.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-2-xyuv8888-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.78, 2.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-2-y210-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-2-y210-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-2-yuyv-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.76, 1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-2-yuyv-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.77, 1.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-4-nv12-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-4-nv12-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-4-p010-horizontal:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-4-p010-vertical:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-4-rgb565-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-4-rgb565-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-4-xrgb16161616f-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-4-xrgb16161616f-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-4-xrgb2101010-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-4-xrgb2101010-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-4-xrgb8888-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-4-xrgb8888-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-4-xv30-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-4-xv30-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-4-xv36-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-4-xv36-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-4-xyuv8888-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-4-xyuv8888-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-4-y210-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-4-y210-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-4-yuyv-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-4-yuyv-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-1-nv12-horizontal:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-1-nv12-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-1-p010-horizontal:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-1-p010-vertical:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-1-rgb565-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-1-rgb565-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-1-xrgb16161616f-horizontal:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-1-xrgb16161616f-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-1-xrgb2101010-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-1-xrgb2101010-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-1-xrgb8888-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-1-xrgb8888-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-1-xv30-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-1-xv30-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-1-xv36-horizontal:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-1-xv36-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-1-xyuv8888-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-1-xyuv8888-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-1-y210-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-1-y210-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-1-yuyv-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-1-yuyv-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-4-nv12-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-4-nv12-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-4-p010-horizontal:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-4-p010-vertical:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-4-rgb565-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-4-rgb565-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-4-xrgb16161616f-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-4-xrgb16161616f-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-4-xrgb2101010-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-4-xrgb2101010-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-4-xrgb8888-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-4-xrgb8888-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-4-xv30-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-4-xv30-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-4-xv36-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-4-xv36-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-4-xyuv8888-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-4-xyuv8888-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-4-y210-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-4-y210-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-4-yuyv-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-d-hdmi-a-4-yuyv-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-yf-tiled:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.02, 0.06] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15452_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@crc32:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-3/igt@api_intel_bb@crc32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230">i915#6230</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@device_reset@unbind-cold-reset-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078">i915#11078</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@dmabuf@all-tests:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-3/igt@dmabuf@all-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15931">i915#15931</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-2/igt@gem_ccs@block-copy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@gem_ccs@block-copy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-5/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@large-ctrl-surf-copy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-1/igt@gem_ccs@large-ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008">i915#13008</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-3/igt@gem_ccs@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-3/igt@gem_create@create-ext-cpu-access-sanity-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk8/igt@gem_ctx_isolation@preservation-s3@rcs0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16466">i915#16466</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-hang:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-snb7/igt@gem_ctx_persistence@engines-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099">i915#1099</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-8/igt@gem_ctx_persistence@heartbeat-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555">i915#8555</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-7/igt@gem_ctx_persistence@heartbeat-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-5/igt@gem_ctx_sseu@engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-1/igt@gem_eio@in-flight-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131">i915#15131</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-2/igt@gem_exec_balancer@parallel-contexts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-8/igt@gem_exec_balancer@parallel-out-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_big@single:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-mtlp-3/igt@gem_exec_big@single.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-7/igt@gem_exec_big@single.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15871">i915#15871</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-7/igt@gem_exec_capture@capture.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11965">i915#11965</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk10/igt@gem_exec_capture@capture-invisible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334">i915#6334</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture@vecs0-lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-6/igt@gem_exec_capture@capture@vecs0-lmem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11965">i915#11965</a>) +4 other tests fail</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-15/igt@gem_exec_capture@capture@vecs0-lmem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11965">i915#11965</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-ro-before-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-4/igt@gem_exec_flush@basic-wb-ro-before-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-noreloc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-1/igt@gem_exec_reloc@basic-cpu-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-cpu-noreloc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-3/igt@gem_exec_reloc@basic-gtt-cpu-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-range-active:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-2/igt@gem_exec_reloc@basic-range-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +7 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-13/igt@gem_exec_reloc@basic-range-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@gem_exec_reloc@basic-write-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3-devices:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-dg1-15/igt@gem_exec_suspend@basic-s3-devices.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-13/igt@gem_exec_suspend@basic-s3-devices.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-8/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-random:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-8/igt@gem_lmem_swapping@heavy-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk9/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@massive-random:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-3/igt@gem_lmem_swapping@massive-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-multi:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@gem_lmem_swapping@parallel-multi.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_madvise@dontneed-before-pwrite:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-5/igt@gem_madvise@dontneed-before-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-7/igt@gem_media_vme.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284">i915#284</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-short:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-6/igt@gem_mmap_gtt@basic-short.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy-odd:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-13/igt@gem_mmap_gtt@cpuset-big-copy-odd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@bad-object:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-7/igt@gem_mmap_wc@bad-object.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-7/igt@gem_mmap_wc@bad-object.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@snoop:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-5/igt@gem_pread@snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-13/igt@gem_pread@snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-4/igt@gem_pread@snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-context:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-7/igt@gem_pxp@hw-rejects-pxp-context.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398">i915#13398</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-ctx-execution:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-5/igt@gem_pxp@verify-pxp-stale-ctx-execution.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-13/igt@gem_pxp@verify-pxp-stale-ctx-execution.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-x-tiled:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-snb4/igt@gem_render_copy@y-tiled-ccs-to-x-tiled.html">SKIP</a> +65 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-7/igt@gem_render_copy@y-tiled-ccs-to-x-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-linear:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-1/igt@gem_render_copy@yf-tiled-ccs-to-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-8/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880">i915#4880</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-8/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-unsync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-3/igt@gem_userptr_blits@readonly-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-overlap:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-5/igt@gem_userptr_blits@unsync-overlap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-1/igt@gem_userptr_blits@unsync-unmap-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk11/igt@gem_workarounds@suspend-resume.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14586">i915#14586</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-glk6/igt@gem_workarounds@suspend-resume-context.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk1/igt@gem_workarounds@suspend-resume-context.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-invalid-length:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-6/igt@gen9_exec_parse@batch-invalid-length.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-17/igt@gen9_exec_parse@batch-invalid-length.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-7/igt@gen9_exec_parse@batch-invalid-length.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-oversize:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-4/igt@gen9_exec_parse@bb-oversize.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-far:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-7/igt@gen9_exec_parse@bb-start-far.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@secure-batches:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@gen9_exec_parse@secure-batches.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@intel_connector_register:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk1/igt@i915_module_load@fault-injection@intel_connector_register.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342">i915#15342</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-no-display:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@i915_module_load@reload-no-display.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029">i915#13029</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545">i915#14545</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-10/igt@i915_pm_freq_api@freq-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#8399</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend@gt0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-dg2-8/igt@i915_pm_freq_api@freq-suspend@gt0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-10/igt@i915_pm_freq_api@freq-suspend@gt0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13820">i915#13820</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16080">i915#16080</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16166">i915#16166</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk3/igt@i915_pm_rpm@system-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@waitboost:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-mtlp-4/igt@i915_pm_rps@waitboost.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-6/igt@i915_pm_rps@waitboost.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15365">i915#15365</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16503">i915#16503</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-3/igt@i915_pm_sseu@full-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387">i915#4387</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-18/igt@i915_query@hwconfig_table.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245">i915#6245</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-5/igt@i915_query@query-topology-unsupported.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16079">i915#16079</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-5/igt@i915_query@test-query-geometry-subslices.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723">i915#5723</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-glk2/igt@i915_suspend@fence-restore-tiled2untiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk8/igt@i915_suspend@fence-restore-tiled2untiled.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182">i915#16182</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-2/igt@i915_suspend@fence-restore-untiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-3/igt@i915_suspend@fence-restore-untiled.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk8/igt@i915_suspend@forcewake.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182">i915#16182</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-5/igt@intel_hwmon@hwmon-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk9/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-5/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-2/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-14/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-3/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-15/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-2/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-7/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-5/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-12/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-16/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +240 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-4/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10434</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-4/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-12/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-4/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +69 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-8/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-5/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +44 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +54 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +70 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-4/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +46 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-4/igt@kms_chamelium_audio@dp-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-ctm3x4:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-2/igt@kms_chamelium_color_pipeline@plane-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16464">i915#16464</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-3/igt@kms_chamelium_color_pipeline@plane-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-16/igt@kms_chamelium_color_pipeline@plane-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@kms_chamelium_color_pipeline@plane-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-6/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-4/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@kms_chamelium_frames@dp-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-cmp-planar-formats:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-18/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-7/igt@kms_chamelium_hpd@dp-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-suspend:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk11/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html">SKIP</a> +26 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-4/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-without-ddc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-9/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9979">i915#9979</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-8/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-3/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-5/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-8/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-7/igt@kms_cursor_crc@cursor-offscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-64x21:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-2/igt@kms_cursor_crc@cursor-offscreen-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814">i915#8814</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-12/igt@kms_cursor_crc@cursor-onscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x10:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@kms_cursor_crc@cursor-random-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-7/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +2 other tests fail</li>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-tglu-10/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-4/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-2/igt@kms_cursor_crc@cursor-sliding-256x85@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-7/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk2/igt@kms_cursor_crc@cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358">i915#12358</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152">i915#14152</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7882">i915#7882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk2/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358">i915#12358</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152">i915#14152</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-4/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809">i915#9809</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-7/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046">i915#13046</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev@basic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-7/igt@kms_dp_aux_dev@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257">i915#1257</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-10/igt@kms_dp_aux_dev@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257">i915#1257</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-4/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749">i915#13749</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-5/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707">i915#13707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-8/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-12/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats-bigjoiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-8/igt@kms_dsc@dsc-with-formats-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-8/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-7/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk11/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9878">i915#9878</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3469">i915#3469</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-8/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081">i915#16081</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-4/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-8/igt@kms_flip@2x-flip-vs-dpms-on-nop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-14/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-4/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +2 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-4/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@c-hdmi-a1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-14/igt@kms_flip@blocking-wf_vblank@c-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14600">i915#14600</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-2/igt@kms_flip@flip-vs-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-3/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16276">i915#16276</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113">i915#6113</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk3/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113">i915#6113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk5/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314">i915#12314</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113">i915#6113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk5/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314">i915#12314</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk3/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113">i915#6113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-3/igt@kms_flip@flip-vs-suspend@a-hdmi-a2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16276">i915#16276</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113">i915#6113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810">i915#8810</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i915#8813</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056">i915#10056</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk10/igt@kms_frontbuffer_tracking@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056">i915#10056</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-5/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-1/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-7/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-10/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> +56 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-farfromfence-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-16/igt@kms_frontbuffer_tracking@fbchdr-farfromfence-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-render:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-7/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-suspend:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk10/igt@kms_frontbuffer_tracking@fbchdr-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16056">i915#16056</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-tiling-4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-7/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html">SKIP</a> +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> +76 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-18/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-8/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-glk8/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-mmap-cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk4/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk9/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> +498 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-indfb-scaledprimary:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@kms_frontbuffer_tracking@hdr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-pwrite:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-2/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +10 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-8/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-3/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move.html">SKIP</a> +90 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-8/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-16/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-5/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-10/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13688">i915#13688</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-4/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_mst@mst-suspend-read-crc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-6/igt@kms_mst@mst-suspend-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16451">i915#16451</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-3/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-4/igt@kms_pipe_crc_basic@suspend-read-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-4/igt@kms_pipe_crc_basic@suspend-read-crc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756">i915#12756</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476">i915#13476</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476">i915#13476</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13409">i915#13409</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476">i915#13476</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-4tiled:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712">i915#14712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-5/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712">i915#14712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-15/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-5/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-4/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-a-plane-5:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-2/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-a-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-7:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-13/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-2/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +2 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-8/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk11/igt@kms_plane@plane-panning-bottom-right-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13026">i915#13026</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk9/igt@kms_plane_alpha_blend@alpha-transparent-fb.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647">i915#10647</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12177">i915#12177</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk9/igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647">i915#10647</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk10/igt@kms_plane_alpha_blend@constant-alpha-max.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647">i915#10647</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12169">i915#12169</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk10/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647">i915#10647</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-7/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-14/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-10/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-3/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-4:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-9/igt@kms_plane_multiple@tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259">i915#14259</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-2/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259">i915#14259</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-4/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259">i915#14259</a>)</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-2-yuyv-horizontal} (NEW):</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk10/igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-2-yuyv-horizontal.html">SKIP</a> +145 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-2-p010-horizontal} (NEW):</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-2-p010-horizontal.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-7/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812">i915#9812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812">i915#9812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-6/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-3/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-pageflip-negative:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_pm_dc@dc5-pageflip-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@fences-dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-5/igt@kms_pm_rpm@fences-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-dg1-15/igt@kms_pm_rpm@modeset-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-18/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-dg2-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@package-g7:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-8/igt@kms_pm_rpm@package-g7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15403">i915#15403</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-8/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-19/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-5/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-snb4/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-16/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-2/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316">i915#12316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk11/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-4/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-6/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +5 other tests skip</li>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk10/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk6/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-5/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-plane-onoff:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-6/igt@kms_psr@fbc-psr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-5/igt@kms_psr@fbc-psr-sprite-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-move:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_psr@fbc-psr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-mmap-cpu:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-2/igt@kms_psr@fbc-psr2-primary-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-render:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-14/igt@kms_psr@psr-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-mmap-cpu:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@kms_psr@psr-sprite-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-mmap-gtt@edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-4/igt@kms_psr@psr-sprite-mmap-gtt@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-mmap-cpu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-3/igt@kms_psr@psr2-sprite-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949">i915#15949</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949">i915#15949</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-7/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-6/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>) +1 other test skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-13/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-6/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-5/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-1/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-8/igt@perf@per-context-mode-unprivileged.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2435">i915#2435</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@semaphore-busy:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-dg2-8/igt@perf_pmu@semaphore-busy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-7/igt@perf_pmu@semaphore-busy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@semaphore-busy@bcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-mtlp-5/igt@perf_pmu@semaphore-busy@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-8/igt@perf_pmu@semaphore-busy@bcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@prime_udl@share-import-addfb:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-5/igt@prime_udl@share-import-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16420">i915#16420</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-5/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@bind-unbind-vf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-8/igt@sriov_basic@bind-unbind-vf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_freq@sysfs@gt0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-dg2-5/igt@gem_ctx_freq@sysfs@gt0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9561">i915#9561</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-5/igt@gem_ctx_freq@sysfs@gt0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-1/igt@gem_softpin@noreloc-s3.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131">i915#15131</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-7/igt@gem_softpin@noreloc-s3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-3/igt@gem_workarounds@suspend-resume-context.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-4/igt@gem_workarounds@suspend-resume-context.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@reg-read-ioctl:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-dg1-15/igt@i915_pm_rpm@reg-read-ioctl.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4391">i915#4391</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-17/igt@i915_pm_rpm@reg-read-ioctl.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_engines:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-mtlp-5/igt@i915_selftest@live@gt_engines.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16229">i915#16229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-3/igt@i915_selftest@live@gt_engines.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-1/igt@i915_suspend@debugfs-reader.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131">i915#15131</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15140">i915#15140</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-2/igt@i915_suspend@debugfs-reader.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14694">i915#14694</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-tglu-6/igt@kms_cursor_crc@cursor-onscreen-256x85.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-9/igt@kms_cursor_crc@cursor-onscreen-256x85.html">PASS</a> +3 other tests pass</li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-256x85.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-8/igt@kms_cursor_crc@cursor-onscreen-256x85.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-4/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-onoff.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-rte:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-dg2-6/igt@kms_frontbuffer_tracking@fbchdr-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-10/igt@kms_frontbuffer_tracking@fbchdr-1p-rte.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-pwrite:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-glk1/igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-pwrite.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-pwrite.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-8/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_hdr@invalid-metadata-sizes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-glk8/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756">i915#12756</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13409">i915#13409</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476">i915#13476</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-dg2-7/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-4/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-dg1-16/igt@kms_pm_rpm@i2c.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-12/igt@kms_pm_rpm@i2c.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-dg1-15/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-13/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@all-busy-idle-check-all:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-dg2-6/igt@perf_pmu@all-busy-idle-check-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15453">i915#15453</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-7/igt@perf_pmu@all-busy-idle-check-all.html">PASS</a></li>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-mtlp-5/igt@perf_pmu@all-busy-idle-check-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15453">i915#15453</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-mtlp-8/igt@perf_pmu@all-busy-idle-check-all.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-2/igt@gem_ctx_sseu@engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@gem_ctx_sseu@engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-read:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-2/igt@gem_exec_reloc@basic-gtt-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-active:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-4/igt@gem_exec_reloc@basic-write-read-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@gem_exec_reloc@basic-write-read-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-8/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-6/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-8/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@display:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-6/igt@gem_pread@display.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-5/igt@gem_pread@display.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-6/igt@gem_softpin@evict-snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-4/igt@gem_softpin@evict-snoop.html">SKIP</a> +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected-ctx-param:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-8/igt@gen9_exec_parse@basic-rejected-ctx-param.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@gen9_exec_parse@basic-rejected-ctx-param.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-out:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-6/igt@gen9_exec_parse@bb-start-out.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-5/igt@gen9_exec_parse@bb-start-out.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-6/igt@i915_pm_freq_api@freq-reset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#8399</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-8/igt@i915_pm_freq_api@freq-reset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-7/igt@i915_pm_freq_mult@media-freq@gt0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590">i915#6590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@i915_pm_freq_mult@media-freq@gt0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590">i915#6590</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-7/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-dg1-13/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-16/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-dg1-19/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-12/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-2/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-8/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-glk1/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14694">i915#14694</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-glk4/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-4/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-2/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-frame-dump:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-6/igt@kms_chamelium_frames@hdmi-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-4/igt@kms_chamelium_frames@hdmi-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-7/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-dg2-8/igt@kms_content_protection@content-type-change.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13562">i915#13562</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-6/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-5/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-4/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-1/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-6/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915#13748</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-7/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915#13748</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic-ultrajoiner:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-7/igt@kms_dsc@dsc-basic-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_dsc@dsc-basic-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-4/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955">i915#3955</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955">i915#3955</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-5/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-6/igt@kms_flip@2x-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-5/igt@kms_flip@2x-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-dg1-15/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-13/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-4/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-pwrite.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-5/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-3/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187">i915#1187</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-6/igt@kms_hdr@static-toggle-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15436">i915#15436</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-2/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-6/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460">i915#15460</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-4/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460">i915#15460</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-2/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-4/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-6/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-4/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-8/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-onoff:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-6/igt@kms_psr@fbc-pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-3/igt@kms_psr@fbc-pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-move:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-2/igt@kms_psr@psr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@kms_psr@psr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949">i915#15949</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949">i915#15949</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-6/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-3/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-6/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-8/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-dg2-5/igt@perf_pmu@module-unload.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15778">i915#15778</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg2-8/igt@perf_pmu@module-unload.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029">i915#13029</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15778">i915#15778</a>)</li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-dg1-13/igt@perf_pmu@module-unload.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15778">i915#15778</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-dg1-18/igt@perf_pmu@module-unload.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029">i915#13029</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15778">i915#15778</a>)</li>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-tglu-9/igt@perf_pmu@module-unload.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029">i915#13029</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15778">i915#15778</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-tglu-3/igt@perf_pmu@module-unload.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15778">i915#15778</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-2/igt@prime_vgem@coherency-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@prime_vgem@coherency-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18726/shard-rkl-2/igt@sriov_basic@enable-vfs-autoprobe-on.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15452/shard-rkl-6/igt@sriov_basic@enable-vfs-autoprobe-on.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8988 -&gt; IGTPW_15452</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18726: 03288b34f48c3fe60055353c30da4aacab572cdc @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15452: 50ab2a8b1f77b74c6721fa31c14372b1aa3060b0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8988: 8988<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============6867552107562840342==--
