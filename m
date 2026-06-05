Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A30CD6E7B
	for <igt-dev@archiver.kernel.org>; Fri,  5 Jun 2026 22:47:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BF1B112C5B;
	Fri,  5 Jun 2026 22:47:32 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08BFD112C5B;
 Fri,  5 Jun 2026 22:47:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5573194252068203124=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_Enable_multi-format_test?=
 =?utf-8?q?ing_for_pipe_color_tests_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pranay Samala" <pranay.samala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 05 Jun 2026 22:47:10 -0000
Message-ID: <178069963000.49942.11362927701253942672@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260605064103.855630-1-pranay.samala@intel.com>
In-Reply-To: <20260605064103.855630-1-pranay.samala@intel.com>
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

--===============5573194252068203124==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Enable multi-format testing for pipe color tests (rev2)
URL   : https://patchwork.freedesktop.org/series/167634/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_18632_full -> IGTPW_15307_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_15307_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_15307_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/index.html

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_15307_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_color@ctm-0-50:
    - shard-dg1:          [PASS][1] -> [FAIL][2] +7 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-dg1-15/igt@kms_color@ctm-0-50.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-18/igt@kms_color@ctm-0-50.html

  * igt@kms_color@ctm-0-50@pipe-a-hdmi-a-1-nv12 (NEW):
    - shard-tglu-1:       NOTRUN -> [FAIL][3] +12 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-1/igt@kms_color@ctm-0-50@pipe-a-hdmi-a-1-nv12.html

  * igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-1-p010 (NEW):
    - shard-rkl:          NOTRUN -> [FAIL][4] +77 other tests fail
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-8/igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-1-p010.html

  * igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-1-nv12 (NEW):
    - shard-glk:          NOTRUN -> [FAIL][5] +92 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk2/igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-1-nv12.html

  * igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-1-nv12 (NEW):
    - shard-tglu:         NOTRUN -> [FAIL][6] +99 other tests fail
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-7/igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-1-nv12.html

  * igt@kms_color@ctm-max:
    - shard-dg2:          [PASS][7] -> [FAIL][8] +2 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-dg2-3/igt@kms_color@ctm-max.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-6/igt@kms_color@ctm-max.html

  * igt@kms_color@ctm-max@pipe-a-hdmi-a-3-nv12 (NEW):
    - shard-dg2:          NOTRUN -> [FAIL][9] +101 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-6/igt@kms_color@ctm-max@pipe-a-hdmi-a-3-nv12.html

  * igt@kms_color@ctm-negative@pipe-a-hdmi-a-2-p010 (NEW):
    - shard-glk10:        NOTRUN -> [FAIL][10] +18 other tests fail
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk10/igt@kms_color@ctm-negative@pipe-a-hdmi-a-2-p010.html

  * igt@kms_color@ctm-negative@pipe-d-edp-1-nv12 (NEW):
    - shard-mtlp:         NOTRUN -> [FAIL][11] +112 other tests fail
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-6/igt@kms_color@ctm-negative@pipe-d-edp-1-nv12.html

  * igt@kms_color@ctm-negative@pipe-d-hdmi-a-1-yuyv (NEW):
    - shard-dg1:          NOTRUN -> [FAIL][12] +112 other tests fail
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-14/igt@kms_color@ctm-negative@pipe-d-hdmi-a-1-yuyv.html

  * igt@kms_color@ctm-signed:
    - shard-tglu:         [PASS][13] -> [FAIL][14] +5 other tests fail
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-tglu-7/igt@kms_color@ctm-signed.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-7/igt@kms_color@ctm-signed.html
    - shard-mtlp:         [PASS][15] -> [FAIL][16] +8 other tests fail
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-mtlp-1/igt@kms_color@ctm-signed.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-6/igt@kms_color@ctm-signed.html

  * igt@kms_color@degamma:
    - shard-rkl:          [PASS][17] -> [FAIL][18] +2 other tests fail
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-4/igt@kms_color@degamma.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-2/igt@kms_color@degamma.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-dg2:          [PASS][19] -> [SKIP][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-dg2-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  
New tests
---------

  New tests have been introduced between CI_DRM_18632_full and IGTPW_15307_full:

### New IGT tests (832) ###

  * igt@kms_color@ctm-0-25@pipe-a-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [7.58] s

  * igt@kms_color@ctm-0-25@pipe-a-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [7.68] s

  * igt@kms_color@ctm-0-25@pipe-a-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [4.31] s

  * igt@kms_color@ctm-0-25@pipe-a-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [3.51] s

  * igt@kms_color@ctm-0-25@pipe-a-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [7.49] s

  * igt@kms_color@ctm-0-25@pipe-a-hdmi-a-1-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [1.95, 4.02] s

  * igt@kms_color@ctm-0-25@pipe-a-hdmi-a-1-p010:
    - Statuses : 2 fail(s)
    - Exec time: [2.26, 4.80] s

  * igt@kms_color@ctm-0-25@pipe-a-hdmi-a-1-xrgb2101010:
    - Statuses : 3 pass(s)
    - Exec time: [1.90, 2.92] s

  * igt@kms_color@ctm-0-25@pipe-a-hdmi-a-1-xrgb8888:
    - Statuses : 3 pass(s)
    - Exec time: [0.83, 2.19] s

  * igt@kms_color@ctm-0-25@pipe-a-hdmi-a-1-yuyv:
    - Statuses : 2 fail(s)
    - Exec time: [1.89, 4.19] s

  * igt@kms_color@ctm-0-25@pipe-a-hdmi-a-2-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [2.53, 4.01] s

  * igt@kms_color@ctm-0-25@pipe-a-hdmi-a-2-p010:
    - Statuses : 2 fail(s)
    - Exec time: [2.94, 4.81] s

  * igt@kms_color@ctm-0-25@pipe-a-hdmi-a-2-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [2.18, 2.92] s

  * igt@kms_color@ctm-0-25@pipe-a-hdmi-a-2-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [1.45, 1.91] s

  * igt@kms_color@ctm-0-25@pipe-a-hdmi-a-2-yuyv:
    - Statuses : 2 fail(s)
    - Exec time: [2.67, 4.16] s

  * igt@kms_color@ctm-0-25@pipe-a-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.80] s

  * igt@kms_color@ctm-0-25@pipe-a-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [5.24] s

  * igt@kms_color@ctm-0-25@pipe-a-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [18.31] s

  * igt@kms_color@ctm-0-25@pipe-a-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.68] s

  * igt@kms_color@ctm-0-25@pipe-a-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.20] s

  * igt@kms_color@ctm-0-25@pipe-a-hdmi-a-4-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.03] s

  * igt@kms_color@ctm-0-25@pipe-a-hdmi-a-4-p010:
    - Statuses : 1 fail(s)
    - Exec time: [3.83] s

  * igt@kms_color@ctm-0-25@pipe-a-hdmi-a-4-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [9.53] s

  * igt@kms_color@ctm-0-25@pipe-a-hdmi-a-4-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.62] s

  * igt@kms_color@ctm-0-25@pipe-a-hdmi-a-4-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [3.31] s

  * igt@kms_color@ctm-0-25@pipe-a-vga-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.60] s

  * igt@kms_color@ctm-0-25@pipe-a-vga-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.41] s

  * igt@kms_color@ctm-0-25@pipe-b-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [7.26] s

  * igt@kms_color@ctm-0-25@pipe-b-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [7.71] s

  * igt@kms_color@ctm-0-25@pipe-b-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [4.35] s

  * igt@kms_color@ctm-0-25@pipe-b-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [4.23] s

  * igt@kms_color@ctm-0-25@pipe-b-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [7.67] s

  * igt@kms_color@ctm-0-25@pipe-b-hdmi-a-1-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [1.98, 4.08] s

  * igt@kms_color@ctm-0-25@pipe-b-hdmi-a-1-p010:
    - Statuses : 2 fail(s)
    - Exec time: [2.25, 4.80] s

  * igt@kms_color@ctm-0-25@pipe-b-hdmi-a-1-xrgb2101010:
    - Statuses : 3 pass(s)
    - Exec time: [1.90, 2.92] s

  * igt@kms_color@ctm-0-25@pipe-b-hdmi-a-1-xrgb8888:
    - Statuses : 3 pass(s)
    - Exec time: [0.82, 1.82] s

  * igt@kms_color@ctm-0-25@pipe-b-hdmi-a-1-yuyv:
    - Statuses : 2 fail(s)
    - Exec time: [1.87, 4.25] s

  * igt@kms_color@ctm-0-25@pipe-b-hdmi-a-2-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [2.58, 4.03] s

  * igt@kms_color@ctm-0-25@pipe-b-hdmi-a-2-p010:
    - Statuses : 2 fail(s)
    - Exec time: [2.87, 4.96] s

  * igt@kms_color@ctm-0-25@pipe-b-hdmi-a-2-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [2.15, 2.97] s

  * igt@kms_color@ctm-0-25@pipe-b-hdmi-a-2-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [1.35, 1.87] s

  * igt@kms_color@ctm-0-25@pipe-b-hdmi-a-2-yuyv:
    - Statuses : 2 fail(s)
    - Exec time: [2.63, 4.18] s

  * igt@kms_color@ctm-0-25@pipe-b-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.66] s

  * igt@kms_color@ctm-0-25@pipe-b-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [4.97] s

  * igt@kms_color@ctm-0-25@pipe-b-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [18.29] s

  * igt@kms_color@ctm-0-25@pipe-b-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.44] s

  * igt@kms_color@ctm-0-25@pipe-b-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.21] s

  * igt@kms_color@ctm-0-25@pipe-b-hdmi-a-4-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.08] s

  * igt@kms_color@ctm-0-25@pipe-b-hdmi-a-4-p010:
    - Statuses : 1 fail(s)
    - Exec time: [3.86] s

  * igt@kms_color@ctm-0-25@pipe-b-hdmi-a-4-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [9.50] s

  * igt@kms_color@ctm-0-25@pipe-b-hdmi-a-4-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.41] s

  * igt@kms_color@ctm-0-25@pipe-b-hdmi-a-4-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [3.32] s

  * igt@kms_color@ctm-0-25@pipe-b-vga-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.60] s

  * igt@kms_color@ctm-0-25@pipe-b-vga-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.29] s

  * igt@kms_color@ctm-0-25@pipe-c-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [7.14] s

  * igt@kms_color@ctm-0-25@pipe-c-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [7.72] s

  * igt@kms_color@ctm-0-25@pipe-c-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [4.25] s

  * igt@kms_color@ctm-0-25@pipe-c-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [4.00] s

  * igt@kms_color@ctm-0-25@pipe-c-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [7.17] s

  * igt@kms_color@ctm-0-25@pipe-c-hdmi-a-1-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [1.98, 4.09] s

  * igt@kms_color@ctm-0-25@pipe-c-hdmi-a-1-p010:
    - Statuses : 2 fail(s)
    - Exec time: [2.24, 4.87] s

  * igt@kms_color@ctm-0-25@pipe-c-hdmi-a-1-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [1.90, 2.93] s

  * igt@kms_color@ctm-0-25@pipe-c-hdmi-a-1-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [0.82, 1.89] s

  * igt@kms_color@ctm-0-25@pipe-c-hdmi-a-1-yuyv:
    - Statuses : 2 fail(s)
    - Exec time: [1.91, 4.16] s

  * igt@kms_color@ctm-0-25@pipe-c-hdmi-a-2-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [2.56, 3.94] s

  * igt@kms_color@ctm-0-25@pipe-c-hdmi-a-2-p010:
    - Statuses : 2 fail(s)
    - Exec time: [2.86, 4.75] s

  * igt@kms_color@ctm-0-25@pipe-c-hdmi-a-2-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [2.17, 2.91] s

  * igt@kms_color@ctm-0-25@pipe-c-hdmi-a-2-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [1.35, 1.89] s

  * igt@kms_color@ctm-0-25@pipe-c-hdmi-a-2-yuyv:
    - Statuses : 2 fail(s)
    - Exec time: [2.66, 4.18] s

  * igt@kms_color@ctm-0-25@pipe-c-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.79] s

  * igt@kms_color@ctm-0-25@pipe-c-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [5.01] s

  * igt@kms_color@ctm-0-25@pipe-c-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [18.30] s

  * igt@kms_color@ctm-0-25@pipe-c-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.41] s

  * igt@kms_color@ctm-0-25@pipe-c-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [3.98] s

  * igt@kms_color@ctm-0-25@pipe-c-hdmi-a-4-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.04] s

  * igt@kms_color@ctm-0-25@pipe-c-hdmi-a-4-p010:
    - Statuses : 1 fail(s)
    - Exec time: [3.86] s

  * igt@kms_color@ctm-0-25@pipe-c-hdmi-a-4-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [9.50] s

  * igt@kms_color@ctm-0-25@pipe-c-hdmi-a-4-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.41] s

  * igt@kms_color@ctm-0-25@pipe-c-hdmi-a-4-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [3.25] s

  * igt@kms_color@ctm-0-25@pipe-d-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [7.17] s

  * igt@kms_color@ctm-0-25@pipe-d-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [7.71] s

  * igt@kms_color@ctm-0-25@pipe-d-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [4.25] s

  * igt@kms_color@ctm-0-25@pipe-d-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [4.00] s

  * igt@kms_color@ctm-0-25@pipe-d-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [7.15] s

  * igt@kms_color@ctm-0-25@pipe-d-hdmi-a-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.98] s

  * igt@kms_color@ctm-0-25@pipe-d-hdmi-a-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [2.23] s

  * igt@kms_color@ctm-0-25@pipe-d-hdmi-a-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.91] s

  * igt@kms_color@ctm-0-25@pipe-d-hdmi-a-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.81] s

  * igt@kms_color@ctm-0-25@pipe-d-hdmi-a-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.90] s

  * igt@kms_color@ctm-0-25@pipe-d-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.77] s

  * igt@kms_color@ctm-0-25@pipe-d-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [4.98] s

  * igt@kms_color@ctm-0-25@pipe-d-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [18.28] s

  * igt@kms_color@ctm-0-25@pipe-d-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.43] s

  * igt@kms_color@ctm-0-25@pipe-d-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.20] s

  * igt@kms_color@ctm-0-25@pipe-d-hdmi-a-4-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.11] s

  * igt@kms_color@ctm-0-25@pipe-d-hdmi-a-4-p010:
    - Statuses : 1 fail(s)
    - Exec time: [3.80] s

  * igt@kms_color@ctm-0-25@pipe-d-hdmi-a-4-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [9.48] s

  * igt@kms_color@ctm-0-25@pipe-d-hdmi-a-4-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.44] s

  * igt@kms_color@ctm-0-25@pipe-d-hdmi-a-4-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [3.29] s

  * igt@kms_color@ctm-0-50@pipe-a-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [7.26] s

  * igt@kms_color@ctm-0-50@pipe-a-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [7.64] s

  * igt@kms_color@ctm-0-50@pipe-a-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [4.24] s

  * igt@kms_color@ctm-0-50@pipe-a-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [3.57] s

  * igt@kms_color@ctm-0-50@pipe-a-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [7.32] s

  * igt@kms_color@ctm-0-50@pipe-a-hdmi-a-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.69] s

  * igt@kms_color@ctm-0-50@pipe-a-hdmi-a-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [2.95] s

  * igt@kms_color@ctm-0-50@pipe-a-hdmi-a-1-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [2.37] s

  * igt@kms_color@ctm-0-50@pipe-a-hdmi-a-1-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [1.50, 1.51] s

  * igt@kms_color@ctm-0-50@pipe-a-hdmi-a-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [2.70] s

  * igt@kms_color@ctm-0-50@pipe-a-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.77] s

  * igt@kms_color@ctm-0-50@pipe-a-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [5.65] s

  * igt@kms_color@ctm-0-50@pipe-a-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [19.01] s

  * igt@kms_color@ctm-0-50@pipe-a-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.59] s

  * igt@kms_color@ctm-0-50@pipe-a-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.50] s

  * igt@kms_color@ctm-0-50@pipe-a-hdmi-a-4-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.04] s

  * igt@kms_color@ctm-0-50@pipe-a-hdmi-a-4-p010:
    - Statuses : 1 fail(s)
    - Exec time: [3.90] s

  * igt@kms_color@ctm-0-50@pipe-a-hdmi-a-4-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [9.54] s

  * igt@kms_color@ctm-0-50@pipe-a-hdmi-a-4-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.61] s

  * igt@kms_color@ctm-0-50@pipe-a-hdmi-a-4-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [3.29] s

  * igt@kms_color@ctm-0-50@pipe-a-vga-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.59] s

  * igt@kms_color@ctm-0-50@pipe-a-vga-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.40] s

  * igt@kms_color@ctm-0-50@pipe-b-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [7.27] s

  * igt@kms_color@ctm-0-50@pipe-b-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [7.71] s

  * igt@kms_color@ctm-0-50@pipe-b-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [4.25] s

  * igt@kms_color@ctm-0-50@pipe-b-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [4.24] s

  * igt@kms_color@ctm-0-50@pipe-b-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [7.32] s

  * igt@kms_color@ctm-0-50@pipe-b-hdmi-a-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.71] s

  * igt@kms_color@ctm-0-50@pipe-b-hdmi-a-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [2.89] s

  * igt@kms_color@ctm-0-50@pipe-b-hdmi-a-1-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [2.39, 2.41] s

  * igt@kms_color@ctm-0-50@pipe-b-hdmi-a-1-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [1.34, 1.49] s

  * igt@kms_color@ctm-0-50@pipe-b-hdmi-a-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [2.66] s

  * igt@kms_color@ctm-0-50@pipe-b-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.80] s

  * igt@kms_color@ctm-0-50@pipe-b-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [5.49] s

  * igt@kms_color@ctm-0-50@pipe-b-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [18.99] s

  * igt@kms_color@ctm-0-50@pipe-b-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.41] s

  * igt@kms_color@ctm-0-50@pipe-b-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.38] s

  * igt@kms_color@ctm-0-50@pipe-b-hdmi-a-4-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.05] s

  * igt@kms_color@ctm-0-50@pipe-b-hdmi-a-4-p010:
    - Statuses : 1 fail(s)
    - Exec time: [3.86] s

  * igt@kms_color@ctm-0-50@pipe-b-hdmi-a-4-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [9.59] s

  * igt@kms_color@ctm-0-50@pipe-b-hdmi-a-4-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.41] s

  * igt@kms_color@ctm-0-50@pipe-b-hdmi-a-4-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [3.28] s

  * igt@kms_color@ctm-0-50@pipe-b-vga-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.59] s

  * igt@kms_color@ctm-0-50@pipe-b-vga-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.27] s

  * igt@kms_color@ctm-0-50@pipe-c-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [7.15] s

  * igt@kms_color@ctm-0-50@pipe-c-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [7.68] s

  * igt@kms_color@ctm-0-50@pipe-c-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [4.21] s

  * igt@kms_color@ctm-0-50@pipe-c-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [3.99] s

  * igt@kms_color@ctm-0-50@pipe-c-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [7.17] s

  * igt@kms_color@ctm-0-50@pipe-c-hdmi-a-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.66] s

  * igt@kms_color@ctm-0-50@pipe-c-hdmi-a-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [2.88] s

  * igt@kms_color@ctm-0-50@pipe-c-hdmi-a-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.38] s

  * igt@kms_color@ctm-0-50@pipe-c-hdmi-a-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_color@ctm-0-50@pipe-c-hdmi-a-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [2.67] s

  * igt@kms_color@ctm-0-50@pipe-c-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.77] s

  * igt@kms_color@ctm-0-50@pipe-c-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [5.32] s

  * igt@kms_color@ctm-0-50@pipe-c-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [18.99] s

  * igt@kms_color@ctm-0-50@pipe-c-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.44] s

  * igt@kms_color@ctm-0-50@pipe-c-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.23] s

  * igt@kms_color@ctm-0-50@pipe-c-hdmi-a-4-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.10] s

  * igt@kms_color@ctm-0-50@pipe-c-hdmi-a-4-p010:
    - Statuses : 1 fail(s)
    - Exec time: [3.90] s

  * igt@kms_color@ctm-0-50@pipe-c-hdmi-a-4-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [9.57] s

  * igt@kms_color@ctm-0-50@pipe-c-hdmi-a-4-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.44] s

  * igt@kms_color@ctm-0-50@pipe-c-hdmi-a-4-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [3.24] s

  * igt@kms_color@ctm-0-50@pipe-d-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [7.12] s

  * igt@kms_color@ctm-0-50@pipe-d-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [7.70] s

  * igt@kms_color@ctm-0-50@pipe-d-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [4.16] s

  * igt@kms_color@ctm-0-50@pipe-d-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [4.01] s

  * igt@kms_color@ctm-0-50@pipe-d-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [7.17] s

  * igt@kms_color@ctm-0-50@pipe-d-hdmi-a-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.66] s

  * igt@kms_color@ctm-0-50@pipe-d-hdmi-a-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [2.88] s

  * igt@kms_color@ctm-0-50@pipe-d-hdmi-a-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.38] s

  * igt@kms_color@ctm-0-50@pipe-d-hdmi-a-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_color@ctm-0-50@pipe-d-hdmi-a-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [2.70] s

  * igt@kms_color@ctm-0-50@pipe-d-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.79] s

  * igt@kms_color@ctm-0-50@pipe-d-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [5.52] s

  * igt@kms_color@ctm-0-50@pipe-d-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [19.10] s

  * igt@kms_color@ctm-0-50@pipe-d-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.41] s

  * igt@kms_color@ctm-0-50@pipe-d-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.31] s

  * igt@kms_color@ctm-0-50@pipe-d-hdmi-a-4-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.16] s

  * igt@kms_color@ctm-0-50@pipe-d-hdmi-a-4-p010:
    - Statuses : 1 fail(s)
    - Exec time: [3.84] s

  * igt@kms_color@ctm-0-50@pipe-d-hdmi-a-4-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [9.54] s

  * igt@kms_color@ctm-0-50@pipe-d-hdmi-a-4-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.45] s

  * igt@kms_color@ctm-0-50@pipe-d-hdmi-a-4-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [3.27] s

  * igt@kms_color@ctm-0-75@pipe-a-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [10.86] s

  * igt@kms_color@ctm-0-75@pipe-a-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [10.70] s

  * igt@kms_color@ctm-0-75@pipe-a-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.93] s

  * igt@kms_color@ctm-0-75@pipe-a-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [4.95] s

  * igt@kms_color@ctm-0-75@pipe-a-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [10.37] s

  * igt@kms_color@ctm-0-75@pipe-a-hdmi-a-1-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [2.73, 4.39] s

  * igt@kms_color@ctm-0-75@pipe-a-hdmi-a-1-p010:
    - Statuses : 2 fail(s)
    - Exec time: [3.16, 5.52] s

  * igt@kms_color@ctm-0-75@pipe-a-hdmi-a-1-xrgb2101010:
    - Statuses : 3 pass(s)
    - Exec time: [0.65, 3.16] s

  * igt@kms_color@ctm-0-75@pipe-a-hdmi-a-1-xrgb8888:
    - Statuses : 3 pass(s)
    - Exec time: [1.11, 2.19] s

  * igt@kms_color@ctm-0-75@pipe-a-hdmi-a-1-yuyv:
    - Statuses : 2 fail(s)
    - Exec time: [2.68, 4.64] s

  * igt@kms_color@ctm-0-75@pipe-a-hdmi-a-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.38] s

  * igt@kms_color@ctm-0-75@pipe-a-hdmi-a-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [3.95] s

  * igt@kms_color@ctm-0-75@pipe-a-hdmi-a-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.69] s

  * igt@kms_color@ctm-0-75@pipe-a-hdmi-a-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.91] s

  * igt@kms_color@ctm-0-75@pipe-a-hdmi-a-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [3.45] s

  * igt@kms_color@ctm-0-75@pipe-a-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [5.20] s

  * igt@kms_color@ctm-0-75@pipe-a-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [7.21] s

  * igt@kms_color@ctm-0-75@pipe-a-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [6.10] s

  * igt@kms_color@ctm-0-75@pipe-a-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [2.04] s

  * igt@kms_color@ctm-0-75@pipe-a-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [5.89] s

  * igt@kms_color@ctm-0-75@pipe-a-vga-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.56] s

  * igt@kms_color@ctm-0-75@pipe-a-vga-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.79] s

  * igt@kms_color@ctm-0-75@pipe-b-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [10.05] s

  * igt@kms_color@ctm-0-75@pipe-b-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [10.68] s

  * igt@kms_color@ctm-0-75@pipe-b-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.46] s

  * igt@kms_color@ctm-0-75@pipe-b-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [5.70] s

  * igt@kms_color@ctm-0-75@pipe-b-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [10.12] s

  * igt@kms_color@ctm-0-75@pipe-b-hdmi-a-1-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [2.77, 4.32] s

  * igt@kms_color@ctm-0-75@pipe-b-hdmi-a-1-p010:
    - Statuses : 2 fail(s)
    - Exec time: [3.13, 5.35] s

  * igt@kms_color@ctm-0-75@pipe-b-hdmi-a-1-xrgb2101010:
    - Statuses : 3 pass(s)
    - Exec time: [0.63, 3.17] s

  * igt@kms_color@ctm-0-75@pipe-b-hdmi-a-1-xrgb8888:
    - Statuses : 3 pass(s)
    - Exec time: [1.09, 1.98] s

  * igt@kms_color@ctm-0-75@pipe-b-hdmi-a-1-yuyv:
    - Statuses : 2 fail(s)
    - Exec time: [2.60, 4.61] s

  * igt@kms_color@ctm-0-75@pipe-b-hdmi-a-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.37] s

  * igt@kms_color@ctm-0-75@pipe-b-hdmi-a-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [3.95] s

  * igt@kms_color@ctm-0-75@pipe-b-hdmi-a-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.69] s

  * igt@kms_color@ctm-0-75@pipe-b-hdmi-a-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.71] s

  * igt@kms_color@ctm-0-75@pipe-b-hdmi-a-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [3.49] s

  * igt@kms_color@ctm-0-75@pipe-b-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [5.30] s

  * igt@kms_color@ctm-0-75@pipe-b-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [7.02] s

  * igt@kms_color@ctm-0-75@pipe-b-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [6.08] s

  * igt@kms_color@ctm-0-75@pipe-b-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.83] s

  * igt@kms_color@ctm-0-75@pipe-b-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [5.68] s

  * igt@kms_color@ctm-0-75@pipe-b-vga-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.52] s

  * igt@kms_color@ctm-0-75@pipe-b-vga-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.71] s

  * igt@kms_color@ctm-0-75@pipe-c-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [9.99] s

  * igt@kms_color@ctm-0-75@pipe-c-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [10.69] s

  * igt@kms_color@ctm-0-75@pipe-c-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.37] s

  * igt@kms_color@ctm-0-75@pipe-c-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [5.34] s

  * igt@kms_color@ctm-0-75@pipe-c-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [10.02] s

  * igt@kms_color@ctm-0-75@pipe-c-hdmi-a-1-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [2.77, 4.37] s

  * igt@kms_color@ctm-0-75@pipe-c-hdmi-a-1-p010:
    - Statuses : 2 fail(s)
    - Exec time: [3.19, 5.36] s

  * igt@kms_color@ctm-0-75@pipe-c-hdmi-a-1-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [0.63, 3.17] s

  * igt@kms_color@ctm-0-75@pipe-c-hdmi-a-1-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [1.08, 1.90] s

  * igt@kms_color@ctm-0-75@pipe-c-hdmi-a-1-yuyv:
    - Statuses : 2 fail(s)
    - Exec time: [2.57, 4.54] s

  * igt@kms_color@ctm-0-75@pipe-c-hdmi-a-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.42] s

  * igt@kms_color@ctm-0-75@pipe-c-hdmi-a-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [3.91] s

  * igt@kms_color@ctm-0-75@pipe-c-hdmi-a-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.69] s

  * igt@kms_color@ctm-0-75@pipe-c-hdmi-a-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.73] s

  * igt@kms_color@ctm-0-75@pipe-c-hdmi-a-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [3.39] s

  * igt@kms_color@ctm-0-75@pipe-c-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [5.17] s

  * igt@kms_color@ctm-0-75@pipe-c-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [7.28] s

  * igt@kms_color@ctm-0-75@pipe-c-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [6.08] s

  * igt@kms_color@ctm-0-75@pipe-c-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.91] s

  * igt@kms_color@ctm-0-75@pipe-c-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [5.64] s

  * igt@kms_color@ctm-0-75@pipe-d-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [10.03] s

  * igt@kms_color@ctm-0-75@pipe-d-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [10.76] s

  * igt@kms_color@ctm-0-75@pipe-d-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_color@ctm-0-75@pipe-d-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [5.37] s

  * igt@kms_color@ctm-0-75@pipe-d-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [10.12] s

  * igt@kms_color@ctm-0-75@pipe-d-hdmi-a-1-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [2.78, 4.31] s

  * igt@kms_color@ctm-0-75@pipe-d-hdmi-a-1-p010:
    - Statuses : 2 fail(s)
    - Exec time: [3.13, 5.39] s

  * igt@kms_color@ctm-0-75@pipe-d-hdmi-a-1-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [0.63, 3.19] s

  * igt@kms_color@ctm-0-75@pipe-d-hdmi-a-1-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [1.07, 1.90] s

  * igt@kms_color@ctm-0-75@pipe-d-hdmi-a-1-yuyv:
    - Statuses : 2 fail(s)
    - Exec time: [2.67, 4.58] s

  * igt@kms_color@ctm-0-75@pipe-d-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [5.29] s

  * igt@kms_color@ctm-0-75@pipe-d-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [6.98] s

  * igt@kms_color@ctm-0-75@pipe-d-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [6.12] s

  * igt@kms_color@ctm-0-75@pipe-d-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.86] s

  * igt@kms_color@ctm-0-75@pipe-d-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [5.66] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.47] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.56] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.41] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.69] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.52] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-1-nv12:
    - Statuses : 4 fail(s)
    - Exec time: [0.42, 0.84] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-1-p010:
    - Statuses : 4 fail(s)
    - Exec time: [0.53, 1.35] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-1-xrgb2101010:
    - Statuses : 5 pass(s)
    - Exec time: [0.63, 6.61] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-1-xrgb8888:
    - Statuses : 5 pass(s)
    - Exec time: [0.30, 0.95] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-1-yuyv:
    - Statuses : 4 fail(s)
    - Exec time: [0.47, 1.03] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.85] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.02] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.98] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.67] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.85] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.60] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [0.81] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [3.20] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.68] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.70] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-vga-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.53] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-vga-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.55] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.47] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.52] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.44] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-1-nv12:
    - Statuses : 4 fail(s)
    - Exec time: [0.45, 0.84] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-1-p010:
    - Statuses : 4 fail(s)
    - Exec time: [0.49, 1.20] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-1-xrgb2101010:
    - Statuses : 5 pass(s)
    - Exec time: [0.63, 6.62] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-1-xrgb8888:
    - Statuses : 5 pass(s)
    - Exec time: [0.29, 0.64] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-1-yuyv:
    - Statuses : 4 fail(s)
    - Exec time: [0.42, 0.95] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.84] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [0.98] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.01] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.65] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.87] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.64] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [0.78] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [3.17] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.50] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.65] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-vga-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.52] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-vga-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.42] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.41] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.54] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.42] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.49] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-1-nv12:
    - Statuses : 4 fail(s)
    - Exec time: [0.43, 0.84] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-1-p010:
    - Statuses : 4 fail(s)
    - Exec time: [0.50, 1.20] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-1-xrgb2101010:
    - Statuses : 4 pass(s)
    - Exec time: [0.64, 6.62] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-1-xrgb8888:
    - Statuses : 4 pass(s)
    - Exec time: [0.28, 0.72] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-1-yuyv:
    - Statuses : 4 fail(s)
    - Exec time: [0.41, 0.95] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.82] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [0.96] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.00] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.66] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.88] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.62] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [0.79] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [3.19] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.53] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.65] s

  * igt@kms_color@ctm-blue-to-red@pipe-d-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.37] s

  * igt@kms_color@ctm-blue-to-red@pipe-d-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.53] s

  * igt@kms_color@ctm-blue-to-red@pipe-d-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.35] s

  * igt@kms_color@ctm-blue-to-red@pipe-d-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_color@ctm-blue-to-red@pipe-d-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.40] s

  * igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-1-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [0.42, 0.80] s

  * igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-1-p010:
    - Statuses : 2 fail(s)
    - Exec time: [0.49, 1.20] s

  * igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-1-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [0.65, 6.62] s

  * igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-1-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [0.29, 0.55] s

  * igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-1-yuyv:
    - Statuses : 2 fail(s)
    - Exec time: [0.42, 0.95] s

  * igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.61] s

  * igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [0.78] s

  * igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [3.20] s

  * igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.56] s

  * igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.66] s

  * igt@kms_color@ctm-green-to-red@pipe-a-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.43] s

  * igt@kms_color@ctm-green-to-red@pipe-a-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.60] s

  * igt@kms_color@ctm-green-to-red@pipe-a-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.35] s

  * igt@kms_color@ctm-green-to-red@pipe-a-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.70] s

  * igt@kms_color@ctm-green-to-red@pipe-a-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.48] s

  * igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-1-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [0.40, 0.84] s

  * igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-1-p010:
    - Statuses : 2 fail(s)
    - Exec time: [0.48, 1.01] s

  * igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-1-xrgb2101010:
    - Statuses : 3 pass(s)
    - Exec time: [0.64, 1.02] s

  * igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-1-xrgb8888:
    - Statuses : 3 pass(s)
    - Exec time: [0.31, 0.95] s

  * igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-1-yuyv:
    - Statuses : 2 fail(s)
    - Exec time: [0.41, 0.94] s

  * igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-2-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [0.85, 1.93] s

  * igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-2-p010:
    - Statuses : 2 fail(s)
    - Exec time: [0.63, 0.97] s

  * igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-2-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [0.72, 1.00] s

  * igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-2-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [0.66] s

  * igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-2-yuyv:
    - Statuses : 2 fail(s)
    - Exec time: [0.57, 0.88] s

  * igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.78] s

  * igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.10] s

  * igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [6.10] s

  * igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.69] s

  * igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.92] s

  * igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-4-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.62] s

  * igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-4-p010:
    - Statuses : 1 fail(s)
    - Exec time: [0.82] s

  * igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-4-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [3.16] s

  * igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-4-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.67] s

  * igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-4-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.70] s

  * igt@kms_color@ctm-green-to-red@pipe-a-vga-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.53] s

  * igt@kms_color@ctm-green-to-red@pipe-a-vga-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.55] s

  * igt@kms_color@ctm-green-to-red@pipe-b-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.46] s

  * igt@kms_color@ctm-green-to-red@pipe-b-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.57] s

  * igt@kms_color@ctm-green-to-red@pipe-b-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.37] s

  * igt@kms_color@ctm-green-to-red@pipe-b-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_color@ctm-green-to-red@pipe-b-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.45] s

  * igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-1-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [0.41, 0.84] s

  * igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-1-p010:
    - Statuses : 2 fail(s)
    - Exec time: [0.45, 0.96] s

  * igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-1-xrgb2101010:
    - Statuses : 3 pass(s)
    - Exec time: [0.64, 1.00] s

  * igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-1-xrgb8888:
    - Statuses : 3 pass(s)
    - Exec time: [0.30, 0.66] s

  * igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-1-yuyv:
    - Statuses : 2 fail(s)
    - Exec time: [0.39, 0.92] s

  * igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-2-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [1.70, 1.86] s

  * igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-2-p010:
    - Statuses : 2 fail(s)
    - Exec time: [0.58, 0.97] s

  * igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-2-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [0.72, 1.01] s

  * igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-2-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [0.48, 0.64] s

  * igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-2-yuyv:
    - Statuses : 2 fail(s)
    - Exec time: [0.53, 0.84] s

  * igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.75] s

  * igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.05] s

  * igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [6.08] s

  * igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.49] s

  * igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.83] s

  * igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-4-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.62] s

  * igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-4-p010:
    - Statuses : 1 fail(s)
    - Exec time: [0.73] s

  * igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-4-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [3.19] s

  * igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-4-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.50] s

  * igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-4-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.65] s

  * igt@kms_color@ctm-green-to-red@pipe-b-vga-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.53] s

  * igt@kms_color@ctm-green-to-red@pipe-b-vga-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.43] s

  * igt@kms_color@ctm-green-to-red@pipe-c-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.42] s

  * igt@kms_color@ctm-green-to-red@pipe-c-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.55] s

  * igt@kms_color@ctm-green-to-red@pipe-c-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.37] s

  * igt@kms_color@ctm-green-to-red@pipe-c-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_color@ctm-green-to-red@pipe-c-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.44] s

  * igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-1-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [0.41, 0.87] s

  * igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-1-p010:
    - Statuses : 2 fail(s)
    - Exec time: [0.45, 1.01] s

  * igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-1-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [0.63, 0.99] s

  * igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-1-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [0.30, 0.67] s

  * igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-1-yuyv:
    - Statuses : 2 fail(s)
    - Exec time: [0.38, 0.85] s

  * igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-2-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [0.85, 1.78] s

  * igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-2-p010:
    - Statuses : 2 fail(s)
    - Exec time: [0.57, 1.0] s

  * igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-2-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [0.72, 1.00] s

  * igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-2-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [0.49, 0.65] s

  * igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-2-yuyv:
    - Statuses : 2 fail(s)
    - Exec time: [0.53, 0.84] s

  * igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.76] s

  * igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.05] s

  * igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [6.08] s

  * igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.57] s

  * igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.85] s

  * igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-4-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.16] s

  * igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-4-p010:
    - Statuses : 1 fail(s)
    - Exec time: [0.78] s

  * igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-4-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [3.19] s

  * igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-4-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.53] s

  * igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-4-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.67] s

  * igt@kms_color@ctm-green-to-red@pipe-d-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.46] s

  * igt@kms_color@ctm-green-to-red@pipe-d-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.49] s

  * igt@kms_color@ctm-green-to-red@pipe-d-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_color@ctm-green-to-red@pipe-d-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_color@ctm-green-to-red@pipe-d-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.36] s

  * igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.40] s

  * igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [0.46] s

  * igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.64] s

  * igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.29] s

  * igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.39] s

  * igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.75] s

  * igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.02] s

  * igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [6.08] s

  * igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.51] s

  * igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.85] s

  * igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-4-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.64] s

  * igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-4-p010:
    - Statuses : 1 fail(s)
    - Exec time: [0.78] s

  * igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-4-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [3.19] s

  * igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-4-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.52] s

  * igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-4-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.67] s

  * igt@kms_color@ctm-max@pipe-a-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.54] s

  * igt@kms_color@ctm-max@pipe-a-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.58] s

  * igt@kms_color@ctm-max@pipe-a-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.44] s

  * igt@kms_color@ctm-max@pipe-a-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.76] s

  * igt@kms_color@ctm-max@pipe-a-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.51] s

  * igt@kms_color@ctm-max@pipe-a-hdmi-a-1-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [0.40, 0.51] s

  * igt@kms_color@ctm-max@pipe-a-hdmi-a-1-p010:
    - Statuses : 2 fail(s)
    - Exec time: [0.47, 0.59] s

  * igt@kms_color@ctm-max@pipe-a-hdmi-a-1-xrgb2101010:
    - Statuses : 3 pass(s)
    - Exec time: [0.64, 0.79] s

  * igt@kms_color@ctm-max@pipe-a-hdmi-a-1-xrgb8888:
    - Statuses : 3 pass(s)
    - Exec time: [0.30, 0.56] s

  * igt@kms_color@ctm-max@pipe-a-hdmi-a-1-yuyv:
    - Statuses : 2 pass(s)
    - Exec time: [0.40, 0.55] s

  * igt@kms_color@ctm-max@pipe-a-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.76] s

  * igt@kms_color@ctm-max@pipe-a-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.10] s

  * igt@kms_color@ctm-max@pipe-a-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [6.10] s

  * igt@kms_color@ctm-max@pipe-a-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.69] s

  * igt@kms_color@ctm-max@pipe-a-hdmi-a-3-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.86] s

  * igt@kms_color@ctm-max@pipe-a-hdmi-a-4-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.05] s

  * igt@kms_color@ctm-max@pipe-a-hdmi-a-4-p010:
    - Statuses : 1 fail(s)
    - Exec time: [0.82] s

  * igt@kms_color@ctm-max@pipe-a-hdmi-a-4-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [3.23] s

  * igt@kms_color@ctm-max@pipe-a-hdmi-a-4-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.71] s

  * igt@kms_color@ctm-max@pipe-a-hdmi-a-4-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.69] s

  * igt@kms_color@ctm-max@pipe-a-vga-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.52] s

  * igt@kms_color@ctm-max@pipe-a-vga-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.55] s

  * igt@kms_color@ctm-max@pipe-b-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.54] s

  * igt@kms_color@ctm-max@pipe-b-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.58] s

  * igt@kms_color@ctm-max@pipe-b-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.45] s

  * igt@kms_color@ctm-max@pipe-b-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_color@ctm-max@pipe-b-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.48] s

  * igt@kms_color@ctm-max@pipe-b-hdmi-a-1-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [0.39, 0.49] s

  * igt@kms_color@ctm-max@pipe-b-hdmi-a-1-p010:
    - Statuses : 2 fail(s)
    - Exec time: [0.44, 0.57] s

  * igt@kms_color@ctm-max@pipe-b-hdmi-a-1-xrgb2101010:
    - Statuses : 3 pass(s)
    - Exec time: [0.63, 0.80] s

  * igt@kms_color@ctm-max@pipe-b-hdmi-a-1-xrgb8888:
    - Statuses : 3 pass(s)
    - Exec time: [0.29, 0.51] s

  * igt@kms_color@ctm-max@pipe-b-hdmi-a-1-yuyv:
    - Statuses : 2 pass(s)
    - Exec time: [0.37, 0.51] s

  * igt@kms_color@ctm-max@pipe-b-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.73] s

  * igt@kms_color@ctm-max@pipe-b-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.05] s

  * igt@kms_color@ctm-max@pipe-b-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [6.08] s

  * igt@kms_color@ctm-max@pipe-b-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.47] s

  * igt@kms_color@ctm-max@pipe-b-hdmi-a-3-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.79] s

  * igt@kms_color@ctm-max@pipe-b-hdmi-a-4-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.62] s

  * igt@kms_color@ctm-max@pipe-b-hdmi-a-4-p010:
    - Statuses : 1 fail(s)
    - Exec time: [0.78] s

  * igt@kms_color@ctm-max@pipe-b-hdmi-a-4-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [3.18] s

  * igt@kms_color@ctm-max@pipe-b-hdmi-a-4-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.50] s

  * igt@kms_color@ctm-max@pipe-b-hdmi-a-4-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.61] s

  * igt@kms_color@ctm-max@pipe-b-vga-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.53] s

  * igt@kms_color@ctm-max@pipe-b-vga-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.43] s

  * igt@kms_color@ctm-max@pipe-c-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.43] s

  * igt@kms_color@ctm-max@pipe-c-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.54] s

  * igt@kms_color@ctm-max@pipe-c-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_color@ctm-max@pipe-c-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.35] s

  * igt@kms_color@ctm-max@pipe-c-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.41] s

  * igt@kms_color@ctm-max@pipe-c-hdmi-a-1-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [0.40, 0.49] s

  * igt@kms_color@ctm-max@pipe-c-hdmi-a-1-p010:
    - Statuses : 2 fail(s)
    - Exec time: [0.47, 0.57] s

  * igt@kms_color@ctm-max@pipe-c-hdmi-a-1-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [0.65, 0.72] s

  * igt@kms_color@ctm-max@pipe-c-hdmi-a-1-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [0.30, 0.47] s

  * igt@kms_color@ctm-max@pipe-c-hdmi-a-1-yuyv:
    - Statuses : 2 pass(s)
    - Exec time: [0.38, 0.51] s

  * igt@kms_color@ctm-max@pipe-c-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.75] s

  * igt@kms_color@ctm-max@pipe-c-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.09] s

  * igt@kms_color@ctm-max@pipe-c-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [6.10] s

  * igt@kms_color@ctm-max@pipe-c-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.46] s

  * igt@kms_color@ctm-max@pipe-c-hdmi-a-3-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.84] s

  * igt@kms_color@ctm-max@pipe-c-hdmi-a-4-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.62] s

  * igt@kms_color@ctm-max@pipe-c-hdmi-a-4-p010:
    - Statuses : 1 fail(s)
    - Exec time: [0.77] s

  * igt@kms_color@ctm-max@pipe-c-hdmi-a-4-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [3.17] s

  * igt@kms_color@ctm-max@pipe-c-hdmi-a-4-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.53] s

  * igt@kms_color@ctm-max@pipe-c-hdmi-a-4-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.65] s

  * igt@kms_color@ctm-max@pipe-d-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.41] s

  * igt@kms_color@ctm-max@pipe-d-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.55] s

  * igt@kms_color@ctm-max@pipe-d-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_color@ctm-max@pipe-d-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_color@ctm-max@pipe-d-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.41] s

  * igt@kms_color@ctm-max@pipe-d-hdmi-a-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.40] s

  * igt@kms_color@ctm-max@pipe-d-hdmi-a-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [0.45] s

  * igt@kms_color@ctm-max@pipe-d-hdmi-a-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.64] s

  * igt@kms_color@ctm-max@pipe-d-hdmi-a-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.29] s

  * igt@kms_color@ctm-max@pipe-d-hdmi-a-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.37] s

  * igt@kms_color@ctm-max@pipe-d-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.73] s

  * igt@kms_color@ctm-max@pipe-d-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.03] s

  * igt@kms_color@ctm-max@pipe-d-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [6.10] s

  * igt@kms_color@ctm-max@pipe-d-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.50] s

  * igt@kms_color@ctm-max@pipe-d-hdmi-a-3-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.81] s

  * igt@kms_color@ctm-max@pipe-d-hdmi-a-4-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.61] s

  * igt@kms_color@ctm-max@pipe-d-hdmi-a-4-p010:
    - Statuses : 1 fail(s)
    - Exec time: [0.80] s

  * igt@kms_color@ctm-max@pipe-d-hdmi-a-4-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [3.20] s

  * igt@kms_color@ctm-max@pipe-d-hdmi-a-4-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.56] s

  * igt@kms_color@ctm-max@pipe-d-hdmi-a-4-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.65] s

  * igt@kms_color@ctm-negative@pipe-a-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.45] s

  * igt@kms_color@ctm-negative@pipe-a-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.57] s

  * igt@kms_color@ctm-negative@pipe-a-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.43] s

  * igt@kms_color@ctm-negative@pipe-a-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.72] s

  * igt@kms_color@ctm-negative@pipe-a-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.55] s

  * igt@kms_color@ctm-negative@pipe-a-hdmi-a-1-nv12:
    - Statuses : 3 fail(s)
    - Exec time: [0.40, 0.79] s

  * igt@kms_color@ctm-negative@pipe-a-hdmi-a-1-p010:
    - Statuses : 3 fail(s)
    - Exec time: [0.47, 0.97] s

  * igt@kms_color@ctm-negative@pipe-a-hdmi-a-1-xrgb2101010:
    - Statuses : 4 pass(s)
    - Exec time: [0.63, 3.18] s

  * igt@kms_color@ctm-negative@pipe-a-hdmi-a-1-xrgb8888:
    - Statuses : 4 pass(s)
    - Exec time: [0.31, 0.92] s

  * igt@kms_color@ctm-negative@pipe-a-hdmi-a-1-yuyv:
    - Statuses : 3 fail(s)
    - Exec time: [0.41, 0.88] s

  * igt@kms_color@ctm-negative@pipe-a-hdmi-a-2-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [0.48, 0.78] s

  * igt@kms_color@ctm-negative@pipe-a-hdmi-a-2-p010:
    - Statuses : 2 fail(s)
    - Exec time: [0.58, 0.95] s

  * igt@kms_color@ctm-negative@pipe-a-hdmi-a-2-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [0.71, 0.94] s

  * igt@kms_color@ctm-negative@pipe-a-hdmi-a-2-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [0.59, 0.69] s

  * igt@kms_color@ctm-negative@pipe-a-hdmi-a-2-yuyv:
    - Statuses : 2 fail(s)
    - Exec time: [0.54, 0.81] s

  * igt@kms_color@ctm-negative@pipe-a-vga-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.55] s

  * igt@kms_color@ctm-negative@pipe-a-vga-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.55] s

  * igt@kms_color@ctm-negative@pipe-b-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.43] s

  * igt@kms_color@ctm-negative@pipe-b-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.59] s

  * igt@kms_color@ctm-negative@pipe-b-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_color@ctm-negative@pipe-b-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.41] s

  * igt@kms_color@ctm-negative@pipe-b-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.47] s

  * igt@kms_color@ctm-negative@pipe-b-hdmi-a-1-nv12:
    - Statuses : 3 fail(s)
    - Exec time: [0.42, 0.78] s

  * igt@kms_color@ctm-negative@pipe-b-hdmi-a-1-p010:
    - Statuses : 3 fail(s)
    - Exec time: [0.46, 0.93] s

  * igt@kms_color@ctm-negative@pipe-b-hdmi-a-1-xrgb2101010:
    - Statuses : 4 pass(s)
    - Exec time: [0.63, 3.20] s

  * igt@kms_color@ctm-negative@pipe-b-hdmi-a-1-xrgb8888:
    - Statuses : 4 pass(s)
    - Exec time: [0.29, 0.67] s

  * igt@kms_color@ctm-negative@pipe-b-hdmi-a-1-yuyv:
    - Statuses : 3 fail(s)
    - Exec time: [0.39, 0.81] s

  * igt@kms_color@ctm-negative@pipe-b-hdmi-a-2-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [0.51, 0.77] s

  * igt@kms_color@ctm-negative@pipe-b-hdmi-a-2-p010:
    - Statuses : 2 fail(s)
    - Exec time: [0.56, 0.95] s

  * igt@kms_color@ctm-negative@pipe-b-hdmi-a-2-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [0.69, 1.00] s

  * igt@kms_color@ctm-negative@pipe-b-hdmi-a-2-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [0.46, 0.66] s

  * igt@kms_color@ctm-negative@pipe-b-hdmi-a-2-yuyv:
    - Statuses : 2 fail(s)
    - Exec time: [0.53, 0.81] s

  * igt@kms_color@ctm-negative@pipe-b-vga-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.52] s

  * igt@kms_color@ctm-negative@pipe-b-vga-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.42] s

  * igt@kms_color@ctm-negative@pipe-c-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.40] s

  * igt@kms_color@ctm-negative@pipe-c-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.04] s

  * igt@kms_color@ctm-negative@pipe-c-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.17] s

  * igt@kms_color@ctm-negative@pipe-c-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_color@ctm-negative@pipe-c-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.43] s

  * igt@kms_color@ctm-negative@pipe-c-hdmi-a-1-nv12:
    - Statuses : 3 fail(s)
    - Exec time: [0.41, 0.78] s

  * igt@kms_color@ctm-negative@pipe-c-hdmi-a-1-p010:
    - Statuses : 3 fail(s)
    - Exec time: [0.47, 0.94] s

  * igt@kms_color@ctm-negative@pipe-c-hdmi-a-1-xrgb2101010:
    - Statuses : 3 pass(s)
    - Exec time: [0.65, 3.20] s

  * igt@kms_color@ctm-negative@pipe-c-hdmi-a-1-xrgb8888:
    - Statuses : 3 pass(s)
    - Exec time: [0.30, 0.67] s

  * igt@kms_color@ctm-negative@pipe-c-hdmi-a-1-yuyv:
    - Statuses : 3 fail(s)
    - Exec time: [0.38, 0.81] s

  * igt@kms_color@ctm-negative@pipe-c-hdmi-a-2-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [0.48, 0.78] s

  * igt@kms_color@ctm-negative@pipe-c-hdmi-a-2-p010:
    - Statuses : 2 fail(s)
    - Exec time: [0.56, 0.95] s

  * igt@kms_color@ctm-negative@pipe-c-hdmi-a-2-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [0.71, 0.97] s

  * igt@kms_color@ctm-negative@pipe-c-hdmi-a-2-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [0.48, 0.68] s

  * igt@kms_color@ctm-negative@pipe-c-hdmi-a-2-yuyv:
    - Statuses : 2 fail(s)
    - Exec time: [0.51, 0.81] s

  * igt@kms_color@ctm-negative@pipe-d-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.41] s

  * igt@kms_color@ctm-negative@pipe-d-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.58] s

  * igt@kms_color@ctm-negative@pipe-d-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_color@ctm-negative@pipe-d-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_color@ctm-negative@pipe-d-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.43] s

  * igt@kms_color@ctm-negative@pipe-d-hdmi-a-1-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [0.39, 0.65] s

  * igt@kms_color@ctm-negative@pipe-d-hdmi-a-1-p010:
    - Statuses : 2 fail(s)
    - Exec time: [0.46, 0.81] s

  * igt@kms_color@ctm-negative@pipe-d-hdmi-a-1-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [0.63, 3.19] s

  * igt@kms_color@ctm-negative@pipe-d-hdmi-a-1-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [0.30, 0.54] s

  * igt@kms_color@ctm-negative@pipe-d-hdmi-a-1-yuyv:
    - Statuses : 2 fail(s)
    - Exec time: [0.39, 0.67] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.52] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.58] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.45] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.73] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.53] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-1-nv12:
    - Statuses : 3 fail(s)
    - Exec time: [0.39, 0.82] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-1-p010:
    - Statuses : 3 fail(s)
    - Exec time: [0.46, 1.02] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-1-xrgb2101010:
    - Statuses : 4 pass(s)
    - Exec time: [0.64, 3.17] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-1-xrgb8888:
    - Statuses : 4 pass(s)
    - Exec time: [0.30, 0.96] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-1-yuyv:
    - Statuses : 3 fail(s)
    - Exec time: [0.40, 0.92] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-2-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [0.51, 1.80] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-2-p010:
    - Statuses : 2 fail(s)
    - Exec time: [0.62, 0.96] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-2-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [0.71, 1.00] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-2-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [0.54, 0.67] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-2-yuyv:
    - Statuses : 2 fail(s)
    - Exec time: [0.58, 0.84] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.75] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.10] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [6.08] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.64] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.90] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-vga-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.53] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-vga-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.54] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.51] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.57] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.46] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.37] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.52] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-1-nv12:
    - Statuses : 3 fail(s)
    - Exec time: [0.38, 0.85] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-1-p010:
    - Statuses : 3 fail(s)
    - Exec time: [0.46, 0.96] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-1-xrgb2101010:
    - Statuses : 4 pass(s)
    - Exec time: [0.63, 3.16] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-1-xrgb8888:
    - Statuses : 4 pass(s)
    - Exec time: [0.29, 0.65] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-1-yuyv:
    - Statuses : 3 fail(s)
    - Exec time: [0.40, 0.86] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-2-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [0.51, 0.81] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-2-p010:
    - Statuses : 2 fail(s)
    - Exec time: [0.60, 0.97] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-2-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [0.72, 1.04] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-2-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [0.46, 0.65] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-2-yuyv:
    - Statuses : 2 fail(s)
    - Exec time: [0.52, 0.86] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.75] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.05] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [6.12] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.49] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.83] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-vga-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.53] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-vga-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.43] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.42] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.56] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.35] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.42] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-1-nv12:
    - Statuses : 3 fail(s)
    - Exec time: [0.42, 0.85] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-1-p010:
    - Statuses : 3 fail(s)
    - Exec time: [0.45, 0.96] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-1-xrgb2101010:
    - Statuses : 3 pass(s)
    - Exec time: [0.64, 3.17] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-1-xrgb8888:
    - Statuses : 3 pass(s)
    - Exec time: [0.30, 0.67] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-1-yuyv:
    - Statuses : 3 fail(s)
    - Exec time: [0.41, 0.82] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-2-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [0.53, 0.85] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-2-p010:
    - Statuses : 2 fail(s)
    - Exec time: [0.58, 0.97] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-2-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [0.72, 1.0] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-2-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [0.49, 0.67] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-2-yuyv:
    - Statuses : 2 fail(s)
    - Exec time: [0.54, 0.85] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.75] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.00] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [6.08] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.49] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.83] s

  * igt@kms_color@ctm-red-to-blue@pipe-d-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.41] s

  * igt@kms_color@ctm-red-to-blue@pipe-d-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.57] s

  * igt@kms_color@ctm-red-to-blue@pipe-d-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_color@ctm-red-to-blue@pipe-d-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_color@ctm-red-to-blue@pipe-d-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.45] s

  * igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-1-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [0.41, 0.63] s

  * igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-1-p010:
    - Statuses : 2 fail(s)
    - Exec time: [0.46, 0.78] s

  * igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-1-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [0.63, 3.17] s

  * igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-1-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [0.30, 0.53] s

  * igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-1-yuyv:
    - Statuses : 2 fail(s)
    - Exec time: [0.38, 0.66] s

  * igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.71] s

  * igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.05] s

  * igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [6.10] s

  * igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.50] s

  * igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.81] s

  * igt@kms_color@ctm-signed@pipe-a-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [4.31] s

  * igt@kms_color@ctm-signed@pipe-a-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [4.59] s

  * igt@kms_color@ctm-signed@pipe-a-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.91] s

  * igt@kms_color@ctm-signed@pipe-a-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [2.12] s

  * igt@kms_color@ctm-signed@pipe-a-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.45] s

  * igt@kms_color@ctm-signed@pipe-a-hdmi-a-1-nv12:
    - Statuses : 3 fail(s)
    - Exec time: [1.17, 2.47] s

  * igt@kms_color@ctm-signed@pipe-a-hdmi-a-1-p010:
    - Statuses : 3 fail(s)
    - Exec time: [1.42, 2.90] s

  * igt@kms_color@ctm-signed@pipe-a-hdmi-a-1-xrgb2101010:
    - Statuses : 4 pass(s)
    - Exec time: [1.0, 6.41] s

  * igt@kms_color@ctm-signed@pipe-a-hdmi-a-1-xrgb8888:
    - Statuses : 4 pass(s)
    - Exec time: [0.57, 1.21] s

  * igt@kms_color@ctm-signed@pipe-a-hdmi-a-1-yuyv:
    - Statuses : 3 fail(s)
    - Exec time: [1.15, 2.56] s

  * igt@kms_color@ctm-signed@pipe-a-hdmi-a-2-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [1.46, 2.44] s

  * igt@kms_color@ctm-signed@pipe-a-hdmi-a-2-p010:
    - Statuses : 2 fail(s)
    - Exec time: [1.70, 2.88] s

  * igt@kms_color@ctm-signed@pipe-a-hdmi-a-2-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [0.98, 1.39] s

  * igt@kms_color@ctm-signed@pipe-a-hdmi-a-2-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [0.77, 1.01] s

  * igt@kms_color@ctm-signed@pipe-a-hdmi-a-2-yuyv:
    - Statuses : 2 fail(s)
    - Exec time: [1.51, 2.60] s

  * igt@kms_color@ctm-signed@pipe-a-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.26] s

  * igt@kms_color@ctm-signed@pipe-a-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [3.08] s

  * igt@kms_color@ctm-signed@pipe-a-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [12.17] s

  * igt@kms_color@ctm-signed@pipe-a-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.13] s

  * igt@kms_color@ctm-signed@pipe-a-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [2.52] s

  * igt@kms_color@ctm-signed@pipe-a-vga-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.08] s

  * igt@kms_color@ctm-signed@pipe-a-vga-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.93] s

  * igt@kms_color@ctm-signed@pipe-b-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [4.42] s

  * igt@kms_color@ctm-signed@pipe-b-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [4.64] s

  * igt@kms_color@ctm-signed@pipe-b-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.89] s

  * igt@kms_color@ctm-signed@pipe-b-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [2.80] s

  * igt@kms_color@ctm-signed@pipe-b-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.47] s

  * igt@kms_color@ctm-signed@pipe-b-hdmi-a-1-nv12:
    - Statuses : 3 fail(s)
    - Exec time: [1.18, 2.48] s

  * igt@kms_color@ctm-signed@pipe-b-hdmi-a-1-p010:
    - Statuses : 3 fail(s)
    - Exec time: [1.37, 2.91] s

  * igt@kms_color@ctm-signed@pipe-b-hdmi-a-1-xrgb2101010:
    - Statuses : 4 pass(s)
    - Exec time: [1.00, 6.44] s

  * igt@kms_color@ctm-signed@pipe-b-hdmi-a-1-xrgb8888:
    - Statuses : 4 pass(s)
    - Exec time: [0.55, 1.02] s

  * igt@kms_color@ctm-signed@pipe-b-hdmi-a-1-yuyv:
    - Statuses : 3 fail(s)
    - Exec time: [1.14, 2.51] s

  * igt@kms_color@ctm-signed@pipe-b-hdmi-a-2-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [1.44, 2.46] s

  * igt@kms_color@ctm-signed@pipe-b-hdmi-a-2-p010:
    - Statuses : 2 fail(s)
    - Exec time: [1.68, 2.92] s

  * igt@kms_color@ctm-signed@pipe-b-hdmi-a-2-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [1.00, 1.37] s

  * igt@kms_color@ctm-signed@pipe-b-hdmi-a-2-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [0.68, 0.88] s

  * igt@kms_color@ctm-signed@pipe-b-hdmi-a-2-yuyv:
    - Statuses : 2 fail(s)
    - Exec time: [1.48, 2.60] s

  * igt@kms_color@ctm-signed@pipe-b-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.24] s

  * igt@kms_color@ctm-signed@pipe-b-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [3.00] s

  * igt@kms_color@ctm-signed@pipe-b-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [12.15] s

  * igt@kms_color@ctm-signed@pipe-b-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.97] s

  * igt@kms_color@ctm-signed@pipe-b-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [2.51] s

  * igt@kms_color@ctm-signed@pipe-b-vga-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.06] s

  * igt@kms_color@ctm-signed@pipe-b-vga-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.85] s

  * igt@kms_color@ctm-signed@pipe-c-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [4.30] s

  * igt@kms_color@ctm-signed@pipe-c-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [4.63] s

  * igt@kms_color@ctm-signed@pipe-c-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.79] s

  * igt@kms_color@ctm-signed@pipe-c-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [2.67] s

  * igt@kms_color@ctm-signed@pipe-c-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.27] s

  * igt@kms_color@ctm-signed@pipe-c-hdmi-a-1-nv12:
    - Statuses : 3 fail(s)
    - Exec time: [1.18, 2.45] s

  * igt@kms_color@ctm-signed@pipe-c-hdmi-a-1-p010:
    - Statuses : 3 fail(s)
    - Exec time: [1.41, 2.95] s

  * igt@kms_color@ctm-signed@pipe-c-hdmi-a-1-xrgb2101010:
    - Statuses : 3 pass(s)
    - Exec time: [0.99, 6.40] s

  * igt@kms_color@ctm-signed@pipe-c-hdmi-a-1-xrgb8888:
    - Statuses : 3 pass(s)
    - Exec time: [0.56, 0.97] s

  * igt@kms_color@ctm-signed@pipe-c-hdmi-a-1-yuyv:
    - Statuses : 3 fail(s)
    - Exec time: [1.15, 2.51] s

  * igt@kms_color@ctm-signed@pipe-c-hdmi-a-2-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [1.47, 2.46] s

  * igt@kms_color@ctm-signed@pipe-c-hdmi-a-2-p010:
    - Statuses : 2 fail(s)
    - Exec time: [1.68, 2.97] s

  * igt@kms_color@ctm-signed@pipe-c-hdmi-a-2-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [1.03, 1.39] s

  * igt@kms_color@ctm-signed@pipe-c-hdmi-a-2-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [0.66, 0.89] s

  * igt@kms_color@ctm-signed@pipe-c-hdmi-a-2-yuyv:
    - Statuses : 2 fail(s)
    - Exec time: [1.45, 2.52] s

  * igt@kms_color@ctm-signed@pipe-c-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.27] s

  * igt@kms_color@ctm-signed@pipe-c-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [3.12] s

  * igt@kms_color@ctm-signed@pipe-c-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [12.20] s

  * igt@kms_color@ctm-signed@pipe-c-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.96] s

  * igt@kms_color@ctm-signed@pipe-c-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [2.50] s

  * igt@kms_color@ctm-signed@pipe-d-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [4.32] s

  * igt@kms_color@ctm-signed@pipe-d-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [4.62] s

  * igt@kms_color@ctm-signed@pipe-d-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.79] s

  * igt@kms_color@ctm-signed@pipe-d-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [2.68] s

  * igt@kms_color@ctm-signed@pipe-d-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.28] s

  * igt@kms_color@ctm-signed@pipe-d-hdmi-a-1-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [1.22, 1.88] s

  * igt@kms_color@ctm-signed@pipe-d-hdmi-a-1-p010:
    - Statuses : 2 fail(s)
    - Exec time: [1.37, 2.42] s

  * igt@kms_color@ctm-signed@pipe-d-hdmi-a-1-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [1.28, 6.37] s

  * igt@kms_color@ctm-signed@pipe-d-hdmi-a-1-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [0.55, 1.03] s

  * igt@kms_color@ctm-signed@pipe-d-hdmi-a-1-yuyv:
    - Statuses : 2 fail(s)
    - Exec time: [1.14, 1.96] s

  * igt@kms_color@ctm-signed@pipe-d-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.16] s

  * igt@kms_color@ctm-signed@pipe-d-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [3.13] s

  * igt@kms_color@ctm-signed@pipe-d-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [12.16] s

  * igt@kms_color@ctm-signed@pipe-d-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.96] s

  * igt@kms_color@ctm-signed@pipe-d-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [2.44] s

  * igt@kms_color@degamma@pipe-a-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.52] s

  * igt@kms_color@degamma@pipe-a-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.52] s

  * igt@kms_color@degamma@pipe-a-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.41] s

  * igt@kms_color@degamma@pipe-a-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.72] s

  * igt@kms_color@degamma@pipe-a-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.52] s

  * igt@kms_color@degamma@pipe-a-hdmi-a-1-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [0.41, 0.56] s

  * igt@kms_color@degamma@pipe-a-hdmi-a-1-p010:
    - Statuses : 2 fail(s)
    - Exec time: [0.46, 0.64] s

  * igt@kms_color@degamma@pipe-a-hdmi-a-1-xrgb2101010:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.71] s

  * igt@kms_color@degamma@pipe-a-hdmi-a-1-xrgb8888:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.59] s

  * igt@kms_color@degamma@pipe-a-hdmi-a-1-yuyv:
    - Statuses : 2 pass(s)
    - Exec time: [0.40, 0.53] s

  * igt@kms_color@degamma@pipe-a-hdmi-a-3-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [0.66, 0.76] s

  * igt@kms_color@degamma@pipe-a-hdmi-a-3-p010:
    - Statuses : 2 fail(s)
    - Exec time: [0.81, 1.05] s

  * igt@kms_color@degamma@pipe-a-hdmi-a-3-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [3.20, 6.0] s

  * igt@kms_color@degamma@pipe-a-hdmi-a-3-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [0.64, 0.69] s

  * igt@kms_color@degamma@pipe-a-hdmi-a-3-yuyv:
    - Statuses : 2 pass(s)
    - Exec time: [0.69, 0.86] s

  * igt@kms_color@degamma@pipe-a-vga-1-xrgb2101010:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@degamma@pipe-a-vga-1-xrgb8888:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@degamma@pipe-b-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.49] s

  * igt@kms_color@degamma@pipe-b-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.52] s

  * igt@kms_color@degamma@pipe-b-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.44] s

  * igt@kms_color@degamma@pipe-b-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_color@degamma@pipe-b-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.46] s

  * igt@kms_color@degamma@pipe-b-hdmi-a-1-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [0.40, 0.53] s

  * igt@kms_color@degamma@pipe-b-hdmi-a-1-p010:
    - Statuses : 2 fail(s)
    - Exec time: [0.46, 0.60] s

  * igt@kms_color@degamma@pipe-b-hdmi-a-1-xrgb2101010:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.68] s

  * igt@kms_color@degamma@pipe-b-hdmi-a-1-xrgb8888:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.47] s

  * igt@kms_color@degamma@pipe-b-hdmi-a-1-yuyv:
    - Statuses : 2 pass(s)
    - Exec time: [0.38, 0.51] s

  * igt@kms_color@degamma@pipe-b-hdmi-a-3-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [0.64, 0.75] s

  * igt@kms_color@degamma@pipe-b-hdmi-a-3-p010:
    - Statuses : 2 fail(s)
    - Exec time: [0.78, 1.00] s

  * igt@kms_color@degamma@pipe-b-hdmi-a-3-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [3.18, 6.05] s

  * igt@kms_color@degamma@pipe-b-hdmi-a-3-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [0.48, 0.56] s

  * igt@kms_color@degamma@pipe-b-hdmi-a-3-yuyv:
    - Statuses : 2 pass(s)
    - Exec time: [0.68, 0.83] s

  * igt@kms_color@degamma@pipe-b-vga-1-xrgb2101010:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@degamma@pipe-b-vga-1-xrgb8888:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@degamma@pipe-c-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.48] s

  * igt@kms_color@degamma@pipe-c-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.55] s

  * igt@kms_color@degamma@pipe-c-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.43] s

  * igt@kms_color@degamma@pipe-c-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_color@degamma@pipe-c-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.50] s

  * igt@kms_color@degamma@pipe-c-hdmi-a-1-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [0.40, 0.54] s

  * igt@kms_color@degamma@pipe-c-hdmi-a-1-p010:
    - Statuses : 2 fail(s)
    - Exec time: [0.45, 0.58] s

  * igt@kms_color@degamma@pipe-c-hdmi-a-1-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [0.64, 0.70] s

  * igt@kms_color@degamma@pipe-c-hdmi-a-1-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [0.30, 0.48] s

  * igt@kms_color@degamma@pipe-c-hdmi-a-1-yuyv:
    - Statuses : 2 pass(s)
    - Exec time: [0.37, 0.51] s

  * igt@kms_color@degamma@pipe-c-hdmi-a-3-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [0.61, 0.71] s

  * igt@kms_color@degamma@pipe-c-hdmi-a-3-p010:
    - Statuses : 2 fail(s)
    - Exec time: [0.78, 0.98] s

  * igt@kms_color@degamma@pipe-c-hdmi-a-3-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [3.18, 6.04] s

  * igt@kms_color@degamma@pipe-c-hdmi-a-3-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [0.50, 0.51] s

  * igt@kms_color@degamma@pipe-c-hdmi-a-3-yuyv:
    - Statuses : 2 pass(s)
    - Exec time: [0.65, 0.81] s

  * igt@kms_color@degamma@pipe-d-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.50] s

  * igt@kms_color@degamma@pipe-d-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.52] s

  * igt@kms_color@degamma@pipe-d-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.43] s

  * igt@kms_color@degamma@pipe-d-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_color@degamma@pipe-d-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.47] s

  * igt@kms_color@degamma@pipe-d-hdmi-a-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.41] s

  * igt@kms_color@degamma@pipe-d-hdmi-a-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [0.45] s

  * igt@kms_color@degamma@pipe-d-hdmi-a-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.65] s

  * igt@kms_color@degamma@pipe-d-hdmi-a-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.30] s

  * igt@kms_color@degamma@pipe-d-hdmi-a-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.37] s

  * igt@kms_color@degamma@pipe-d-hdmi-a-3-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [0.66, 0.71] s

  * igt@kms_color@degamma@pipe-d-hdmi-a-3-p010:
    - Statuses : 2 fail(s)
    - Exec time: [0.80, 0.98] s

  * igt@kms_color@degamma@pipe-d-hdmi-a-3-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [3.19, 6.04] s

  * igt@kms_color@degamma@pipe-d-hdmi-a-3-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [0.48, 0.51] s

  * igt@kms_color@degamma@pipe-d-hdmi-a-3-yuyv:
    - Statuses : 2 pass(s)
    - Exec time: [0.64, 0.76] s

  * igt@kms_color@legacy-gamma@pipe-a-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.72] s

  * igt@kms_color@legacy-gamma@pipe-a-hdmi-a-1-xrgb8888:
    - Statuses : 4 pass(s)
    - Exec time: [0.33, 1.19] s

  * igt@kms_color@legacy-gamma@pipe-a-hdmi-a-2-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [0.67, 0.70] s

  * igt@kms_color@legacy-gamma@pipe-a-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.70] s

  * igt@kms_color@legacy-gamma@pipe-a-vga-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.52] s

  * igt@kms_color@legacy-gamma@pipe-b-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.45] s

  * igt@kms_color@legacy-gamma@pipe-b-hdmi-a-1-xrgb8888:
    - Statuses : 4 pass(s)
    - Exec time: [0.32, 0.68] s

  * igt@kms_color@legacy-gamma@pipe-b-hdmi-a-2-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [0.49, 0.70] s

  * igt@kms_color@legacy-gamma@pipe-b-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.52] s

  * igt@kms_color@legacy-gamma@pipe-b-vga-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.42] s

  * igt@kms_color@legacy-gamma@pipe-c-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.37] s

  * igt@kms_color@legacy-gamma@pipe-c-hdmi-a-1-xrgb8888:
    - Statuses : 3 pass(s)
    - Exec time: [0.32, 0.68] s

  * igt@kms_color@legacy-gamma@pipe-c-hdmi-a-2-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [0.49, 0.68] s

  * igt@kms_color@legacy-gamma@pipe-c-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.48] s

  * igt@kms_color@legacy-gamma@pipe-d-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_color@legacy-gamma@pipe-d-hdmi-a-1-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [0.33, 0.55] s

  * igt@kms_color@legacy-gamma@pipe-d-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.53] s

  * igt@kms_cursor_legacy@brightness-with-hdr:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_legacy@dontneed-before-exec:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_legacy@fbchdr-shrfb-scaledprimary:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_legacy@force-edid:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_legacy@hdr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_legacy@huge-split:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_legacy@psr-1p-primscrn-spr-indfb-move:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_flip@2x-flip-vs-panning@ab-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.87] s

  * igt@kms_flip@2x-flip-vs-panning@ac-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.82] s

  * igt@kms_flip@2x-flip-vs-panning@bc-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.79] s

  

Known issues
------------

  Here are the changes found in IGTPW_15307_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@device_reset@cold-reset-bound:
    - shard-dg2:          NOTRUN -> [SKIP][21] ([i915#11078]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-1/igt@device_reset@cold-reset-bound.html

  * igt@device_reset@unbind-reset-rebind:
    - shard-dg1:          NOTRUN -> [ABORT][22] ([i915#11814])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-19/igt@device_reset@unbind-reset-rebind.html

  * igt@dmabuf@all-tests:
    - shard-tglu:         NOTRUN -> [SKIP][23] ([i915#15931])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-5/igt@dmabuf@all-tests.html
    - shard-dg2:          NOTRUN -> [SKIP][24] ([i915#15931])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-8/igt@dmabuf@all-tests.html
    - shard-rkl:          NOTRUN -> [SKIP][25] ([i915#15931])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-2/igt@dmabuf@all-tests.html

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-tglu-1:       NOTRUN -> [SKIP][26] ([i915#3555] / [i915#9323])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-1/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-rkl:          NOTRUN -> [SKIP][27] ([i915#3555] / [i915#9323])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-2/igt@gem_ccs@ctrl-surf-copy.html
    - shard-tglu:         NOTRUN -> [SKIP][28] ([i915#3555] / [i915#9323])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-5/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-rkl:          NOTRUN -> [SKIP][29] ([i915#9323])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-8/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
    - shard-dg1:          NOTRUN -> [SKIP][30] ([i915#9323])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-13/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
    - shard-tglu:         NOTRUN -> [SKIP][31] ([i915#9323])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-10/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
    - shard-mtlp:         NOTRUN -> [SKIP][32] ([i915#9323])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-5/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          [PASS][33] -> [INCOMPLETE][34] ([i915#13356] / [i915#16348])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-dg2-6/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-3/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-rkl:          NOTRUN -> [SKIP][35] ([i915#6335])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-4/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_create@create-ext-set-pat:
    - shard-dg2:          NOTRUN -> [SKIP][36] ([i915#8562])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-6/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_isolation@preservation-s3:
    - shard-rkl:          [PASS][37] -> [INCOMPLETE][38] ([i915#13356]) +1 other test incomplete
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-4/igt@gem_ctx_isolation@preservation-s3.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-3/igt@gem_ctx_isolation@preservation-s3.html

  * igt@gem_ctx_persistence@heartbeat-hostile:
    - shard-dg2:          NOTRUN -> [SKIP][39] ([i915#8555]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-4/igt@gem_ctx_persistence@heartbeat-hostile.html

  * igt@gem_ctx_persistence@legacy-engines-hostile-preempt:
    - shard-snb:          NOTRUN -> [SKIP][40] ([i915#1099])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-snb6/igt@gem_ctx_persistence@legacy-engines-hostile-preempt.html

  * igt@gem_ctx_sseu@engines:
    - shard-tglu:         NOTRUN -> [SKIP][41] ([i915#280])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-4/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-tglu-1:       NOTRUN -> [SKIP][42] ([i915#280])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-1/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_eio@hibernate:
    - shard-dg1:          [PASS][43] -> [DMESG-WARN][44] ([i915#4391] / [i915#4423])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-dg1-14/igt@gem_eio@hibernate.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-14/igt@gem_eio@hibernate.html

  * igt@gem_eio@in-flight-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][45] ([i915#13390])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk2/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_balancer@bonded-dual:
    - shard-dg2:          NOTRUN -> [SKIP][46] ([i915#4771]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-7/igt@gem_exec_balancer@bonded-dual.html

  * igt@gem_exec_balancer@noheartbeat:
    - shard-dg1:          NOTRUN -> [SKIP][47] ([i915#8555])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-14/igt@gem_exec_balancer@noheartbeat.html
    - shard-mtlp:         NOTRUN -> [SKIP][48] ([i915#8555])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-1/igt@gem_exec_balancer@noheartbeat.html

  * igt@gem_exec_balancer@parallel-bb-first:
    - shard-rkl:          NOTRUN -> [SKIP][49] ([i915#4525]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-2/igt@gem_exec_balancer@parallel-bb-first.html

  * igt@gem_exec_fence@submit3:
    - shard-dg2:          NOTRUN -> [SKIP][50] ([i915#4812])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-5/igt@gem_exec_fence@submit3.html
    - shard-mtlp:         NOTRUN -> [SKIP][51] ([i915#4812])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-6/igt@gem_exec_fence@submit3.html

  * igt@gem_exec_flush@basic-uc-rw-default:
    - shard-dg1:          NOTRUN -> [SKIP][52] ([i915#3539] / [i915#4852])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-14/igt@gem_exec_flush@basic-uc-rw-default.html

  * igt@gem_exec_flush@basic-wb-prw-default:
    - shard-dg2:          NOTRUN -> [SKIP][53] ([i915#3539] / [i915#4852]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-5/igt@gem_exec_flush@basic-wb-prw-default.html

  * igt@gem_exec_reloc@basic-gtt-wc:
    - shard-dg2:          NOTRUN -> [SKIP][54] ([i915#3281]) +4 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-7/igt@gem_exec_reloc@basic-gtt-wc.html
    - shard-rkl:          NOTRUN -> [SKIP][55] ([i915#3281]) +4 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-4/igt@gem_exec_reloc@basic-gtt-wc.html
    - shard-dg1:          NOTRUN -> [SKIP][56] ([i915#3281]) +3 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-12/igt@gem_exec_reloc@basic-gtt-wc.html
    - shard-mtlp:         NOTRUN -> [SKIP][57] ([i915#3281]) +3 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-8/igt@gem_exec_reloc@basic-gtt-wc.html

  * igt@gem_exec_schedule@preempt-queue-contexts:
    - shard-dg1:          NOTRUN -> [SKIP][58] ([i915#4812]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-19/igt@gem_exec_schedule@preempt-queue-contexts.html
    - shard-mtlp:         NOTRUN -> [SKIP][59] ([i915#4537] / [i915#4812])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-4/igt@gem_exec_schedule@preempt-queue-contexts.html
    - shard-dg2:          NOTRUN -> [SKIP][60] ([i915#4537] / [i915#4812])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-6/igt@gem_exec_schedule@preempt-queue-contexts.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-glk:          NOTRUN -> [INCOMPLETE][61] ([i915#13196] / [i915#13356]) +1 other test incomplete
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk5/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_fence_thrash@bo-copy:
    - shard-dg2:          NOTRUN -> [SKIP][62] ([i915#4860])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-6/igt@gem_fence_thrash@bo-copy.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-rkl:          NOTRUN -> [SKIP][63] ([i915#14544] / [i915#4613] / [i915#7582])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@heavy-verify-random:
    - shard-tglu:         NOTRUN -> [SKIP][64] ([i915#4613]) +4 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-10/igt@gem_lmem_swapping@heavy-verify-random.html

  * igt@gem_lmem_swapping@massive-random:
    - shard-rkl:          NOTRUN -> [SKIP][65] ([i915#4613]) +2 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-7/igt@gem_lmem_swapping@massive-random.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-glk:          NOTRUN -> [SKIP][66] ([i915#4613]) +9 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk3/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][67] ([i915#14544] / [i915#4613])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][68] ([i915#4613]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-1/igt@gem_lmem_swapping@verify-random-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][69] ([i915#12193])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-12/igt@gem_lmem_swapping@verify-random-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][70] ([i915#4613]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-5/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_lmem_swapping@verify-random-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][71] ([i915#4565])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-12/igt@gem_lmem_swapping@verify-random-ccs@lmem0.html

  * igt@gem_mmap_gtt@basic-write-cpu-read-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][72] ([i915#4077])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-3/igt@gem_mmap_gtt@basic-write-cpu-read-gtt.html
    - shard-dg1:          NOTRUN -> [SKIP][73] ([i915#4077])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-15/igt@gem_mmap_gtt@basic-write-cpu-read-gtt.html

  * igt@gem_mmap_gtt@medium-copy-xy:
    - shard-dg2:          NOTRUN -> [SKIP][74] ([i915#4077]) +8 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-8/igt@gem_mmap_gtt@medium-copy-xy.html

  * igt@gem_mmap_wc@bad-size:
    - shard-dg1:          NOTRUN -> [SKIP][75] ([i915#4083])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-13/igt@gem_mmap_wc@bad-size.html
    - shard-mtlp:         NOTRUN -> [SKIP][76] ([i915#4083])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-8/igt@gem_mmap_wc@bad-size.html

  * igt@gem_mmap_wc@close:
    - shard-dg2:          NOTRUN -> [SKIP][77] ([i915#4083]) +2 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-6/igt@gem_mmap_wc@close.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-rkl:          NOTRUN -> [SKIP][78] ([i915#3282])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-3/igt@gem_partial_pwrite_pread@writes-after-reads.html
    - shard-dg1:          NOTRUN -> [SKIP][79] ([i915#3282])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-14/igt@gem_partial_pwrite_pread@writes-after-reads.html
    - shard-mtlp:         NOTRUN -> [SKIP][80] ([i915#3282])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-6/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-dg2:          NOTRUN -> [SKIP][81] ([i915#4270]) +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-4/igt@gem_pxp@create-protected-buffer.html

  * igt@gem_pxp@reject-modify-context-protection-off-2:
    - shard-rkl:          NOTRUN -> [SKIP][82] ([i915#4270])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-4/igt@gem_pxp@reject-modify-context-protection-off-2.html
    - shard-dg1:          NOTRUN -> [SKIP][83] ([i915#4270])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-12/igt@gem_pxp@reject-modify-context-protection-off-2.html

  * igt@gem_readwrite@read-bad-handle:
    - shard-dg2:          NOTRUN -> [SKIP][84] ([i915#3282]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-8/igt@gem_readwrite@read-bad-handle.html

  * igt@gem_render_copy@linear-to-vebox-y-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][85] ([i915#8428])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-2/igt@gem_render_copy@linear-to-vebox-y-tiled.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][86] ([i915#5190] / [i915#8428]) +4 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-5/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html

  * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][87] ([i915#4079])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-5/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html
    - shard-rkl:          NOTRUN -> [SKIP][88] ([i915#8411])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-3/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html
    - shard-dg1:          NOTRUN -> [SKIP][89] ([i915#4079])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-15/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html
    - shard-mtlp:         NOTRUN -> [SKIP][90] ([i915#4079])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-3/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html

  * igt@gem_softpin@noreloc-s3:
    - shard-dg2:          [PASS][91] -> [ABORT][92] ([i915#15131])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-dg2-4/igt@gem_softpin@noreloc-s3.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-10/igt@gem_softpin@noreloc-s3.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-tglu:         NOTRUN -> [SKIP][93] ([i915#3297] / [i915#3323])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-10/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-mtlp:         NOTRUN -> [SKIP][94] ([i915#3297])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-5/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-glk:          NOTRUN -> [SKIP][95] ([i915#3323])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk2/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-rkl:          NOTRUN -> [SKIP][96] ([i915#3297] / [i915#3323])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-8/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-dg1:          NOTRUN -> [SKIP][97] ([i915#3297])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-13/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-tglu-1:       NOTRUN -> [SKIP][98] ([i915#3297]) +1 other test skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-1/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][99] ([i915#3297]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-8/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html
    - shard-rkl:          NOTRUN -> [SKIP][100] ([i915#3297])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-2/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html
    - shard-tglu:         NOTRUN -> [SKIP][101] ([i915#3297])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-5/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
    - shard-dg2:          NOTRUN -> [SKIP][102] ([i915#3297] / [i915#4880])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-6/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-rkl:          NOTRUN -> [SKIP][103] ([i915#14544] / [i915#3297])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-glk:          [PASS][104] -> [INCOMPLETE][105] ([i915#13356])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-glk2/igt@gem_workarounds@suspend-resume-context.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk4/igt@gem_workarounds@suspend-resume-context.html
    - shard-rkl:          [PASS][106] -> [ABORT][107] ([i915#15131])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-2/igt@gem_workarounds@suspend-resume-context.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-1/igt@gem_workarounds@suspend-resume-context.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-glk:          NOTRUN -> [INCOMPLETE][108] ([i915#13356] / [i915#14586])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk6/igt@gem_workarounds@suspend-resume-fd.html

  * igt@gen9_exec_parse@basic-rejected:
    - shard-tglu-1:       NOTRUN -> [SKIP][109] ([i915#2527] / [i915#2856])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-1/igt@gen9_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-dg2:          NOTRUN -> [SKIP][110] ([i915#2856]) +3 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-4/igt@gen9_exec_parse@bb-start-out.html
    - shard-rkl:          NOTRUN -> [SKIP][111] ([i915#2527]) +3 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-2/igt@gen9_exec_parse@bb-start-out.html
    - shard-dg1:          NOTRUN -> [SKIP][112] ([i915#2527])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-17/igt@gen9_exec_parse@bb-start-out.html
    - shard-mtlp:         NOTRUN -> [SKIP][113] ([i915#2856])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-2/igt@gen9_exec_parse@bb-start-out.html

  * igt@gen9_exec_parse@unaligned-jump:
    - shard-tglu:         NOTRUN -> [SKIP][114] ([i915#2527] / [i915#2856]) +4 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-3/igt@gen9_exec_parse@unaligned-jump.html

  * igt@i915_drm_fdinfo@busy@vecs1:
    - shard-dg2:          NOTRUN -> [SKIP][115] ([i915#14073]) +7 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-10/igt@i915_drm_fdinfo@busy@vecs1.html

  * igt@i915_drm_fdinfo@virtual-busy-hang:
    - shard-mtlp:         NOTRUN -> [SKIP][116] ([i915#14118])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-4/igt@i915_drm_fdinfo@virtual-busy-hang.html
    - shard-dg2:          NOTRUN -> [SKIP][117] ([i915#14118])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-5/igt@i915_drm_fdinfo@virtual-busy-hang.html
    - shard-dg1:          NOTRUN -> [SKIP][118] ([i915#14118])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-17/igt@i915_drm_fdinfo@virtual-busy-hang.html

  * igt@i915_module_load@resize-bar:
    - shard-tglu-1:       NOTRUN -> [SKIP][119] ([i915#6412])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-1/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_freq_api@freq-basic-api:
    - shard-tglu-1:       NOTRUN -> [SKIP][120] ([i915#8399])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-1/igt@i915_pm_freq_api@freq-basic-api.html

  * igt@i915_pm_freq_api@freq-reset-multiple:
    - shard-tglu:         NOTRUN -> [SKIP][121] ([i915#8399])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-10/igt@i915_pm_freq_api@freq-reset-multiple.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-dg2:          NOTRUN -> [SKIP][122] +5 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-8/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][123] ([i915#13356]) +2 other tests incomplete
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk4/igt@i915_pm_rpm@system-suspend.html

  * igt@i915_query@query-topology-known-pci-ids:
    - shard-rkl:          NOTRUN -> [SKIP][124] ([i915#16109])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-7/igt@i915_query@query-topology-known-pci-ids.html

  * igt@i915_query@query-topology-unsupported:
    - shard-dg2:          NOTRUN -> [SKIP][125] ([i915#16079])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-8/igt@i915_query@query-topology-unsupported.html
    - shard-rkl:          NOTRUN -> [SKIP][126] ([i915#16079])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-5/igt@i915_query@query-topology-unsupported.html
    - shard-tglu:         NOTRUN -> [SKIP][127] ([i915#16079])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-2/igt@i915_query@query-topology-unsupported.html

  * igt@intel_hwmon@hwmon-read:
    - shard-rkl:          NOTRUN -> [SKIP][128] ([i915#7707])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-7/igt@intel_hwmon@hwmon-read.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - shard-dg2:          NOTRUN -> [SKIP][129] ([i915#4212])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-1/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-glk:          NOTRUN -> [SKIP][130] ([i915#1769])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-dg2:          NOTRUN -> [SKIP][131] ([i915#1769] / [i915#3555])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-rkl:          NOTRUN -> [SKIP][132] ([i915#1769] / [i915#3555])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-dg1:          NOTRUN -> [SKIP][133] ([i915#1769] / [i915#3555])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-13/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-snb:          NOTRUN -> [SKIP][134] ([i915#1769])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-snb4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-tglu:         NOTRUN -> [SKIP][135] ([i915#1769] / [i915#3555])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-10/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-tglu-1:       NOTRUN -> [SKIP][136] ([i915#5286]) +2 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-1/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-mtlp:         NOTRUN -> [SKIP][137] +4 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-3/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
    - shard-dg1:          NOTRUN -> [SKIP][138] ([i915#4538] / [i915#5286])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-18/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-tglu:         NOTRUN -> [SKIP][139] ([i915#5286]) +2 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-rkl:          NOTRUN -> [SKIP][140] ([i915#5286]) +2 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-mtlp:         [PASS][141] -> [FAIL][142] ([i915#15733] / [i915#5138])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-tglu:         NOTRUN -> [SKIP][143] ([i915#3828]) +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][144] ([i915#3638])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-7/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-dg2:          NOTRUN -> [SKIP][145] ([i915#4538] / [i915#5190]) +6 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-1/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg1:          NOTRUN -> [SKIP][146] ([i915#4538]) +2 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-16/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][147] ([i915#10307] / [i915#10434] / [i915#6095]) +2 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-4/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][148] ([i915#6095]) +14 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][149] ([i915#6095]) +54 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-2/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][150] ([i915#12313])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2:
    - shard-glk10:        NOTRUN -> [SKIP][151] +84 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk10/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][152] ([i915#10307] / [i915#6095]) +111 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][153] ([i915#6095]) +12 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-glk:          NOTRUN -> [INCOMPLETE][154] ([i915#14694] / [i915#15582]) +1 other test incomplete
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk3/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][155] ([i915#12313])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][156] ([i915#14098] / [i915#6095]) +45 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-7/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][157] ([i915#12313])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-3/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][158] ([i915#14544] / [i915#6095]) +5 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][159] ([i915#14098] / [i915#14544] / [i915#6095]) +4 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][160] ([i915#6095]) +75 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-8/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][161] ([i915#4423] / [i915#6095])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-18/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-4.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][162] ([i915#6095]) +39 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-1/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][163] ([i915#6095]) +170 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-12/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_cdclk@plane-scaling:
    - shard-tglu:         NOTRUN -> [SKIP][164] ([i915#3742])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-10/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_frames@dp-crc-multiple:
    - shard-tglu-1:       NOTRUN -> [SKIP][165] ([i915#11151] / [i915#7828]) +1 other test skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-1/igt@kms_chamelium_frames@dp-crc-multiple.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-dg2:          NOTRUN -> [SKIP][166] ([i915#11151] / [i915#7828]) +5 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-10/igt@kms_chamelium_frames@hdmi-crc-fast.html
    - shard-rkl:          NOTRUN -> [SKIP][167] ([i915#11151] / [i915#7828]) +7 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-8/igt@kms_chamelium_frames@hdmi-crc-fast.html
    - shard-dg1:          NOTRUN -> [SKIP][168] ([i915#11151] / [i915#7828]) +2 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-15/igt@kms_chamelium_frames@hdmi-crc-fast.html
    - shard-tglu:         NOTRUN -> [SKIP][169] ([i915#11151] / [i915#7828]) +3 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-6/igt@kms_chamelium_frames@hdmi-crc-fast.html
    - shard-mtlp:         NOTRUN -> [SKIP][170] ([i915#11151] / [i915#7828]) +1 other test skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-5/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_color@ctm-0-25:
    - shard-dg2:          [PASS][171] -> [FAIL][172] ([i915#315]) +1 other test fail
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-dg2-4/igt@kms_color@ctm-0-25.html
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-6/igt@kms_color@ctm-0-25.html
    - shard-rkl:          [PASS][173] -> [FAIL][174] ([i915#315]) +1 other test fail
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-4/igt@kms_color@ctm-0-25.html
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_color@ctm-0-25.html

  * igt@kms_color@ctm-0-75:
    - shard-tglu:         [PASS][175] -> [FAIL][176] ([i915#315])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-tglu-10/igt@kms_color@ctm-0-75.html
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-3/igt@kms_color@ctm-0-75.html

  * igt@kms_color@ctm-blue-to-red:
    - shard-tglu:         NOTRUN -> [FAIL][177] ([i915#315]) +1 other test fail
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-10/igt@kms_color@ctm-blue-to-red.html
    - shard-glk:          NOTRUN -> [FAIL][178] ([i915#315]) +1 other test fail
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk2/igt@kms_color@ctm-blue-to-red.html
    - shard-dg2:          NOTRUN -> [FAIL][179] ([i915#315])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-4/igt@kms_color@ctm-blue-to-red.html
    - shard-rkl:          NOTRUN -> [FAIL][180] ([i915#315])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-8/igt@kms_color@ctm-blue-to-red.html

  * igt@kms_color@deep-color:
    - shard-tglu:         NOTRUN -> [SKIP][181] ([i915#3555] / [i915#9979])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-9/igt@kms_color@deep-color.html

  * igt@kms_color@degamma:
    - shard-dg2:          [PASS][182] -> [FAIL][183] ([i915#6893])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-dg2-4/igt@kms_color@degamma.html
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-3/igt@kms_color@degamma.html
    - shard-dg1:          [PASS][184] -> [FAIL][185] ([i915#6893])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-dg1-15/igt@kms_color@degamma.html
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-13/igt@kms_color@degamma.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-rkl:          NOTRUN -> [SKIP][186] ([i915#15330] / [i915#3116])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-7/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
    - shard-dg2:          NOTRUN -> [SKIP][187] ([i915#15330])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-1/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html

  * igt@kms_content_protection@lic-type-0:
    - shard-rkl:          NOTRUN -> [SKIP][188] ([i915#15865])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-3/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@mei-interface:
    - shard-tglu-1:       NOTRUN -> [SKIP][189] ([i915#15865]) +1 other test skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-1/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@suspend-resume@pipe-a-dp-3:
    - shard-dg2:          NOTRUN -> [FAIL][190] ([i915#7173])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-10/igt@kms_content_protection@suspend-resume@pipe-a-dp-3.html

  * igt@kms_content_protection@type1:
    - shard-dg2:          NOTRUN -> [SKIP][191] ([i915#15865]) +1 other test skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-6/igt@kms_content_protection@type1.html
    - shard-rkl:          NOTRUN -> [SKIP][192] ([i915#14544] / [i915#15865]) +1 other test skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_content_protection@type1.html
    - shard-dg1:          NOTRUN -> [SKIP][193] ([i915#15865]) +1 other test skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-19/igt@kms_content_protection@type1.html
    - shard-tglu:         NOTRUN -> [SKIP][194] ([i915#15865]) +3 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-7/igt@kms_content_protection@type1.html
    - shard-mtlp:         NOTRUN -> [SKIP][195] ([i915#15865]) +1 other test skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-4/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-max-size:
    - shard-dg2:          NOTRUN -> [SKIP][196] ([i915#3555])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-8/igt@kms_cursor_crc@cursor-offscreen-max-size.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][197] ([i915#13049] / [i915#14544])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-128x42:
    - shard-rkl:          [PASS][198] -> [FAIL][199] ([i915#13566])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-4/igt@kms_cursor_crc@cursor-random-128x42.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-5/igt@kms_cursor_crc@cursor-random-128x42.html

  * igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [FAIL][200] ([i915#13566]) +3 other tests fail
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-10/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-random-128x42@pipe-c-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [FAIL][201] ([i915#13566]) +2 other tests fail
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-5/igt@kms_cursor_crc@cursor-random-128x42@pipe-c-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
    - shard-mtlp:         NOTRUN -> [SKIP][202] ([i915#8814]) +1 other test skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-1/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][203] ([i915#13049]) +1 other test skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-6/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1:
    - shard-tglu:         [PASS][204] -> [FAIL][205] ([i915#13566]) +1 other test fail
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-tglu-10/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-7/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-tglu-1:       NOTRUN -> [SKIP][206] ([i915#3555]) +3 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-mtlp:         NOTRUN -> [SKIP][207] ([i915#13049])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-2/igt@kms_cursor_crc@cursor-sliding-512x170.html
    - shard-rkl:          NOTRUN -> [SKIP][208] ([i915#13049])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-1/igt@kms_cursor_crc@cursor-sliding-512x170.html
    - shard-dg1:          NOTRUN -> [SKIP][209] ([i915#13049])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-14/igt@kms_cursor_crc@cursor-sliding-512x170.html
    - shard-tglu:         NOTRUN -> [SKIP][210] ([i915#13049])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-5/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][211] ([i915#12358] / [i915#14152] / [i915#7882])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk1/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][212] ([i915#12358] / [i915#14152])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk1/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][213] ([i915#13046] / [i915#5354]) +2 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-mtlp:         NOTRUN -> [SKIP][214] ([i915#9809]) +1 other test skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-2/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-glk:          NOTRUN -> [FAIL][215] ([i915#15804])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic:
    - shard-dg1:          [PASS][216] -> [FAIL][217] ([i915#15999])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-dg1-13/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-19/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html

  * igt@kms_cursor_legacy@nonblocking-modeset-vs-cursor-atomic:
    - shard-mtlp:         [PASS][218] -> [DMESG-WARN][219] ([i915#13562])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-mtlp-4/igt@kms_cursor_legacy@nonblocking-modeset-vs-cursor-atomic.html
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-7/igt@kms_cursor_legacy@nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-rkl:          NOTRUN -> [SKIP][220] ([i915#4103])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-tglu:         NOTRUN -> [SKIP][221] ([i915#9723])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-7/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][222] ([i915#3804])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dp_aux_dev@basic:
    - shard-dg2:          NOTRUN -> [SKIP][223] ([i915#1257])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-6/igt@kms_dp_aux_dev@basic.html
    - shard-rkl:          NOTRUN -> [SKIP][224] ([i915#1257])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-5/igt@kms_dp_aux_dev@basic.html
    - shard-tglu:         NOTRUN -> [SKIP][225] ([i915#1257])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-4/igt@kms_dp_aux_dev@basic.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-tglu-1:       NOTRUN -> [SKIP][226] ([i915#13749])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-1/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-dg2:          NOTRUN -> [SKIP][227] ([i915#13748])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-7/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-dg2:          NOTRUN -> [SKIP][228] ([i915#13707])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-1/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - shard-rkl:          NOTRUN -> [SKIP][229] ([i915#13707])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-7/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - shard-dg1:          NOTRUN -> [SKIP][230] ([i915#13707])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-16/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - shard-tglu:         NOTRUN -> [SKIP][231] ([i915#13707])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-4/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - shard-mtlp:         NOTRUN -> [SKIP][232] ([i915#13707])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-2/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-dg2:          NOTRUN -> [SKIP][233] ([i915#3555] / [i915#3840])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-3/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-rkl:          [PASS][234] -> [INCOMPLETE][235] ([i915#9878])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-4/igt@kms_fbcon_fbt@fbc-suspend.html
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-3/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2:          NOTRUN -> [SKIP][236] ([i915#3469])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-6/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@display-2x:
    - shard-dg2:          NOTRUN -> [SKIP][237] ([i915#16081])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-8/igt@kms_feature_discovery@display-2x.html
    - shard-rkl:          NOTRUN -> [SKIP][238] ([i915#16081])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-7/igt@kms_feature_discovery@display-2x.html
    - shard-dg1:          NOTRUN -> [SKIP][239] ([i915#16081])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-14/igt@kms_feature_discovery@display-2x.html
    - shard-tglu:         NOTRUN -> [SKIP][240] ([i915#16081]) +1 other test skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-2/igt@kms_feature_discovery@display-2x.html
    - shard-mtlp:         NOTRUN -> [SKIP][241] ([i915#16081])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-1/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-dg2:          NOTRUN -> [SKIP][242] ([i915#9934]) +4 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-4/igt@kms_flip@2x-absolute-wf_vblank.html
    - shard-rkl:          NOTRUN -> [SKIP][243] ([i915#9934]) +2 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-7/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-glk10:        NOTRUN -> [FAIL][244] ([i915#13027]) +1 other test fail
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk10/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-dg2:          NOTRUN -> [SKIP][245] ([i915#8381]) +1 other test skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-10/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-plain-flip:
    - shard-tglu-1:       NOTRUN -> [SKIP][246] ([i915#3637] / [i915#9934]) +5 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-1/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][247] ([i915#9934]) +1 other test skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-14/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
    - shard-tglu:         NOTRUN -> [SKIP][248] ([i915#3637] / [i915#9934]) +2 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-7/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
    - shard-mtlp:         NOTRUN -> [SKIP][249] ([i915#3637] / [i915#9934]) +1 other test skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][250] ([i915#15643]) +2 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][251] ([i915#15643]) +6 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-10/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-rkl:          NOTRUN -> [SKIP][252] ([i915#14544] / [i915#15643]) +1 other test skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][253] ([i915#15643]) +1 other test skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][254] ([i915#15643]) +2 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html
    - shard-dg1:          NOTRUN -> [SKIP][255] ([i915#15643]) +2 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-14/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][256] ([i915#15643] / [i915#5190]) +1 other test skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile:
    - shard-tglu-1:       NOTRUN -> [SKIP][257] ([i915#15643])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-1/igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile.html

  * igt@kms_force_connector_basic@force-connector-state:
    - shard-mtlp:         [PASS][258] -> [SKIP][259] ([i915#15672])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-mtlp-4/igt@kms_force_connector_basic@force-connector-state.html
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-1/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][260] ([i915#15104] / [i915#15990]) +1 other test skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][261] ([i915#15990] / [i915#8708]) +1 other test skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][262] ([i915#15991] / [i915#1825]) +6 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][263] ([i915#10056])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk8/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-tglu-1:       NOTRUN -> [SKIP][264] ([i915#5439])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][265] ([i915#15989]) +14 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-8/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-move:
    - shard-dg2:          NOTRUN -> [SKIP][266] ([i915#15989]) +11 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-8/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-plflip-blt:
    - shard-rkl:          [PASS][267] -> [SKIP][268] ([i915#15989]) +12 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-plflip-blt.html
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-8/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-pgflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][269] +61 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-4/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-stridechange:
    - shard-tglu-1:       NOTRUN -> [SKIP][270] ([i915#15989]) +11 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-1/igt@kms_frontbuffer_tracking@fbchdr-stridechange.html
    - shard-dg1:          NOTRUN -> [SKIP][271] ([i915#15989]) +2 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-18/igt@kms_frontbuffer_tracking@fbchdr-stridechange.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][272] ([i915#1825]) +3 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
    - shard-dg1:          NOTRUN -> [SKIP][273] +20 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][274] ([i915#5439])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-shrfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][275] ([i915#14544] / [i915#15102]) +2 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-msflip-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][276] ([i915#15989]) +7 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][277] ([i915#15102]) +6 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][278] ([i915#15990]) +7 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-shrfb-plflip-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][279] +46 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-draw-render:
    - shard-glk11:        NOTRUN -> [SKIP][280] +50 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk11/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][281] ([i915#15990]) +14 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-mmap-gtt.html
    - shard-dg1:          NOTRUN -> [SKIP][282] ([i915#15990]) +8 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-shrfb-scaledprimary:
    - shard-tglu:         NOTRUN -> [SKIP][283] ([i915#15102]) +46 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-10/igt@kms_frontbuffer_tracking@fbcpsrhdr-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-blt:
    - shard-tglu:         NOTRUN -> [SKIP][284] ([i915#15989]) +16 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-4/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-pwrite:
    - shard-mtlp:         NOTRUN -> [SKIP][285] ([i915#15991]) +10 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-6/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-fullscreen:
    - shard-dg2:          NOTRUN -> [SKIP][286] ([i915#15991]) +24 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-8/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-indfb-draw-pwrite:
    - shard-tglu:         NOTRUN -> [SKIP][287] +78 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-10/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-mmap-cpu:
    - shard-dg2:          [PASS][288] -> [SKIP][289] ([i915#15989])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-dg2-10/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-mmap-cpu.html
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-5/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-render:
    - shard-glk:          [PASS][290] -> [SKIP][291] +2 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-glk8/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-render.html
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk5/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][292] ([i915#15104] / [i915#15990])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-19/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt.html
    - shard-mtlp:         NOTRUN -> [SKIP][293] ([i915#15104] / [i915#15990])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-7/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-tglu-1:       NOTRUN -> [SKIP][294] ([i915#15102]) +21 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][295] ([i915#15990] / [i915#8708]) +1 other test skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][296] ([i915#15102]) +21 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html
    - shard-rkl:          NOTRUN -> [SKIP][297] ([i915#15102] / [i915#3023]) +12 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render:
    - shard-rkl:          NOTRUN -> [SKIP][298] ([i915#14544] / [i915#15102] / [i915#3023]) +1 other test skip
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-snb:          NOTRUN -> [SKIP][299] +200 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-snb6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][300] ([i915#15990] / [i915#8708]) +5 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][301] ([i915#15991] / [i915#5354]) +16 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move:
    - shard-rkl:          NOTRUN -> [SKIP][302] ([i915#15102]) +17 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-2/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-draw-render:
    - shard-rkl:          NOTRUN -> [SKIP][303] ([i915#14544]) +8 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_getfb@getfb2-handle-closed:
    - shard-dg1:          [PASS][304] -> [DMESG-WARN][305] ([i915#4423]) +2 other tests dmesg-warn
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-dg1-12/igt@kms_getfb@getfb2-handle-closed.html
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-14/igt@kms_getfb@getfb2-handle-closed.html

  * igt@kms_hdmi_inject@inject-4k:
    - shard-mtlp:         [PASS][306] -> [SKIP][307] ([i915#15725])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-mtlp-6/igt@kms_hdmi_inject@inject-4k.html
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-1/igt@kms_hdmi_inject@inject-4k.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][308] ([i915#16012] / [i915#3555] / [i915#8228])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-4/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-1-xrgb2101010:
    - shard-dg2:          NOTRUN -> [SKIP][309] ([i915#16012]) +3 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-4/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-1-xrgb2101010.html
    - shard-rkl:          NOTRUN -> [SKIP][310] ([i915#16012]) +1 other test skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-8/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-1-xrgb2101010.html

  * igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-dg1:          NOTRUN -> [SKIP][311] ([i915#16012]) +5 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-13/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3-xrgb16161616f.html

  * igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-1-xrgb2101010:
    - shard-rkl:          NOTRUN -> [SKIP][312] ([i915#16011]) +5 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-5/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-1-xrgb2101010.html

  * igt@kms_hdr@invalid-hdr:
    - shard-tglu:         NOTRUN -> [SKIP][313] ([i915#16012] / [i915#3555] / [i915#8228])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-10/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-1-xrgb2101010:
    - shard-tglu:         NOTRUN -> [SKIP][314] ([i915#16012]) +1 other test skip
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-10/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-1-xrgb2101010.html

  * igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-1-xrgb16161616f:
    - shard-dg1:          NOTRUN -> [SKIP][315] ([i915#16011]) +7 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-15/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-1-xrgb16161616f.html

  * igt@kms_hdr@static-swap:
    - shard-rkl:          [PASS][316] -> [SKIP][317] ([i915#16011] / [i915#3555] / [i915#8228])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-6/igt@kms_hdr@static-swap.html
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-2/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-mtlp:         NOTRUN -> [SKIP][318] ([i915#16011] / [i915#3555] / [i915#8228])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-3/igt@kms_hdr@static-toggle-dpms.html
    - shard-dg2:          NOTRUN -> [SKIP][319] ([i915#16011] / [i915#3555] / [i915#8228])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-8/igt@kms_hdr@static-toggle-dpms.html
    - shard-dg1:          NOTRUN -> [SKIP][320] ([i915#16011] / [i915#3555] / [i915#8228])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-15/igt@kms_hdr@static-toggle-dpms.html
    - shard-tglu:         NOTRUN -> [SKIP][321] ([i915#16011] / [i915#3555] / [i915#8228])
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-3/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_hdr@static-toggle-dpms@pipe-a-edp-1-xrgb2101010:
    - shard-mtlp:         NOTRUN -> [SKIP][322] ([i915#16011]) +1 other test skip
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-3/igt@kms_hdr@static-toggle-dpms@pipe-a-edp-1-xrgb2101010.html

  * igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-1-xrgb2101010:
    - shard-tglu:         NOTRUN -> [SKIP][323] ([i915#16011]) +1 other test skip
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-3/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-1-xrgb2101010.html

  * igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-dg2:          NOTRUN -> [SKIP][324] ([i915#16011]) +1 other test skip
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-8/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb16161616f.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-tglu-1:       NOTRUN -> [SKIP][325] ([i915#16011] / [i915#3555] / [i915#8228])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-1/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-1-xrgb16161616f:
    - shard-tglu-1:       NOTRUN -> [SKIP][326] ([i915#16011]) +1 other test skip
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-1/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-1-xrgb16161616f.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][327] ([i915#13688])
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-5/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][328] ([i915#15459])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-8/igt@kms_joiner@invalid-modeset-force-big-joiner.html
    - shard-tglu:         NOTRUN -> [SKIP][329] ([i915#15459])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][330] ([i915#15638] / [i915#15722])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-3/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-tglu:         NOTRUN -> [SKIP][331] ([i915#6301])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-6/igt@kms_panel_fitting@legacy.html
    - shard-dg2:          NOTRUN -> [SKIP][332] ([i915#6301])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-4/igt@kms_panel_fitting@legacy.html
    - shard-rkl:          NOTRUN -> [SKIP][333] ([i915#6301])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-2/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping:
    - shard-dg2:          NOTRUN -> [SKIP][334] ([i915#15709]) +3 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-3/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:
    - shard-tglu:         NOTRUN -> [SKIP][335] ([i915#15709]) +3 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-3/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping:
    - shard-tglu-1:       NOTRUN -> [SKIP][336] ([i915#15709])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-1/igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:
    - shard-rkl:          NOTRUN -> [SKIP][337] ([i915#15709]) +3 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-2/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-7:
    - shard-tglu:         NOTRUN -> [SKIP][338] ([i915#15608]) +1 other test skip
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-10/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-7.html

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:
    - shard-dg1:          NOTRUN -> [SKIP][339] ([i915#15709]) +1 other test skip
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-19/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html
    - shard-mtlp:         NOTRUN -> [SKIP][340] ([i915#15709]) +1 other test skip
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-7/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html

  * igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:
    - shard-tglu:         NOTRUN -> [SKIP][341] ([i915#16112])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-5/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][342] ([i915#13026]) +1 other test incomplete
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk8/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_alpha_blend@constant-alpha-max:
    - shard-glk:          NOTRUN -> [FAIL][343] ([i915#10647] / [i915#12169])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk4/igt@kms_plane_alpha_blend@constant-alpha-max.html

  * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][344] ([i915#10647]) +1 other test fail
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk4/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-rkl:          NOTRUN -> [SKIP][345] ([i915#13958])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-2/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_multiple@tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][346] ([i915#14259])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-8/igt@kms_plane_multiple@tiling-4.html
    - shard-tglu:         NOTRUN -> [SKIP][347] ([i915#14259])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-10/igt@kms_plane_multiple@tiling-4.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2:          NOTRUN -> [SKIP][348] ([i915#6953] / [i915#9423])
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-8/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
    - shard-tglu:         NOTRUN -> [SKIP][349] ([i915#15329] / [i915#3555])
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b:
    - shard-tglu:         NOTRUN -> [SKIP][350] ([i915#15329]) +3 other tests skip
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][351] ([i915#12343] / [i915#14544] / [i915#5354])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-tglu-1:       NOTRUN -> [SKIP][352] ([i915#15948])
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-1/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][353] ([i915#15739])
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-3/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-rkl:          NOTRUN -> [SKIP][354] ([i915#3828])
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-8/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][355] ([i915#15073]) +1 other test skip
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-5/igt@kms_pm_rpm@dpms-lpsp.html
    - shard-rkl:          NOTRUN -> [SKIP][356] ([i915#15073]) +2 other tests skip
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-4/igt@kms_pm_rpm@dpms-lpsp.html
    - shard-dg1:          NOTRUN -> [SKIP][357] ([i915#15073])
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-17/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2:          [PASS][358] -> [SKIP][359] ([i915#15073])
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-6/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg1:          [PASS][360] -> [SKIP][361] ([i915#15073]) +2 other tests skip
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-dg1-19/igt@kms_pm_rpm@modeset-non-lpsp.html
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-15/igt@kms_pm_rpm@modeset-non-lpsp.html
    - shard-tglu:         NOTRUN -> [SKIP][362] ([i915#15073]) +1 other test skip
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-3/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-mtlp:         NOTRUN -> [SKIP][363] ([i915#15073])
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-2/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
    - shard-tglu:         NOTRUN -> [SKIP][364] ([i915#11520]) +5 other tests skip
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-7/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-snb:          NOTRUN -> [SKIP][365] ([i915#11520]) +1 other test skip
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-snb6/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-dg2:          NOTRUN -> [SKIP][366] ([i915#11520]) +4 other tests skip
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][367] ([i915#11520] / [i915#14544])
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-glk:          NOTRUN -> [SKIP][368] ([i915#11520]) +14 other tests skip
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk2/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html
    - shard-rkl:          NOTRUN -> [SKIP][369] ([i915#11520]) +4 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-8/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
    - shard-glk11:        NOTRUN -> [SKIP][370] ([i915#11520])
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk11/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-glk10:        NOTRUN -> [SKIP][371] ([i915#11520]) +1 other test skip
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk10/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-tglu-1:       NOTRUN -> [SKIP][372] ([i915#11520]) +3 other tests skip
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-1/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-tglu:         NOTRUN -> [SKIP][373] ([i915#9683])
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-7/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr-primary-page-flip:
    - shard-dg2:          NOTRUN -> [SKIP][374] ([i915#1072] / [i915#9732]) +11 other tests skip
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-3/igt@kms_psr@fbc-psr-primary-page-flip.html

  * igt@kms_psr@fbc-psr2-cursor-mmap-gtt:
    - shard-glk:          NOTRUN -> [SKIP][375] +607 other tests skip
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk2/igt@kms_psr@fbc-psr2-cursor-mmap-gtt.html

  * igt@kms_psr@fbc-psr2-no-drrs:
    - shard-rkl:          NOTRUN -> [SKIP][376] ([i915#1072] / [i915#14544] / [i915#9732]) +1 other test skip
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_psr@fbc-psr2-no-drrs.html

  * igt@kms_psr@fbc-psr2-no-drrs@edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][377] ([i915#9688]) +3 other tests skip
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-1/igt@kms_psr@fbc-psr2-no-drrs@edp-1.html

  * igt@kms_psr@psr-sprite-mmap-cpu:
    - shard-tglu-1:       NOTRUN -> [SKIP][378] ([i915#9732]) +9 other tests skip
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-1/igt@kms_psr@psr-sprite-mmap-cpu.html

  * igt@kms_psr@psr2-cursor-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][379] ([i915#1072] / [i915#9732]) +12 other tests skip
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-7/igt@kms_psr@psr2-cursor-mmap-gtt.html

  * igt@kms_psr@psr2-sprite-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][380] ([i915#1072] / [i915#9732]) +3 other tests skip
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-12/igt@kms_psr@psr2-sprite-mmap-gtt.html
    - shard-tglu:         NOTRUN -> [SKIP][381] ([i915#9732]) +15 other tests skip
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-7/igt@kms_psr@psr2-sprite-mmap-gtt.html
    - shard-mtlp:         NOTRUN -> [SKIP][382] ([i915#4077] / [i915#9688]) +1 other test skip
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-8/igt@kms_psr@psr2-sprite-mmap-gtt.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-tglu-1:       NOTRUN -> [SKIP][383] ([i915#15949])
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-rkl:          NOTRUN -> [SKIP][384] ([i915#5289])
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-2/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2:          NOTRUN -> [SKIP][385] ([i915#12755] / [i915#15867])
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-1/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-tglu:         NOTRUN -> [SKIP][386] ([i915#3555]) +1 other test skip
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-3/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-rkl:          NOTRUN -> [ABORT][387] ([i915#13179]) +1 other test abort
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-7/igt@kms_selftest@drm_framebuffer.html
    - shard-dg1:          NOTRUN -> [ABORT][388] ([i915#13179]) +1 other test abort
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-16/igt@kms_selftest@drm_framebuffer.html
    - shard-snb:          NOTRUN -> [ABORT][389] ([i915#13179]) +1 other test abort
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-snb6/igt@kms_selftest@drm_framebuffer.html
    - shard-tglu:         NOTRUN -> [ABORT][390] ([i915#13179]) +1 other test abort
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-10/igt@kms_selftest@drm_framebuffer.html
    - shard-mtlp:         NOTRUN -> [ABORT][391] ([i915#13179]) +1 other test abort
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-6/igt@kms_selftest@drm_framebuffer.html
    - shard-glk11:        NOTRUN -> [ABORT][392] ([i915#13179]) +1 other test abort
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk11/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free:
    - shard-dg2:          NOTRUN -> [ABORT][393] ([i915#13179]) +1 other test abort
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-4/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free.html

  * igt@kms_setmode@basic:
    - shard-rkl:          [PASS][394] -> [FAIL][395] ([i915#15106])
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-4/igt@kms_setmode@basic.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-5/igt@kms_setmode@basic.html

  * igt@kms_setmode@basic@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [FAIL][396] ([i915#15106])
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-5/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-mtlp:         [PASS][397] -> [FAIL][398] ([i915#15106]) +2 other tests fail
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-mtlp-6/igt@kms_setmode@basic@pipe-b-edp-1.html
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-7/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-glk:          NOTRUN -> [FAIL][399] ([i915#10959])
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk5/igt@kms_tiled_display@basic-test-pattern.html
    - shard-rkl:          NOTRUN -> [SKIP][400] ([i915#8623])
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-2/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][401] ([i915#12276]) +1 other test incomplete
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk10/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-tglu:         NOTRUN -> [SKIP][402] ([i915#9906])
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-7/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][403] ([i915#15243] / [i915#3555])
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-5/igt@kms_vrr@flip-dpms.html

  * igt@perf_pmu@all-busy-idle-check-all:
    - shard-dg2:          NOTRUN -> [FAIL][404] ([i915#15453])
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-3/igt@perf_pmu@all-busy-idle-check-all.html
    - shard-dg1:          NOTRUN -> [FAIL][405] ([i915#15453])
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-13/igt@perf_pmu@all-busy-idle-check-all.html
    - shard-mtlp:         NOTRUN -> [FAIL][406] ([i915#15453])
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-8/igt@perf_pmu@all-busy-idle-check-all.html

  * igt@perf_pmu@busy-double-start:
    - shard-mtlp:         NOTRUN -> [FAIL][407] ([i915#4349]) +2 other tests fail
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-3/igt@perf_pmu@busy-double-start.html

  * igt@perf_pmu@busy-double-start@vecs1:
    - shard-dg2:          NOTRUN -> [FAIL][408] ([i915#4349]) +4 other tests fail
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-5/igt@perf_pmu@busy-double-start@vecs1.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-dg2:          NOTRUN -> [SKIP][409] ([i915#8516])
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-1/igt@perf_pmu@rc6-all-gts.html

  * igt@perf_pmu@semaphore-busy:
    - shard-mtlp:         [PASS][410] -> [FAIL][411] ([i915#4349]) +1 other test fail
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-mtlp-8/igt@perf_pmu@semaphore-busy.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-7/igt@perf_pmu@semaphore-busy.html

  * igt@prime_vgem@basic-write:
    - shard-rkl:          NOTRUN -> [SKIP][412] ([i915#3291] / [i915#3708])
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-3/igt@prime_vgem@basic-write.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-tglu:         NOTRUN -> [SKIP][413] ([i915#16066])
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-7/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
    - shard-dg2:          NOTRUN -> [SKIP][414] ([i915#9917])
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-6/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
    - shard-rkl:          NOTRUN -> [SKIP][415] ([i915#14544] / [i915#9917])
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  
#### Possible fixes ####

  * igt@gem_linear_blits@interruptible:
    - shard-dg1:          [FAIL][416] ([i915#15391]) -> [PASS][417]
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-dg1-14/igt@gem_linear_blits@interruptible.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-19/igt@gem_linear_blits@interruptible.html

  * igt@gem_workarounds@suspend-resume:
    - shard-rkl:          [INCOMPLETE][418] ([i915#13356]) -> [PASS][419]
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-3/igt@gem_workarounds@suspend-resume.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-2/igt@gem_workarounds@suspend-resume.html

  * igt@i915_pm_rps@reset:
    - shard-snb:          [TIMEOUT][420] ([i915#16162]) -> [PASS][421]
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-snb6/igt@i915_pm_rps@reset.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-snb1/igt@i915_pm_rps@reset.html

  * igt@i915_suspend@forcewake:
    - shard-rkl:          [INCOMPLETE][422] ([i915#4817]) -> [PASS][423]
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-6/igt@i915_suspend@forcewake.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-8/igt@i915_suspend@forcewake.html

  * igt@i915_suspend@sysfs-reader:
    - shard-glk:          [INCOMPLETE][424] ([i915#16182] / [i915#4817]) -> [PASS][425]
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-glk8/igt@i915_suspend@sysfs-reader.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk9/igt@i915_suspend@sysfs-reader.html

  * igt@kms_3d@basic:
    - shard-mtlp:         [SKIP][426] ([i915#15726]) -> [PASS][427]
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-mtlp-1/igt@kms_3d@basic.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-8/igt@kms_3d@basic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-2:
    - shard-glk:          [FAIL][428] ([i915#14888]) -> [PASS][429] +1 other test pass
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-glk5/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-2.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk2/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-2.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-mtlp:         [FAIL][430] ([i915#5956]) -> [PASS][431] +1 other test pass
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-mtlp-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-rkl:          [FAIL][432] ([i915#13566]) -> [PASS][433] +3 other tests pass
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-128x42.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-tglu:         [FAIL][434] ([i915#13566]) -> [PASS][435] +5 other tests pass
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-tglu-3/igt@kms_cursor_crc@cursor-onscreen-256x85.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-4/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-glk:          [FAIL][436] ([i915#13027]) -> [PASS][437] +1 other test pass
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-render:
    - shard-dg2:          [SKIP][438] ([i915#15989]) -> [PASS][439] +1 other test pass
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-dg2-4/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-render.html
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-10/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-render:
    - shard-glk:          [SKIP][440] -> [PASS][441] +2 other tests pass
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-glk6/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-render.html
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk8/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@hdr-farfromfence-mmap-gtt:
    - shard-rkl:          [SKIP][442] ([i915#15989]) -> [PASS][443] +14 other tests pass
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-3/igt@kms_frontbuffer_tracking@hdr-farfromfence-mmap-gtt.html
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-farfromfence-mmap-gtt.html

  * igt@kms_hdr@static-toggle:
    - shard-rkl:          [SKIP][444] ([i915#16011] / [i915#3555] / [i915#8228]) -> [PASS][445]
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-2/igt@kms_hdr@static-toggle.html
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_hdr@static-toggle.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-dg2:          [ABORT][446] ([i915#15132]) -> [PASS][447]
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-dg2-10/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-7/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-rkl:          [SKIP][448] ([i915#6953]) -> [PASS][449]
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-7/igt@kms_plane_scaling@intel-max-src-size.html
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-rkl:          [SKIP][450] ([i915#15073]) -> [PASS][451] +2 other tests pass
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-2/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
    - shard-dg1:          [SKIP][452] ([i915#15073]) -> [PASS][453]
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-dg1-14/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-18/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@system-suspend-idle:
    - shard-dg2:          [INCOMPLETE][454] ([i915#14419]) -> [PASS][455]
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-dg2-3/igt@kms_pm_rpm@system-suspend-idle.html
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-8/igt@kms_pm_rpm@system-suspend-idle.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-rkl:          [INCOMPLETE][456] ([i915#12276]) -> [PASS][457] +1 other test pass
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-6/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-4/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@perf_pmu@rc6-suspend:
    - shard-glk:          [INCOMPLETE][458] ([i915#13356] / [i915#14242] / [i915#16236]) -> [PASS][459]
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-glk5/igt@perf_pmu@rc6-suspend.html
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk6/igt@perf_pmu@rc6-suspend.html

  
#### Warnings ####

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-rkl:          [SKIP][460] ([i915#14544] / [i915#7697]) -> [SKIP][461] ([i915#7697]) +1 other test skip
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-6/igt@gem_close_race@multigpu-basic-threads.html
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-5/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_exec_big@single:
    - shard-tglu:         [FAIL][462] ([i915#15944]) -> [FAIL][463] ([i915#15816])
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-tglu-7/igt@gem_exec_big@single.html
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-2/igt@gem_exec_big@single.html

  * igt@gem_exec_reloc@basic-gtt-read:
    - shard-rkl:          [SKIP][464] ([i915#3281]) -> [SKIP][465] ([i915#14544] / [i915#3281]) +2 other tests skip
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-1/igt@gem_exec_reloc@basic-gtt-read.html
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-read.html

  * igt@gem_exec_reloc@basic-wc-cpu:
    - shard-rkl:          [SKIP][466] ([i915#14544] / [i915#3281]) -> [SKIP][467] ([i915#3281]) +6 other tests skip
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-6/igt@gem_exec_reloc@basic-wc-cpu.html
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-2/igt@gem_exec_reloc@basic-wc-cpu.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-rkl:          [SKIP][468] ([i915#4613]) -> [SKIP][469] ([i915#14544] / [i915#4613]) +2 other tests skip
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-7/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-rkl:          [SKIP][470] ([i915#14544] / [i915#4613]) -> [SKIP][471] ([i915#4613])
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-6/igt@gem_lmem_swapping@verify-random.html
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-4/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_partial_pwrite_pread@reads:
    - shard-rkl:          [SKIP][472] ([i915#3282]) -> [SKIP][473] ([i915#14544] / [i915#3282]) +2 other tests skip
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-2/igt@gem_partial_pwrite_pread@reads.html
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@gem_partial_pwrite_pread@reads.html

  * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
    - shard-rkl:          [SKIP][474] ([i915#14544] / [i915#8411]) -> [SKIP][475] ([i915#8411])
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-6/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-8/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html

  * igt@gem_tiled_pread_pwrite:
    - shard-rkl:          [SKIP][476] ([i915#14544] / [i915#3282]) -> [SKIP][477] ([i915#3282])
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-6/igt@gem_tiled_pread_pwrite.html
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-2/igt@gem_tiled_pread_pwrite.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-rkl:          [SKIP][478] ([i915#3297]) -> [SKIP][479] ([i915#14544] / [i915#3297]) +1 other test skip
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-3/igt@gem_userptr_blits@create-destroy-unsync.html
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@unsync-overlap:
    - shard-rkl:          [SKIP][480] ([i915#14544] / [i915#3297]) -> [SKIP][481] ([i915#3297])
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-6/igt@gem_userptr_blits@unsync-overlap.html
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-7/igt@gem_userptr_blits@unsync-overlap.html

  * igt@gen9_exec_parse@bb-oversize:
    - shard-rkl:          [SKIP][482] ([i915#2527]) -> [SKIP][483] ([i915#14544] / [i915#2527]) +1 other test skip
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-4/igt@gen9_exec_parse@bb-oversize.html
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@gen9_exec_parse@bb-oversize.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-rkl:          [SKIP][484] ([i915#14544] / [i915#2527]) -> [SKIP][485] ([i915#2527]) +1 other test skip
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-6/igt@gen9_exec_parse@valid-registers.html
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-8/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-rkl:          [SKIP][486] ([i915#14544] / [i915#6590]) -> [SKIP][487] ([i915#6590]) +1 other test skip
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-6/igt@i915_pm_freq_mult@media-freq@gt0.html
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-3/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-rkl:          [SKIP][488] ([i915#14498]) -> [SKIP][489] ([i915#14498] / [i915#14544])
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-8/igt@i915_pm_rc6_residency@rc6-idle.html
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-rkl:          [ABORT][490] ([i915#15140]) -> [INCOMPLETE][491] ([i915#4817])
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-1/igt@i915_suspend@fence-restore-tiled2untiled.html
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-2:
    - shard-glk:          [INCOMPLETE][492] ([i915#12761] / [i915#14995] / [i915#16314]) -> [INCOMPLETE][493] ([i915#14995] / [i915#16314])
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-glk4/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-2.html
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk9/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-2.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-rkl:          [SKIP][494] ([i915#14544] / [i915#1769] / [i915#3555]) -> [SKIP][495] ([i915#1769] / [i915#3555])
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
    - shard-rkl:          [SKIP][496] ([i915#5286]) -> [SKIP][497] ([i915#14544] / [i915#5286]) +2 other tests skip
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-8/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-dg1:          [SKIP][498] ([i915#4423] / [i915#4538] / [i915#5286]) -> [SKIP][499] ([i915#4538] / [i915#5286])
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-dg1-17/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-12/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-rkl:          [SKIP][500] ([i915#14544] / [i915#5286]) -> [SKIP][501] ([i915#5286])
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-rkl:          [SKIP][502] ([i915#3638]) -> [SKIP][503] ([i915#14544] / [i915#3638]) +1 other test skip
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-5/igt@kms_big_fb@linear-32bpp-rotate-90.html
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-rkl:          [SKIP][504] ([i915#14544] / [i915#3638]) -> [SKIP][505] ([i915#3638])
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-6/igt@kms_big_fb@linear-8bpp-rotate-270.html
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-3/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-rkl:          [SKIP][506] ([i915#3828]) -> [SKIP][507] ([i915#14544] / [i915#3828])
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-5/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html
   [507]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-rkl:          [SKIP][508] ([i915#12313]) -> [SKIP][509] ([i915#12313] / [i915#14544])
   [508]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-4/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
   [509]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs:
    - shard-dg1:          [SKIP][510] ([i915#4423] / [i915#6095]) -> [SKIP][511] ([i915#6095])
   [510]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-dg1-12/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs.html
   [511]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-15/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-rkl:          [SKIP][512] ([i915#12805] / [i915#14544]) -> [SKIP][513] ([i915#12805])
   [512]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [513]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          [SKIP][514] ([i915#14544] / [i915#6095]) -> [SKIP][515] ([i915#6095]) +1 other test skip
   [514]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-6/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html
   [515]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-7/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          [SKIP][516] ([i915#14098] / [i915#14544] / [i915#6095]) -> [SKIP][517] ([i915#14098] / [i915#6095]) +3 other tests skip
   [516]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-6/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-2.html
   [517]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-7/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-rkl:          [SKIP][518] ([i915#14098] / [i915#6095]) -> [SKIP][519] ([i915#14098] / [i915#14544] / [i915#6095])
   [518]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-5/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [519]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs:
    - shard-dg1:          [SKIP][520] ([i915#6095]) -> [SKIP][521] ([i915#4423] / [i915#6095])
   [520]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-dg1-15/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html
   [521]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-18/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-rkl:          [SKIP][522] ([i915#14544] / [i915#3742]) -> [SKIP][523] ([i915#3742])
   [522]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-6/igt@kms_cdclk@mode-transition-all-outputs.html
   [523]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-4/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_frames@hdmi-crc-multiple:
    - shard-rkl:          [SKIP][524] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][525] ([i915#11151] / [i915#7828]) +2 other tests skip
   [524]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-6/igt@kms_chamelium_frames@hdmi-crc-multiple.html
   [525]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-7/igt@kms_chamelium_frames@hdmi-crc-multiple.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-rkl:          [SKIP][526] ([i915#11151] / [i915#7828]) -> [SKIP][527] ([i915#11151] / [i915#14544] / [i915#7828]) +1 other test skip
   [526]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-3/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
   [527]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-rkl:          [SKIP][528] ([i915#15330] / [i915#3116]) -> [SKIP][529] ([i915#14544] / [i915#15330] / [i915#3116])
   [528]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-3/igt@kms_content_protection@dp-mst-type-0.html
   [529]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg1:          [SKIP][530] ([i915#9433]) -> [SKIP][531] ([i915#15865])
   [530]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-dg1-13/igt@kms_content_protection@mei-interface.html
   [531]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-18/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@suspend-resume:
    - shard-dg2:          [SKIP][532] ([i915#15865]) -> [FAIL][533] ([i915#7173])
   [532]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-dg2-1/igt@kms_content_protection@suspend-resume.html
   [533]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-10/igt@kms_content_protection@suspend-resume.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-dg2:          [SKIP][534] ([i915#13049]) -> [SKIP][535] ([i915#13049] / [i915#3359]) +1 other test skip
   [534]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-dg2-6/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [535]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-10/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-rkl:          [SKIP][536] ([i915#14544] / [i915#3555]) -> [SKIP][537] ([i915#3555]) +1 other test skip
   [536]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-max-size.html
   [537]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-8/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-rkl:          [SKIP][538] ([i915#3555]) -> [SKIP][539] ([i915#14544] / [i915#3555]) +1 other test skip
   [538]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-2/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
   [539]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-rkl:          [SKIP][540] ([i915#9723]) -> [SKIP][541] ([i915#14544] / [i915#9723])
   [540]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
   [541]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-rkl:          [SKIP][542] ([i915#13748]) -> [SKIP][543] ([i915#13748] / [i915#14544]) +1 other test skip
   [542]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-4/igt@kms_dp_link_training@uhbr-sst.html
   [543]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-rkl:          [SKIP][544] ([i915#14544] / [i915#3555] / [i915#3840]) -> [SKIP][545] ([i915#3555] / [i915#3840])
   [544]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-6/igt@kms_dsc@dsc-with-bpc.html
   [545]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-3/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg1:          [SKIP][546] ([i915#3840] / [i915#4423] / [i915#9053]) -> [SKIP][547] ([i915#3840] / [i915#9053])
   [546]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-dg1-17/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [547]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-16/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-rkl:          [SKIP][548] ([i915#3955]) -> [SKIP][549] ([i915#14544] / [i915#3955])
   [548]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-4/igt@kms_fbcon_fbt@psr-suspend.html
   [549]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-rkl:          [SKIP][550] ([i915#9337]) -> [SKIP][551] ([i915#14544] / [i915#9337])
   [550]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-5/igt@kms_feature_discovery@dp-mst.html
   [551]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-rkl:          [SKIP][552] ([i915#14544] / [i915#9934]) -> [SKIP][553] ([i915#9934]) +1 other test skip
   [552]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-6/igt@kms_flip@2x-modeset-vs-vblank-race.html
   [553]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-1/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-rkl:          [SKIP][554] ([i915#9934]) -> [SKIP][555] ([i915#14544] / [i915#9934]) +1 other test skip
   [554]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-8/igt@kms_flip@2x-plain-flip-ts-check.html
   [555]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-rkl:          [SKIP][556] ([i915#14544] / [i915#15643]) -> [SKIP][557] ([i915#15643])
   [556]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [557]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-dg1:          [SKIP][558] ([i915#15643] / [i915#4423]) -> [SKIP][559] ([i915#15643])
   [558]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-dg1-12/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html
   [559]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-13/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][560] ([i915#14544] / [i915#1825]) -> [SKIP][561] ([i915#1825]) +4 other tests skip
   [560]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [561]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render:
    - shard-rkl:          [SKIP][562] ([i915#14544] / [i915#15102] / [i915#3023]) -> [SKIP][563] ([i915#15102] / [i915#3023]) +3 other tests skip
   [562]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html
   [563]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-rkl:          [SKIP][564] -> [SKIP][565] ([i915#14544]) +50 other tests skip
   [564]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html
   [565]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-farfromfence-mmap-gtt:
    - shard-rkl:          [SKIP][566] ([i915#15102] / [i915#3023]) -> [SKIP][567] ([i915#14544] / [i915#15102] / [i915#3023]) +8 other tests skip
   [566]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-farfromfence-mmap-gtt.html
   [567]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-farfromfence-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
    - shard-dg2:          [SKIP][568] ([i915#15102]) -> [SKIP][569] ([i915#10433] / [i915#15102])
   [568]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
   [569]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-move:
    - shard-rkl:          [SKIP][570] ([i915#14544]) -> [SKIP][571] +30 other tests skip
   [570]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-move.html
   [571]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-render:
    - shard-dg1:          [SKIP][572] ([i915#15102]) -> [SKIP][573] ([i915#15102] / [i915#4423])
   [572]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-render.html
   [573]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-render:
    - shard-rkl:          [SKIP][574] ([i915#15102]) -> [SKIP][575] ([i915#14544] / [i915#15102]) +15 other tests skip
   [574]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-render.html
   [575]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4:
    - shard-rkl:          [SKIP][576] ([i915#5439]) -> [SKIP][577] ([i915#14544] / [i915#5439])
   [576]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html
   [577]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-shrfb-draw-pwrite:
    - shard-dg1:          [SKIP][578] -> [SKIP][579] ([i915#4423])
   [578]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-dg1-13/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-shrfb-draw-pwrite.html
   [579]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-18/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-rkl:          [SKIP][580] ([i915#1825]) -> [SKIP][581] ([i915#14544] / [i915#1825])
   [580]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [581]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
    - shard-dg2:          [SKIP][582] ([i915#10433] / [i915#15102]) -> [SKIP][583] ([i915#15102]) +5 other tests skip
   [582]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html
   [583]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-shrfb-draw-pwrite:
    - shard-rkl:          [SKIP][584] ([i915#14544] / [i915#15102]) -> [SKIP][585] ([i915#15102]) +10 other tests skip
   [584]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-shrfb-draw-pwrite.html
   [585]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-3/igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-shrfb-draw-pwrite.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-rkl:          [SKIP][586] ([i915#16076]) -> [SKIP][587] ([i915#16011])
   [586]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-1/igt@kms_hdr@brightness-with-hdr.html
   [587]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-5/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-rkl:          [SKIP][588] ([i915#14544] / [i915#15459]) -> [SKIP][589] ([i915#15459])
   [588]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-6/igt@kms_joiner@basic-force-big-joiner.html
   [589]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-4/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping:
    - shard-rkl:          [SKIP][590] ([i915#15709]) -> [SKIP][591] ([i915#14544] / [i915#15709]) +2 other tests skip
   [590]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-5/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping.html
   [591]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:
    - shard-rkl:          [SKIP][592] ([i915#14544] / [i915#15709]) -> [SKIP][593] ([i915#15709]) +1 other test skip
   [592]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html
   [593]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-2/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-rkl:          [SKIP][594] ([i915#14544] / [i915#3828]) -> [SKIP][595] ([i915#3828])
   [594]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-6/igt@kms_pm_dc@dc5-retention-flops.html
   [595]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-3/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-rkl:          [SKIP][596] ([i915#15739]) -> [SKIP][597] ([i915#14544] / [i915#15739])
   [596]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-4/igt@kms_pm_dc@dc9-dpms.html
   [597]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
    - shard-rkl:          [SKIP][598] ([i915#11520] / [i915#14544]) -> [SKIP][599] ([i915#11520]) +3 other tests skip
   [598]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html
   [599]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-4/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
    - shard-rkl:          [SKIP][600] ([i915#11520]) -> [SKIP][601] ([i915#11520] / [i915#14544]) +3 other tests skip
   [600]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-5/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html
   [601]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr@fbc-psr-cursor-plane-move:
    - shard-rkl:          [SKIP][602] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][603] ([i915#1072] / [i915#9732]) +6 other tests skip
   [602]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-6/igt@kms_psr@fbc-psr-cursor-plane-move.html
   [603]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-3/igt@kms_psr@fbc-psr-cursor-plane-move.html

  * igt@kms_psr@pr-cursor-plane-onoff:
    - shard-rkl:          [SKIP][604] ([i915#1072] / [i915#9732]) -> [SKIP][605] ([i915#1072] / [i915#14544] / [i915#9732]) +9 other tests skip
   [604]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-1/igt@kms_psr@pr-cursor-plane-onoff.html
   [605]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_psr@pr-cursor-plane-onoff.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-rkl:          [SKIP][606] ([i915#14544] / [i915#15949]) -> [SKIP][607] ([i915#15949])
   [606]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [607]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-dg2:          [SKIP][608] ([i915#15867]) -> [SKIP][609] ([i915#12755] / [i915#15867])
   [608]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-dg2-10/igt@kms_rotation_crc@primary-rotation-270.html
   [609]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-8/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-rkl:          [SKIP][610] ([i915#5289]) -> [SKIP][611] ([i915#14544] / [i915#5289]) +1 other test skip
   [610]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [611]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2:          [SKIP][612] ([i915#12755] / [i915#15867]) -> [SKIP][613] ([i915#15867]) +2 other tests skip
   [612]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-dg2-4/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [613]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-10/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-rkl:          [SKIP][614] ([i915#14544] / [i915#2435]) -> [SKIP][615] ([i915#2435])
   [614]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-6/igt@perf@per-context-mode-unprivileged.html
   [615]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-5/igt@perf@per-context-mode-unprivileged.html

  * igt@prime_vgem@basic-read:
    - shard-rkl:          [SKIP][616] ([i915#3291] / [i915#3708]) -> [SKIP][617] ([i915#14544] / [i915#3291] / [i915#3708])
   [616]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-5/igt@prime_vgem@basic-read.html
   [617]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@prime_vgem@basic-read.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each:
    - shard-rkl:          [SKIP][618] ([i915#9917]) -> [SKIP][619] ([i915#14544] / [i915#9917])
   [618]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-2/igt@sriov_basic@enable-vfs-bind-unbind-each.html
   [619]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@sriov_basic@enable-vfs-bind-unbind-each.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10056]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#10647]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#10959]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10959
  [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
  [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11814
  [i915#12169]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12169
  [i915#12193]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193
  [i915#12276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
  [i915#12358]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358
  [i915#1257]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12761]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761
  [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
  [i915#13026]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13026
  [i915#13027]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027
  [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13179]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179
  [i915#13196]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13196
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13390]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13390
  [i915#13562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13562
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13688
  [i915#13707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707
  [i915#13748]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748
  [i915#13749]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749
  [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
  [i915#14073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118
  [i915#14152]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152
  [i915#14242]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14242
  [i915#14259]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259
  [i915#14419]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419
  [i915#14498]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14498
  [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
  [i915#14586]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14586
  [i915#14694]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14694
  [i915#14888]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14888
  [i915#14995]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14995
  [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
  [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
  [i915#15104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104
  [i915#15106]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15106
  [i915#15131]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131
  [i915#15132]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132
  [i915#15140]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15140
  [i915#15243]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243
  [i915#15329]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329
  [i915#15330]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330
  [i915#15391]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15391
  [i915#15453]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15453
  [i915#15459]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459
  [i915#15582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582
  [i915#15608]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15608
  [i915#15638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15638
  [i915#15643]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643
  [i915#15672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15672
  [i915#15709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709
  [i915#15722]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15722
  [i915#15725]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15725
  [i915#15726]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15726
  [i915#15733]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15733
  [i915#15739]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15739
  [i915#15804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15804
  [i915#15816]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15816
  [i915#15865]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865
  [i915#15867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867
  [i915#15931]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15931
  [i915#15944]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15944
  [i915#15948]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948
  [i915#15949]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949
  [i915#15989]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989
  [i915#15990]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990
  [i915#15991]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991
  [i915#15999]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15999
  [i915#16011]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011
  [i915#16012]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16012
  [i915#16066]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16066
  [i915#16076]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16076
  [i915#16079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16079
  [i915#16081]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081
  [i915#16109]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16109
  [i915#16112]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16112
  [i915#16162]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16162
  [i915#16182]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182
  [i915#16236]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16236
  [i915#16314]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16314
  [i915#16348]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#2435]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2435
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
  [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
  [i915#315]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/315
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323
  [i915#3359]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3359
  [i915#3469]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3469
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
  [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
  [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
  [i915#3955]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
  [i915#4391]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4391
  [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4537]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4565]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
  [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
  [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
  [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
  [i915#4880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880
  [i915#5138]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
  [i915#5956]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
  [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
  [i915#6412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412
  [i915#6590]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590
  [i915#6893]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6893
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7173]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173
  [i915#7582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582
  [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
  [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#7882]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7882
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8381]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381
  [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
  [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
  [i915#8562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562
  [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
  [i915#9053]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9337]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9337
  [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
  [i915#9433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9433
  [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809
  [i915#9878]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9878
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934
  [i915#9979]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9979


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8949 -> IGTPW_15307
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_18632: e3821511385af9b3b404fe878418937eec48de9f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15307: 15307
  IGT_8949: 8949
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/index.html

--===============5573194252068203124==
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
<tr><td><b>Series:</b></td><td>Enable multi-format testing for pipe color tests (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167634/">https://patchwork.freedesktop.org/series/167634/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_18632_full -&gt; IGTPW_15307_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_15307_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_15307_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/index.html</p>
<h2>Participating hosts (10 -&gt; 10)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_15307_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_color@ctm-0-50:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-dg1-15/igt@kms_color@ctm-0-50.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-18/igt@kms_color@ctm-0-50.html">FAIL</a> +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-hdmi-a-1-nv12 (NEW):</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-1/igt@kms_color@ctm-0-50@pipe-a-hdmi-a-1-nv12.html">FAIL</a> +12 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-1-p010 (NEW):</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-8/igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-1-p010.html">FAIL</a> +77 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-1-nv12 (NEW):</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk2/igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-1-nv12.html">FAIL</a> +92 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-1-nv12 (NEW):</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-7/igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-1-nv12.html">FAIL</a> +99 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-dg2-3/igt@kms_color@ctm-max.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-6/igt@kms_color@ctm-max.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-hdmi-a-3-nv12 (NEW):</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-6/igt@kms_color@ctm-max@pipe-a-hdmi-a-3-nv12.html">FAIL</a> +101 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-hdmi-a-2-p010 (NEW):</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk10/igt@kms_color@ctm-negative@pipe-a-hdmi-a-2-p010.html">FAIL</a> +18 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-d-edp-1-nv12 (NEW):</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-6/igt@kms_color@ctm-negative@pipe-d-edp-1-nv12.html">FAIL</a> +112 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-d-hdmi-a-1-yuyv (NEW):</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-14/igt@kms_color@ctm-negative@pipe-d-hdmi-a-1-yuyv.html">FAIL</a> +112 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-tglu-7/igt@kms_color@ctm-signed.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-7/igt@kms_color@ctm-signed.html">FAIL</a> +5 other tests fail</li>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-mtlp-1/igt@kms_color@ctm-signed.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-6/igt@kms_color@ctm-signed.html">FAIL</a> +8 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-4/igt@kms_color@degamma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-2/igt@kms_color@degamma.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-dg2-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_18632_full and IGTPW_15307_full:</p>
<h3>New IGT tests (832)</h3>
<ul>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [7.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [7.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [7.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [1.95, 4.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [2.26, 4.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.90, 2.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.83, 2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [1.89, 4.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-hdmi-a-2-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [2.53, 4.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-hdmi-a-2-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [2.94, 4.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-hdmi-a-2-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.18, 2.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-hdmi-a-2-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.45, 1.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-hdmi-a-2-yuyv:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [2.67, 4.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [18.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-hdmi-a-4-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-hdmi-a-4-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-hdmi-a-4-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [9.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-hdmi-a-4-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-hdmi-a-4-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-vga-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-vga-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [7.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [7.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [7.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [1.98, 4.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [2.25, 4.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.90, 2.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.82, 1.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [1.87, 4.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-hdmi-a-2-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [2.58, 4.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-hdmi-a-2-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [2.87, 4.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-hdmi-a-2-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.15, 2.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-hdmi-a-2-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.35, 1.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-hdmi-a-2-yuyv:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [2.63, 4.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [18.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-hdmi-a-4-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-hdmi-a-4-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-hdmi-a-4-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [9.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-hdmi-a-4-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-hdmi-a-4-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-vga-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-vga-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [7.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [7.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [7.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [1.98, 4.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [2.24, 4.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.90, 2.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.82, 1.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [1.91, 4.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-hdmi-a-2-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [2.56, 3.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-hdmi-a-2-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [2.86, 4.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-hdmi-a-2-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.17, 2.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-hdmi-a-2-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.35, 1.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-hdmi-a-2-yuyv:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [2.66, 4.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [18.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-hdmi-a-4-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-hdmi-a-4-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-hdmi-a-4-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [9.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-hdmi-a-4-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-hdmi-a-4-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [7.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [7.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [7.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [18.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-hdmi-a-4-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-hdmi-a-4-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-hdmi-a-4-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [9.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-hdmi-a-4-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-hdmi-a-4-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [7.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [7.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [7.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.50, 1.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [19.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-hdmi-a-4-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-hdmi-a-4-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-hdmi-a-4-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [9.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-hdmi-a-4-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-hdmi-a-4-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-vga-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-vga-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [7.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [7.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [7.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.39, 2.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.34, 1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [18.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-hdmi-a-4-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-hdmi-a-4-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-hdmi-a-4-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [9.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-hdmi-a-4-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-hdmi-a-4-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-vga-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-vga-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [7.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [7.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [7.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [18.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-hdmi-a-4-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-hdmi-a-4-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-hdmi-a-4-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [9.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-hdmi-a-4-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-hdmi-a-4-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-d-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [7.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-d-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [7.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-d-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-d-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-d-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [7.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-d-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-d-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-d-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-d-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-d-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-d-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-d-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-d-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [19.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-d-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-d-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-d-hdmi-a-4-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-d-hdmi-a-4-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-d-hdmi-a-4-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [9.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-d-hdmi-a-4-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-d-hdmi-a-4-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [10.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [10.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [10.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [2.73, 4.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [3.16, 5.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.65, 3.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.11, 2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [2.68, 4.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-hdmi-a-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-hdmi-a-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-hdmi-a-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-hdmi-a-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-hdmi-a-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [7.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-vga-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-vga-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [10.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [10.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [10.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [2.77, 4.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [3.13, 5.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.63, 3.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.09, 1.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [2.60, 4.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-hdmi-a-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-hdmi-a-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-hdmi-a-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-hdmi-a-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-hdmi-a-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [7.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-vga-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-vga-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [9.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [10.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [10.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [2.77, 4.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [3.19, 5.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.63, 3.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.08, 1.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [2.57, 4.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-hdmi-a-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-hdmi-a-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-hdmi-a-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-hdmi-a-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-hdmi-a-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [7.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-d-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [10.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-d-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [10.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-d-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-d-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-d-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [10.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-d-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [2.78, 4.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-d-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [3.13, 5.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-d-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.63, 3.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-d-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.07, 1.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-d-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [2.67, 4.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-d-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-d-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [6.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-d-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-d-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-d-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.42, 0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.53, 1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.63, 6.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.30, 0.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.47, 1.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-vga-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-vga-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.45, 0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.49, 1.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.63, 6.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.29, 0.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.42, 0.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-vga-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-vga-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.43, 0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.50, 1.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.64, 6.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.28, 0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.41, 0.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-d-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-d-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-d-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-d-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-d-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.42, 0.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.49, 1.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.65, 6.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.29, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.42, 0.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.40, 0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.48, 1.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.64, 1.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.31, 0.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.41, 0.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-2-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.85, 1.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-2-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.63, 0.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-2-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.72, 1.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-2-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-2-yuyv:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.57, 0.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-4-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-4-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-4-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-4-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-4-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-vga-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-vga-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.41, 0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.45, 0.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.64, 1.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.30, 0.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.39, 0.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-2-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [1.70, 1.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-2-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.58, 0.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-2-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.72, 1.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-2-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.48, 0.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-2-yuyv:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.53, 0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-4-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-4-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-4-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-4-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-4-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-vga-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-vga-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.41, 0.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.45, 1.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.63, 0.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.30, 0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.38, 0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-2-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.85, 1.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-2-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.57, 1.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-2-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.72, 1.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-2-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.49, 0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-2-yuyv:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.53, 0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-4-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-4-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-4-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-4-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-4-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-4-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-4-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-4-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-4-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-4-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.40, 0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.47, 0.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.64, 0.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.30, 0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.40, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-hdmi-a-4-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-hdmi-a-4-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-hdmi-a-4-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-hdmi-a-4-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-hdmi-a-4-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-vga-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-vga-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.39, 0.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.44, 0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.63, 0.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.29, 0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.37, 0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-hdmi-a-4-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-hdmi-a-4-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-hdmi-a-4-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-hdmi-a-4-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-hdmi-a-4-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-vga-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-vga-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.40, 0.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.47, 0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.65, 0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.30, 0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.38, 0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-hdmi-a-4-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-hdmi-a-4-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-hdmi-a-4-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-hdmi-a-4-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-hdmi-a-4-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-d-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-d-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-d-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-d-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-d-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-d-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-d-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-d-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-d-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-d-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-d-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-d-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-d-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-d-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-d-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-d-hdmi-a-4-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-d-hdmi-a-4-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-d-hdmi-a-4-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-d-hdmi-a-4-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-d-hdmi-a-4-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.40, 0.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.47, 0.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.63, 3.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.31, 0.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.41, 0.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-hdmi-a-2-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.48, 0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-hdmi-a-2-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.58, 0.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-hdmi-a-2-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.71, 0.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-hdmi-a-2-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.59, 0.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-hdmi-a-2-yuyv:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.54, 0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-vga-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-vga-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.42, 0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.46, 0.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.63, 3.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.29, 0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.39, 0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-hdmi-a-2-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.51, 0.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-hdmi-a-2-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.56, 0.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-hdmi-a-2-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.69, 1.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-hdmi-a-2-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.46, 0.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-hdmi-a-2-yuyv:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.53, 0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-vga-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-vga-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.41, 0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.47, 0.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.65, 3.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.30, 0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.38, 0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-hdmi-a-2-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.48, 0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-hdmi-a-2-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.56, 0.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-hdmi-a-2-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.71, 0.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-hdmi-a-2-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.48, 0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-hdmi-a-2-yuyv:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.51, 0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-d-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-d-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-d-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-d-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-d-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-d-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.39, 0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-d-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.46, 0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-d-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.63, 3.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-d-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.30, 0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-d-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.39, 0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.39, 0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.46, 1.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.64, 3.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.30, 0.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.40, 0.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-2-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.51, 1.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-2-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.62, 0.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-2-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.71, 1.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-2-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.54, 0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-2-yuyv:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.58, 0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-vga-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-vga-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.38, 0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.46, 0.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.63, 3.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.29, 0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.40, 0.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-2-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.51, 0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-2-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.60, 0.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-2-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.72, 1.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-2-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.46, 0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-2-yuyv:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.52, 0.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-vga-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-vga-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.42, 0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.45, 0.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.64, 3.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.30, 0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.41, 0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-2-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.53, 0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-2-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.58, 0.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-2-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.72, 1.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-2-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.49, 0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-2-yuyv:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.54, 0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-d-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-d-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-d-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-d-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-d-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.41, 0.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.46, 0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.63, 3.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.30, 0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.38, 0.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [1.17, 2.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [1.42, 2.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.0, 6.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.57, 1.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [1.15, 2.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-hdmi-a-2-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [1.46, 2.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-hdmi-a-2-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [1.70, 2.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-hdmi-a-2-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.98, 1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-hdmi-a-2-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.77, 1.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-hdmi-a-2-yuyv:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [1.51, 2.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [12.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-vga-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-vga-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [1.18, 2.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [1.37, 2.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.00, 6.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.55, 1.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [1.14, 2.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-hdmi-a-2-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [1.44, 2.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-hdmi-a-2-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [1.68, 2.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-hdmi-a-2-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.00, 1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-hdmi-a-2-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.68, 0.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-hdmi-a-2-yuyv:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [1.48, 2.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [12.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-vga-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-vga-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [1.18, 2.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [1.41, 2.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.99, 6.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.56, 0.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [1.15, 2.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-hdmi-a-2-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [1.47, 2.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-hdmi-a-2-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [1.68, 2.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-hdmi-a-2-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.03, 1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-hdmi-a-2-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.66, 0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-hdmi-a-2-yuyv:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [1.45, 2.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [12.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [1.22, 1.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [1.37, 2.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.28, 6.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.55, 1.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [1.14, 1.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [12.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.41, 0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.46, 0.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.40, 0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.66, 0.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.81, 1.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.20, 6.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.64, 0.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.69, 0.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-vga-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-vga-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.40, 0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.46, 0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.38, 0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.64, 0.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.78, 1.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.18, 6.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.48, 0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.68, 0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-vga-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-vga-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.40, 0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.45, 0.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.64, 0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.30, 0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.37, 0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.61, 0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.78, 0.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.18, 6.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.50, 0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.65, 0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-d-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-d-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-d-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-d-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-d-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-d-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-d-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-d-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-d-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-d-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-d-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.66, 0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-d-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.80, 0.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-d-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.19, 6.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-d-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.48, 0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-d-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.64, 0.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-a-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-a-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.33, 1.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-a-hdmi-a-2-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.67, 0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-a-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-a-vga-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-b-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-b-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.32, 0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-b-hdmi-a-2-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.49, 0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-b-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-b-vga-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-c-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-c-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.32, 0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-c-hdmi-a-2-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.49, 0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-c-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-d-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-d-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.33, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-d-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@brightness-with-hdr:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@dontneed-before-exec:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@fbchdr-shrfb-scaledprimary:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@force-edid:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@hdr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@huge-split:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@psr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning@bc-hdmi-a1-hdmi-a2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.79] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15307_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@device_reset@cold-reset-bound:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-1/igt@device_reset@cold-reset-bound.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078">i915#11078</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-19/igt@device_reset@unbind-reset-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11814">i915#11814</a>)</li>
</ul>
</li>
<li>
<p>igt@dmabuf@all-tests:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-5/igt@dmabuf@all-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15931">i915#15931</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-8/igt@dmabuf@all-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15931">i915#15931</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-2/igt@dmabuf@all-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15931">i915#15931</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-inplace:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-1/igt@gem_ccs@block-multicopy-inplace.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-2/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-5/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-8/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-13/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-10/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-5/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-dg2-6/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-3/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348">i915#16348</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-4/igt@gem_create@create-ext-cpu-access-sanity-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-6/igt@gem_create@create-ext-set-pat.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562">i915#8562</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-4/igt@gem_ctx_isolation@preservation-s3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-3/igt@gem_ctx_isolation@preservation-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-hostile:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-4/igt@gem_ctx_persistence@heartbeat-hostile.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555">i915#8555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-hostile-preempt:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-snb6/igt@gem_ctx_persistence@legacy-engines-hostile-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099">i915#1099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-4/igt@gem_ctx_sseu@engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-1/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@hibernate:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-dg1-14/igt@gem_eio@hibernate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-14/igt@gem_eio@hibernate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4391">i915#4391</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk2/igt@gem_eio@in-flight-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13390">i915#13390</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-dual:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-7/igt@gem_exec_balancer@bonded-dual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771">i915#4771</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@noheartbeat:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-14/igt@gem_exec_balancer@noheartbeat.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555">i915#8555</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-1/igt@gem_exec_balancer@noheartbeat.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-bb-first:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-2/igt@gem_exec_balancer@parallel-bb-first.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-5/igt@gem_exec_fence@submit3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-6/igt@gem_exec_fence@submit3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-rw-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-14/igt@gem_exec_flush@basic-uc-rw-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-prw-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-5/igt@gem_exec_flush@basic-wb-prw-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-7/igt@gem_exec_reloc@basic-gtt-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +4 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-4/igt@gem_exec_reloc@basic-gtt-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +4 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-12/igt@gem_exec_reloc@basic-gtt-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +3 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-8/igt@gem_exec_reloc@basic-gtt-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-contexts:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-19/igt@gem_exec_schedule@preempt-queue-contexts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-4/igt@gem_exec_schedule@preempt-queue-contexts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537">i915#4537</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-6/igt@gem_exec_schedule@preempt-queue-contexts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537">i915#4537</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk5/igt@gem_exec_suspend@basic-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13196">i915#13196</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-copy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-6/igt@gem_fence_thrash@bo-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_evict@dontneed-evict-race:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@gem_lmem_evict@dontneed-evict-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582">i915#7582</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-10/igt@gem_lmem_swapping@heavy-verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@massive-random:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-7/igt@gem_lmem_swapping@massive-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk3/igt@gem_lmem_swapping@random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@gem_lmem_swapping@verify-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-1/igt@gem_lmem_swapping@verify-random-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-12/igt@gem_lmem_swapping@verify-random-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193">i915#12193</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-5/igt@gem_lmem_swapping@verify-random-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random-ccs@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-12/igt@gem_lmem_swapping@verify-random-ccs@lmem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565">i915#4565</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-write-cpu-read-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-3/igt@gem_mmap_gtt@basic-write-cpu-read-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-15/igt@gem_mmap_gtt@basic-write-cpu-read-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@medium-copy-xy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-8/igt@gem_mmap_gtt@medium-copy-xy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@bad-size:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-13/igt@gem_mmap_wc@bad-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-8/igt@gem_mmap_wc@bad-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@close:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-6/igt@gem_mmap_wc@close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-3/igt@gem_partial_pwrite_pread@writes-after-reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-14/igt@gem_partial_pwrite_pread@writes-after-reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-6/igt@gem_partial_pwrite_pread@writes-after-reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-protected-buffer:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-4/igt@gem_pxp@create-protected-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-4/igt@gem_pxp@reject-modify-context-protection-off-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-12/igt@gem_pxp@reject-modify-context-protection-off-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@read-bad-handle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-8/igt@gem_readwrite@read-bad-handle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@linear-to-vebox-y-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-2/igt@gem_render_copy@linear-to-vebox-y-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-5/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@untiled-to-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-5/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-3/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-15/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-3/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-dg2-4/igt@gem_softpin@noreloc-s3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-10/igt@gem_softpin@noreloc-s3.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131">i915#15131</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-10/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323">i915#3323</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-5/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk2/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323">i915#3323</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-8/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323">i915#3323</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-13/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-1/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@invalid-mmap-offset-unsync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-8/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-2/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-5/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-6/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880">i915#4880</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@gem_userptr_blits@unsync-unmap-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-glk2/igt@gem_workarounds@suspend-resume-context.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk4/igt@gem_workarounds@suspend-resume-context.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>)</li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-2/igt@gem_workarounds@suspend-resume-context.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-1/igt@gem_workarounds@suspend-resume-context.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131">i915#15131</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk6/igt@gem_workarounds@suspend-resume-fd.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14586">i915#14586</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-1/igt@gen9_exec_parse@basic-rejected.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-out:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-4/igt@gen9_exec_parse@bb-start-out.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +3 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-2/igt@gen9_exec_parse@bb-start-out.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-17/igt@gen9_exec_parse@bb-start-out.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-2/igt@gen9_exec_parse@bb-start-out.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-jump:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-3/igt@gen9_exec_parse@unaligned-jump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy@vecs1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-10/igt@i915_drm_fdinfo@busy@vecs1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073">i915#14073</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy-hang:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-4/igt@i915_drm_fdinfo@virtual-busy-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118">i915#14118</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-5/igt@i915_drm_fdinfo@virtual-busy-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118">i915#14118</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-17/igt@i915_drm_fdinfo@virtual-busy-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118">i915#14118</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-1/igt@i915_module_load@resize-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412">i915#6412</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-basic-api:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-1/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset-multiple:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-10/igt@i915_pm_freq_api@freq-reset-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-8/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk4/igt@i915_pm_rpm@system-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-7/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16109">i915#16109</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-8/igt@i915_query@query-topology-unsupported.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16079">i915#16079</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-5/igt@i915_query@query-topology-unsupported.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16079">i915#16079</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-2/igt@i915_query@query-topology-unsupported.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16079">i915#16079</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-7/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@tile-pitch-mismatch:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-1/igt@kms_addfb_basic@tile-pitch-mismatch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-13/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-snb4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-10/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-1/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-3/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> +4 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-18/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15733">i915#15733</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138">i915#5138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-7/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-1/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-16/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-4/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10434</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-2/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +54 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk10/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> +84 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +111 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk3/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14694">i915#14694</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-7/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +45 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-3/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-8/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +75 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-18/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-1/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-12/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +170 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-10/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-multiple:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-1/igt@kms_chamelium_frames@dp-crc-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-10/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +5 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-8/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +7 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-15/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-6/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +3 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-5/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-dg2-4/igt@kms_color@ctm-0-25.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-6/igt@kms_color@ctm-0-25.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/315">i915#315</a>) +1 other test fail</li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-4/igt@kms_color@ctm-0-25.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_color@ctm-0-25.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/315">i915#315</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-tglu-10/igt@kms_color@ctm-0-75.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-3/igt@kms_color@ctm-0-75.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/315">i915#315</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-10/igt@kms_color@ctm-blue-to-red.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/315">i915#315</a>) +1 other test fail</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk2/igt@kms_color@ctm-blue-to-red.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/315">i915#315</a>) +1 other test fail</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-4/igt@kms_color@ctm-blue-to-red.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/315">i915#315</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-8/igt@kms_color@ctm-blue-to-red.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/315">i915#315</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-9/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9979">i915#9979</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-dg2-4/igt@kms_color@degamma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-3/igt@kms_color@degamma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6893">i915#6893</a>)</li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-dg1-15/igt@kms_color@degamma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-13/igt@kms_color@degamma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6893">i915#6893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-7/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-suspend-resume:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-1/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-3/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-1/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume@pipe-a-dp-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-10/igt@kms_content_protection@suspend-resume@pipe-a-dp-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173">i915#7173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-6/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-19/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-7/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +3 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-4/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-max-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-8/igt@kms_cursor_crc@cursor-offscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-4/igt@kms_cursor_crc@cursor-random-128x42.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-5/igt@kms_cursor_crc@cursor-random-128x42.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-10/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-5/igt@kms_cursor_crc@cursor-random-128x42@pipe-c-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x42:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-1/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814">i915#8814</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-6/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-tglu-10/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-7/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-2/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-1/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-14/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-5/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk1/igt@kms_cursor_crc@cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358">i915#12358</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152">i915#14152</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7882">i915#7882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk1/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358">i915#12358</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152">i915#14152</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046">i915#13046</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-2/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809">i915#9809</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15804">i915#15804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-dg1-13/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-19/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15999">i915#15999</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-mtlp-4/igt@kms_cursor_legacy@nonblocking-modeset-vs-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-7/igt@kms_cursor_legacy@nonblocking-modeset-vs-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13562">i915#13562</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-7/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev@basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-6/igt@kms_dp_aux_dev@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257">i915#1257</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-5/igt@kms_dp_aux_dev@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257">i915#1257</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-4/igt@kms_dp_aux_dev@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257">i915#1257</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-1/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749">i915#13749</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-7/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915#13748</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-1/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707">i915#13707</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-7/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707">i915#13707</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-16/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707">i915#13707</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-4/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707">i915#13707</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-2/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707">i915#13707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-3/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-4/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-3/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9878">i915#9878</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-6/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3469">i915#3469</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-8/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081">i915#16081</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-7/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081">i915#16081</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-14/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081">i915#16081</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-2/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081">i915#16081</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-1/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081">i915#16081</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-4/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +4 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-7/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk10/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027">i915#13027</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-10/igt@kms_flip@2x-flip-vs-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381">i915#8381</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-1/igt@kms_flip@2x-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-14/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-7/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-10/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-14/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-1/igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-mtlp-4/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-1/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15672">i915#15672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk8/igt@kms_frontbuffer_tracking@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056">i915#10056</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-8/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-8/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-plflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-8/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-4/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> +61 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-stridechange:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-1/igt@kms_frontbuffer_tracking@fbchdr-stridechange.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +11 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-18/igt@kms_frontbuffer_tracking@fbchdr-stridechange.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> +46 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk11/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> +50 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +14 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-shrfb-scaledprimary:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-10/igt@kms_frontbuffer_tracking@fbcpsrhdr-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +46 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-4/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-6/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-8/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-10/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-indfb-draw-pwrite.html">SKIP</a> +78 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-dg2-10/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-mmap-cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-5/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-render:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-glk8/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk5/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-render.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-19/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-7/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +21 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-snb6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> +200 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-2/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-handle-closed:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-dg1-12/igt@kms_getfb@getfb2-handle-closed.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-14/igt@kms_getfb@getfb2-handle-closed.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-4k:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-mtlp-6/igt@kms_hdmi_inject@inject-4k.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-1/igt@kms_hdmi_inject@inject-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15725">i915#15725</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-4/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16012">i915#16012</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-4/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-1-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16012">i915#16012</a>) +3 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-8/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-1-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16012">i915#16012</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-13/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16012">i915#16012</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-5/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-1-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011">i915#16011</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-10/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16012">i915#16012</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-10/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-1-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16012">i915#16012</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-1-xrgb16161616f:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-15/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-1-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011">i915#16011</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-6/igt@kms_hdr@static-swap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-2/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011">i915#16011</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-3/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011">i915#16011</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-8/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011">i915#16011</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-15/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011">i915#16011</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-3/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011">i915#16011</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms@pipe-a-edp-1-xrgb2101010:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-3/igt@kms_hdr@static-toggle-dpms@pipe-a-edp-1-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011">i915#16011</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-3/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-1-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011">i915#16011</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-8/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011">i915#16011</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-1/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011">i915#16011</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-1-xrgb16161616f:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-1/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-1-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011">i915#16011</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-5/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13688">i915#13688</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-8/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459">i915#15459</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459">i915#15459</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-3/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15638">i915#15638</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15722">i915#15722</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-6/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i915#6301</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-4/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i915#6301</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-2/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-3/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-3/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-1/igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-2/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-7:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-10/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15608">i915#15608</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-19/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-7/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-5/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16112">i915#16112</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk8/igt@kms_plane@plane-panning-bottom-right-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13026">i915#13026</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk4/igt@kms_plane_alpha_blend@constant-alpha-max.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647">i915#10647</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12169">i915#12169</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk4/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647">i915#10647</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-2/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-8/igt@kms_plane_multiple@tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259">i915#14259</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-10/igt@kms_plane_multiple@tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259">i915#14259</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-8/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-1/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948">i915#15948</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-3/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15739">i915#15739</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-8/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-5/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-4/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-17/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-6/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-dg1-19/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-15/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) +2 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-3/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-2/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-7/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-snb6/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk2/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +14 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-8/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk11/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk10/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-1/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-7/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-page-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-3/igt@kms_psr@fbc-psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-mmap-gtt:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk2/igt@kms_psr@fbc-psr2-cursor-mmap-gtt.html">SKIP</a> +607 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-no-drrs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_psr@fbc-psr2-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-no-drrs@edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-1/igt@kms_psr@fbc-psr2-no-drrs@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-mmap-cpu:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-1/igt@kms_psr@psr-sprite-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-7/igt@kms_psr@psr2-cursor-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-12/igt@kms_psr@psr2-sprite-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-7/igt@kms_psr@psr2-sprite-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +15 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-8/igt@kms_psr@psr2-sprite-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949">i915#15949</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-2/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-1/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-3/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-7/igt@kms_selftest@drm_framebuffer.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179">i915#13179</a>) +1 other test abort</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-16/igt@kms_selftest@drm_framebuffer.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179">i915#13179</a>) +1 other test abort</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-snb6/igt@kms_selftest@drm_framebuffer.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179">i915#13179</a>) +1 other test abort</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-10/igt@kms_selftest@drm_framebuffer.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179">i915#13179</a>) +1 other test abort</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-6/igt@kms_selftest@drm_framebuffer.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179">i915#13179</a>) +1 other test abort</li>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk11/igt@kms_selftest@drm_framebuffer.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179">i915#13179</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-4/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179">i915#13179</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-4/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-5/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15106">i915#15106</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-5/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15106">i915#15106</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-mtlp-6/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-7/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15106">i915#15106</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk5/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10959">i915#10959</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-2/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk10/igt@kms_vblank@ts-continuation-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276">i915#12276</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-7/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-5/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@all-busy-idle-check-all:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-3/igt@perf_pmu@all-busy-idle-check-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15453">i915#15453</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-13/igt@perf_pmu@all-busy-idle-check-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15453">i915#15453</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-8/igt@perf_pmu@all-busy-idle-check-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15453">i915#15453</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-3/igt@perf_pmu@busy-double-start.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vecs1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-5/igt@perf_pmu@busy-double-start@vecs1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-all-gts:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-1/igt@perf_pmu@rc6-all-gts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516">i915#8516</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@semaphore-busy:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-mtlp-8/igt@perf_pmu@semaphore-busy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-7/igt@perf_pmu@semaphore-busy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-3/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-7/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16066">i915#16066</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-6/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_linear_blits@interruptible:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-dg1-14/igt@gem_linear_blits@interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15391">i915#15391</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-19/igt@gem_linear_blits@interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-3/igt@gem_workarounds@suspend-resume.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-2/igt@gem_workarounds@suspend-resume.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@reset:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-snb6/igt@i915_pm_rps@reset.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16162">i915#16162</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-snb1/igt@i915_pm_rps@reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-6/igt@i915_suspend@forcewake.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-8/igt@i915_suspend@forcewake.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-glk8/igt@i915_suspend@sysfs-reader.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182">i915#16182</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk9/igt@i915_suspend@sysfs-reader.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_3d@basic:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-mtlp-1/igt@kms_3d@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15726">i915#15726</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-8/igt@kms_3d@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-glk5/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14888">i915#14888</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk2/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-mtlp-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956">i915#5956</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-mtlp-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-128x42.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-128x42.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-tglu-3/igt@kms_cursor_crc@cursor-onscreen-256x85.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-4/igt@kms_cursor_crc@cursor-onscreen-256x85.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027">i915#13027</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-dg2-4/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-10/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-render.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-glk6/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk8/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-render.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-farfromfence-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-3/igt@kms_frontbuffer_tracking@hdr-farfromfence-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-farfromfence-mmap-gtt.html">PASS</a> +14 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-2/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011">i915#16011</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_hdr@static-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-dg2-10/igt@kms_pipe_crc_basic@suspend-read-crc.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132">i915#15132</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-7/igt@kms_pipe_crc_basic@suspend-read-crc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-7/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_plane_scaling@intel-max-src-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-2/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a> +2 other tests pass</li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-dg1-14/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-18/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-idle:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-dg2-3/igt@kms_pm_rpm@system-suspend-idle.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419">i915#14419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-8/igt@kms_pm_rpm@system-suspend-idle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-6/igt@kms_vblank@ts-continuation-dpms-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276">i915#12276</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-4/igt@kms_vblank@ts-continuation-dpms-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-glk5/igt@perf_pmu@rc6-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14242">i915#14242</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16236">i915#16236</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk6/igt@perf_pmu@rc6-suspend.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_close_race@multigpu-basic-threads:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-6/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-5/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_big@single:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-tglu-7/igt@gem_exec_big@single.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15944">i915#15944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-tglu-2/igt@gem_exec_big@single.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15816">i915#15816</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-read:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-1/igt@gem_exec_reloc@basic-gtt-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-cpu:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-6/igt@gem_exec_reloc@basic-wc-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-2/igt@gem_exec_reloc@basic-wc-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-7/igt@gem_lmem_swapping@parallel-random-verify-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-verify-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-6/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-4/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-2/igt@gem_partial_pwrite_pread@reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@gem_partial_pwrite_pread@reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-tiled:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-6/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-8/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_pwrite:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-6/igt@gem_tiled_pread_pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-2/igt@gem_tiled_pread_pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-3/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-overlap:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-6/igt@gem_userptr_blits@unsync-overlap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-7/igt@gem_userptr_blits@unsync-overlap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-oversize:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-4/igt@gen9_exec_parse@bb-oversize.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@gen9_exec_parse@bb-oversize.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-6/igt@gen9_exec_parse@valid-registers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-8/igt@gen9_exec_parse@valid-registers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-6/igt@i915_pm_freq_mult@media-freq@gt0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590">i915#6590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-3/igt@i915_pm_freq_mult@media-freq@gt0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590">i915#6590</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-8/igt@i915_pm_rc6_residency@rc6-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14498">i915#14498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@i915_pm_rc6_residency@rc6-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14498">i915#14498</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-1/igt@i915_suspend@fence-restore-tiled2untiled.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15140">i915#15140</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@i915_suspend@fence-restore-tiled2untiled.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-glk4/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761">i915#12761</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14995">i915#14995</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16314">i915#16314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-glk9/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14995">i915#14995</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16314">i915#16314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-8/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-dg1-17/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-12/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-5/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-6/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-3/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-5/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-4/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-dg1-12/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-15/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805">i915#12805</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805">i915#12805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-6/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-7/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-6/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-7/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-5/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-dg1-15/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-18/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-6/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-4/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-multiple:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-6/igt@kms_chamelium_frames@hdmi-crc-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-7/igt@kms_chamelium_frames@hdmi-crc-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-3/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-3/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-dg1-13/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9433">i915#9433</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-18/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-dg2-1/igt@kms_content_protection@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-10/igt@kms_content_protection@suspend-resume.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173">i915#7173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-dg2-6/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-10/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3359">i915#3359</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-8/igt@kms_cursor_crc@cursor-onscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-2/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-4/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915#13748</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915#13748</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-6/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-3/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-dg1-17/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053">i915#9053</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-16/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053">i915#9053</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-4/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955">i915#3955</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955">i915#3955</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-5/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9337">i915#9337</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9337">i915#9337</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-6/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-1/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-8/igt@kms_flip@2x-plain-flip-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_flip@2x-plain-flip-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-dg1-12/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-13/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +50 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-farfromfence-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-farfromfence-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-farfromfence-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-suspend:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-move.html">SKIP</a> +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-render:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-render:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-dg1-13/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-shrfb-draw-pwrite.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg1-18/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-shrfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-shrfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-3/igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-shrfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-1/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16076">i915#16076</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-5/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011">i915#16011</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-6/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459">i915#15459</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-4/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459">i915#15459</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-5/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-2/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-6/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-3/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-4/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15739">i915#15739</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15739">i915#15739</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-4/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-5/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-plane-move:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-6/igt@kms_psr@fbc-psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-3/igt@kms_psr@fbc-psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-plane-onoff:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-1/igt@kms_psr@pr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_psr@pr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949">i915#15949</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949">i915#15949</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-dg2-10/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-8/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-dg2-4/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-dg2-10/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-6/igt@perf@per-context-mode-unprivileged.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2435">i915#2435</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-5/igt@perf@per-context-mode-unprivileged.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2435">i915#2435</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-5/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18632/shard-rkl-2/igt@sriov_basic@enable-vfs-bind-unbind-each.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15307/shard-rkl-6/igt@sriov_basic@enable-vfs-bind-unbind-each.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8949 -&gt; IGTPW_15307</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18632: e3821511385af9b3b404fe878418937eec48de9f @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15307: 15307<br />
  IGT_8949: 8949<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============5573194252068203124==--
