Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C1D3CDB466
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jun 2026 00:57:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C808410E670;
	Tue, 23 Jun 2026 00:57:49 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C02910E5D3;
 Tue, 23 Jun 2026 00:57:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7868814991301003163=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_Enable_multi-format_test?=
 =?utf-8?q?ing_for_pipe_color_tests_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pranay Samala" <pranay.samala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 23 Jun 2026 00:57:23 -0000
Message-ID: <178217624313.103867.2491414206056790817@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260621182506.2970102-1-pranay.samala@intel.com>
In-Reply-To: <20260621182506.2970102-1-pranay.samala@intel.com>
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

--===============7868814991301003163==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Enable multi-format testing for pipe color tests (rev3)
URL   : https://patchwork.freedesktop.org/series/167634/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8977_full -> IGTPW_15414_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_15414_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_15414_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/index.html

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_15414_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_color@ctm-blue-to-red:
    - shard-dg1:          [PASS][1] -> [FAIL][2] +7 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-dg1-18/igt@kms_color@ctm-blue-to-red.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-16/igt@kms_color@ctm-blue-to-red.html

  * igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-1-nv12 (NEW):
    - shard-dg1:          NOTRUN -> [FAIL][3] +121 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-14/igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-1-nv12.html

  * igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-1-nv12 (NEW):
    - shard-tglu:         NOTRUN -> [FAIL][4] +114 other tests fail
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-5/igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-1-nv12.html

  * igt@kms_color@ctm-max:
    - shard-glk:          [PASS][5] -> [FAIL][6] +2 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-glk2/igt@kms_color@ctm-max.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk4/igt@kms_color@ctm-max.html

  * igt@kms_color@ctm-max@pipe-a-hdmi-a-3-nv12 (NEW):
    - shard-dg2:          NOTRUN -> [FAIL][7] +129 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-7/igt@kms_color@ctm-max@pipe-a-hdmi-a-3-nv12.html

  * igt@kms_color@ctm-negative@pipe-a-hdmi-a-1-p010 (NEW):
    - shard-glk:          NOTRUN -> [FAIL][8] +133 other tests fail
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk4/igt@kms_color@ctm-negative@pipe-a-hdmi-a-1-p010.html

  * igt@kms_color@ctm-negative@pipe-d-edp-1-nv12 (NEW):
    - shard-mtlp:         NOTRUN -> [FAIL][9] +120 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-1/igt@kms_color@ctm-negative@pipe-d-edp-1-nv12.html

  * igt@kms_color@ctm-signed:
    - shard-mtlp:         [PASS][10] -> [FAIL][11] +9 other tests fail
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-mtlp-7/igt@kms_color@ctm-signed.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-3/igt@kms_color@ctm-signed.html

  * igt@kms_color@degamma@pipe-a-hdmi-a-2-nv12 (NEW):
    - shard-rkl:          NOTRUN -> [FAIL][12] +72 other tests fail
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-3/igt@kms_color@degamma@pipe-a-hdmi-a-2-nv12.html

  * igt@kms_color@degamma@pipe-b-hdmi-a-2-yuyv (NEW):
    - shard-glk10:        NOTRUN -> [FAIL][13] +17 other tests fail
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk10/igt@kms_color@degamma@pipe-b-hdmi-a-2-yuyv.html

  * igt@kms_color@degamma@pipe-d-hdmi-a-1-p010 (NEW):
    - shard-tglu-1:       NOTRUN -> [FAIL][14] +8 other tests fail
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-1/igt@kms_color@degamma@pipe-d-hdmi-a-1-p010.html

  * igt@kms_color@gamma:
    - shard-dg2:          [PASS][15] -> [FAIL][16] +4 other tests fail
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-dg2-5/igt@kms_color@gamma.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-5/igt@kms_color@gamma.html
    - shard-rkl:          [PASS][17] -> [FAIL][18] +5 other tests fail
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-5/igt@kms_color@gamma.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-2/igt@kms_color@gamma.html
    - shard-tglu:         [PASS][19] -> [FAIL][20] +3 other tests fail
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-tglu-10/igt@kms_color@gamma.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-6/igt@kms_color@gamma.html

  
New tests
---------

  New tests have been introduced between IGT_8977_full and IGTPW_15414_full:

### New IGT tests (1138) ###

  * igt@kms_color@ctm-0-25@pipe-a-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.64] s

  * igt@kms_color@ctm-0-25@pipe-a-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [7.35] s

  * igt@kms_color@ctm-0-25@pipe-a-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [7.70] s

  * igt@kms_color@ctm-0-25@pipe-a-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [4.33] s

  * igt@kms_color@ctm-0-25@pipe-a-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [3.53] s

  * igt@kms_color@ctm-0-25@pipe-a-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [7.61] s

  * igt@kms_color@ctm-0-25@pipe-a-hdmi-a-1-fp16:
    - Statuses : 2 pass(s)
    - Exec time: [0.70, 0.77] s

  * igt@kms_color@ctm-0-25@pipe-a-hdmi-a-1-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [1.92, 2.54] s

  * igt@kms_color@ctm-0-25@pipe-a-hdmi-a-1-p010:
    - Statuses : 2 fail(s)
    - Exec time: [2.22, 2.95] s

  * igt@kms_color@ctm-0-25@pipe-a-hdmi-a-1-xrgb2101010:
    - Statuses : 3 pass(s)
    - Exec time: [1.93, 2.37] s

  * igt@kms_color@ctm-0-25@pipe-a-hdmi-a-1-xrgb8888:
    - Statuses : 3 pass(s)
    - Exec time: [0.80, 1.51] s

  * igt@kms_color@ctm-0-25@pipe-a-hdmi-a-1-yuyv:
    - Statuses : 2 fail(s)
    - Exec time: [1.85, 2.69] s

  * igt@kms_color@ctm-0-25@pipe-a-hdmi-a-3-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [2.02] s

  * igt@kms_color@ctm-0-25@pipe-a-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.69] s

  * igt@kms_color@ctm-0-25@pipe-a-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [5.16] s

  * igt@kms_color@ctm-0-25@pipe-a-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [18.36] s

  * igt@kms_color@ctm-0-25@pipe-a-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.62] s

  * igt@kms_color@ctm-0-25@pipe-a-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.19] s

  * igt@kms_color@ctm-0-25@pipe-a-hdmi-a-4-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.25] s

  * igt@kms_color@ctm-0-25@pipe-a-hdmi-a-4-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.08] s

  * igt@kms_color@ctm-0-25@pipe-a-hdmi-a-4-p010:
    - Statuses : 1 fail(s)
    - Exec time: [3.93] s

  * igt@kms_color@ctm-0-25@pipe-a-hdmi-a-4-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [9.57] s

  * igt@kms_color@ctm-0-25@pipe-a-hdmi-a-4-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.58] s

  * igt@kms_color@ctm-0-25@pipe-a-hdmi-a-4-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [3.29] s

  * igt@kms_color@ctm-0-25@pipe-a-vga-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.57] s

  * igt@kms_color@ctm-0-25@pipe-a-vga-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.42] s

  * igt@kms_color@ctm-0-25@pipe-b-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.64] s

  * igt@kms_color@ctm-0-25@pipe-b-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [7.38] s

  * igt@kms_color@ctm-0-25@pipe-b-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [7.71] s

  * igt@kms_color@ctm-0-25@pipe-b-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [4.35] s

  * igt@kms_color@ctm-0-25@pipe-b-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [4.22] s

  * igt@kms_color@ctm-0-25@pipe-b-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [7.48] s

  * igt@kms_color@ctm-0-25@pipe-b-hdmi-a-1-fp16:
    - Statuses : 2 pass(s)
    - Exec time: [0.61, 0.68] s

  * igt@kms_color@ctm-0-25@pipe-b-hdmi-a-1-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [1.91, 2.51] s

  * igt@kms_color@ctm-0-25@pipe-b-hdmi-a-1-p010:
    - Statuses : 2 fail(s)
    - Exec time: [2.23, 2.87] s

  * igt@kms_color@ctm-0-25@pipe-b-hdmi-a-1-xrgb2101010:
    - Statuses : 3 pass(s)
    - Exec time: [1.90, 2.39] s

  * igt@kms_color@ctm-0-25@pipe-b-hdmi-a-1-xrgb8888:
    - Statuses : 3 pass(s)
    - Exec time: [0.81, 1.49] s

  * igt@kms_color@ctm-0-25@pipe-b-hdmi-a-1-yuyv:
    - Statuses : 2 fail(s)
    - Exec time: [1.89, 2.58] s

  * igt@kms_color@ctm-0-25@pipe-b-hdmi-a-3-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.87] s

  * igt@kms_color@ctm-0-25@pipe-b-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.74] s

  * igt@kms_color@ctm-0-25@pipe-b-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [5.08] s

  * igt@kms_color@ctm-0-25@pipe-b-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [18.32] s

  * igt@kms_color@ctm-0-25@pipe-b-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.45] s

  * igt@kms_color@ctm-0-25@pipe-b-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.21] s

  * igt@kms_color@ctm-0-25@pipe-b-hdmi-a-4-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.02] s

  * igt@kms_color@ctm-0-25@pipe-b-hdmi-a-4-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.07] s

  * igt@kms_color@ctm-0-25@pipe-b-hdmi-a-4-p010:
    - Statuses : 1 fail(s)
    - Exec time: [3.85] s

  * igt@kms_color@ctm-0-25@pipe-b-hdmi-a-4-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [9.67] s

  * igt@kms_color@ctm-0-25@pipe-b-hdmi-a-4-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.45] s

  * igt@kms_color@ctm-0-25@pipe-b-hdmi-a-4-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [3.27] s

  * igt@kms_color@ctm-0-25@pipe-b-vga-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.58] s

  * igt@kms_color@ctm-0-25@pipe-b-vga-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.27] s

  * igt@kms_color@ctm-0-25@pipe-c-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.64] s

  * igt@kms_color@ctm-0-25@pipe-c-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [7.17] s

  * igt@kms_color@ctm-0-25@pipe-c-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [7.71] s

  * igt@kms_color@ctm-0-25@pipe-c-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [4.25] s

  * igt@kms_color@ctm-0-25@pipe-c-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [4.00] s

  * igt@kms_color@ctm-0-25@pipe-c-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [7.17] s

  * igt@kms_color@ctm-0-25@pipe-c-hdmi-a-1-fp16:
    - Statuses : 2 pass(s)
    - Exec time: [0.59, 0.68] s

  * igt@kms_color@ctm-0-25@pipe-c-hdmi-a-1-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [1.97, 2.52] s

  * igt@kms_color@ctm-0-25@pipe-c-hdmi-a-1-p010:
    - Statuses : 2 fail(s)
    - Exec time: [2.27, 2.89] s

  * igt@kms_color@ctm-0-25@pipe-c-hdmi-a-1-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [1.91, 2.13] s

  * igt@kms_color@ctm-0-25@pipe-c-hdmi-a-1-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [0.81, 1.34] s

  * igt@kms_color@ctm-0-25@pipe-c-hdmi-a-1-yuyv:
    - Statuses : 2 fail(s)
    - Exec time: [1.84, 2.60] s

  * igt@kms_color@ctm-0-25@pipe-c-hdmi-a-3-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.87] s

  * igt@kms_color@ctm-0-25@pipe-c-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.80] s

  * igt@kms_color@ctm-0-25@pipe-c-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [5.15] s

  * igt@kms_color@ctm-0-25@pipe-c-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [18.31] s

  * igt@kms_color@ctm-0-25@pipe-c-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.45] s

  * igt@kms_color@ctm-0-25@pipe-c-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.22] s

  * igt@kms_color@ctm-0-25@pipe-c-hdmi-a-4-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.04] s

  * igt@kms_color@ctm-0-25@pipe-c-hdmi-a-4-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.08] s

  * igt@kms_color@ctm-0-25@pipe-c-hdmi-a-4-p010:
    - Statuses : 1 fail(s)
    - Exec time: [3.83] s

  * igt@kms_color@ctm-0-25@pipe-c-hdmi-a-4-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [9.54] s

  * igt@kms_color@ctm-0-25@pipe-c-hdmi-a-4-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.46] s

  * igt@kms_color@ctm-0-25@pipe-c-hdmi-a-4-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [3.27] s

  * igt@kms_color@ctm-0-25@pipe-d-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.62] s

  * igt@kms_color@ctm-0-25@pipe-d-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [7.15] s

  * igt@kms_color@ctm-0-25@pipe-d-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [7.70] s

  * igt@kms_color@ctm-0-25@pipe-d-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [4.26] s

  * igt@kms_color@ctm-0-25@pipe-d-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [4.02] s

  * igt@kms_color@ctm-0-25@pipe-d-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [7.18] s

  * igt@kms_color@ctm-0-25@pipe-d-hdmi-a-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [0.61] s

  * igt@kms_color@ctm-0-25@pipe-d-hdmi-a-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.92] s

  * igt@kms_color@ctm-0-25@pipe-d-hdmi-a-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [2.26] s

  * igt@kms_color@ctm-0-25@pipe-d-hdmi-a-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.90] s

  * igt@kms_color@ctm-0-25@pipe-d-hdmi-a-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.81] s

  * igt@kms_color@ctm-0-25@pipe-d-hdmi-a-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.83] s

  * igt@kms_color@ctm-0-25@pipe-d-hdmi-a-3-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.84] s

  * igt@kms_color@ctm-0-25@pipe-d-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.81] s

  * igt@kms_color@ctm-0-25@pipe-d-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [4.93] s

  * igt@kms_color@ctm-0-25@pipe-d-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [18.34] s

  * igt@kms_color@ctm-0-25@pipe-d-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.44] s

  * igt@kms_color@ctm-0-25@pipe-d-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.23] s

  * igt@kms_color@ctm-0-25@pipe-d-hdmi-a-4-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.04] s

  * igt@kms_color@ctm-0-25@pipe-d-hdmi-a-4-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.14] s

  * igt@kms_color@ctm-0-25@pipe-d-hdmi-a-4-p010:
    - Statuses : 1 fail(s)
    - Exec time: [3.86] s

  * igt@kms_color@ctm-0-25@pipe-d-hdmi-a-4-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [9.59] s

  * igt@kms_color@ctm-0-25@pipe-d-hdmi-a-4-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.41] s

  * igt@kms_color@ctm-0-25@pipe-d-hdmi-a-4-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [3.31] s

  * igt@kms_color@ctm-0-50@pipe-a-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.66] s

  * igt@kms_color@ctm-0-50@pipe-a-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [7.25] s

  * igt@kms_color@ctm-0-50@pipe-a-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [7.67] s

  * igt@kms_color@ctm-0-50@pipe-a-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [4.22] s

  * igt@kms_color@ctm-0-50@pipe-a-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [3.55] s

  * igt@kms_color@ctm-0-50@pipe-a-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [7.47] s

  * igt@kms_color@ctm-0-50@pipe-a-hdmi-a-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [0.68] s

  * igt@kms_color@ctm-0-50@pipe-a-hdmi-a-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.97] s

  * igt@kms_color@ctm-0-50@pipe-a-hdmi-a-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [2.32] s

  * igt@kms_color@ctm-0-50@pipe-a-hdmi-a-1-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [1.90, 2.36] s

  * igt@kms_color@ctm-0-50@pipe-a-hdmi-a-1-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [0.84, 1.51] s

  * igt@kms_color@ctm-0-50@pipe-a-hdmi-a-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.98] s

  * igt@kms_color@ctm-0-50@pipe-a-hdmi-a-3-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [2.15] s

  * igt@kms_color@ctm-0-50@pipe-a-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.73] s

  * igt@kms_color@ctm-0-50@pipe-a-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [5.27] s

  * igt@kms_color@ctm-0-50@pipe-a-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [18.41] s

  * igt@kms_color@ctm-0-50@pipe-a-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.60] s

  * igt@kms_color@ctm-0-50@pipe-a-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.26] s

  * igt@kms_color@ctm-0-50@pipe-a-hdmi-a-4-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.20] s

  * igt@kms_color@ctm-0-50@pipe-a-hdmi-a-4-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.14] s

  * igt@kms_color@ctm-0-50@pipe-a-hdmi-a-4-p010:
    - Statuses : 1 fail(s)
    - Exec time: [3.96] s

  * igt@kms_color@ctm-0-50@pipe-a-hdmi-a-4-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [9.57] s

  * igt@kms_color@ctm-0-50@pipe-a-hdmi-a-4-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.62] s

  * igt@kms_color@ctm-0-50@pipe-a-hdmi-a-4-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [3.31] s

  * igt@kms_color@ctm-0-50@pipe-a-vga-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.58] s

  * igt@kms_color@ctm-0-50@pipe-a-vga-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.40] s

  * igt@kms_color@ctm-0-50@pipe-b-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.63] s

  * igt@kms_color@ctm-0-50@pipe-b-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [7.17] s

  * igt@kms_color@ctm-0-50@pipe-b-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [7.71] s

  * igt@kms_color@ctm-0-50@pipe-b-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [4.24] s

  * igt@kms_color@ctm-0-50@pipe-b-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [4.25] s

  * igt@kms_color@ctm-0-50@pipe-b-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [7.35] s

  * igt@kms_color@ctm-0-50@pipe-b-hdmi-a-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [0.60] s

  * igt@kms_color@ctm-0-50@pipe-b-hdmi-a-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.99] s

  * igt@kms_color@ctm-0-50@pipe-b-hdmi-a-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [2.28] s

  * igt@kms_color@ctm-0-50@pipe-b-hdmi-a-1-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [1.90, 2.37] s

  * igt@kms_color@ctm-0-50@pipe-b-hdmi-a-1-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [0.81, 1.50] s

  * igt@kms_color@ctm-0-50@pipe-b-hdmi-a-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.91] s

  * igt@kms_color@ctm-0-50@pipe-b-hdmi-a-3-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.82] s

  * igt@kms_color@ctm-0-50@pipe-b-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.73] s

  * igt@kms_color@ctm-0-50@pipe-b-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [5.18] s

  * igt@kms_color@ctm-0-50@pipe-b-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [18.39] s

  * igt@kms_color@ctm-0-50@pipe-b-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.43] s

  * igt@kms_color@ctm-0-50@pipe-b-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.23] s

  * igt@kms_color@ctm-0-50@pipe-b-hdmi-a-4-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.10] s

  * igt@kms_color@ctm-0-50@pipe-b-hdmi-a-4-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.10] s

  * igt@kms_color@ctm-0-50@pipe-b-hdmi-a-4-p010:
    - Statuses : 1 fail(s)
    - Exec time: [3.86] s

  * igt@kms_color@ctm-0-50@pipe-b-hdmi-a-4-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [9.61] s

  * igt@kms_color@ctm-0-50@pipe-b-hdmi-a-4-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.46] s

  * igt@kms_color@ctm-0-50@pipe-b-hdmi-a-4-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [3.23] s

  * igt@kms_color@ctm-0-50@pipe-b-vga-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.57] s

  * igt@kms_color@ctm-0-50@pipe-b-vga-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.27] s

  * igt@kms_color@ctm-0-50@pipe-c-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.62] s

  * igt@kms_color@ctm-0-50@pipe-c-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [7.17] s

  * igt@kms_color@ctm-0-50@pipe-c-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [7.62] s

  * igt@kms_color@ctm-0-50@pipe-c-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [4.23] s

  * igt@kms_color@ctm-0-50@pipe-c-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [4.01] s

  * igt@kms_color@ctm-0-50@pipe-c-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [7.17] s

  * igt@kms_color@ctm-0-50@pipe-c-hdmi-a-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [0.60] s

  * igt@kms_color@ctm-0-50@pipe-c-hdmi-a-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.97] s

  * igt@kms_color@ctm-0-50@pipe-c-hdmi-a-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [2.31] s

  * igt@kms_color@ctm-0-50@pipe-c-hdmi-a-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.92] s

  * igt@kms_color@ctm-0-50@pipe-c-hdmi-a-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.83] s

  * igt@kms_color@ctm-0-50@pipe-c-hdmi-a-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.88] s

  * igt@kms_color@ctm-0-50@pipe-c-hdmi-a-3-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.89] s

  * igt@kms_color@ctm-0-50@pipe-c-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.79] s

  * igt@kms_color@ctm-0-50@pipe-c-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [5.19] s

  * igt@kms_color@ctm-0-50@pipe-c-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [18.41] s

  * igt@kms_color@ctm-0-50@pipe-c-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.37] s

  * igt@kms_color@ctm-0-50@pipe-c-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.15] s

  * igt@kms_color@ctm-0-50@pipe-c-hdmi-a-4-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.02] s

  * igt@kms_color@ctm-0-50@pipe-c-hdmi-a-4-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.12] s

  * igt@kms_color@ctm-0-50@pipe-c-hdmi-a-4-p010:
    - Statuses : 1 fail(s)
    - Exec time: [3.87] s

  * igt@kms_color@ctm-0-50@pipe-c-hdmi-a-4-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [9.53] s

  * igt@kms_color@ctm-0-50@pipe-c-hdmi-a-4-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.40] s

  * igt@kms_color@ctm-0-50@pipe-c-hdmi-a-4-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [3.28] s

  * igt@kms_color@ctm-0-50@pipe-d-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.62] s

  * igt@kms_color@ctm-0-50@pipe-d-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [7.16] s

  * igt@kms_color@ctm-0-50@pipe-d-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [7.61] s

  * igt@kms_color@ctm-0-50@pipe-d-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [4.25] s

  * igt@kms_color@ctm-0-50@pipe-d-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [4.06] s

  * igt@kms_color@ctm-0-50@pipe-d-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [7.16] s

  * igt@kms_color@ctm-0-50@pipe-d-hdmi-a-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [0.60] s

  * igt@kms_color@ctm-0-50@pipe-d-hdmi-a-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.99] s

  * igt@kms_color@ctm-0-50@pipe-d-hdmi-a-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [2.27] s

  * igt@kms_color@ctm-0-50@pipe-d-hdmi-a-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.93] s

  * igt@kms_color@ctm-0-50@pipe-d-hdmi-a-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.80] s

  * igt@kms_color@ctm-0-50@pipe-d-hdmi-a-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.90] s

  * igt@kms_color@ctm-0-50@pipe-d-hdmi-a-3-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.80] s

  * igt@kms_color@ctm-0-50@pipe-d-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.74] s

  * igt@kms_color@ctm-0-50@pipe-d-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [5.11] s

  * igt@kms_color@ctm-0-50@pipe-d-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [18.36] s

  * igt@kms_color@ctm-0-50@pipe-d-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.41] s

  * igt@kms_color@ctm-0-50@pipe-d-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.22] s

  * igt@kms_color@ctm-0-50@pipe-d-hdmi-a-4-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.05] s

  * igt@kms_color@ctm-0-50@pipe-d-hdmi-a-4-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.16] s

  * igt@kms_color@ctm-0-50@pipe-d-hdmi-a-4-p010:
    - Statuses : 1 fail(s)
    - Exec time: [3.82] s

  * igt@kms_color@ctm-0-50@pipe-d-hdmi-a-4-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [9.58] s

  * igt@kms_color@ctm-0-50@pipe-d-hdmi-a-4-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.43] s

  * igt@kms_color@ctm-0-50@pipe-d-hdmi-a-4-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [3.29] s

  * igt@kms_color@ctm-0-75@pipe-a-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.62] s

  * igt@kms_color@ctm-0-75@pipe-a-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [10.12] s

  * igt@kms_color@ctm-0-75@pipe-a-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [10.77] s

  * igt@kms_color@ctm-0-75@pipe-a-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_color@ctm-0-75@pipe-a-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [5.06] s

  * igt@kms_color@ctm-0-75@pipe-a-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [10.64] s

  * igt@kms_color@ctm-0-75@pipe-a-hdmi-a-1-fp16:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [0.68, 9.06] s

  * igt@kms_color@ctm-0-75@pipe-a-hdmi-a-1-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [2.72, 5.71] s

  * igt@kms_color@ctm-0-75@pipe-a-hdmi-a-1-p010:
    - Statuses : 2 fail(s)
    - Exec time: [3.18, 6.82] s

  * igt@kms_color@ctm-0-75@pipe-a-hdmi-a-1-xrgb2101010:
    - Statuses : 3 pass(s)
    - Exec time: [0.63, 1.00] s

  * igt@kms_color@ctm-0-75@pipe-a-hdmi-a-1-xrgb8888:
    - Statuses : 3 pass(s)
    - Exec time: [1.08, 2.90] s

  * igt@kms_color@ctm-0-75@pipe-a-hdmi-a-1-yuyv:
    - Statuses : 2 fail(s)
    - Exec time: [2.61, 5.97] s

  * igt@kms_color@ctm-0-75@pipe-a-hdmi-a-2-fp16:
    - Statuses : 1 fail(s)
    - Exec time: [8.85] s

  * igt@kms_color@ctm-0-75@pipe-a-hdmi-a-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [5.65] s

  * igt@kms_color@ctm-0-75@pipe-a-hdmi-a-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [6.70] s

  * igt@kms_color@ctm-0-75@pipe-a-hdmi-a-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.99] s

  * igt@kms_color@ctm-0-75@pipe-a-hdmi-a-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [2.52] s

  * igt@kms_color@ctm-0-75@pipe-a-hdmi-a-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [5.87] s

  * igt@kms_color@ctm-0-75@pipe-a-hdmi-a-3-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.93] s

  * igt@kms_color@ctm-0-75@pipe-a-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [5.38] s

  * igt@kms_color@ctm-0-75@pipe-a-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [7.19] s

  * igt@kms_color@ctm-0-75@pipe-a-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [6.49] s

  * igt@kms_color@ctm-0-75@pipe-a-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.97] s

  * igt@kms_color@ctm-0-75@pipe-a-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [5.99] s

  * igt@kms_color@ctm-0-75@pipe-a-hdmi-a-4-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.22] s

  * igt@kms_color@ctm-0-75@pipe-a-hdmi-a-4-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [4.32] s

  * igt@kms_color@ctm-0-75@pipe-a-hdmi-a-4-p010:
    - Statuses : 1 fail(s)
    - Exec time: [5.65] s

  * igt@kms_color@ctm-0-75@pipe-a-hdmi-a-4-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [3.20] s

  * igt@kms_color@ctm-0-75@pipe-a-hdmi-a-4-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [2.14] s

  * igt@kms_color@ctm-0-75@pipe-a-hdmi-a-4-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.69] s

  * igt@kms_color@ctm-0-75@pipe-a-vga-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.54] s

  * igt@kms_color@ctm-0-75@pipe-a-vga-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.82] s

  * igt@kms_color@ctm-0-75@pipe-b-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.62] s

  * igt@kms_color@ctm-0-75@pipe-b-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [10.31] s

  * igt@kms_color@ctm-0-75@pipe-b-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [10.76] s

  * igt@kms_color@ctm-0-75@pipe-b-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.37] s

  * igt@kms_color@ctm-0-75@pipe-b-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [5.73] s

  * igt@kms_color@ctm-0-75@pipe-b-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [10.42] s

  * igt@kms_color@ctm-0-75@pipe-b-hdmi-a-1-fp16:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [0.61, 8.91] s

  * igt@kms_color@ctm-0-75@pipe-b-hdmi-a-1-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [2.75, 5.67] s

  * igt@kms_color@ctm-0-75@pipe-b-hdmi-a-1-p010:
    - Statuses : 2 fail(s)
    - Exec time: [3.16, 6.82] s

  * igt@kms_color@ctm-0-75@pipe-b-hdmi-a-1-xrgb2101010:
    - Statuses : 3 pass(s)
    - Exec time: [0.64, 1.03] s

  * igt@kms_color@ctm-0-75@pipe-b-hdmi-a-1-xrgb8888:
    - Statuses : 3 pass(s)
    - Exec time: [1.08, 2.50] s

  * igt@kms_color@ctm-0-75@pipe-b-hdmi-a-1-yuyv:
    - Statuses : 2 fail(s)
    - Exec time: [2.61, 5.88] s

  * igt@kms_color@ctm-0-75@pipe-b-hdmi-a-2-fp16:
    - Statuses : 1 fail(s)
    - Exec time: [8.92] s

  * igt@kms_color@ctm-0-75@pipe-b-hdmi-a-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [5.72] s

  * igt@kms_color@ctm-0-75@pipe-b-hdmi-a-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [6.75] s

  * igt@kms_color@ctm-0-75@pipe-b-hdmi-a-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.99] s

  * igt@kms_color@ctm-0-75@pipe-b-hdmi-a-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [2.57] s

  * igt@kms_color@ctm-0-75@pipe-b-hdmi-a-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [5.92] s

  * igt@kms_color@ctm-0-75@pipe-b-hdmi-a-3-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.84] s

  * igt@kms_color@ctm-0-75@pipe-b-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [5.32] s

  * igt@kms_color@ctm-0-75@pipe-b-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [7.46] s

  * igt@kms_color@ctm-0-75@pipe-b-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [6.32] s

  * igt@kms_color@ctm-0-75@pipe-b-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.80] s

  * igt@kms_color@ctm-0-75@pipe-b-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [5.89] s

  * igt@kms_color@ctm-0-75@pipe-b-hdmi-a-4-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.04] s

  * igt@kms_color@ctm-0-75@pipe-b-hdmi-a-4-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [4.39] s

  * igt@kms_color@ctm-0-75@pipe-b-hdmi-a-4-p010:
    - Statuses : 1 fail(s)
    - Exec time: [5.68] s

  * igt@kms_color@ctm-0-75@pipe-b-hdmi-a-4-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [3.21] s

  * igt@kms_color@ctm-0-75@pipe-b-hdmi-a-4-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.95] s

  * igt@kms_color@ctm-0-75@pipe-b-hdmi-a-4-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.65] s

  * igt@kms_color@ctm-0-75@pipe-b-vga-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.54] s

  * igt@kms_color@ctm-0-75@pipe-b-vga-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.69] s

  * igt@kms_color@ctm-0-75@pipe-c-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.63] s

  * igt@kms_color@ctm-0-75@pipe-c-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [9.99] s

  * igt@kms_color@ctm-0-75@pipe-c-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [10.79] s

  * igt@kms_color@ctm-0-75@pipe-c-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.40] s

  * igt@kms_color@ctm-0-75@pipe-c-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [5.34] s

  * igt@kms_color@ctm-0-75@pipe-c-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [10.02] s

  * igt@kms_color@ctm-0-75@pipe-c-hdmi-a-1-fp16:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [0.61, 8.83] s

  * igt@kms_color@ctm-0-75@pipe-c-hdmi-a-1-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [2.75, 5.66] s

  * igt@kms_color@ctm-0-75@pipe-c-hdmi-a-1-p010:
    - Statuses : 2 fail(s)
    - Exec time: [3.16, 6.74] s

  * igt@kms_color@ctm-0-75@pipe-c-hdmi-a-1-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [0.63, 1.00] s

  * igt@kms_color@ctm-0-75@pipe-c-hdmi-a-1-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [1.06, 2.49] s

  * igt@kms_color@ctm-0-75@pipe-c-hdmi-a-1-yuyv:
    - Statuses : 2 fail(s)
    - Exec time: [2.62, 5.92] s

  * igt@kms_color@ctm-0-75@pipe-c-hdmi-a-2-fp16:
    - Statuses : 1 fail(s)
    - Exec time: [9.03] s

  * igt@kms_color@ctm-0-75@pipe-c-hdmi-a-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [5.69] s

  * igt@kms_color@ctm-0-75@pipe-c-hdmi-a-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [6.82] s

  * igt@kms_color@ctm-0-75@pipe-c-hdmi-a-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.01] s

  * igt@kms_color@ctm-0-75@pipe-c-hdmi-a-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [2.52] s

  * igt@kms_color@ctm-0-75@pipe-c-hdmi-a-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [5.84] s

  * igt@kms_color@ctm-0-75@pipe-c-hdmi-a-3-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.84] s

  * igt@kms_color@ctm-0-75@pipe-c-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [4.99] s

  * igt@kms_color@ctm-0-75@pipe-c-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [7.50] s

  * igt@kms_color@ctm-0-75@pipe-c-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [6.50] s

  * igt@kms_color@ctm-0-75@pipe-c-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.84] s

  * igt@kms_color@ctm-0-75@pipe-c-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [5.97] s

  * igt@kms_color@ctm-0-75@pipe-c-hdmi-a-4-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.06] s

  * igt@kms_color@ctm-0-75@pipe-c-hdmi-a-4-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [4.43] s

  * igt@kms_color@ctm-0-75@pipe-c-hdmi-a-4-p010:
    - Statuses : 1 fail(s)
    - Exec time: [5.45] s

  * igt@kms_color@ctm-0-75@pipe-c-hdmi-a-4-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [3.21] s

  * igt@kms_color@ctm-0-75@pipe-c-hdmi-a-4-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.93] s

  * igt@kms_color@ctm-0-75@pipe-c-hdmi-a-4-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.67] s

  * igt@kms_color@ctm-0-75@pipe-d-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.63] s

  * igt@kms_color@ctm-0-75@pipe-d-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [10.03] s

  * igt@kms_color@ctm-0-75@pipe-d-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [10.76] s

  * igt@kms_color@ctm-0-75@pipe-d-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.37] s

  * igt@kms_color@ctm-0-75@pipe-d-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [5.37] s

  * igt@kms_color@ctm-0-75@pipe-d-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [10.14] s

  * igt@kms_color@ctm-0-75@pipe-d-hdmi-a-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [0.61] s

  * igt@kms_color@ctm-0-75@pipe-d-hdmi-a-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.79] s

  * igt@kms_color@ctm-0-75@pipe-d-hdmi-a-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [3.18] s

  * igt@kms_color@ctm-0-75@pipe-d-hdmi-a-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.64] s

  * igt@kms_color@ctm-0-75@pipe-d-hdmi-a-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.06] s

  * igt@kms_color@ctm-0-75@pipe-d-hdmi-a-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [2.62] s

  * igt@kms_color@ctm-0-75@pipe-d-hdmi-a-3-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.88] s

  * igt@kms_color@ctm-0-75@pipe-d-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [5.34] s

  * igt@kms_color@ctm-0-75@pipe-d-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [7.50] s

  * igt@kms_color@ctm-0-75@pipe-d-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [6.42] s

  * igt@kms_color@ctm-0-75@pipe-d-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.87] s

  * igt@kms_color@ctm-0-75@pipe-d-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [5.98] s

  * igt@kms_color@ctm-0-75@pipe-d-hdmi-a-4-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.04] s

  * igt@kms_color@ctm-0-75@pipe-d-hdmi-a-4-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [4.43] s

  * igt@kms_color@ctm-0-75@pipe-d-hdmi-a-4-p010:
    - Statuses : 1 fail(s)
    - Exec time: [5.39] s

  * igt@kms_color@ctm-0-75@pipe-d-hdmi-a-4-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [3.21] s

  * igt@kms_color@ctm-0-75@pipe-d-hdmi-a-4-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.91] s

  * igt@kms_color@ctm-0-75@pipe-d-hdmi-a-4-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.66] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.58] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.40] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.55] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.42] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.67] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.48] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-1-fp16:
    - Statuses : 3 pass(s)
    - Exec time: [0.68, 1.41] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-1-nv12:
    - Statuses : 3 fail(s)
    - Exec time: [0.39, 0.83] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-1-p010:
    - Statuses : 3 fail(s)
    - Exec time: [0.49, 1.00] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-1-xrgb2101010:
    - Statuses : 4 pass(s)
    - Exec time: [0.63, 0.98] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-1-xrgb8888:
    - Statuses : 4 pass(s)
    - Exec time: [0.30, 0.94] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-1-yuyv:
    - Statuses : 3 fail(s)
    - Exec time: [0.42, 0.88] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-2-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.30] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.82] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [0.99] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.99] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.69] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.84] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-3-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [2.35] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.77] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.21] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [6.34] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.66] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.99] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-4-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.23] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-4-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.63] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-4-p010:
    - Statuses : 1 fail(s)
    - Exec time: [0.82] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-4-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [3.18] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-4-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.70] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-4-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.73] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-vga-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.54] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-vga-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.51] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.62] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.46] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.57] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.44] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.42] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.50] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-1-fp16:
    - Statuses : 3 pass(s)
    - Exec time: [0.60, 1.30] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-1-nv12:
    - Statuses : 3 fail(s)
    - Exec time: [0.41, 0.86] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-1-p010:
    - Statuses : 3 fail(s)
    - Exec time: [0.46, 0.97] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-1-xrgb2101010:
    - Statuses : 4 pass(s)
    - Exec time: [0.63, 1.05] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-1-xrgb8888:
    - Statuses : 4 pass(s)
    - Exec time: [0.30, 0.68] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-1-yuyv:
    - Statuses : 3 fail(s)
    - Exec time: [0.38, 0.86] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-2-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.28] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.84] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [0.97] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.02] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.68] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.86] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-3-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [2.10] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.78] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.12] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [6.32] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.51] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.88] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-4-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.04] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-4-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.64] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-4-p010:
    - Statuses : 1 fail(s)
    - Exec time: [0.78] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-4-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [3.20] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-4-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.50] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-4-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.67] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-vga-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.52] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-vga-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.43] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.61] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.46] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.50] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.35] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.41] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-1-fp16:
    - Statuses : 3 pass(s)
    - Exec time: [0.60, 1.25] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-1-nv12:
    - Statuses : 3 fail(s)
    - Exec time: [0.38, 0.85] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-1-p010:
    - Statuses : 3 fail(s)
    - Exec time: [0.45, 0.97] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-1-xrgb2101010:
    - Statuses : 3 pass(s)
    - Exec time: [0.64, 1.05] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-1-xrgb8888:
    - Statuses : 3 pass(s)
    - Exec time: [0.29, 0.68] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-1-yuyv:
    - Statuses : 3 fail(s)
    - Exec time: [0.39, 0.88] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-2-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.28] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.83] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [0.97] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.02] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.68] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.86] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-3-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [2.04] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.77] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.11] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [6.32] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.49] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.87] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-4-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.07] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-4-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.64] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-4-p010:
    - Statuses : 1 fail(s)
    - Exec time: [0.77] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-4-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [3.17] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-4-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.50] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-4-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.65] s

  * igt@kms_color@ctm-blue-to-red@pipe-d-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.62] s

  * igt@kms_color@ctm-blue-to-red@pipe-d-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.42] s

  * igt@kms_color@ctm-blue-to-red@pipe-d-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.51] s

  * igt@kms_color@ctm-blue-to-red@pipe-d-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.37] s

  * igt@kms_color@ctm-blue-to-red@pipe-d-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.37] s

  * igt@kms_color@ctm-blue-to-red@pipe-d-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.42] s

  * igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [0.59] s

  * igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.41] s

  * igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [0.45] s

  * igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.63] s

  * igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.30] s

  * igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.39] s

  * igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-3-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [2.00] s

  * igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.77] s

  * igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.09] s

  * igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [6.33] s

  * igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.50] s

  * igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.89] s

  * igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-4-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.10] s

  * igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-4-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.64] s

  * igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-4-p010:
    - Statuses : 1 fail(s)
    - Exec time: [0.79] s

  * igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-4-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [3.19] s

  * igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-4-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.54] s

  * igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-4-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.65] s

  * igt@kms_color@ctm-green-to-red@pipe-a-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.60] s

  * igt@kms_color@ctm-green-to-red@pipe-a-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.44] s

  * igt@kms_color@ctm-green-to-red@pipe-a-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.60] s

  * igt@kms_color@ctm-green-to-red@pipe-a-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.35] s

  * igt@kms_color@ctm-green-to-red@pipe-a-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.69] s

  * igt@kms_color@ctm-green-to-red@pipe-a-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.50] s

  * igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-1-fp16:
    - Statuses : 3 pass(s)
    - Exec time: [0.68, 1.31] s

  * igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-1-nv12:
    - Statuses : 3 fail(s)
    - Exec time: [0.41, 0.85] s

  * igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-1-p010:
    - Statuses : 3 fail(s)
    - Exec time: [0.47, 1.00] s

  * igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-1-xrgb2101010:
    - Statuses : 4 pass(s)
    - Exec time: [0.64, 3.18] s

  * igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-1-xrgb8888:
    - Statuses : 4 pass(s)
    - Exec time: [0.29, 0.94] s

  * igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-1-yuyv:
    - Statuses : 3 fail(s)
    - Exec time: [0.41, 0.90] s

  * igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-2-fp16:
    - Statuses : 2 pass(s)
    - Exec time: [0.76, 1.28] s

  * igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-2-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [0.48, 0.81] s

  * igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-2-p010:
    - Statuses : 2 fail(s)
    - Exec time: [0.58, 0.97] s

  * igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-2-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [0.69, 1.01] s

  * igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-2-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [0.57, 0.69] s

  * igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-2-yuyv:
    - Statuses : 2 fail(s)
    - Exec time: [0.53, 0.86] s

  * igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-3-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [2.20] s

  * igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.82] s

  * igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.12] s

  * igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [6.35] s

  * igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.68] s

  * igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.96] s

  * igt@kms_color@ctm-green-to-red@pipe-a-vga-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.53] s

  * igt@kms_color@ctm-green-to-red@pipe-a-vga-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.56] s

  * igt@kms_color@ctm-green-to-red@pipe-b-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.61] s

  * igt@kms_color@ctm-green-to-red@pipe-b-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.49] s

  * igt@kms_color@ctm-green-to-red@pipe-b-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.60] s

  * igt@kms_color@ctm-green-to-red@pipe-b-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.37] s

  * igt@kms_color@ctm-green-to-red@pipe-b-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.42] s

  * igt@kms_color@ctm-green-to-red@pipe-b-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.53] s

  * igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-1-fp16:
    - Statuses : 3 pass(s)
    - Exec time: [0.61, 1.25] s

  * igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-1-nv12:
    - Statuses : 3 fail(s)
    - Exec time: [0.40, 0.83] s

  * igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-1-p010:
    - Statuses : 3 fail(s)
    - Exec time: [0.46, 0.99] s

  * igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-1-xrgb2101010:
    - Statuses : 4 pass(s)
    - Exec time: [0.64, 3.24] s

  * igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-1-xrgb8888:
    - Statuses : 4 pass(s)
    - Exec time: [0.30, 0.66] s

  * igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-1-yuyv:
    - Statuses : 3 fail(s)
    - Exec time: [0.38, 0.84] s

  * igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-2-fp16:
    - Statuses : 2 pass(s)
    - Exec time: [0.67, 1.23] s

  * igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-2-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [0.50, 0.84] s

  * igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-2-p010:
    - Statuses : 2 fail(s)
    - Exec time: [0.56, 0.98] s

  * igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-2-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [0.69, 1.00] s

  * igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-2-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [0.48, 0.74] s

  * igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-2-yuyv:
    - Statuses : 2 fail(s)
    - Exec time: [0.51, 0.90] s

  * igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-3-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [2.10] s

  * igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.79] s

  * igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.12] s

  * igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [6.37] s

  * igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.49] s

  * igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.89] s

  * igt@kms_color@ctm-green-to-red@pipe-b-vga-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.54] s

  * igt@kms_color@ctm-green-to-red@pipe-b-vga-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.43] s

  * igt@kms_color@ctm-green-to-red@pipe-c-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.62] s

  * igt@kms_color@ctm-green-to-red@pipe-c-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.44] s

  * igt@kms_color@ctm-green-to-red@pipe-c-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.49] s

  * igt@kms_color@ctm-green-to-red@pipe-c-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_color@ctm-green-to-red@pipe-c-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_color@ctm-green-to-red@pipe-c-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.47] s

  * igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-1-fp16:
    - Statuses : 3 pass(s)
    - Exec time: [0.61, 1.24] s

  * igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-1-nv12:
    - Statuses : 3 fail(s)
    - Exec time: [0.41, 0.84] s

  * igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-1-p010:
    - Statuses : 3 fail(s)
    - Exec time: [0.46, 0.98] s

  * igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-1-xrgb2101010:
    - Statuses : 3 pass(s)
    - Exec time: [0.65, 3.19] s

  * igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-1-xrgb8888:
    - Statuses : 3 pass(s)
    - Exec time: [0.30, 0.69] s

  * igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-1-yuyv:
    - Statuses : 3 fail(s)
    - Exec time: [0.39, 0.86] s

  * igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-2-fp16:
    - Statuses : 2 pass(s)
    - Exec time: [0.69, 1.27] s

  * igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-2-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [0.48, 0.85] s

  * igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-2-p010:
    - Statuses : 2 fail(s)
    - Exec time: [0.56, 0.98] s

  * igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-2-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [0.69, 1.00] s

  * igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-2-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [0.48, 0.67] s

  * igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-2-yuyv:
    - Statuses : 2 fail(s)
    - Exec time: [0.51, 0.88] s

  * igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-3-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [2.09] s

  * igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.78] s

  * igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.09] s

  * igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [6.37] s

  * igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.51] s

  * igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.87] s

  * igt@kms_color@ctm-green-to-red@pipe-d-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.62] s

  * igt@kms_color@ctm-green-to-red@pipe-d-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.45] s

  * igt@kms_color@ctm-green-to-red@pipe-d-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.49] s

  * igt@kms_color@ctm-green-to-red@pipe-d-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.35] s

  * igt@kms_color@ctm-green-to-red@pipe-d-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_color@ctm-green-to-red@pipe-d-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.39] s

  * igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-1-fp16:
    - Statuses : 2 pass(s)
    - Exec time: [0.59, 1.06] s

  * igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-1-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [0.38, 0.65] s

  * igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-1-p010:
    - Statuses : 2 fail(s)
    - Exec time: [0.46, 0.78] s

  * igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-1-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [0.64, 3.21] s

  * igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-1-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [0.29, 0.54] s

  * igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-1-yuyv:
    - Statuses : 2 fail(s)
    - Exec time: [0.38, 0.68] s

  * igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-3-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [2.08] s

  * igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.80] s

  * igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.12] s

  * igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [6.36] s

  * igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.52] s

  * igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.89] s

  * igt@kms_color@ctm-max@pipe-a-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.63] s

  * igt@kms_color@ctm-max@pipe-a-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.46] s

  * igt@kms_color@ctm-max@pipe-a-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.57] s

  * igt@kms_color@ctm-max@pipe-a-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.37] s

  * igt@kms_color@ctm-max@pipe-a-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.73] s

  * igt@kms_color@ctm-max@pipe-a-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.49] s

  * igt@kms_color@ctm-max@pipe-a-hdmi-a-1-fp16:
    - Statuses : 2 pass(s)
    - Exec time: [0.68, 1.36] s

  * igt@kms_color@ctm-max@pipe-a-hdmi-a-1-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [0.39, 0.84] s

  * igt@kms_color@ctm-max@pipe-a-hdmi-a-1-p010:
    - Statuses : 2 fail(s)
    - Exec time: [0.48, 1.03] s

  * igt@kms_color@ctm-max@pipe-a-hdmi-a-1-xrgb2101010:
    - Statuses : 3 pass(s)
    - Exec time: [0.64, 1.00] s

  * igt@kms_color@ctm-max@pipe-a-hdmi-a-1-xrgb8888:
    - Statuses : 3 pass(s)
    - Exec time: [0.31, 1.03] s

  * igt@kms_color@ctm-max@pipe-a-hdmi-a-1-yuyv:
    - Statuses : 2 pass(s)
    - Exec time: [0.39, 1.03] s

  * igt@kms_color@ctm-max@pipe-a-hdmi-a-2-fp16:
    - Statuses : 2 pass(s)
    - Exec time: [0.76, 1.24] s

  * igt@kms_color@ctm-max@pipe-a-hdmi-a-2-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [0.49, 0.81] s

  * igt@kms_color@ctm-max@pipe-a-hdmi-a-2-p010:
    - Statuses : 2 fail(s)
    - Exec time: [0.58, 0.97] s

  * igt@kms_color@ctm-max@pipe-a-hdmi-a-2-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [0.69, 0.99] s

  * igt@kms_color@ctm-max@pipe-a-hdmi-a-2-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [0.57, 0.69] s

  * igt@kms_color@ctm-max@pipe-a-hdmi-a-2-yuyv:
    - Statuses : 2 pass(s)
    - Exec time: [0.52, 0.84] s

  * igt@kms_color@ctm-max@pipe-a-hdmi-a-3-fp16:
    - Statuses : 2 pass(s)
    - Exec time: [1.23, 2.10] s

  * igt@kms_color@ctm-max@pipe-a-hdmi-a-3-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [0.61, 0.79] s

  * igt@kms_color@ctm-max@pipe-a-hdmi-a-3-p010:
    - Statuses : 2 fail(s)
    - Exec time: [0.84, 1.11] s

  * igt@kms_color@ctm-max@pipe-a-hdmi-a-3-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [3.20, 6.12] s

  * igt@kms_color@ctm-max@pipe-a-hdmi-a-3-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [0.62, 0.67] s

  * igt@kms_color@ctm-max@pipe-a-hdmi-a-3-yuyv:
    - Statuses : 2 pass(s)
    - Exec time: [0.70, 0.93] s

  * igt@kms_color@ctm-max@pipe-a-vga-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.53] s

  * igt@kms_color@ctm-max@pipe-a-vga-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.55] s

  * igt@kms_color@ctm-max@pipe-b-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.64] s

  * igt@kms_color@ctm-max@pipe-b-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.42] s

  * igt@kms_color@ctm-max@pipe-b-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.55] s

  * igt@kms_color@ctm-max@pipe-b-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_color@ctm-max@pipe-b-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.41] s

  * igt@kms_color@ctm-max@pipe-b-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.49] s

  * igt@kms_color@ctm-max@pipe-b-hdmi-a-1-fp16:
    - Statuses : 2 pass(s)
    - Exec time: [0.62, 1.26] s

  * igt@kms_color@ctm-max@pipe-b-hdmi-a-1-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [0.40, 0.81] s

  * igt@kms_color@ctm-max@pipe-b-hdmi-a-1-p010:
    - Statuses : 2 fail(s)
    - Exec time: [0.45, 1.03] s

  * igt@kms_color@ctm-max@pipe-b-hdmi-a-1-xrgb2101010:
    - Statuses : 3 pass(s)
    - Exec time: [0.64, 1.00] s

  * igt@kms_color@ctm-max@pipe-b-hdmi-a-1-xrgb8888:
    - Statuses : 3 pass(s)
    - Exec time: [0.29, 0.66] s

  * igt@kms_color@ctm-max@pipe-b-hdmi-a-1-yuyv:
    - Statuses : 2 pass(s)
    - Exec time: [0.37, 0.89] s

  * igt@kms_color@ctm-max@pipe-b-hdmi-a-2-fp16:
    - Statuses : 2 pass(s)
    - Exec time: [0.67, 1.27] s

  * igt@kms_color@ctm-max@pipe-b-hdmi-a-2-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [0.49, 0.82] s

  * igt@kms_color@ctm-max@pipe-b-hdmi-a-2-p010:
    - Statuses : 2 fail(s)
    - Exec time: [0.56, 0.99] s

  * igt@kms_color@ctm-max@pipe-b-hdmi-a-2-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [0.69, 1.00] s

  * igt@kms_color@ctm-max@pipe-b-hdmi-a-2-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [0.47, 0.69] s

  * igt@kms_color@ctm-max@pipe-b-hdmi-a-2-yuyv:
    - Statuses : 2 pass(s)
    - Exec time: [0.48, 0.82] s

  * igt@kms_color@ctm-max@pipe-b-hdmi-a-3-fp16:
    - Statuses : 2 pass(s)
    - Exec time: [1.07, 1.89] s

  * igt@kms_color@ctm-max@pipe-b-hdmi-a-3-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [0.62, 0.75] s

  * igt@kms_color@ctm-max@pipe-b-hdmi-a-3-p010:
    - Statuses : 2 fail(s)
    - Exec time: [0.79, 1.06] s

  * igt@kms_color@ctm-max@pipe-b-hdmi-a-3-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [3.24, 6.10] s

  * igt@kms_color@ctm-max@pipe-b-hdmi-a-3-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [0.51, 0.56] s

  * igt@kms_color@ctm-max@pipe-b-hdmi-a-3-yuyv:
    - Statuses : 2 pass(s)
    - Exec time: [0.65, 0.81] s

  * igt@kms_color@ctm-max@pipe-b-vga-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.54] s

  * igt@kms_color@ctm-max@pipe-b-vga-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.45] s

  * igt@kms_color@ctm-max@pipe-c-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.64] s

  * igt@kms_color@ctm-max@pipe-c-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.43] s

  * igt@kms_color@ctm-max@pipe-c-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.56] s

  * igt@kms_color@ctm-max@pipe-c-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_color@ctm-max@pipe-c-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_color@ctm-max@pipe-c-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.40] s

  * igt@kms_color@ctm-max@pipe-c-hdmi-a-1-fp16:
    - Statuses : 2 pass(s)
    - Exec time: [0.61, 1.27] s

  * igt@kms_color@ctm-max@pipe-c-hdmi-a-1-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [0.40, 0.82] s

  * igt@kms_color@ctm-max@pipe-c-hdmi-a-1-p010:
    - Statuses : 2 fail(s)
    - Exec time: [0.45, 0.97] s

  * igt@kms_color@ctm-max@pipe-c-hdmi-a-1-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [0.63, 1.02] s

  * igt@kms_color@ctm-max@pipe-c-hdmi-a-1-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [0.31, 0.68] s

  * igt@kms_color@ctm-max@pipe-c-hdmi-a-1-yuyv:
    - Statuses : 2 pass(s)
    - Exec time: [0.38, 0.83] s

  * igt@kms_color@ctm-max@pipe-c-hdmi-a-2-fp16:
    - Statuses : 2 pass(s)
    - Exec time: [0.67, 1.28] s

  * igt@kms_color@ctm-max@pipe-c-hdmi-a-2-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [0.48, 0.84] s

  * igt@kms_color@ctm-max@pipe-c-hdmi-a-2-p010:
    - Statuses : 2 fail(s)
    - Exec time: [0.56, 0.97] s

  * igt@kms_color@ctm-max@pipe-c-hdmi-a-2-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [0.69, 0.98] s

  * igt@kms_color@ctm-max@pipe-c-hdmi-a-2-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [0.46, 0.72] s

  * igt@kms_color@ctm-max@pipe-c-hdmi-a-2-yuyv:
    - Statuses : 2 pass(s)
    - Exec time: [0.50, 0.84] s

  * igt@kms_color@ctm-max@pipe-c-hdmi-a-3-fp16:
    - Statuses : 2 pass(s)
    - Exec time: [1.03, 1.75] s

  * igt@kms_color@ctm-max@pipe-c-hdmi-a-3-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [0.64, 0.77] s

  * igt@kms_color@ctm-max@pipe-c-hdmi-a-3-p010:
    - Statuses : 2 fail(s)
    - Exec time: [0.81, 1.04] s

  * igt@kms_color@ctm-max@pipe-c-hdmi-a-3-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [3.22, 6.08] s

  * igt@kms_color@ctm-max@pipe-c-hdmi-a-3-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [0.52, 0.53] s

  * igt@kms_color@ctm-max@pipe-c-hdmi-a-3-yuyv:
    - Statuses : 2 pass(s)
    - Exec time: [0.66, 0.84] s

  * igt@kms_color@ctm-max@pipe-d-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.62] s

  * igt@kms_color@ctm-max@pipe-d-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.43] s

  * igt@kms_color@ctm-max@pipe-d-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.56] s

  * igt@kms_color@ctm-max@pipe-d-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_color@ctm-max@pipe-d-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.40] s

  * igt@kms_color@ctm-max@pipe-d-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.41] s

  * igt@kms_color@ctm-max@pipe-d-hdmi-a-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [0.59] s

  * igt@kms_color@ctm-max@pipe-d-hdmi-a-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.39] s

  * igt@kms_color@ctm-max@pipe-d-hdmi-a-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [0.46] s

  * igt@kms_color@ctm-max@pipe-d-hdmi-a-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.63] s

  * igt@kms_color@ctm-max@pipe-d-hdmi-a-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.30] s

  * igt@kms_color@ctm-max@pipe-d-hdmi-a-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.38] s

  * igt@kms_color@ctm-max@pipe-d-hdmi-a-3-fp16:
    - Statuses : 2 pass(s)
    - Exec time: [1.10, 1.85] s

  * igt@kms_color@ctm-max@pipe-d-hdmi-a-3-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [0.61, 0.75] s

  * igt@kms_color@ctm-max@pipe-d-hdmi-a-3-p010:
    - Statuses : 2 fail(s)
    - Exec time: [0.78, 1.06] s

  * igt@kms_color@ctm-max@pipe-d-hdmi-a-3-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [3.20, 6.10] s

  * igt@kms_color@ctm-max@pipe-d-hdmi-a-3-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [0.52, 0.53] s

  * igt@kms_color@ctm-max@pipe-d-hdmi-a-3-yuyv:
    - Statuses : 2 pass(s)
    - Exec time: [0.64, 0.78] s

  * igt@kms_color@ctm-negative@pipe-a-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.59] s

  * igt@kms_color@ctm-negative@pipe-a-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.48] s

  * igt@kms_color@ctm-negative@pipe-a-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.58] s

  * igt@kms_color@ctm-negative@pipe-a-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_color@ctm-negative@pipe-a-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.71] s

  * igt@kms_color@ctm-negative@pipe-a-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.52] s

  * igt@kms_color@ctm-negative@pipe-a-hdmi-a-1-fp16:
    - Statuses : 3 pass(s)
    - Exec time: [0.67, 1.33] s

  * igt@kms_color@ctm-negative@pipe-a-hdmi-a-1-nv12:
    - Statuses : 3 fail(s)
    - Exec time: [0.39, 0.84] s

  * igt@kms_color@ctm-negative@pipe-a-hdmi-a-1-p010:
    - Statuses : 3 fail(s)
    - Exec time: [0.48, 1.01] s

  * igt@kms_color@ctm-negative@pipe-a-hdmi-a-1-xrgb2101010:
    - Statuses : 4 pass(s)
    - Exec time: [0.63, 1.00] s

  * igt@kms_color@ctm-negative@pipe-a-hdmi-a-1-xrgb8888:
    - Statuses : 4 pass(s)
    - Exec time: [0.30, 0.97] s

  * igt@kms_color@ctm-negative@pipe-a-hdmi-a-1-yuyv:
    - Statuses : 3 fail(s)
    - Exec time: [0.41, 0.88] s

  * igt@kms_color@ctm-negative@pipe-a-hdmi-a-2-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.19] s

  * igt@kms_color@ctm-negative@pipe-a-hdmi-a-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.81] s

  * igt@kms_color@ctm-negative@pipe-a-hdmi-a-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [0.97] s

  * igt@kms_color@ctm-negative@pipe-a-hdmi-a-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.99] s

  * igt@kms_color@ctm-negative@pipe-a-hdmi-a-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.69] s

  * igt@kms_color@ctm-negative@pipe-a-hdmi-a-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.85] s

  * igt@kms_color@ctm-negative@pipe-a-hdmi-a-3-fp16:
    - Statuses : 2 pass(s)
    - Exec time: [1.18, 2.10] s

  * igt@kms_color@ctm-negative@pipe-a-hdmi-a-3-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [0.62, 0.77] s

  * igt@kms_color@ctm-negative@pipe-a-hdmi-a-3-p010:
    - Statuses : 2 fail(s)
    - Exec time: [0.82, 1.11] s

  * igt@kms_color@ctm-negative@pipe-a-hdmi-a-3-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [3.20, 5.65] s

  * igt@kms_color@ctm-negative@pipe-a-hdmi-a-3-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [0.65, 0.66] s

  * igt@kms_color@ctm-negative@pipe-a-hdmi-a-3-yuyv:
    - Statuses : 2 fail(s)
    - Exec time: [0.73, 0.88] s

  * igt@kms_color@ctm-negative@pipe-a-vga-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.52] s

  * igt@kms_color@ctm-negative@pipe-a-vga-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.56] s

  * igt@kms_color@ctm-negative@pipe-b-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.69] s

  * igt@kms_color@ctm-negative@pipe-b-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.44] s

  * igt@kms_color@ctm-negative@pipe-b-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.51] s

  * igt@kms_color@ctm-negative@pipe-b-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_color@ctm-negative@pipe-b-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.44] s

  * igt@kms_color@ctm-negative@pipe-b-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.45] s

  * igt@kms_color@ctm-negative@pipe-b-hdmi-a-1-fp16:
    - Statuses : 3 pass(s)
    - Exec time: [0.59, 1.22] s

  * igt@kms_color@ctm-negative@pipe-b-hdmi-a-1-nv12:
    - Statuses : 3 fail(s)
    - Exec time: [0.40, 0.84] s

  * igt@kms_color@ctm-negative@pipe-b-hdmi-a-1-p010:
    - Statuses : 3 fail(s)
    - Exec time: [0.47, 1.01] s

  * igt@kms_color@ctm-negative@pipe-b-hdmi-a-1-xrgb2101010:
    - Statuses : 4 pass(s)
    - Exec time: [0.63, 1.04] s

  * igt@kms_color@ctm-negative@pipe-b-hdmi-a-1-xrgb8888:
    - Statuses : 4 pass(s)
    - Exec time: [0.30, 0.67] s

  * igt@kms_color@ctm-negative@pipe-b-hdmi-a-1-yuyv:
    - Statuses : 3 fail(s)
    - Exec time: [0.38, 0.88] s

  * igt@kms_color@ctm-negative@pipe-b-hdmi-a-2-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.25] s

  * igt@kms_color@ctm-negative@pipe-b-hdmi-a-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.83] s

  * igt@kms_color@ctm-negative@pipe-b-hdmi-a-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [0.97] s

  * igt@kms_color@ctm-negative@pipe-b-hdmi-a-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.98] s

  * igt@kms_color@ctm-negative@pipe-b-hdmi-a-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.72] s

  * igt@kms_color@ctm-negative@pipe-b-hdmi-a-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.91] s

  * igt@kms_color@ctm-negative@pipe-b-hdmi-a-3-fp16:
    - Statuses : 2 pass(s)
    - Exec time: [1.07, 1.85] s

  * igt@kms_color@ctm-negative@pipe-b-hdmi-a-3-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [0.64, 0.75] s

  * igt@kms_color@ctm-negative@pipe-b-hdmi-a-3-p010:
    - Statuses : 2 fail(s)
    - Exec time: [0.78, 1.02] s

  * igt@kms_color@ctm-negative@pipe-b-hdmi-a-3-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [3.20, 6.12] s

  * igt@kms_color@ctm-negative@pipe-b-hdmi-a-3-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [0.51, 0.54] s

  * igt@kms_color@ctm-negative@pipe-b-hdmi-a-3-yuyv:
    - Statuses : 2 fail(s)
    - Exec time: [0.67, 0.87] s

  * igt@kms_color@ctm-negative@pipe-b-vga-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.53] s

  * igt@kms_color@ctm-negative@pipe-b-vga-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.43] s

  * igt@kms_color@ctm-negative@pipe-c-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.61] s

  * igt@kms_color@ctm-negative@pipe-c-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.44] s

  * igt@kms_color@ctm-negative@pipe-c-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.57] s

  * igt@kms_color@ctm-negative@pipe-c-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.37] s

  * igt@kms_color@ctm-negative@pipe-c-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.35] s

  * igt@kms_color@ctm-negative@pipe-c-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.49] s

  * igt@kms_color@ctm-negative@pipe-c-hdmi-a-1-fp16:
    - Statuses : 3 pass(s)
    - Exec time: [0.60, 1.22] s

  * igt@kms_color@ctm-negative@pipe-c-hdmi-a-1-nv12:
    - Statuses : 3 fail(s)
    - Exec time: [0.40, 0.85] s

  * igt@kms_color@ctm-negative@pipe-c-hdmi-a-1-p010:
    - Statuses : 3 fail(s)
    - Exec time: [0.47, 0.96] s

  * igt@kms_color@ctm-negative@pipe-c-hdmi-a-1-xrgb2101010:
    - Statuses : 3 pass(s)
    - Exec time: [0.64, 1.00] s

  * igt@kms_color@ctm-negative@pipe-c-hdmi-a-1-xrgb8888:
    - Statuses : 3 pass(s)
    - Exec time: [0.31, 0.69] s

  * igt@kms_color@ctm-negative@pipe-c-hdmi-a-1-yuyv:
    - Statuses : 3 fail(s)
    - Exec time: [0.38, 0.86] s

  * igt@kms_color@ctm-negative@pipe-c-hdmi-a-2-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.27] s

  * igt@kms_color@ctm-negative@pipe-c-hdmi-a-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.82] s

  * igt@kms_color@ctm-negative@pipe-c-hdmi-a-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [0.97] s

  * igt@kms_color@ctm-negative@pipe-c-hdmi-a-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.99] s

  * igt@kms_color@ctm-negative@pipe-c-hdmi-a-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.68] s

  * igt@kms_color@ctm-negative@pipe-c-hdmi-a-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.87] s

  * igt@kms_color@ctm-negative@pipe-c-hdmi-a-3-fp16:
    - Statuses : 2 pass(s)
    - Exec time: [1.07, 1.74] s

  * igt@kms_color@ctm-negative@pipe-c-hdmi-a-3-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [0.64, 0.77] s

  * igt@kms_color@ctm-negative@pipe-c-hdmi-a-3-p010:
    - Statuses : 2 fail(s)
    - Exec time: [0.76, 1.03] s

  * igt@kms_color@ctm-negative@pipe-c-hdmi-a-3-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [3.22, 6.10] s

  * igt@kms_color@ctm-negative@pipe-c-hdmi-a-3-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [0.49, 0.54] s

  * igt@kms_color@ctm-negative@pipe-c-hdmi-a-3-yuyv:
    - Statuses : 2 fail(s)
    - Exec time: [0.67, 0.83] s

  * igt@kms_color@ctm-negative@pipe-d-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.64] s

  * igt@kms_color@ctm-negative@pipe-d-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.43] s

  * igt@kms_color@ctm-negative@pipe-d-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.57] s

  * igt@kms_color@ctm-negative@pipe-d-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_color@ctm-negative@pipe-d-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.40] s

  * igt@kms_color@ctm-negative@pipe-d-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.41] s

  * igt@kms_color@ctm-negative@pipe-d-hdmi-a-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [0.60] s

  * igt@kms_color@ctm-negative@pipe-d-hdmi-a-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.41] s

  * igt@kms_color@ctm-negative@pipe-d-hdmi-a-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [0.46] s

  * igt@kms_color@ctm-negative@pipe-d-hdmi-a-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.63] s

  * igt@kms_color@ctm-negative@pipe-d-hdmi-a-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.31] s

  * igt@kms_color@ctm-negative@pipe-d-hdmi-a-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.40] s

  * igt@kms_color@ctm-negative@pipe-d-hdmi-a-3-fp16:
    - Statuses : 2 pass(s)
    - Exec time: [1.14, 1.85] s

  * igt@kms_color@ctm-negative@pipe-d-hdmi-a-3-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [0.63, 0.75] s

  * igt@kms_color@ctm-negative@pipe-d-hdmi-a-3-p010:
    - Statuses : 2 fail(s)
    - Exec time: [0.78, 1.02] s

  * igt@kms_color@ctm-negative@pipe-d-hdmi-a-3-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [3.20, 6.08] s

  * igt@kms_color@ctm-negative@pipe-d-hdmi-a-3-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [0.52] s

  * igt@kms_color@ctm-negative@pipe-d-hdmi-a-3-yuyv:
    - Statuses : 2 fail(s)
    - Exec time: [0.66, 0.82] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.61] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.50] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.56] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.72] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.52] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-1-fp16:
    - Statuses : 3 pass(s)
    - Exec time: [0.68, 1.41] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-1-nv12:
    - Statuses : 3 fail(s)
    - Exec time: [0.40, 0.84] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-1-p010:
    - Statuses : 3 fail(s)
    - Exec time: [0.48, 1.01] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-1-xrgb2101010:
    - Statuses : 4 pass(s)
    - Exec time: [0.64, 1.03] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-1-xrgb8888:
    - Statuses : 4 pass(s)
    - Exec time: [0.30, 0.93] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-1-yuyv:
    - Statuses : 3 fail(s)
    - Exec time: [0.44, 0.96] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-2-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.30] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.86] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.00] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.99] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.69] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.89] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-3-fp16:
    - Statuses : 2 pass(s)
    - Exec time: [1.22, 2.37] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-3-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [0.62, 0.79] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-3-p010:
    - Statuses : 2 fail(s)
    - Exec time: [0.82, 1.19] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-3-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [3.17, 6.35] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-3-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [0.68, 0.69] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-3-yuyv:
    - Statuses : 2 fail(s)
    - Exec time: [0.71, 0.96] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-vga-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.53] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-vga-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.53] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.61] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.46] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.58] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.46] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.42] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.48] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-1-fp16:
    - Statuses : 3 pass(s)
    - Exec time: [0.59, 1.32] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-1-nv12:
    - Statuses : 3 fail(s)
    - Exec time: [0.39, 0.84] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-1-p010:
    - Statuses : 3 fail(s)
    - Exec time: [0.46, 1.00] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-1-xrgb2101010:
    - Statuses : 4 pass(s)
    - Exec time: [0.64, 1.03] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-1-xrgb8888:
    - Statuses : 4 pass(s)
    - Exec time: [0.30, 0.74] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-1-yuyv:
    - Statuses : 3 fail(s)
    - Exec time: [0.38, 0.93] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-2-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.30] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.85] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [0.98] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.00] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.68] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.88] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-3-fp16:
    - Statuses : 2 pass(s)
    - Exec time: [1.03, 1.92] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-3-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [0.62, 0.77] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-3-p010:
    - Statuses : 2 fail(s)
    - Exec time: [0.78, 1.12] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-3-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [3.17, 6.34] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-3-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [0.51, 0.54] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-3-yuyv:
    - Statuses : 2 fail(s)
    - Exec time: [0.65, 0.90] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-vga-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.52] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-vga-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.43] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.61] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.44] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.57] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.41] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-1-fp16:
    - Statuses : 3 pass(s)
    - Exec time: [0.61, 1.30] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-1-nv12:
    - Statuses : 3 fail(s)
    - Exec time: [0.40, 0.84] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-1-p010:
    - Statuses : 3 fail(s)
    - Exec time: [0.47, 0.97] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-1-xrgb2101010:
    - Statuses : 3 pass(s)
    - Exec time: [0.63, 1.01] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-1-xrgb8888:
    - Statuses : 3 pass(s)
    - Exec time: [0.31, 0.67] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-1-yuyv:
    - Statuses : 3 fail(s)
    - Exec time: [0.38, 0.87] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-2-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.87] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [0.98] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.04] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.67] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.86] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-3-fp16:
    - Statuses : 2 pass(s)
    - Exec time: [1.07, 2.11] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-3-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [0.64, 0.77] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-3-p010:
    - Statuses : 2 fail(s)
    - Exec time: [0.79, 1.07] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-3-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [3.17, 6.34] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-3-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [0.49, 0.53] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-3-yuyv:
    - Statuses : 2 fail(s)
    - Exec time: [0.67, 0.87] s

  * igt@kms_color@ctm-red-to-blue@pipe-d-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.65] s

  * igt@kms_color@ctm-red-to-blue@pipe-d-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.43] s

  * igt@kms_color@ctm-red-to-blue@pipe-d-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.57] s

  * igt@kms_color@ctm-red-to-blue@pipe-d-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_color@ctm-red-to-blue@pipe-d-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_color@ctm-red-to-blue@pipe-d-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.40] s

  * igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [0.61] s

  * igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.41] s

  * igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [0.47] s

  * igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.63] s

  * igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.29] s

  * igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.41] s

  * igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-3-fp16:
    - Statuses : 2 pass(s)
    - Exec time: [1.09, 2.11] s

  * igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-3-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [0.64, 0.77] s

  * igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-3-p010:
    - Statuses : 2 fail(s)
    - Exec time: [0.76, 1.12] s

  * igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-3-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [3.17, 6.34] s

  * igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-3-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [0.54, 0.55] s

  * igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-3-yuyv:
    - Statuses : 2 fail(s)
    - Exec time: [0.65, 0.89] s

  * igt@kms_color@ctm-signed@pipe-a-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.61] s

  * igt@kms_color@ctm-signed@pipe-a-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [4.29] s

  * igt@kms_color@ctm-signed@pipe-a-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [4.62] s

  * igt@kms_color@ctm-signed@pipe-a-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.81] s

  * igt@kms_color@ctm-signed@pipe-a-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [2.18] s

  * igt@kms_color@ctm-signed@pipe-a-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.40] s

  * igt@kms_color@ctm-signed@pipe-a-hdmi-a-1-fp16:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [0.71, 4.12] s

  * igt@kms_color@ctm-signed@pipe-a-hdmi-a-1-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [1.21, 2.68] s

  * igt@kms_color@ctm-signed@pipe-a-hdmi-a-1-p010:
    - Statuses : 2 fail(s)
    - Exec time: [1.38, 2.97] s

  * igt@kms_color@ctm-signed@pipe-a-hdmi-a-1-xrgb2101010:
    - Statuses : 3 pass(s)
    - Exec time: [1.02, 1.59] s

  * igt@kms_color@ctm-signed@pipe-a-hdmi-a-1-xrgb8888:
    - Statuses : 3 pass(s)
    - Exec time: [0.55, 1.03] s

  * igt@kms_color@ctm-signed@pipe-a-hdmi-a-1-yuyv:
    - Statuses : 2 fail(s)
    - Exec time: [1.14, 2.76] s

  * igt@kms_color@ctm-signed@pipe-a-hdmi-a-2-fp16:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [0.76, 4.01] s

  * igt@kms_color@ctm-signed@pipe-a-hdmi-a-2-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [1.46, 2.42] s

  * igt@kms_color@ctm-signed@pipe-a-hdmi-a-2-p010:
    - Statuses : 2 fail(s)
    - Exec time: [1.70, 2.93] s

  * igt@kms_color@ctm-signed@pipe-a-hdmi-a-2-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [1.03, 1.39] s

  * igt@kms_color@ctm-signed@pipe-a-hdmi-a-2-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [0.71, 1.02] s

  * igt@kms_color@ctm-signed@pipe-a-hdmi-a-2-yuyv:
    - Statuses : 2 fail(s)
    - Exec time: [1.52, 2.52] s

  * igt@kms_color@ctm-signed@pipe-a-hdmi-a-3-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [2.05] s

  * igt@kms_color@ctm-signed@pipe-a-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.32] s

  * igt@kms_color@ctm-signed@pipe-a-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [3.08] s

  * igt@kms_color@ctm-signed@pipe-a-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [12.24] s

  * igt@kms_color@ctm-signed@pipe-a-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.21] s

  * igt@kms_color@ctm-signed@pipe-a-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [2.63] s

  * igt@kms_color@ctm-signed@pipe-a-hdmi-a-4-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.23] s

  * igt@kms_color@ctm-signed@pipe-a-hdmi-a-4-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.86] s

  * igt@kms_color@ctm-signed@pipe-a-hdmi-a-4-p010:
    - Statuses : 1 fail(s)
    - Exec time: [2.30] s

  * igt@kms_color@ctm-signed@pipe-a-hdmi-a-4-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [6.36] s

  * igt@kms_color@ctm-signed@pipe-a-hdmi-a-4-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.14] s

  * igt@kms_color@ctm-signed@pipe-a-hdmi-a-4-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [2.01] s

  * igt@kms_color@ctm-signed@pipe-a-vga-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.05] s

  * igt@kms_color@ctm-signed@pipe-a-vga-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.97] s

  * igt@kms_color@ctm-signed@pipe-b-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.60] s

  * igt@kms_color@ctm-signed@pipe-b-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [4.27] s

  * igt@kms_color@ctm-signed@pipe-b-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [4.65] s

  * igt@kms_color@ctm-signed@pipe-b-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.81] s

  * igt@kms_color@ctm-signed@pipe-b-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [2.83] s

  * igt@kms_color@ctm-signed@pipe-b-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.47] s

  * igt@kms_color@ctm-signed@pipe-b-hdmi-a-1-fp16:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [0.61, 3.91] s

  * igt@kms_color@ctm-signed@pipe-b-hdmi-a-1-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [1.17, 2.45] s

  * igt@kms_color@ctm-signed@pipe-b-hdmi-a-1-p010:
    - Statuses : 2 fail(s)
    - Exec time: [1.36, 3.02] s

  * igt@kms_color@ctm-signed@pipe-b-hdmi-a-1-xrgb2101010:
    - Statuses : 3 pass(s)
    - Exec time: [1.02, 1.59] s

  * igt@kms_color@ctm-signed@pipe-b-hdmi-a-1-xrgb8888:
    - Statuses : 3 pass(s)
    - Exec time: [0.56, 1.02] s

  * igt@kms_color@ctm-signed@pipe-b-hdmi-a-1-yuyv:
    - Statuses : 2 fail(s)
    - Exec time: [1.12, 2.58] s

  * igt@kms_color@ctm-signed@pipe-b-hdmi-a-2-fp16:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [0.67, 3.94] s

  * igt@kms_color@ctm-signed@pipe-b-hdmi-a-2-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [1.45, 2.54] s

  * igt@kms_color@ctm-signed@pipe-b-hdmi-a-2-p010:
    - Statuses : 2 fail(s)
    - Exec time: [1.70, 2.90] s

  * igt@kms_color@ctm-signed@pipe-b-hdmi-a-2-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [1.01, 1.39] s

  * igt@kms_color@ctm-signed@pipe-b-hdmi-a-2-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [0.68, 0.89] s

  * igt@kms_color@ctm-signed@pipe-b-hdmi-a-2-yuyv:
    - Statuses : 2 fail(s)
    - Exec time: [1.50, 2.54] s

  * igt@kms_color@ctm-signed@pipe-b-hdmi-a-3-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.77] s

  * igt@kms_color@ctm-signed@pipe-b-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.24] s

  * igt@kms_color@ctm-signed@pipe-b-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [3.12] s

  * igt@kms_color@ctm-signed@pipe-b-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [12.24] s

  * igt@kms_color@ctm-signed@pipe-b-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.98] s

  * igt@kms_color@ctm-signed@pipe-b-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [2.49] s

  * igt@kms_color@ctm-signed@pipe-b-hdmi-a-4-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.07] s

  * igt@kms_color@ctm-signed@pipe-b-hdmi-a-4-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.84] s

  * igt@kms_color@ctm-signed@pipe-b-hdmi-a-4-p010:
    - Statuses : 1 fail(s)
    - Exec time: [2.35] s

  * igt@kms_color@ctm-signed@pipe-b-hdmi-a-4-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [6.33] s

  * igt@kms_color@ctm-signed@pipe-b-hdmi-a-4-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.99] s

  * igt@kms_color@ctm-signed@pipe-b-hdmi-a-4-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.96] s

  * igt@kms_color@ctm-signed@pipe-b-vga-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.06] s

  * igt@kms_color@ctm-signed@pipe-b-vga-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.85] s

  * igt@kms_color@ctm-signed@pipe-c-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.61] s

  * igt@kms_color@ctm-signed@pipe-c-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [4.27] s

  * igt@kms_color@ctm-signed@pipe-c-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [4.64] s

  * igt@kms_color@ctm-signed@pipe-c-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.72] s

  * igt@kms_color@ctm-signed@pipe-c-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [2.69] s

  * igt@kms_color@ctm-signed@pipe-c-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.28] s

  * igt@kms_color@ctm-signed@pipe-c-hdmi-a-1-fp16:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [0.61, 3.96] s

  * igt@kms_color@ctm-signed@pipe-c-hdmi-a-1-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [1.16, 2.49] s

  * igt@kms_color@ctm-signed@pipe-c-hdmi-a-1-p010:
    - Statuses : 2 fail(s)
    - Exec time: [1.35, 2.93] s

  * igt@kms_color@ctm-signed@pipe-c-hdmi-a-1-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [0.99, 1.27] s

  * igt@kms_color@ctm-signed@pipe-c-hdmi-a-1-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [0.56, 0.70] s

  * igt@kms_color@ctm-signed@pipe-c-hdmi-a-1-yuyv:
    - Statuses : 2 fail(s)
    - Exec time: [1.14, 2.63] s

  * igt@kms_color@ctm-signed@pipe-c-hdmi-a-2-fp16:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [0.69, 3.94] s

  * igt@kms_color@ctm-signed@pipe-c-hdmi-a-2-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [1.48, 2.44] s

  * igt@kms_color@ctm-signed@pipe-c-hdmi-a-2-p010:
    - Statuses : 2 fail(s)
    - Exec time: [1.68, 2.94] s

  * igt@kms_color@ctm-signed@pipe-c-hdmi-a-2-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [1.01, 1.41] s

  * igt@kms_color@ctm-signed@pipe-c-hdmi-a-2-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [0.68, 0.89] s

  * igt@kms_color@ctm-signed@pipe-c-hdmi-a-2-yuyv:
    - Statuses : 2 fail(s)
    - Exec time: [1.50, 2.58] s

  * igt@kms_color@ctm-signed@pipe-c-hdmi-a-3-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.85] s

  * igt@kms_color@ctm-signed@pipe-c-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.24] s

  * igt@kms_color@ctm-signed@pipe-c-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [3.09] s

  * igt@kms_color@ctm-signed@pipe-c-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [12.24] s

  * igt@kms_color@ctm-signed@pipe-c-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.97] s

  * igt@kms_color@ctm-signed@pipe-c-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [2.49] s

  * igt@kms_color@ctm-signed@pipe-c-hdmi-a-4-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.04] s

  * igt@kms_color@ctm-signed@pipe-c-hdmi-a-4-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.86] s

  * igt@kms_color@ctm-signed@pipe-c-hdmi-a-4-p010:
    - Statuses : 1 fail(s)
    - Exec time: [2.29] s

  * igt@kms_color@ctm-signed@pipe-c-hdmi-a-4-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [6.37] s

  * igt@kms_color@ctm-signed@pipe-c-hdmi-a-4-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.97] s

  * igt@kms_color@ctm-signed@pipe-c-hdmi-a-4-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.98] s

  * igt@kms_color@ctm-signed@pipe-d-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.60] s

  * igt@kms_color@ctm-signed@pipe-d-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [4.27] s

  * igt@kms_color@ctm-signed@pipe-d-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [4.58] s

  * igt@kms_color@ctm-signed@pipe-d-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.69] s

  * igt@kms_color@ctm-signed@pipe-d-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [2.71] s

  * igt@kms_color@ctm-signed@pipe-d-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.32] s

  * igt@kms_color@ctm-signed@pipe-d-hdmi-a-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [0.60] s

  * igt@kms_color@ctm-signed@pipe-d-hdmi-a-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.21] s

  * igt@kms_color@ctm-signed@pipe-d-hdmi-a-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.38] s

  * igt@kms_color@ctm-signed@pipe-d-hdmi-a-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.28] s

  * igt@kms_color@ctm-signed@pipe-d-hdmi-a-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.55] s

  * igt@kms_color@ctm-signed@pipe-d-hdmi-a-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.14] s

  * igt@kms_color@ctm-signed@pipe-d-hdmi-a-3-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.77] s

  * igt@kms_color@ctm-signed@pipe-d-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.21] s

  * igt@kms_color@ctm-signed@pipe-d-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [3.10] s

  * igt@kms_color@ctm-signed@pipe-d-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [12.22] s

  * igt@kms_color@ctm-signed@pipe-d-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.00] s

  * igt@kms_color@ctm-signed@pipe-d-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [2.47] s

  * igt@kms_color@ctm-signed@pipe-d-hdmi-a-4-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.02] s

  * igt@kms_color@ctm-signed@pipe-d-hdmi-a-4-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.82] s

  * igt@kms_color@ctm-signed@pipe-d-hdmi-a-4-p010:
    - Statuses : 1 fail(s)
    - Exec time: [2.32] s

  * igt@kms_color@ctm-signed@pipe-d-hdmi-a-4-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [6.36] s

  * igt@kms_color@ctm-signed@pipe-d-hdmi-a-4-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.99] s

  * igt@kms_color@ctm-signed@pipe-d-hdmi-a-4-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.96] s

  * igt@kms_color@degamma@pipe-a-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.59] s

  * igt@kms_color@degamma@pipe-a-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.55] s

  * igt@kms_color@degamma@pipe-a-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.60] s

  * igt@kms_color@degamma@pipe-a-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.42] s

  * igt@kms_color@degamma@pipe-a-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.75] s

  * igt@kms_color@degamma@pipe-a-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.49] s

  * igt@kms_color@degamma@pipe-a-hdmi-a-1-fp16:
    - Statuses : 3 pass(s)
    - Exec time: [0.81, 1.34] s

  * igt@kms_color@degamma@pipe-a-hdmi-a-1-nv12:
    - Statuses : 3 fail(s)
    - Exec time: [0.56, 0.79] s

  * igt@kms_color@degamma@pipe-a-hdmi-a-1-p010:
    - Statuses : 3 fail(s)
    - Exec time: [0.61, 0.97] s

  * igt@kms_color@degamma@pipe-a-hdmi-a-1-xrgb2101010:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.0, 3.20] s

  * igt@kms_color@degamma@pipe-a-hdmi-a-1-xrgb8888:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.94] s

  * igt@kms_color@degamma@pipe-a-hdmi-a-1-yuyv:
    - Statuses : 1 fail(s) 2 pass(s)
    - Exec time: [0.55, 0.85] s

  * igt@kms_color@degamma@pipe-a-hdmi-a-2-fp16:
    - Statuses : 2 pass(s)
    - Exec time: [0.74, 1.25] s

  * igt@kms_color@degamma@pipe-a-hdmi-a-2-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [0.51, 0.81] s

  * igt@kms_color@degamma@pipe-a-hdmi-a-2-p010:
    - Statuses : 2 fail(s)
    - Exec time: [0.58, 0.95] s

  * igt@kms_color@degamma@pipe-a-hdmi-a-2-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [0.67, 0.97] s

  * igt@kms_color@degamma@pipe-a-hdmi-a-2-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [0.57, 0.70] s

  * igt@kms_color@degamma@pipe-a-hdmi-a-2-yuyv:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [0.52, 0.82] s

  * igt@kms_color@degamma@pipe-a-hdmi-a-3-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [2.34] s

  * igt@kms_color@degamma@pipe-a-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.82] s

  * igt@kms_color@degamma@pipe-a-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.31] s

  * igt@kms_color@degamma@pipe-a-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [6.65] s

  * igt@kms_color@degamma@pipe-a-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.67] s

  * igt@kms_color@degamma@pipe-a-hdmi-a-3-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.99] s

  * igt@kms_color@degamma@pipe-a-vga-1-xrgb2101010:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@degamma@pipe-a-vga-1-xrgb8888:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@degamma@pipe-b-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.61] s

  * igt@kms_color@degamma@pipe-b-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.53] s

  * igt@kms_color@degamma@pipe-b-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.57] s

  * igt@kms_color@degamma@pipe-b-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_color@degamma@pipe-b-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.43] s

  * igt@kms_color@degamma@pipe-b-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.49] s

  * igt@kms_color@degamma@pipe-b-hdmi-a-1-fp16:
    - Statuses : 3 pass(s)
    - Exec time: [0.74, 1.25] s

  * igt@kms_color@degamma@pipe-b-hdmi-a-1-nv12:
    - Statuses : 3 fail(s)
    - Exec time: [0.54, 0.81] s

  * igt@kms_color@degamma@pipe-b-hdmi-a-1-p010:
    - Statuses : 3 fail(s)
    - Exec time: [0.58, 0.96] s

  * igt@kms_color@degamma@pipe-b-hdmi-a-1-xrgb2101010:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.0, 3.21] s

  * igt@kms_color@degamma@pipe-b-hdmi-a-1-xrgb8888:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.68] s

  * igt@kms_color@degamma@pipe-b-hdmi-a-1-yuyv:
    - Statuses : 1 fail(s) 2 pass(s)
    - Exec time: [0.51, 0.82] s

  * igt@kms_color@degamma@pipe-b-hdmi-a-2-fp16:
    - Statuses : 2 pass(s)
    - Exec time: [0.67, 1.24] s

  * igt@kms_color@degamma@pipe-b-hdmi-a-2-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [0.48, 0.83] s

  * igt@kms_color@degamma@pipe-b-hdmi-a-2-p010:
    - Statuses : 2 fail(s)
    - Exec time: [0.54, 0.95] s

  * igt@kms_color@degamma@pipe-b-hdmi-a-2-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [0.67, 0.97] s

  * igt@kms_color@degamma@pipe-b-hdmi-a-2-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [0.46, 0.68] s

  * igt@kms_color@degamma@pipe-b-hdmi-a-2-yuyv:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [0.48, 0.82] s

  * igt@kms_color@degamma@pipe-b-hdmi-a-3-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [2.15] s

  * igt@kms_color@degamma@pipe-b-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.85] s

  * igt@kms_color@degamma@pipe-b-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.14] s

  * igt@kms_color@degamma@pipe-b-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [6.60] s

  * igt@kms_color@degamma@pipe-b-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.53] s

  * igt@kms_color@degamma@pipe-b-hdmi-a-3-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.94] s

  * igt@kms_color@degamma@pipe-b-vga-1-xrgb2101010:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@degamma@pipe-b-vga-1-xrgb8888:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@degamma@pipe-c-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.61] s

  * igt@kms_color@degamma@pipe-c-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.53] s

  * igt@kms_color@degamma@pipe-c-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.57] s

  * igt@kms_color@degamma@pipe-c-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_color@degamma@pipe-c-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_color@degamma@pipe-c-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.45] s

  * igt@kms_color@degamma@pipe-c-hdmi-a-1-fp16:
    - Statuses : 3 pass(s)
    - Exec time: [0.76, 1.23] s

  * igt@kms_color@degamma@pipe-c-hdmi-a-1-nv12:
    - Statuses : 3 fail(s)
    - Exec time: [0.54, 0.81] s

  * igt@kms_color@degamma@pipe-c-hdmi-a-1-p010:
    - Statuses : 3 fail(s)
    - Exec time: [0.60, 0.98] s

  * igt@kms_color@degamma@pipe-c-hdmi-a-1-xrgb2101010:
    - Statuses : 3 pass(s)
    - Exec time: [0.78, 3.22] s

  * igt@kms_color@degamma@pipe-c-hdmi-a-1-xrgb8888:
    - Statuses : 3 pass(s)
    - Exec time: [0.50, 0.68] s

  * igt@kms_color@degamma@pipe-c-hdmi-a-1-yuyv:
    - Statuses : 1 fail(s) 2 pass(s)
    - Exec time: [0.51, 0.83] s

  * igt@kms_color@degamma@pipe-c-hdmi-a-2-fp16:
    - Statuses : 2 pass(s)
    - Exec time: [0.65, 1.25] s

  * igt@kms_color@degamma@pipe-c-hdmi-a-2-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [0.50, 0.82] s

  * igt@kms_color@degamma@pipe-c-hdmi-a-2-p010:
    - Statuses : 2 fail(s)
    - Exec time: [0.54, 0.95] s

  * igt@kms_color@degamma@pipe-c-hdmi-a-2-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [0.67, 0.97] s

  * igt@kms_color@degamma@pipe-c-hdmi-a-2-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [0.47, 0.70] s

  * igt@kms_color@degamma@pipe-c-hdmi-a-2-yuyv:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [0.48, 0.83] s

  * igt@kms_color@degamma@pipe-c-hdmi-a-3-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [2.22] s

  * igt@kms_color@degamma@pipe-c-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.83] s

  * igt@kms_color@degamma@pipe-c-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.19] s

  * igt@kms_color@degamma@pipe-c-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [6.62] s

  * igt@kms_color@degamma@pipe-c-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.51] s

  * igt@kms_color@degamma@pipe-c-hdmi-a-3-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.94] s

  * igt@kms_color@degamma@pipe-d-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.65] s

  * igt@kms_color@degamma@pipe-d-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.43] s

  * igt@kms_color@degamma@pipe-d-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.58] s

  * igt@kms_color@degamma@pipe-d-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.35] s

  * igt@kms_color@degamma@pipe-d-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.40] s

  * igt@kms_color@degamma@pipe-d-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.52] s

  * igt@kms_color@degamma@pipe-d-hdmi-a-1-fp16:
    - Statuses : 2 pass(s)
    - Exec time: [0.74, 1.09] s

  * igt@kms_color@degamma@pipe-d-hdmi-a-1-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [0.54, 0.62] s

  * igt@kms_color@degamma@pipe-d-hdmi-a-1-p010:
    - Statuses : 2 fail(s)
    - Exec time: [0.58, 0.77] s

  * igt@kms_color@degamma@pipe-d-hdmi-a-1-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [0.78, 3.21] s

  * igt@kms_color@degamma@pipe-d-hdmi-a-1-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [0.51, 0.53] s

  * igt@kms_color@degamma@pipe-d-hdmi-a-1-yuyv:
    - Statuses : 2 pass(s)
    - Exec time: [0.51, 0.67] s

  * igt@kms_color@degamma@pipe-d-hdmi-a-3-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [2.39] s

  * igt@kms_color@degamma@pipe-d-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.82] s

  * igt@kms_color@degamma@pipe-d-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.19] s

  * igt@kms_color@degamma@pipe-d-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [6.62] s

  * igt@kms_color@degamma@pipe-d-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.55] s

  * igt@kms_color@degamma@pipe-d-hdmi-a-3-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.91] s

  * igt@kms_color@gamma@pipe-a-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.62] s

  * igt@kms_color@gamma@pipe-a-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.55] s

  * igt@kms_color@gamma@pipe-a-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.58] s

  * igt@kms_color@gamma@pipe-a-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.44] s

  * igt@kms_color@gamma@pipe-a-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.72] s

  * igt@kms_color@gamma@pipe-a-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.53] s

  * igt@kms_color@gamma@pipe-a-hdmi-a-1-fp16:
    - Statuses : 3 pass(s)
    - Exec time: [0.70, 1.27] s

  * igt@kms_color@gamma@pipe-a-hdmi-a-1-nv12:
    - Statuses : 3 fail(s)
    - Exec time: [0.40, 0.65] s

  * igt@kms_color@gamma@pipe-a-hdmi-a-1-p010:
    - Statuses : 3 fail(s)
    - Exec time: [0.46, 0.83] s

  * igt@kms_color@gamma@pipe-a-hdmi-a-1-xrgb2101010:
    - Statuses : 4 pass(s)
    - Exec time: [0.63, 3.17] s

  * igt@kms_color@gamma@pipe-a-hdmi-a-1-xrgb8888:
    - Statuses : 4 pass(s)
    - Exec time: [0.32, 0.65] s

  * igt@kms_color@gamma@pipe-a-hdmi-a-1-yuyv:
    - Statuses : 3 pass(s)
    - Exec time: [0.38, 0.65] s

  * igt@kms_color@gamma@pipe-a-hdmi-a-3-fp16:
    - Statuses : 1 fail(s)
    - Exec time: [2.03] s

  * igt@kms_color@gamma@pipe-a-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.74] s

  * igt@kms_color@gamma@pipe-a-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.06] s

  * igt@kms_color@gamma@pipe-a-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [6.02] s

  * igt@kms_color@gamma@pipe-a-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.65] s

  * igt@kms_color@gamma@pipe-a-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.91] s

  * igt@kms_color@gamma@pipe-a-vga-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.51] s

  * igt@kms_color@gamma@pipe-a-vga-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.50] s

  * igt@kms_color@gamma@pipe-b-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.64] s

  * igt@kms_color@gamma@pipe-b-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.43] s

  * igt@kms_color@gamma@pipe-b-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.51] s

  * igt@kms_color@gamma@pipe-b-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.40] s

  * igt@kms_color@gamma@pipe-b-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.43] s

  * igt@kms_color@gamma@pipe-b-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.48] s

  * igt@kms_color@gamma@pipe-b-hdmi-a-1-fp16:
    - Statuses : 3 pass(s)
    - Exec time: [0.61, 1.09] s

  * igt@kms_color@gamma@pipe-b-hdmi-a-1-nv12:
    - Statuses : 3 fail(s)
    - Exec time: [0.39, 0.62] s

  * igt@kms_color@gamma@pipe-b-hdmi-a-1-p010:
    - Statuses : 3 fail(s)
    - Exec time: [0.44, 0.78] s

  * igt@kms_color@gamma@pipe-b-hdmi-a-1-xrgb2101010:
    - Statuses : 4 pass(s)
    - Exec time: [0.64, 3.19] s

  * igt@kms_color@gamma@pipe-b-hdmi-a-1-xrgb8888:
    - Statuses : 4 pass(s)
    - Exec time: [0.29, 0.52] s

  * igt@kms_color@gamma@pipe-b-hdmi-a-1-yuyv:
    - Statuses : 3 pass(s)
    - Exec time: [0.38, 0.62] s

  * igt@kms_color@gamma@pipe-b-hdmi-a-3-fp16:
    - Statuses : 1 fail(s)
    - Exec time: [1.61] s

  * igt@kms_color@gamma@pipe-b-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.75] s

  * igt@kms_color@gamma@pipe-b-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [0.97] s

  * igt@kms_color@gamma@pipe-b-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.66] s

  * igt@kms_color@gamma@pipe-b-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.47] s

  * igt@kms_color@gamma@pipe-b-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.80] s

  * igt@kms_color@gamma@pipe-b-vga-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.51] s

  * igt@kms_color@gamma@pipe-b-vga-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.41] s

  * igt@kms_color@gamma@pipe-c-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.63] s

  * igt@kms_color@gamma@pipe-c-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.43] s

  * igt@kms_color@gamma@pipe-c-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.47] s

  * igt@kms_color@gamma@pipe-c-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.35] s

  * igt@kms_color@gamma@pipe-c-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_color@gamma@pipe-c-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.42] s

  * igt@kms_color@gamma@pipe-c-hdmi-a-1-fp16:
    - Statuses : 3 pass(s)
    - Exec time: [0.60, 1.05] s

  * igt@kms_color@gamma@pipe-c-hdmi-a-1-nv12:
    - Statuses : 3 fail(s)
    - Exec time: [0.39, 0.59] s

  * igt@kms_color@gamma@pipe-c-hdmi-a-1-p010:
    - Statuses : 3 fail(s)
    - Exec time: [0.43, 0.79] s

  * igt@kms_color@gamma@pipe-c-hdmi-a-1-xrgb2101010:
    - Statuses : 3 pass(s)
    - Exec time: [0.63, 3.19] s

  * igt@kms_color@gamma@pipe-c-hdmi-a-1-xrgb8888:
    - Statuses : 3 pass(s)
    - Exec time: [0.30, 0.50] s

  * igt@kms_color@gamma@pipe-c-hdmi-a-1-yuyv:
    - Statuses : 3 pass(s)
    - Exec time: [0.37, 0.65] s

  * igt@kms_color@gamma@pipe-c-hdmi-a-3-fp16:
    - Statuses : 1 fail(s)
    - Exec time: [1.88] s

  * igt@kms_color@gamma@pipe-c-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.75] s

  * igt@kms_color@gamma@pipe-c-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [0.99] s

  * igt@kms_color@gamma@pipe-c-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [6.05] s

  * igt@kms_color@gamma@pipe-c-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.48] s

  * igt@kms_color@gamma@pipe-c-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.82] s

  * igt@kms_color@gamma@pipe-d-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.60] s

  * igt@kms_color@gamma@pipe-d-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.43] s

  * igt@kms_color@gamma@pipe-d-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.51] s

  * igt@kms_color@gamma@pipe-d-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_color@gamma@pipe-d-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_color@gamma@pipe-d-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.43] s

  * igt@kms_color@gamma@pipe-d-hdmi-a-1-fp16:
    - Statuses : 2 pass(s)
    - Exec time: [0.59, 1.07] s

  * igt@kms_color@gamma@pipe-d-hdmi-a-1-nv12:
    - Statuses : 2 fail(s)
    - Exec time: [0.39, 0.61] s

  * igt@kms_color@gamma@pipe-d-hdmi-a-1-p010:
    - Statuses : 2 fail(s)
    - Exec time: [0.44, 0.79] s

  * igt@kms_color@gamma@pipe-d-hdmi-a-1-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [0.64, 3.21] s

  * igt@kms_color@gamma@pipe-d-hdmi-a-1-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [0.30, 0.52] s

  * igt@kms_color@gamma@pipe-d-hdmi-a-1-yuyv:
    - Statuses : 2 pass(s)
    - Exec time: [0.37, 0.65] s

  * igt@kms_color@gamma@pipe-d-hdmi-a-3-fp16:
    - Statuses : 1 fail(s)
    - Exec time: [1.76] s

  * igt@kms_color@gamma@pipe-d-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.73] s

  * igt@kms_color@gamma@pipe-d-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [0.99] s

  * igt@kms_color@gamma@pipe-d-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [6.02] s

  * igt@kms_color@gamma@pipe-d-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.52] s

  * igt@kms_color@gamma@pipe-d-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.80] s

  * igt@kms_color@legacy-gamma-reset@pipe-a-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.39] s

  * igt@kms_color@legacy-gamma-reset@pipe-a-hdmi-a-1-xrgb8888:
    - Statuses : 4 pass(s)
    - Exec time: [0.00, 0.63] s

  * igt@kms_color@legacy-gamma-reset@pipe-a-hdmi-a-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_color@legacy-gamma-reset@pipe-a-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.24] s

  * igt@kms_color@legacy-gamma-reset@pipe-a-hdmi-a-4-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.27] s

  * igt@kms_color@legacy-gamma-reset@pipe-a-vga-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.25] s

  * igt@kms_color@legacy-gamma-reset@pipe-b-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_color@legacy-gamma-reset@pipe-b-hdmi-a-1-xrgb8888:
    - Statuses : 4 pass(s)
    - Exec time: [0.00, 0.03] s

  * igt@kms_color@legacy-gamma-reset@pipe-b-hdmi-a-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_color@legacy-gamma-reset@pipe-b-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_color@legacy-gamma-reset@pipe-b-hdmi-a-4-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@kms_color@legacy-gamma-reset@pipe-b-vga-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_color@legacy-gamma-reset@pipe-c-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_color@legacy-gamma-reset@pipe-c-hdmi-a-1-xrgb8888:
    - Statuses : 3 pass(s)
    - Exec time: [0.01, 0.03] s

  * igt@kms_color@legacy-gamma-reset@pipe-c-hdmi-a-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_color@legacy-gamma-reset@pipe-c-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_color@legacy-gamma-reset@pipe-c-hdmi-a-4-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_color@legacy-gamma-reset@pipe-d-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_color@legacy-gamma-reset@pipe-d-hdmi-a-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_color@legacy-gamma-reset@pipe-d-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_color@legacy-gamma-reset@pipe-d-hdmi-a-4-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_color@legacy-gamma@pipe-a-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.72] s

  * igt@kms_color@legacy-gamma@pipe-a-hdmi-a-1-xrgb8888:
    - Statuses : 3 pass(s)
    - Exec time: [0.32, 1.21] s

  * igt@kms_color@legacy-gamma@pipe-a-hdmi-a-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.72] s

  * igt@kms_color@legacy-gamma@pipe-a-hdmi-a-4-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.70] s

  * igt@kms_color@legacy-gamma@pipe-a-vga-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.55] s

  * igt@kms_color@legacy-gamma@pipe-b-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.45] s

  * igt@kms_color@legacy-gamma@pipe-b-hdmi-a-1-xrgb8888:
    - Statuses : 3 pass(s)
    - Exec time: [0.31, 0.67] s

  * igt@kms_color@legacy-gamma@pipe-b-hdmi-a-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.69] s

  * igt@kms_color@legacy-gamma@pipe-b-hdmi-a-4-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.52] s

  * igt@kms_color@legacy-gamma@pipe-b-vga-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.41] s

  * igt@kms_color@legacy-gamma@pipe-c-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_color@legacy-gamma@pipe-c-hdmi-a-1-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [0.32, 0.68] s

  * igt@kms_color@legacy-gamma@pipe-c-hdmi-a-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.70] s

  * igt@kms_color@legacy-gamma@pipe-c-hdmi-a-4-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.52] s

  * igt@kms_color@legacy-gamma@pipe-d-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.42] s

  * igt@kms_color@legacy-gamma@pipe-d-hdmi-a-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.31] s

  * igt@kms_color@legacy-gamma@pipe-d-hdmi-a-4-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.54] s

  

Known issues
------------

  Here are the changes found in IGTPW_15414_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - shard-dg2:          NOTRUN -> [SKIP][21] ([i915#8411])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-6/igt@api_intel_bb@blit-reloc-keep-cache.html
    - shard-dg1:          NOTRUN -> [SKIP][22] ([i915#8411])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-16/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@api_intel_bb@crc32:
    - shard-tglu:         NOTRUN -> [SKIP][23] ([i915#6230])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-4/igt@api_intel_bb@crc32.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-rkl:          NOTRUN -> [SKIP][24] ([i915#11078])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-4/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@dmabuf@all-tests:
    - shard-tglu:         NOTRUN -> [SKIP][25] ([i915#15931])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-9/igt@dmabuf@all-tests.html

  * igt@drm_buddy@drm_buddy:
    - shard-rkl:          NOTRUN -> [SKIP][26] ([i915#14544] / [i915#15678])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@drm_buddy@drm_buddy.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-rkl:          NOTRUN -> [SKIP][27] ([i915#9323])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-2/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
    - shard-dg1:          NOTRUN -> [SKIP][28] ([i915#9323])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-15/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
    - shard-mtlp:         NOTRUN -> [SKIP][29] ([i915#9323])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-1/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_ccs@suspend-resume:
    - shard-tglu:         NOTRUN -> [SKIP][30] ([i915#9323])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-5/igt@gem_ccs@suspend-resume.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-tglu:         NOTRUN -> [SKIP][31] ([i915#6335])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-9/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_ctx_freq@sysfs@gt0:
    - shard-dg2:          [PASS][32] -> [FAIL][33] ([i915#9561]) +1 other test fail
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-dg2-5/igt@gem_ctx_freq@sysfs@gt0.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-1/igt@gem_ctx_freq@sysfs@gt0.html

  * igt@gem_ctx_persistence@smoketest:
    - shard-snb:          NOTRUN -> [SKIP][34] ([i915#1099])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-snb4/igt@gem_ctx_persistence@smoketest.html

  * igt@gem_ctx_sseu@engines:
    - shard-rkl:          NOTRUN -> [SKIP][35] ([i915#280])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-2/igt@gem_ctx_sseu@engines.html

  * igt@gem_exec_balancer@noheartbeat:
    - shard-dg2:          NOTRUN -> [SKIP][36] ([i915#8555]) +2 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-8/igt@gem_exec_balancer@noheartbeat.html
    - shard-dg1:          NOTRUN -> [SKIP][37] ([i915#8555]) +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-17/igt@gem_exec_balancer@noheartbeat.html
    - shard-mtlp:         NOTRUN -> [SKIP][38] ([i915#8555]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-5/igt@gem_exec_balancer@noheartbeat.html

  * igt@gem_exec_balancer@parallel:
    - shard-tglu:         NOTRUN -> [SKIP][39] ([i915#4525]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-2/igt@gem_exec_balancer@parallel.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-tglu-1:       NOTRUN -> [SKIP][40] ([i915#4525])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-1/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_big@single:
    - shard-tglu:         NOTRUN -> [FAIL][41] ([i915#15816])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-7/igt@gem_exec_big@single.html

  * igt@gem_exec_capture@capture:
    - shard-mtlp:         NOTRUN -> [FAIL][42] ([i915#11965]) +1 other test fail
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-1/igt@gem_exec_capture@capture.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-glk:          NOTRUN -> [SKIP][43] ([i915#6334]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk9/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_capture@capture@vecs0-lmem0:
    - shard-dg2:          NOTRUN -> [FAIL][44] ([i915#11965]) +4 other tests fail
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-8/igt@gem_exec_capture@capture@vecs0-lmem0.html
    - shard-dg1:          NOTRUN -> [FAIL][45] ([i915#11965]) +2 other tests fail
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-19/igt@gem_exec_capture@capture@vecs0-lmem0.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-dg2:          NOTRUN -> [SKIP][46] ([i915#3539])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-7/igt@gem_exec_flush@basic-uc-prw-default.html
    - shard-dg1:          NOTRUN -> [SKIP][47] ([i915#3539])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-19/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_flush@basic-wb-ro-default:
    - shard-dg2:          NOTRUN -> [SKIP][48] ([i915#3539] / [i915#4852])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-8/igt@gem_exec_flush@basic-wb-ro-default.html
    - shard-dg1:          NOTRUN -> [SKIP][49] ([i915#3539] / [i915#4852])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-17/igt@gem_exec_flush@basic-wb-ro-default.html

  * igt@gem_exec_reloc@basic-gtt-read:
    - shard-rkl:          NOTRUN -> [SKIP][50] ([i915#3281]) +11 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-4/igt@gem_exec_reloc@basic-gtt-read.html

  * igt@gem_exec_reloc@basic-wc-cpu:
    - shard-mtlp:         NOTRUN -> [SKIP][51] ([i915#3281]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-1/igt@gem_exec_reloc@basic-wc-cpu.html

  * igt@gem_exec_reloc@basic-write-wc-noreloc:
    - shard-dg2:          NOTRUN -> [SKIP][52] ([i915#3281]) +2 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-7/igt@gem_exec_reloc@basic-write-wc-noreloc.html
    - shard-dg1:          NOTRUN -> [SKIP][53] ([i915#3281]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-15/igt@gem_exec_reloc@basic-write-wc-noreloc.html

  * igt@gem_fenced_exec_thrash@2-spare-fences:
    - shard-dg2:          NOTRUN -> [SKIP][54] ([i915#4860])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-1/igt@gem_fenced_exec_thrash@2-spare-fences.html
    - shard-dg1:          NOTRUN -> [SKIP][55] ([i915#4860])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-16/igt@gem_fenced_exec_thrash@2-spare-fences.html
    - shard-mtlp:         NOTRUN -> [SKIP][56] ([i915#4860])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-7/igt@gem_fenced_exec_thrash@2-spare-fences.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglu-1:       NOTRUN -> [SKIP][57] ([i915#2190])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-1/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][58] ([i915#4613]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-8/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@heavy-verify-random:
    - shard-tglu:         NOTRUN -> [SKIP][59] ([i915#4613]) +2 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-9/igt@gem_lmem_swapping@heavy-verify-random.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-rkl:          NOTRUN -> [SKIP][60] ([i915#14544] / [i915#4613])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-glk:          NOTRUN -> [SKIP][61] ([i915#4613]) +9 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk9/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_media_vme:
    - shard-dg2:          NOTRUN -> [SKIP][62] ([i915#284])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-5/igt@gem_media_vme.html
    - shard-rkl:          NOTRUN -> [SKIP][63] ([i915#284])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-2/igt@gem_media_vme.html
    - shard-dg1:          NOTRUN -> [SKIP][64] ([i915#284])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-18/igt@gem_media_vme.html
    - shard-tglu:         NOTRUN -> [SKIP][65] ([i915#284])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-4/igt@gem_media_vme.html
    - shard-mtlp:         NOTRUN -> [SKIP][66] ([i915#284])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-4/igt@gem_media_vme.html

  * igt@gem_mmap_offset@clear-via-pagefault:
    - shard-mtlp:         [PASS][67] -> [TIMEOUT][68] ([i915#16021] / [i915#16168] / [i915#16349]) +1 other test timeout
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-mtlp-1/igt@gem_mmap_offset@clear-via-pagefault.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-7/igt@gem_mmap_offset@clear-via-pagefault.html

  * igt@gem_partial_pwrite_pread@reads:
    - shard-dg2:          NOTRUN -> [SKIP][69] ([i915#3282]) +4 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-8/igt@gem_partial_pwrite_pread@reads.html
    - shard-dg1:          NOTRUN -> [SKIP][70] ([i915#3282]) +4 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-17/igt@gem_partial_pwrite_pread@reads.html

  * igt@gem_partial_pwrite_pread@reads-display:
    - shard-mtlp:         NOTRUN -> [SKIP][71] ([i915#3282]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-1/igt@gem_partial_pwrite_pread@reads-display.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-dg2:          NOTRUN -> [SKIP][72] ([i915#4270])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-5/igt@gem_pxp@create-protected-buffer.html
    - shard-dg1:          NOTRUN -> [SKIP][73] ([i915#4270])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-15/igt@gem_pxp@create-protected-buffer.html

  * igt@gem_pxp@hw-rejects-pxp-context:
    - shard-tglu-1:       NOTRUN -> [SKIP][74] ([i915#13398])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-1/igt@gem_pxp@hw-rejects-pxp-context.html

  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
    - shard-rkl:          [PASS][75] -> [SKIP][76] ([i915#4270]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-6/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-7/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html

  * igt@gem_render_copy@linear-to-vebox-y-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][77] ([i915#5190] / [i915#8428])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-7/igt@gem_render_copy@linear-to-vebox-y-tiled.html

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
    - shard-glk:          NOTRUN -> [SKIP][78] +597 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk4/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html

  * igt@gem_render_copy@yf-tiled-ccs-to-y-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][79] ([i915#8428])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-2/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][80] ([i915#4885])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-5/igt@gem_softpin@evict-snoop-interruptible.html
    - shard-dg1:          NOTRUN -> [SKIP][81] ([i915#4885])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-18/igt@gem_softpin@evict-snoop-interruptible.html
    - shard-mtlp:         NOTRUN -> [SKIP][82] ([i915#4885])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-4/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_softpin@noreloc-s3:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][83] ([i915#13809] / [i915#16193])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk10/igt@gem_softpin@noreloc-s3.html

  * igt@gem_tiled_partial_pwrite_pread@reads:
    - shard-rkl:          NOTRUN -> [SKIP][84] ([i915#3282]) +4 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-2/igt@gem_tiled_partial_pwrite_pread@reads.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-rkl:          NOTRUN -> [SKIP][85] ([i915#3297])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-4/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@relocations:
    - shard-dg2:          NOTRUN -> [SKIP][86] ([i915#3281] / [i915#3297])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-4/igt@gem_userptr_blits@relocations.html
    - shard-rkl:          NOTRUN -> [SKIP][87] ([i915#14544] / [i915#3281] / [i915#3297])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@gem_userptr_blits@relocations.html
    - shard-dg1:          NOTRUN -> [SKIP][88] ([i915#3281] / [i915#3297])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-15/igt@gem_userptr_blits@relocations.html
    - shard-mtlp:         NOTRUN -> [SKIP][89] ([i915#3281] / [i915#3297])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-6/igt@gem_userptr_blits@relocations.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-tglu:         NOTRUN -> [SKIP][90] ([i915#3297]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-3/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-glk:          [PASS][91] -> [INCOMPLETE][92] ([i915#13356])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-glk6/igt@gem_workarounds@suspend-resume-context.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk8/igt@gem_workarounds@suspend-resume-context.html
    - shard-rkl:          [PASS][93] -> [INCOMPLETE][94] ([i915#13356]) +2 other tests incomplete
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-3/igt@gem_workarounds@suspend-resume-context.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@gem_workarounds@suspend-resume-context.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-rkl:          NOTRUN -> [SKIP][95] ([i915#2527]) +3 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-2/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-dg2:          NOTRUN -> [SKIP][96] ([i915#2856]) +2 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-1/igt@gen9_exec_parse@allowed-single.html
    - shard-tglu-1:       NOTRUN -> [SKIP][97] ([i915#2527] / [i915#2856])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-1/igt@gen9_exec_parse@allowed-single.html
    - shard-dg1:          NOTRUN -> [SKIP][98] ([i915#2527]) +2 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-14/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@basic-rejected:
    - shard-tglu:         NOTRUN -> [SKIP][99] ([i915#2527] / [i915#2856]) +3 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-7/igt@gen9_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@batch-zero-length:
    - shard-mtlp:         NOTRUN -> [SKIP][100] ([i915#2856]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-1/igt@gen9_exec_parse@batch-zero-length.html

  * igt@i915_drm_fdinfo@busy-idle@bcs0:
    - shard-dg1:          NOTRUN -> [SKIP][101] ([i915#14073]) +11 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-18/igt@i915_drm_fdinfo@busy-idle@bcs0.html

  * igt@i915_drm_fdinfo@busy-idle@rcs0:
    - shard-mtlp:         NOTRUN -> [SKIP][102] ([i915#14073]) +6 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-8/igt@i915_drm_fdinfo@busy-idle@rcs0.html

  * igt@i915_drm_fdinfo@most-busy-idle-check-all@vecs1:
    - shard-dg2:          NOTRUN -> [SKIP][103] ([i915#14073]) +23 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-5/igt@i915_drm_fdinfo@most-busy-idle-check-all@vecs1.html

  * igt@i915_module_load@fault-injection@intel_connector_register:
    - shard-glk11:        NOTRUN -> [ABORT][104] ([i915#15342]) +1 other test abort
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk11/igt@i915_module_load@fault-injection@intel_connector_register.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][105] ([i915#8399])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-1/igt@i915_pm_freq_api@freq-suspend.html
    - shard-tglu:         NOTRUN -> [SKIP][106] ([i915#8399])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-10/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-tglu:         NOTRUN -> [SKIP][107] ([i915#6590]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-4/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-tglu:         NOTRUN -> [INCOMPLETE][108] ([i915#4817] / [i915#7443])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-6/igt@i915_suspend@basic-s3-without-i915.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-dg2:          NOTRUN -> [SKIP][109] ([i915#4077]) +3 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-6/igt@i915_suspend@fence-restore-untiled.html

  * igt@intel_hwmon@hwmon-read:
    - shard-tglu-1:       NOTRUN -> [SKIP][110] ([i915#7707])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-1/igt@intel_hwmon@hwmon-read.html

  * igt@kms_addfb_basic@basic-x-tiled-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][111] ([i915#4212])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-1/igt@kms_addfb_basic@basic-x-tiled-legacy.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][112] ([i915#12761] / [i915#14995])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk9/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-2.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-rkl:          NOTRUN -> [SKIP][113] ([i915#9531])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-8/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-mtlp:         NOTRUN -> [SKIP][114] ([i915#1769] / [i915#3555])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-1/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-glk10:        NOTRUN -> [SKIP][115] ([i915#1769])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk10/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][116] ([i915#5286]) +6 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-5/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-tglu-1:       NOTRUN -> [SKIP][117] ([i915#5286])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-1/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
    - shard-dg1:          NOTRUN -> [SKIP][118] ([i915#4538] / [i915#5286])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-14/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-tglu:         NOTRUN -> [SKIP][119] ([i915#5286]) +3 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-2/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][120] ([i915#3638]) +2 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-8/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-tglu:         NOTRUN -> [SKIP][121] ([i915#3828]) +3 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-5/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][122] +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-4/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][123] ([i915#3638])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-12/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][124] ([i915#4538] / [i915#5190]) +4 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html
    - shard-dg1:          NOTRUN -> [SKIP][125] ([i915#4538]) +3 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-16/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-mtlp:         NOTRUN -> [SKIP][126] +4 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2:          NOTRUN -> [SKIP][127] ([i915#5190]) +1 other test skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-1/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-rkl:          NOTRUN -> [SKIP][128] ([i915#14544]) +7 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-c-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][129] ([i915#6095]) +49 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-6/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][130] ([i915#14544] / [i915#6095]) +3 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][131] ([i915#14098] / [i915#14544] / [i915#6095]) +1 other test skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-hdmi-a-2:
    - shard-glk10:        NOTRUN -> [SKIP][132] +177 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk10/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][133] ([i915#12313]) +2 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-10/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][134] ([i915#6095]) +65 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-7/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][135] ([i915#4423] / [i915#6095])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-12/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][136] ([i915#12313]) +1 other test skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-8/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-2:
    - shard-glk11:        NOTRUN -> [SKIP][137] +156 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk11/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][138] ([i915#14694] / [i915#15582]) +1 other test incomplete
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][139] ([i915#14098] / [i915#6095]) +39 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-5/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][140] ([i915#15582])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk2/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][141] ([i915#6095]) +29 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-1/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][142] ([i915#12313]) +1 other test skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-16/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][143] ([i915#12313])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-3/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
    - shard-rkl:          NOTRUN -> [SKIP][144] ([i915#12313])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-7/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][145] ([i915#10307] / [i915#6095]) +71 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-4/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][146] ([i915#6095]) +4 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-2/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-a-edp-1.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][147] ([i915#6095]) +184 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-12/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][148] ([i915#10307] / [i915#10434] / [i915#6095]) +4 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-4/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition:
    - shard-rkl:          NOTRUN -> [SKIP][149] ([i915#3742])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-5/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@plane-scaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][150] ([i915#3742])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-1/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_color_pipeline@plane-ctm3x4:
    - shard-dg2:          NOTRUN -> [SKIP][151] ([i915#16471])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-5/igt@kms_chamelium_color_pipeline@plane-ctm3x4.html
    - shard-dg1:          NOTRUN -> [SKIP][152] ([i915#16471])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-16/igt@kms_chamelium_color_pipeline@plane-ctm3x4.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-dg2:          NOTRUN -> [SKIP][153] ([i915#11151] / [i915#7828]) +3 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-4/igt@kms_chamelium_frames@dp-crc-fast.html
    - shard-rkl:          NOTRUN -> [SKIP][154] ([i915#11151] / [i915#7828]) +4 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-4/igt@kms_chamelium_frames@dp-crc-fast.html
    - shard-dg1:          NOTRUN -> [SKIP][155] ([i915#11151] / [i915#7828]) +2 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-12/igt@kms_chamelium_frames@dp-crc-fast.html
    - shard-mtlp:         NOTRUN -> [SKIP][156] ([i915#11151] / [i915#7828]) +2 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-6/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_frames@dp-crc-multiple:
    - shard-rkl:          NOTRUN -> [SKIP][157] ([i915#11151] / [i915#14544] / [i915#7828])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@kms_chamelium_frames@dp-crc-multiple.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-tglu-1:       NOTRUN -> [SKIP][158] ([i915#11151] / [i915#7828]) +2 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-1/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-tglu:         NOTRUN -> [SKIP][159] ([i915#11151] / [i915#7828]) +7 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-9/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_color@ctm-0-25:
    - shard-dg2:          [PASS][160] -> [FAIL][161] ([i915#315]) +2 other tests fail
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-dg2-6/igt@kms_color@ctm-0-25.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-5/igt@kms_color@ctm-0-25.html
    - shard-rkl:          [PASS][162] -> [FAIL][163] ([i915#315]) +1 other test fail
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-2/igt@kms_color@ctm-0-25.html
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-2/igt@kms_color@ctm-0-25.html

  * igt@kms_color@ctm-0-75:
    - shard-glk:          NOTRUN -> [FAIL][164] ([i915#315])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk3/igt@kms_color@ctm-0-75.html

  * igt@kms_color@ctm-blue-to-red:
    - shard-tglu:         [PASS][165] -> [FAIL][166] ([i915#315]) +2 other tests fail
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-tglu-7/igt@kms_color@ctm-blue-to-red.html
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-3/igt@kms_color@ctm-blue-to-red.html
    - shard-glk:          [PASS][167] -> [FAIL][168] ([i915#315])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-glk6/igt@kms_color@ctm-blue-to-red.html
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk2/igt@kms_color@ctm-blue-to-red.html

  * igt@kms_color@degamma:
    - shard-dg2:          [PASS][169] -> [FAIL][170] ([i915#6893])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-dg2-3/igt@kms_color@degamma.html
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-1/igt@kms_color@degamma.html
    - shard-dg1:          [PASS][171] -> [FAIL][172] ([i915#6893])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-dg1-16/igt@kms_color@degamma.html
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-14/igt@kms_color@degamma.html
    - shard-glk10:        NOTRUN -> [FAIL][173] ([i915#6893])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk10/igt@kms_color@degamma.html

  * igt@kms_color@degamma@pipe-a-vga-1-xrgb2101010 (NEW):
    - shard-snb:          NOTRUN -> [SKIP][174] +116 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-snb5/igt@kms_color@degamma@pipe-a-vga-1-xrgb2101010.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][175] ([i915#15865]) +2 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-5/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@atomic-dpms-hdcp14:
    - shard-dg2:          NOTRUN -> [SKIP][176] ([i915#15865])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-4/igt@kms_content_protection@atomic-dpms-hdcp14.html
    - shard-dg1:          NOTRUN -> [SKIP][177] ([i915#15865])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-13/igt@kms_content_protection@atomic-dpms-hdcp14.html
    - shard-mtlp:         NOTRUN -> [SKIP][178] ([i915#15865])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-4/igt@kms_content_protection@atomic-dpms-hdcp14.html

  * igt@kms_content_protection@content-type-change:
    - shard-tglu-1:       NOTRUN -> [SKIP][179] ([i915#15865])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-1/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-rkl:          NOTRUN -> [SKIP][180] ([i915#15330] / [i915#3116])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-7/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
    - shard-tglu:         NOTRUN -> [SKIP][181] ([i915#15330]) +1 other test skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-4/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html

  * igt@kms_content_protection@dp-mst-type-0-hdcp14:
    - shard-dg2:          NOTRUN -> [SKIP][182] ([i915#15330])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-3/igt@kms_content_protection@dp-mst-type-0-hdcp14.html
    - shard-dg1:          NOTRUN -> [SKIP][183] ([i915#15330])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-19/igt@kms_content_protection@dp-mst-type-0-hdcp14.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2:          NOTRUN -> [SKIP][184] ([i915#15330] / [i915#3299])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-3/igt@kms_content_protection@dp-mst-type-1.html
    - shard-dg1:          NOTRUN -> [SKIP][185] ([i915#15330] / [i915#3299])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-18/igt@kms_content_protection@dp-mst-type-1.html
    - shard-tglu:         NOTRUN -> [SKIP][186] ([i915#15330] / [i915#3116] / [i915#3299])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-8/igt@kms_content_protection@dp-mst-type-1.html
    - shard-mtlp:         NOTRUN -> [SKIP][187] ([i915#15330] / [i915#3299])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-8/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@type1:
    - shard-rkl:          NOTRUN -> [SKIP][188] ([i915#15865]) +2 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-3/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-tglu:         NOTRUN -> [SKIP][189] ([i915#13049])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-4/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-tglu-1:       NOTRUN -> [SKIP][190] ([i915#13049])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-128x42:
    - shard-rkl:          [PASS][191] -> [FAIL][192] ([i915#13566]) +1 other test fail
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-4/igt@kms_cursor_crc@cursor-random-128x42.html
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-7/igt@kms_cursor_crc@cursor-random-128x42.html

  * igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [FAIL][193] ([i915#13566]) +1 other test fail
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-6/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-rkl:          NOTRUN -> [SKIP][194] ([i915#13049]) +2 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-3/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
    - shard-mtlp:         NOTRUN -> [SKIP][195] ([i915#8814])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-2/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-rkl:          NOTRUN -> [FAIL][196] ([i915#13566]) +1 other test fail
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-7/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-tglu-1:       NOTRUN -> [SKIP][197] ([i915#3555])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-tglu:         NOTRUN -> [SKIP][198] ([i915#4103])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-10/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@single-bo:
    - shard-dg1:          [PASS][199] -> [DMESG-WARN][200] ([i915#4423])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-dg1-15/igt@kms_cursor_legacy@single-bo.html
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-16/igt@kms_cursor_legacy@single-bo.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-tglu:         NOTRUN -> [SKIP][201] ([i915#9723])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-4/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-rkl:          NOTRUN -> [SKIP][202] ([i915#13749])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-4/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-tglu-1:       NOTRUN -> [SKIP][203] ([i915#13748])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-1/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-tglu:         NOTRUN -> [SKIP][204] ([i915#13748])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-2/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-dg2:          NOTRUN -> [SKIP][205] ([i915#13707])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-1/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - shard-rkl:          NOTRUN -> [SKIP][206] ([i915#13707])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-5/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - shard-dg1:          NOTRUN -> [SKIP][207] ([i915#13707])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-16/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - shard-tglu:         NOTRUN -> [SKIP][208] ([i915#13707])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-3/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - shard-mtlp:         NOTRUN -> [SKIP][209] ([i915#13707])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-7/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][210] ([i915#8812])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-8/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-tglu-1:       NOTRUN -> [SKIP][211] ([i915#16361]) +1 other test skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-1/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats-bigjoiner:
    - shard-rkl:          NOTRUN -> [SKIP][212] ([i915#16361]) +2 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-8/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html
    - shard-dg1:          NOTRUN -> [SKIP][213] ([i915#16361])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-12/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html
    - shard-tglu:         NOTRUN -> [SKIP][214] ([i915#16361]) +5 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-2/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html
    - shard-mtlp:         NOTRUN -> [SKIP][215] ([i915#16361])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-1/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html
    - shard-dg2:          NOTRUN -> [SKIP][216] ([i915#16361])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-3/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][217] ([i915#9878])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr:
    - shard-rkl:          NOTRUN -> [SKIP][218] ([i915#3955])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-3/igt@kms_fbcon_fbt@psr.html
    - shard-tglu:         NOTRUN -> [SKIP][219] ([i915#3469])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-5/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2:          NOTRUN -> [SKIP][220] ([i915#16084])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-3/igt@kms_feature_discovery@chamelium.html
    - shard-dg1:          NOTRUN -> [SKIP][221] ([i915#16084])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-18/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-rkl:          NOTRUN -> [SKIP][222] ([i915#9337])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-5/igt@kms_feature_discovery@dp-mst.html
    - shard-tglu:         NOTRUN -> [SKIP][223] ([i915#9337])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-4/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - shard-tglu-1:       NOTRUN -> [SKIP][224] ([i915#9934])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-1/igt@kms_flip@2x-flip-vs-dpms-on-nop.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][225] ([i915#12314] / [i915#12745] / [i915#4839] / [i915#6113])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk5/igt@kms_flip@2x-flip-vs-suspend.html
    - shard-dg2:          NOTRUN -> [SKIP][226] ([i915#9934]) +1 other test skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-8/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-tglu:         NOTRUN -> [SKIP][227] ([i915#3637] / [i915#9934]) +7 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-9/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][228] ([i915#9934]) +8 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-7/igt@kms_flip@2x-plain-flip-interruptible.html
    - shard-dg1:          NOTRUN -> [SKIP][229] ([i915#9934]) +1 other test skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-17/igt@kms_flip@2x-plain-flip-interruptible.html
    - shard-mtlp:         NOTRUN -> [SKIP][230] ([i915#3637] / [i915#9934])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-3/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-tglu:         NOTRUN -> [FAIL][231] ([i915#13027]) +1 other test fail
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][232] ([i915#12314] / [i915#12745] / [i915#4839])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk8/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][233] ([i915#12314] / [i915#12745]) +1 other test incomplete
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk8/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][234] ([i915#15643]) +3 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
    - shard-dg1:          NOTRUN -> [SKIP][235] ([i915#15643])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-15/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][236] ([i915#15643]) +1 other test skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][237] ([i915#15643]) +2 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-9/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][238] ([i915#15643]) +1 other test skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
    - shard-dg2:          NOTRUN -> [SKIP][239] ([i915#15643])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][240] ([i915#15104] / [i915#15990])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-gtt.html
    - shard-dg2:          NOTRUN -> [SKIP][241] ([i915#15104] / [i915#15990])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][242] ([i915#15990] / [i915#8708]) +5 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-mtlp:         NOTRUN -> [SKIP][243] ([i915#15991] / [i915#1825]) +9 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][244] ([i915#10056])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk4/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-tglu-1:       NOTRUN -> [SKIP][245] ([i915#15989]) +7 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-1/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-tglu:         NOTRUN -> [SKIP][246] ([i915#15989]) +25 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-3/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-pgflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][247] +68 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-3/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][248] ([i915#15990]) +7 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-1/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-mmap-gtt.html
    - shard-dg1:          NOTRUN -> [SKIP][249] ([i915#15990]) +6 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-14/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][250] ([i915#15990]) +2 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-1/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][251] ([i915#15989]) +6 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-4/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-stridechange:
    - shard-dg1:          NOTRUN -> [SKIP][252] ([i915#15989]) +5 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-14/igt@kms_frontbuffer_tracking@fbchdr-stridechange.html

  * igt@kms_frontbuffer_tracking@fbchdr-tiling-4:
    - shard-tglu:         NOTRUN -> [SKIP][253] ([i915#5439]) +1 other test skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-4/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbchdr-tiling-linear:
    - shard-rkl:          NOTRUN -> [SKIP][254] ([i915#15989]) +17 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-3/igt@kms_frontbuffer_tracking@fbchdr-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][255] ([i915#14544] / [i915#15102] / [i915#3023]) +1 other test skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][256] ([i915#15102] / [i915#3023]) +11 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][257] ([i915#1825]) +11 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt.html
    - shard-dg1:          NOTRUN -> [SKIP][258] ([i915#15990] / [i915#8708]) +2 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt.html
    - shard-mtlp:         NOTRUN -> [SKIP][259] ([i915#15990] / [i915#8708])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-rte:
    - shard-dg2:          NOTRUN -> [SKIP][260] ([i915#15991] / [i915#5354]) +15 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-tglu-1:       NOTRUN -> [SKIP][261] ([i915#15102]) +19 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg1:          NOTRUN -> [SKIP][262] ([i915#15102]) +13 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte:
    - shard-rkl:          NOTRUN -> [SKIP][263] ([i915#15102]) +21 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-shrfb-plflip-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][264] +55 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-blt:
    - shard-rkl:          [PASS][265] -> [SKIP][266] ([i915#15989]) +10 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-1/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-blt.html
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-7/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-indfb-draw-mmap-gtt:
    - shard-glk:          [PASS][267] -> [SKIP][268] +8 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-glk8/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk1/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][269] ([i915#15991]) +15 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-1/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-pgflip-blt:
    - shard-tglu:         NOTRUN -> [SKIP][270] ([i915#15102]) +53 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-3/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-tglu:         NOTRUN -> [SKIP][271] +111 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-3/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-onoff:
    - shard-dg1:          NOTRUN -> [SKIP][272] +31 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-19/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][273] ([i915#15991]) +21 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-7/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][274] ([i915#15102]) +17 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-8/igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-pwrite.html
    - shard-rkl:          NOTRUN -> [SKIP][275] ([i915#14544] / [i915#15102]) +1 other test skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-pwrite.html
    - shard-mtlp:         NOTRUN -> [SKIP][276] ([i915#15989]) +9 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-1/igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-pwrite.html

  * igt@kms_hdmi_inject@inject-4k:
    - shard-mtlp:         [PASS][277] -> [SKIP][278] ([i915#15725])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-mtlp-3/igt@kms_hdmi_inject@inject-4k.html
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-1/igt@kms_hdmi_inject@inject-4k.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][279] ([i915#16012] / [i915#3555] / [i915#8228])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-3/igt@kms_hdr@bpc-switch-suspend.html
    - shard-rkl:          NOTRUN -> [SKIP][280] ([i915#16012] / [i915#3555] / [i915#8228])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-7/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-1-xrgb2101010:
    - shard-tglu:         NOTRUN -> [SKIP][281] ([i915#16012]) +1 other test skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-3/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-1-xrgb2101010.html

  * igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-2-xrgb2101010:
    - shard-rkl:          NOTRUN -> [SKIP][282] ([i915#16012]) +3 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-7/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-2-xrgb2101010.html

  * igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-4-xrgb2101010:
    - shard-dg1:          NOTRUN -> [SKIP][283] ([i915#16012]) +5 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-17/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-4-xrgb2101010.html

  * igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-2-xrgb16161616f:
    - shard-rkl:          NOTRUN -> [SKIP][284] ([i915#16011]) +3 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-4/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-2-xrgb16161616f.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-tglu-1:       NOTRUN -> [SKIP][285] ([i915#16011] / [i915#3555] / [i915#8228])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-1/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-1-xrgb16161616f:
    - shard-tglu-1:       NOTRUN -> [SKIP][286] ([i915#16011]) +1 other test skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-1/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-1-xrgb16161616f.html
    - shard-dg1:          NOTRUN -> [SKIP][287] ([i915#16011]) +7 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-15/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-1-xrgb16161616f.html

  * igt@kms_hdr@static-swap:
    - shard-dg1:          NOTRUN -> [SKIP][288] ([i915#16011] / [i915#3555] / [i915#8228])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-18/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-1-xrgb16161616f:
    - shard-dg2:          NOTRUN -> [SKIP][289] ([i915#16011]) +5 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-4/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-1-xrgb16161616f.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][290] ([i915#15460])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-5/igt@kms_joiner@basic-big-joiner.html
    - shard-rkl:          NOTRUN -> [SKIP][291] ([i915#15460])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-7/igt@kms_joiner@basic-big-joiner.html
    - shard-dg1:          NOTRUN -> [SKIP][292] ([i915#15460])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-17/igt@kms_joiner@basic-big-joiner.html
    - shard-tglu:         NOTRUN -> [SKIP][293] ([i915#15460]) +1 other test skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-3/igt@kms_joiner@basic-big-joiner.html
    - shard-mtlp:         NOTRUN -> [SKIP][294] ([i915#15460])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-3/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][295] ([i915#15459])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-1/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][296] ([i915#15458]) +1 other test skip
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-3/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - shard-rkl:          NOTRUN -> [SKIP][297] ([i915#15458])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-8/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - shard-dg1:          NOTRUN -> [SKIP][298] ([i915#15458])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-12/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - shard-tglu:         NOTRUN -> [SKIP][299] ([i915#15458])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-2/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - shard-mtlp:         NOTRUN -> [SKIP][300] ([i915#15458])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier:
    - shard-mtlp:         NOTRUN -> [SKIP][301] ([i915#15709]) +1 other test skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-8/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5:
    - shard-dg2:          NOTRUN -> [SKIP][302] ([i915#16386]) +3 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-5/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5.html
    - shard-mtlp:         NOTRUN -> [SKIP][303] ([i915#16386]) +1 other test skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-3/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:
    - shard-tglu-1:       NOTRUN -> [SKIP][304] ([i915#15709])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-1/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping:
    - shard-tglu:         NOTRUN -> [SKIP][305] ([i915#15709]) +4 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-10/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping:
    - shard-dg1:          NOTRUN -> [SKIP][306] ([i915#15709]) +2 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-13/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier:
    - shard-dg2:          NOTRUN -> [SKIP][307] ([i915#15709]) +2 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-5/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7:
    - shard-dg1:          NOTRUN -> [SKIP][308] ([i915#16386]) +1 other test skip
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-15/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7.html
    - shard-tglu:         NOTRUN -> [SKIP][309] ([i915#16386]) +1 other test skip
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-6/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-b-plane-5:
    - shard-rkl:          NOTRUN -> [SKIP][310] ([i915#16386]) +1 other test skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-2/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier:
    - shard-rkl:          NOTRUN -> [SKIP][311] ([i915#15709]) +5 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-8/igt@kms_plane@pixel-format-yf-tiled-modifier.html

  * igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:
    - shard-dg2:          NOTRUN -> [SKIP][312] ([i915#16112])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-1/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html
    - shard-dg1:          NOTRUN -> [SKIP][313] ([i915#16112])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-16/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb:
    - shard-glk:          NOTRUN -> [FAIL][314] ([i915#10647] / [i915#12169])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk1/igt@kms_plane_alpha_blend@alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][315] ([i915#10647]) +3 other tests fail
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk1/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb:
    - shard-glk:          NOTRUN -> [FAIL][316] ([i915#10647] / [i915#12177])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk4/igt@kms_plane_alpha_blend@alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@constant-alpha-max:
    - shard-glk10:        NOTRUN -> [FAIL][317] ([i915#10647] / [i915#12169])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk10/igt@kms_plane_alpha_blend@constant-alpha-max.html

  * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-a-hdmi-a-1:
    - shard-glk10:        NOTRUN -> [FAIL][318] ([i915#10647]) +1 other test fail
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk10/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-a-hdmi-a-1.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-rkl:          NOTRUN -> [SKIP][319] ([i915#3555]) +6 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-7/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][320] ([i915#13958])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-3/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-tglu-1:       NOTRUN -> [SKIP][321] ([i915#13958])
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-1/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-rkl:          [PASS][322] -> [SKIP][323] ([i915#6953])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-6/igt@kms_plane_scaling@intel-max-src-size.html
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-3/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][324] ([i915#14544] / [i915#15329]) +3 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html
    - shard-tglu-1:       NOTRUN -> [SKIP][325] ([i915#15329]) +4 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-1/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html
    - shard-dg1:          NOTRUN -> [SKIP][326] ([i915#15329]) +4 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-15/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c:
    - shard-rkl:          NOTRUN -> [SKIP][327] ([i915#15329]) +3 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-8/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d:
    - shard-tglu:         NOTRUN -> [SKIP][328] ([i915#15329]) +4 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-3/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d.html

  * igt@kms_pm_backlight@fade:
    - shard-tglu-1:       NOTRUN -> [SKIP][329] ([i915#12343] / [i915#9812])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-1/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][330] ([i915#12343] / [i915#5354])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-5/igt@kms_pm_backlight@fade-with-dpms.html
    - shard-dg1:          NOTRUN -> [SKIP][331] ([i915#12343] / [i915#5354])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-16/igt@kms_pm_backlight@fade-with-dpms.html
    - shard-tglu:         NOTRUN -> [SKIP][332] ([i915#12343] / [i915#9812])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-7/igt@kms_pm_backlight@fade-with-dpms.html
    - shard-dg2:          NOTRUN -> [SKIP][333] ([i915#12343] / [i915#5354])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-6/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-rkl:          [PASS][334] -> [SKIP][335] ([i915#15073])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-3/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@fences:
    - shard-dg1:          NOTRUN -> [SKIP][336] ([i915#4077]) +4 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-18/igt@kms_pm_rpm@fences.html
    - shard-mtlp:         NOTRUN -> [SKIP][337] ([i915#4077]) +3 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-4/igt@kms_pm_rpm@fences.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2:          [PASS][338] -> [SKIP][339] ([i915#15073]) +1 other test skip
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-dg2-5/igt@kms_pm_rpm@modeset-non-lpsp.html
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-dg1:          [PASS][340] -> [SKIP][341] ([i915#15073])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-dg1-19/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-15/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-tglu:         NOTRUN -> [SKIP][342] ([i915#6524]) +1 other test skip
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-5/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_prime@d3hot:
    - shard-dg2:          NOTRUN -> [SKIP][343] ([i915#6524] / [i915#6805])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-5/igt@kms_prime@d3hot.html
    - shard-rkl:          NOTRUN -> [SKIP][344] ([i915#6524])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-7/igt@kms_prime@d3hot.html
    - shard-dg1:          NOTRUN -> [SKIP][345] ([i915#6524])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-17/igt@kms_prime@d3hot.html
    - shard-mtlp:         NOTRUN -> [SKIP][346] ([i915#6524])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-3/igt@kms_prime@d3hot.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][347] ([i915#9808])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:
    - shard-glk10:        NOTRUN -> [SKIP][348] ([i915#11520]) +3 other tests skip
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk10/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-tglu:         NOTRUN -> [SKIP][349] ([i915#11520]) +10 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-7/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html
    - shard-mtlp:         NOTRUN -> [SKIP][350] ([i915#12316]) +3 other tests skip
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-6/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
    - shard-glk11:        NOTRUN -> [SKIP][351] ([i915#11520]) +3 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk11/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:
    - shard-glk:          NOTRUN -> [SKIP][352] ([i915#11520]) +12 other tests skip
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk9/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
    - shard-dg2:          NOTRUN -> [SKIP][353] ([i915#11520]) +5 other tests skip
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-1/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html
    - shard-rkl:          NOTRUN -> [SKIP][354] ([i915#11520]) +4 other tests skip
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-3/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - shard-tglu-1:       NOTRUN -> [SKIP][355] ([i915#11520]) +4 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-1/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-snb:          NOTRUN -> [SKIP][356] ([i915#11520]) +4 other tests skip
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-snb6/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html
    - shard-dg1:          NOTRUN -> [SKIP][357] ([i915#11520]) +5 other tests skip
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-16/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@fbc-psr-sprite-plane-onoff:
    - shard-mtlp:         NOTRUN -> [SKIP][358] ([i915#9688]) +5 other tests skip
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-3/igt@kms_psr@fbc-psr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr2-primary-mmap-gtt:
    - shard-tglu:         NOTRUN -> [SKIP][359] ([i915#9732]) +21 other tests skip
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-3/igt@kms_psr@fbc-psr2-primary-mmap-gtt.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-rkl:          NOTRUN -> [SKIP][360] ([i915#1072] / [i915#9732]) +19 other tests skip
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-4/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_psr@psr-sprite-plane-move:
    - shard-tglu-1:       NOTRUN -> [SKIP][361] ([i915#9732]) +10 other tests skip
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-1/igt@kms_psr@psr-sprite-plane-move.html

  * igt@kms_psr@psr2-cursor-plane-move:
    - shard-dg2:          NOTRUN -> [SKIP][362] ([i915#1072] / [i915#9732]) +8 other tests skip
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-8/igt@kms_psr@psr2-cursor-plane-move.html
    - shard-dg1:          NOTRUN -> [SKIP][363] ([i915#1072] / [i915#9732]) +4 other tests skip
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-17/igt@kms_psr@psr2-cursor-plane-move.html

  * igt@kms_psr@psr2-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][364] ([i915#1072] / [i915#14544] / [i915#9732]) +1 other test skip
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@kms_psr@psr2-suspend.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-tglu:         NOTRUN -> [SKIP][365] ([i915#15949])
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][366] ([i915#12755] / [i915#15867]) +1 other test skip
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-8/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2:          NOTRUN -> [SKIP][367] ([i915#12755] / [i915#15867] / [i915#5190])
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
    - shard-mtlp:         NOTRUN -> [SKIP][368] ([i915#12755] / [i915#15867]) +1 other test skip
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-tglu-1:       NOTRUN -> [SKIP][369] ([i915#5289])
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-rkl:          NOTRUN -> [SKIP][370] ([i915#5289]) +1 other test skip
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-glk:          NOTRUN -> [ABORT][371] ([i915#13179]) +1 other test abort
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk1/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-glk:          NOTRUN -> [FAIL][372] ([i915#10959])
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk2/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][373] ([i915#12276]) +1 other test incomplete
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk1/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-2.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [ABORT][374] ([i915#15132]) +1 other test abort
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-1/igt@kms_vblank@ts-continuation-suspend@pipe-c-hdmi-a-2.html

  * igt@kms_vrr@flip-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][375] ([i915#3555]) +5 other tests skip
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-8/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@max-min:
    - shard-dg1:          NOTRUN -> [SKIP][376] ([i915#9906])
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-16/igt@kms_vrr@max-min.html
    - shard-tglu:         NOTRUN -> [SKIP][377] ([i915#9906])
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-6/igt@kms_vrr@max-min.html
    - shard-mtlp:         NOTRUN -> [SKIP][378] ([i915#8808] / [i915#9906])
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-7/igt@kms_vrr@max-min.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-tglu-1:       NOTRUN -> [SKIP][379] ([i915#9906])
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-1/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-dg2:          NOTRUN -> [SKIP][380] ([i915#9906]) +1 other test skip
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-6/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-rkl:          NOTRUN -> [SKIP][381] ([i915#2435])
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-4/igt@perf@per-context-mode-unprivileged.html

  * igt@perf_pmu@busy-double-start@vcs1:
    - shard-mtlp:         [PASS][382] -> [FAIL][383] ([i915#4349]) +4 other tests fail
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-mtlp-1/igt@perf_pmu@busy-double-start@vcs1.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-4/igt@perf_pmu@busy-double-start@vcs1.html

  * igt@perf_pmu@module-unload:
    - shard-glk:          NOTRUN -> [ABORT][384] ([i915#15778])
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk3/igt@perf_pmu@module-unload.html
    - shard-dg2:          NOTRUN -> [ABORT][385] ([i915#13029] / [i915#15778])
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-3/igt@perf_pmu@module-unload.html

  * igt@perf_pmu@rc6-suspend:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][386] ([i915#13356] / [i915#16236])
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk11/igt@perf_pmu@rc6-suspend.html
    - shard-rkl:          [PASS][387] -> [INCOMPLETE][388] ([i915#13520])
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-7/igt@perf_pmu@rc6-suspend.html
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-4/igt@perf_pmu@rc6-suspend.html

  * igt@prime_vgem@fence-write-hang:
    - shard-rkl:          NOTRUN -> [SKIP][389] ([i915#3708])
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-5/igt@prime_vgem@fence-write-hang.html

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - shard-dg2:          NOTRUN -> [SKIP][390] ([i915#9917])
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-3/igt@sriov_basic@enable-vfs-autoprobe-on.html
    - shard-dg1:          NOTRUN -> [SKIP][391] ([i915#9917])
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-18/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-random:
    - shard-tglu:         NOTRUN -> [SKIP][392] ([i915#16066]) +8 other tests skip
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-7/igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-random.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-dg2:          NOTRUN -> [SKIP][393] ([i915#4818])
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-4/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@gem_eio@hibernate:
    - shard-rkl:          [ABORT][394] ([i915#7975]) -> [PASS][395]
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-1/igt@gem_eio@hibernate.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-3/igt@gem_eio@hibernate.html

  * igt@gem_eio@kms:
    - shard-rkl:          [DMESG-WARN][396] ([i915#13363]) -> [PASS][397]
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-4/igt@gem_eio@kms.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-8/igt@gem_eio@kms.html
    - shard-tglu:         [DMESG-WARN][398] ([i915#13363]) -> [PASS][399]
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-tglu-7/igt@gem_eio@kms.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-3/igt@gem_eio@kms.html

  * igt@gem_exec_endless@dispatch@bcs0:
    - shard-dg2:          [TIMEOUT][400] ([i915#3778] / [i915#7016]) -> [PASS][401] +1 other test pass
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-dg2-3/igt@gem_exec_endless@dispatch@bcs0.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-1/igt@gem_exec_endless@dispatch@bcs0.html

  * igt@gem_exec_suspend@basic-s0:
    - shard-dg2:          [INCOMPLETE][402] ([i915#13356]) -> [PASS][403] +1 other test pass
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-dg2-7/igt@gem_exec_suspend@basic-s0.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-7/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-glk:          [INCOMPLETE][404] ([i915#13196] / [i915#13356]) -> [PASS][405] +1 other test pass
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-glk3/igt@gem_exec_suspend@basic-s3.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk3/igt@gem_exec_suspend@basic-s3.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglu:         [WARN][406] ([i915#13790] / [i915#2681]) -> [PASS][407] +1 other test pass
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-tglu-8/igt@i915_pm_rc6_residency@rc6-fence.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-6/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-dg1:          [FAIL][408] ([i915#14888]) -> [PASS][409]
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-dg1-16/igt@kms_async_flips@alternate-sync-async-flip.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-15/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1:
    - shard-glk:          [INCOMPLETE][410] ([i915#12761]) -> [PASS][411]
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-glk6/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk9/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:
    - shard-glk:          [INCOMPLETE][412] ([i915#15582]) -> [PASS][413]
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-glk8/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk2/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1:
    - shard-tglu:         [FAIL][414] ([i915#13566]) -> [PASS][415] +1 other test pass
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-tglu-6/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-2/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-rkl:          [INCOMPLETE][416] ([i915#12358] / [i915#14152]) -> [PASS][417]
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-7/igt@kms_cursor_crc@cursor-suspend.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-8/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-dg1:          [DMESG-WARN][418] ([i915#4423]) -> [PASS][419]
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-dg1-18/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-13/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_force_connector_basic@force-connector-state:
    - shard-mtlp:         [SKIP][420] ([i915#15672]) -> [PASS][421]
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-mtlp-1/igt@kms_force_connector_basic@force-connector-state.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-3/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-rkl:          [SKIP][422] ([i915#15989]) -> [PASS][423] +5 other tests pass
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-2/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-glk:          [SKIP][424] -> [PASS][425] +3 other tests pass
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-glk9/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk8/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-rkl:          [SKIP][426] ([i915#16011] / [i915#3555] / [i915#8228]) -> [PASS][427]
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-7/igt@kms_hdr@invalid-metadata-sizes.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-2-xrgb2101010:
    - shard-rkl:          [SKIP][428] ([i915#16011]) -> [PASS][429] +1 other test pass
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-7/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-2-xrgb2101010.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-2-xrgb2101010.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg2:          [SKIP][430] ([i915#15073]) -> [PASS][431]
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-dg2-3/igt@kms_pm_rpm@dpms-lpsp.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-4/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg1:          [SKIP][432] ([i915#15073]) -> [PASS][433]
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-dg1-15/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-12/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-rkl:          [SKIP][434] ([i915#15073]) -> [PASS][435]
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-rkl:          [INCOMPLETE][436] ([i915#14419]) -> [PASS][437]
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-3/igt@kms_pm_rpm@system-suspend-modeset.html
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-5/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@perf_pmu@busy-idle-check-all@ccs0:
    - shard-mtlp:         [FAIL][438] ([i915#4349]) -> [PASS][439] +8 other tests pass
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-mtlp-7/igt@perf_pmu@busy-idle-check-all@ccs0.html
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-5/igt@perf_pmu@busy-idle-check-all@ccs0.html

  * igt@perf_pmu@busy-idle-check-all@vcs0:
    - shard-dg2:          [FAIL][440] ([i915#4349]) -> [PASS][441] +5 other tests pass
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-dg2-1/igt@perf_pmu@busy-idle-check-all@vcs0.html
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-7/igt@perf_pmu@busy-idle-check-all@vcs0.html

  * igt@perf_pmu@busy-idle-check-all@vecs0:
    - shard-dg1:          [FAIL][442] ([i915#4349]) -> [PASS][443] +3 other tests pass
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-dg1-18/igt@perf_pmu@busy-idle-check-all@vecs0.html
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-15/igt@perf_pmu@busy-idle-check-all@vecs0.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
    - shard-rkl:          [SKIP][444] ([i915#14544] / [i915#3281]) -> [SKIP][445] ([i915#3281]) +5 other tests skip
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-6/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-1/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html

  * igt@gem_exec_reloc@basic-wc-read:
    - shard-rkl:          [SKIP][446] ([i915#3281]) -> [SKIP][447] ([i915#14544] / [i915#3281]) +1 other test skip
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-2/igt@gem_exec_reloc@basic-wc-read.html
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@gem_exec_reloc@basic-wc-read.html

  * igt@gem_exec_schedule@semaphore-power:
    - shard-rkl:          [SKIP][448] ([i915#14544] / [i915#7276]) -> [SKIP][449] ([i915#7276])
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-6/igt@gem_exec_schedule@semaphore-power.html
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-1/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_huc_copy@huc-copy:
    - shard-rkl:          [SKIP][450] ([i915#2190]) -> [SKIP][451] ([i915#14544] / [i915#2190])
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-3/igt@gem_huc_copy@huc-copy.html
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-rkl:          [SKIP][452] ([i915#14544] / [i915#4613]) -> [SKIP][453] ([i915#4613])
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-6/igt@gem_lmem_swapping@parallel-multi.html
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-7/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-rkl:          [SKIP][454] ([i915#4613]) -> [SKIP][455] ([i915#14544] / [i915#4613]) +1 other test skip
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-2/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_pread@display:
    - shard-rkl:          [SKIP][456] ([i915#3282]) -> [SKIP][457] ([i915#14544] / [i915#3282])
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-8/igt@gem_pread@display.html
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@gem_pread@display.html

  * igt@gem_pwrite@basic-self:
    - shard-rkl:          [SKIP][458] ([i915#14544] / [i915#3282]) -> [SKIP][459] ([i915#3282]) +1 other test skip
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-6/igt@gem_pwrite@basic-self.html
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-3/igt@gem_pwrite@basic-self.html

  * igt@gem_userptr_blits@access-control:
    - shard-rkl:          [SKIP][460] ([i915#14544] / [i915#3297]) -> [SKIP][461] ([i915#3297])
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-6/igt@gem_userptr_blits@access-control.html
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-5/igt@gem_userptr_blits@access-control.html

  * igt@i915_module_load@fault-injection@__uc_init:
    - shard-rkl:          [SKIP][462] ([i915#14544] / [i915#15479]) -> [SKIP][463] ([i915#15479]) +4 other tests skip
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-6/igt@i915_module_load@fault-injection@__uc_init.html
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-3/igt@i915_module_load@fault-injection@__uc_init.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-rkl:          [SKIP][464] ([i915#14544] / [i915#1769] / [i915#3555]) -> [SKIP][465] ([i915#1769] / [i915#3555])
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-rkl:          [SKIP][466] ([i915#5286]) -> [SKIP][467] ([i915#14544] / [i915#5286])
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-rkl:          [SKIP][468] ([i915#14544] / [i915#5286]) -> [SKIP][469] ([i915#5286])
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-rkl:          [SKIP][470] ([i915#3638]) -> [SKIP][471] ([i915#14544] / [i915#3638])
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-7/igt@kms_big_fb@linear-64bpp-rotate-90.html
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-rkl:          [SKIP][472] ([i915#14544] / [i915#3638]) -> [SKIP][473] ([i915#3638]) +2 other tests skip
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-6/igt@kms_big_fb@linear-8bpp-rotate-90.html
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-7/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          [SKIP][474] ([i915#6095]) -> [SKIP][475] ([i915#14544] / [i915#6095]) +1 other test skip
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-3/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-2.html
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:
    - shard-dg1:          [SKIP][476] ([i915#6095]) -> [SKIP][477] ([i915#4423] / [i915#6095])
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-dg1-15/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-12/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          [SKIP][478] ([i915#14544] / [i915#6095]) -> [SKIP][479] ([i915#6095]) +1 other test skip
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2.html
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          [SKIP][480] ([i915#14098] / [i915#14544] / [i915#6095]) -> [SKIP][481] ([i915#14098] / [i915#6095]) +7 other tests skip
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2.html
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1:
    - shard-glk:          [INCOMPLETE][482] ([i915#15582]) -> [INCOMPLETE][483] ([i915#14694] / [i915#15582]) +1 other test incomplete
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-glk8/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1.html
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk3/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:
    - shard-rkl:          [SKIP][484] ([i915#14098] / [i915#6095]) -> [SKIP][485] ([i915#14098] / [i915#14544] / [i915#6095]) +3 other tests skip
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-5/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html

  * igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d:
    - shard-rkl:          [SKIP][486] ([i915#14544] / [i915#16471]) -> [SKIP][487] ([i915#16471])
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d.html
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-2/igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:
    - shard-rkl:          [SKIP][488] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][489] ([i915#11151] / [i915#7828]) +5 other tests skip
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-6/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-3/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_edid@hdmi-mode-timings:
    - shard-rkl:          [SKIP][490] ([i915#11151] / [i915#7828]) -> [SKIP][491] ([i915#11151] / [i915#14544] / [i915#7828]) +1 other test skip
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-4/igt@kms_chamelium_edid@hdmi-mode-timings.html
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@kms_chamelium_edid@hdmi-mode-timings.html

  * igt@kms_content_protection@content-type-change:
    - shard-rkl:          [SKIP][492] ([i915#15865]) -> [SKIP][493] ([i915#14544] / [i915#15865])
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-5/igt@kms_content_protection@content-type-change.html
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@kms_content_protection@content-type-change.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-rkl:          [SKIP][494] ([i915#14544] / [i915#3555]) -> [SKIP][495] ([i915#3555]) +1 other test skip
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-32x10.html
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-2/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-rkl:          [SKIP][496] -> [SKIP][497] ([i915#14544]) +28 other tests skip
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-rkl:          [SKIP][498] ([i915#14544] / [i915#4103]) -> [SKIP][499] ([i915#4103])
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-rkl:          [SKIP][500] ([i915#14544]) -> [SKIP][501] +37 other tests skip
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-7/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-rkl:          [SKIP][502] ([i915#16361]) -> [SKIP][503] ([i915#14544] / [i915#16361]) +1 other test skip
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-7/igt@kms_dsc@dsc-with-bpc.html
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-rkl:          [SKIP][504] ([i915#14544] / [i915#16361]) -> [SKIP][505] ([i915#16361]) +1 other test skip
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-8/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_feature_discovery@display-3x:
    - shard-rkl:          [SKIP][506] ([i915#14544] / [i915#16081]) -> [SKIP][507] ([i915#16081])
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-6/igt@kms_feature_discovery@display-3x.html
   [507]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-4/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-glk:          [INCOMPLETE][508] ([i915#12314] / [i915#12745] / [i915#4839]) -> [INCOMPLETE][509] ([i915#12745] / [i915#4839])
   [508]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-glk5/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [509]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk6/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          [INCOMPLETE][510] ([i915#12314] / [i915#12745]) -> [INCOMPLETE][511] ([i915#12745])
   [510]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-glk5/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2.html
   [511]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk6/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-plain-flip:
    - shard-rkl:          [SKIP][512] ([i915#14544] / [i915#9934]) -> [SKIP][513] ([i915#9934]) +2 other tests skip
   [512]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-6/igt@kms_flip@2x-plain-flip.html
   [513]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-8/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:
    - shard-rkl:          [SKIP][514] ([i915#14544] / [i915#15643]) -> [SKIP][515] ([i915#15643]) +2 other tests skip
   [514]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html
   [515]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html

  * igt@kms_force_connector_basic@force-load-detect:
    - shard-mtlp:         [SKIP][516] -> [SKIP][517] ([i915#15672])
   [516]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-mtlp-6/igt@kms_force_connector_basic@force-load-detect.html
   [517]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-1/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][518] ([i915#14544] / [i915#1825]) -> [SKIP][519] ([i915#1825]) +3 other tests skip
   [518]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt.html
   [519]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][520] ([i915#1825]) -> [SKIP][521] ([i915#14544] / [i915#1825]) +1 other test skip
   [520]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-gtt.html
   [521]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary:
    - shard-dg2:          [SKIP][522] ([i915#15102]) -> [SKIP][523] ([i915#10433] / [i915#15102])
   [522]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html
   [523]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-rkl:          [SKIP][524] ([i915#15102]) -> [SKIP][525] ([i915#14544] / [i915#15102]) +5 other tests skip
   [524]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-wc.html
   [525]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4:
    - shard-rkl:          [SKIP][526] ([i915#14544] / [i915#5439]) -> [SKIP][527] ([i915#5439])
   [526]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html
   [527]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html

  * igt@kms_frontbuffer_tracking@hdr-suspend:
    - shard-rkl:          [SKIP][528] ([i915#15989]) -> [INCOMPLETE][529] ([i915#16056])
   [528]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-5/igt@kms_frontbuffer_tracking@hdr-suspend.html
   [529]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-suspend.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt:
    - shard-dg2:          [SKIP][530] ([i915#10433] / [i915#15102]) -> [SKIP][531] ([i915#15102]) +1 other test skip
   [530]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt.html
   [531]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-rte:
    - shard-rkl:          [SKIP][532] ([i915#14544] / [i915#15102] / [i915#3023]) -> [SKIP][533] ([i915#15102] / [i915#3023]) +11 other tests skip
   [532]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-rte.html
   [533]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-1p-rte.html

  * igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt:
    - shard-rkl:          [SKIP][534] ([i915#15102] / [i915#3023]) -> [SKIP][535] ([i915#14544] / [i915#15102] / [i915#3023]) +4 other tests skip
   [534]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt.html
   [535]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-blt:
    - shard-rkl:          [SKIP][536] ([i915#14544] / [i915#15102]) -> [SKIP][537] ([i915#15102]) +14 other tests skip
   [536]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-blt.html
   [537]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-1/igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-blt.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-dg1:          [SKIP][538] ([i915#15458] / [i915#4423]) -> [SKIP][539] ([i915#15458])
   [538]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-dg1-18/igt@kms_joiner@basic-force-ultra-joiner.html
   [539]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-12/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-rkl:          [SKIP][540] ([i915#14544] / [i915#15458]) -> [SKIP][541] ([i915#15458])
   [540]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [541]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-3/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:
    - shard-rkl:          [SKIP][542] ([i915#15709]) -> [SKIP][543] ([i915#14544] / [i915#15709]) +1 other test skip
   [542]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-4/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html
   [543]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:
    - shard-rkl:          [SKIP][544] ([i915#14544] / [i915#15709]) -> [SKIP][545] ([i915#15709])
   [544]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-6/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html
   [545]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-7/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-rkl:          [SKIP][546] ([i915#13958] / [i915#14544]) -> [SKIP][547] ([i915#13958])
   [546]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-y.html
   [547]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-5/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-rkl:          [SKIP][548] ([i915#14259]) -> [SKIP][549] ([i915#14259] / [i915#14544])
   [548]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-4/igt@kms_plane_multiple@tiling-yf.html
   [549]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-rkl:          [SKIP][550] ([i915#9340]) -> [SKIP][551] ([i915#3828])
   [550]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-4/igt@kms_pm_lpsp@kms-lpsp.html
   [551]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-5/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-rkl:          [SKIP][552] ([i915#14544] / [i915#15073]) -> [SKIP][553] ([i915#15073])
   [552]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-6/igt@kms_pm_rpm@dpms-lpsp.html
   [553]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-4/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
    - shard-rkl:          [SKIP][554] ([i915#11520] / [i915#14544]) -> [SKIP][555] ([i915#11520]) +3 other tests skip
   [554]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html
   [555]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-3/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:
    - shard-rkl:          [SKIP][556] ([i915#11520]) -> [SKIP][557] ([i915#11520] / [i915#14544]) +1 other test skip
   [556]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-8/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html
   [557]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-rkl:          [SKIP][558] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][559] ([i915#1072] / [i915#9732]) +7 other tests skip
   [558]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-6/igt@kms_psr@fbc-psr2-primary-blt.html
   [559]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-5/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@kms_psr@pr-cursor-plane-move:
    - shard-dg1:          [SKIP][560] ([i915#1072] / [i915#9732]) -> [SKIP][561] ([i915#1072] / [i915#4423] / [i915#9732])
   [560]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-dg1-16/igt@kms_psr@pr-cursor-plane-move.html
   [561]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-19/igt@kms_psr@pr-cursor-plane-move.html

  * igt@kms_psr@psr-cursor-plane-move:
    - shard-rkl:          [SKIP][562] ([i915#1072] / [i915#9732]) -> [SKIP][563] ([i915#1072] / [i915#14544] / [i915#9732]) +5 other tests skip
   [562]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-8/igt@kms_psr@psr-cursor-plane-move.html
   [563]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-rkl:          [SKIP][564] ([i915#5289]) -> [SKIP][565] ([i915#14544] / [i915#5289])
   [564]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [565]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_vrr@lobf:
    - shard-rkl:          [SKIP][566] ([i915#11920]) -> [SKIP][567] ([i915#11920] / [i915#14544])
   [566]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-5/igt@kms_vrr@lobf.html
   [567]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@kms_vrr@lobf.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-rkl:          [SKIP][568] ([i915#9906]) -> [SKIP][569] ([i915#14544] / [i915#9906])
   [568]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-5/igt@kms_vrr@seamless-rr-switch-virtual.html
   [569]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-rkl:          [SKIP][570] ([i915#14544] / [i915#9906]) -> [SKIP][571] ([i915#9906])
   [570]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-6/igt@kms_vrr@seamless-rr-switch-vrr.html
   [571]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-8/igt@kms_vrr@seamless-rr-switch-vrr.html

  
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
  [i915#11920]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920
  [i915#11965]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11965
  [i915#12169]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12169
  [i915#12177]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12177
  [i915#12276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12314]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
  [i915#12358]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12761]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761
  [i915#13027]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027
  [i915#13029]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13179]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179
  [i915#13196]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13196
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13363]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13363
  [i915#13398]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398
  [i915#13520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13520
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707
  [i915#13748]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748
  [i915#13749]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749
  [i915#13790]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13790
  [i915#13809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13809
  [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
  [i915#14073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14152]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152
  [i915#14259]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259
  [i915#14419]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419
  [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
  [i915#14694]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14694
  [i915#14888]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14888
  [i915#14995]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14995
  [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
  [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
  [i915#15104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104
  [i915#15132]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132
  [i915#15329]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329
  [i915#15330]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330
  [i915#15342]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342
  [i915#15458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458
  [i915#15459]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459
  [i915#15460]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460
  [i915#15479]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15479
  [i915#15582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582
  [i915#15643]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643
  [i915#15672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15672
  [i915#15678]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15678
  [i915#15709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709
  [i915#15725]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15725
  [i915#15778]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15778
  [i915#15816]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15816
  [i915#15865]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865
  [i915#15867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867
  [i915#15931]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15931
  [i915#15949]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949
  [i915#15989]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989
  [i915#15990]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990
  [i915#15991]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991
  [i915#16011]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011
  [i915#16012]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16012
  [i915#16021]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16021
  [i915#16056]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16056
  [i915#16066]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16066
  [i915#16081]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081
  [i915#16084]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16084
  [i915#16112]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16112
  [i915#16168]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16168
  [i915#16193]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16193
  [i915#16236]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16236
  [i915#16349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16349
  [i915#16361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361
  [i915#16386]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386
  [i915#16471]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#2435]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2435
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2681
  [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
  [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
  [i915#315]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/315
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
  [i915#3469]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3469
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
  [i915#3778]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3778
  [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
  [i915#3955]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
  [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
  [i915#4818]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4818
  [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
  [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
  [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
  [i915#4885]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4885
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6113]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113
  [i915#6230]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230
  [i915#6334]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334
  [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#6590]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590
  [i915#6805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6805
  [i915#6893]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6893
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7016]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7016
  [i915#7276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7276
  [i915#7443]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7443
  [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#7975]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7975
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808
  [i915#8812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812
  [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9337]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9337
  [i915#9340]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
  [i915#9531]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531
  [i915#9561]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9561
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808
  [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
  [i915#9878]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9878
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8977 -> IGTPW_15414

  CI-20190529: 20190529
  CI_DRM_18707: 6583dd200482a34bb17e5dc54551f91f53b79798 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15414: 15414
  IGT_8977: c8bdb0bc2140e337e1d79969430c3d7a5c088c9e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/index.html

--===============7868814991301003163==
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
<tr><td><b>Series:</b></td><td>Enable multi-format testing for pipe color tests (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167634/">https://patchwork.freedesktop.org/series/167634/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8977_full -&gt; IGTPW_15414_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_15414_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_15414_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/index.html</p>
<h2>Participating hosts (10 -&gt; 10)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_15414_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_color@ctm-blue-to-red:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-dg1-18/igt@kms_color@ctm-blue-to-red.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-16/igt@kms_color@ctm-blue-to-red.html">FAIL</a> +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-1-nv12 (NEW):</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-14/igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-1-nv12.html">FAIL</a> +121 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-1-nv12 (NEW):</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-5/igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-1-nv12.html">FAIL</a> +114 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-glk2/igt@kms_color@ctm-max.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk4/igt@kms_color@ctm-max.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-hdmi-a-3-nv12 (NEW):</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-7/igt@kms_color@ctm-max@pipe-a-hdmi-a-3-nv12.html">FAIL</a> +129 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-hdmi-a-1-p010 (NEW):</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk4/igt@kms_color@ctm-negative@pipe-a-hdmi-a-1-p010.html">FAIL</a> +133 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-d-edp-1-nv12 (NEW):</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-1/igt@kms_color@ctm-negative@pipe-d-edp-1-nv12.html">FAIL</a> +120 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-mtlp-7/igt@kms_color@ctm-signed.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-3/igt@kms_color@ctm-signed.html">FAIL</a> +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-hdmi-a-2-nv12 (NEW):</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-3/igt@kms_color@degamma@pipe-a-hdmi-a-2-nv12.html">FAIL</a> +72 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-hdmi-a-2-yuyv (NEW):</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk10/igt@kms_color@degamma@pipe-b-hdmi-a-2-yuyv.html">FAIL</a> +17 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-d-hdmi-a-1-p010 (NEW):</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-1/igt@kms_color@degamma@pipe-d-hdmi-a-1-p010.html">FAIL</a> +8 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-dg2-5/igt@kms_color@gamma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-5/igt@kms_color@gamma.html">FAIL</a> +4 other tests fail</li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-5/igt@kms_color@gamma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-2/igt@kms_color@gamma.html">FAIL</a> +5 other tests fail</li>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-tglu-10/igt@kms_color@gamma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-6/igt@kms_color@gamma.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_8977_full and IGTPW_15414_full:</p>
<h3>New IGT tests (1138)</h3>
<ul>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [7.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [7.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [7.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-hdmi-a-1-fp16:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.70, 0.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [1.92, 2.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [2.22, 2.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.93, 2.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.80, 1.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [1.85, 2.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [18.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-hdmi-a-4-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-hdmi-a-4-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-hdmi-a-4-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-hdmi-a-4-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [9.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-hdmi-a-4-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-hdmi-a-4-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-vga-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-vga-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [7.38] s</li>
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
<li>Exec time: [4.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [7.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-hdmi-a-1-fp16:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.61, 0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [1.91, 2.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [2.23, 2.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.90, 2.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.81, 1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [1.89, 2.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [18.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.45] s</li>
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
<p>igt@kms_color@ctm-0-25@pipe-b-hdmi-a-4-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-hdmi-a-4-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-hdmi-a-4-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-hdmi-a-4-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [9.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-hdmi-a-4-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-hdmi-a-4-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-vga-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-vga-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [7.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [7.71] s</li>
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
<p>igt@kms_color@ctm-0-25@pipe-c-hdmi-a-1-fp16:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.59, 0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [1.97, 2.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [2.27, 2.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.91, 2.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.81, 1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [1.84, 2.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [18.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-hdmi-a-4-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-hdmi-a-4-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-hdmi-a-4-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-hdmi-a-4-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [9.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-hdmi-a-4-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-hdmi-a-4-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [7.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [7.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [7.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-hdmi-a-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.90] s</li>
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
<li>Exec time: [1.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [18.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-hdmi-a-4-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-hdmi-a-4-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-hdmi-a-4-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-hdmi-a-4-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [9.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-hdmi-a-4-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-hdmi-a-4-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [7.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [7.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [7.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-hdmi-a-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.90, 2.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.84, 1.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [18.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-hdmi-a-4-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-hdmi-a-4-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-hdmi-a-4-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-hdmi-a-4-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [9.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-hdmi-a-4-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-hdmi-a-4-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-vga-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.58] s</li>
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
<p>igt@kms_color@ctm-0-50@pipe-b-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [7.17] s</li>
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
<li>Exec time: [4.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [7.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-hdmi-a-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.90, 2.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.81, 1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [18.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-hdmi-a-4-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-hdmi-a-4-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.10] s</li>
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
<li>Exec time: [9.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-hdmi-a-4-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-hdmi-a-4-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-vga-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.57] s</li>
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
<p>igt@kms_color@ctm-0-50@pipe-c-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [7.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [7.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.01] s</li>
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
<p>igt@kms_color@ctm-0-50@pipe-c-hdmi-a-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [18.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-hdmi-a-4-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-hdmi-a-4-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-hdmi-a-4-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-hdmi-a-4-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [9.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-hdmi-a-4-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-hdmi-a-4-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-d-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-d-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [7.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-d-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [7.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-d-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-d-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-d-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [7.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-d-hdmi-a-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-d-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-d-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-d-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-d-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-d-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-d-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-d-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-d-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-d-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [18.36] s</li>
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
<li>Exec time: [4.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-d-hdmi-a-4-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.05] s</li>
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
<li>Exec time: [3.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-d-hdmi-a-4-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [9.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-d-hdmi-a-4-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-d-hdmi-a-4-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [10.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [10.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [10.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-hdmi-a-1-fp16:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [0.68, 9.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [2.72, 5.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [3.18, 6.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.63, 1.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.08, 2.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [2.61, 5.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-hdmi-a-2-fp16:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [8.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-hdmi-a-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-hdmi-a-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [6.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-hdmi-a-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-hdmi-a-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-hdmi-a-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [7.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-hdmi-a-4-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-hdmi-a-4-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-hdmi-a-4-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-hdmi-a-4-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-hdmi-a-4-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-hdmi-a-4-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-vga-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-vga-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [10.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [10.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [10.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-hdmi-a-1-fp16:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [0.61, 8.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [2.75, 5.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [3.16, 6.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.64, 1.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.08, 2.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [2.61, 5.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-hdmi-a-2-fp16:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [8.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-hdmi-a-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-hdmi-a-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [6.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-hdmi-a-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-hdmi-a-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-hdmi-a-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [7.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-hdmi-a-4-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-hdmi-a-4-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-hdmi-a-4-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-hdmi-a-4-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-hdmi-a-4-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-hdmi-a-4-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-vga-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-vga-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.63] s</li>
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
<li>Exec time: [10.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.40] s</li>
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
<p>igt@kms_color@ctm-0-75@pipe-c-hdmi-a-1-fp16:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [0.61, 8.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [2.75, 5.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [3.16, 6.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.63, 1.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.06, 2.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [2.62, 5.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-hdmi-a-2-fp16:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [9.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-hdmi-a-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-hdmi-a-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [6.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-hdmi-a-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-hdmi-a-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-hdmi-a-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [7.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-hdmi-a-4-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-hdmi-a-4-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-hdmi-a-4-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-hdmi-a-4-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-hdmi-a-4-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-hdmi-a-4-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-d-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.63] s</li>
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
<li>Exec time: [1.37] s</li>
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
<li>Exec time: [10.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-d-hdmi-a-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-d-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-d-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-d-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-d-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-d-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-d-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-d-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-d-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [7.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-d-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-d-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-d-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-d-hdmi-a-4-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-d-hdmi-a-4-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-d-hdmi-a-4-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-d-hdmi-a-4-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-d-hdmi-a-4-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-d-hdmi-a-4-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-1-fp16:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.68, 1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.39, 0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.49, 1.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.63, 0.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.30, 0.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.42, 0.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-2-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-4-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-4-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-4-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-4-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-4-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-4-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-vga-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-vga-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-1-fp16:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.60, 1.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.41, 0.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.46, 0.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.63, 1.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.30, 0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.38, 0.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-2-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.28] s</li>
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
<li>Exec time: [0.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-4-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-4-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-4-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-4-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-4-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-4-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.67] s</li>
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
<li>Exec time: [0.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-1-fp16:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.60, 1.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.38, 0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.45, 0.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.64, 1.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.29, 0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.39, 0.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-2-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-4-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-4-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-4-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-4-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-4-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-4-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-d-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-d-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-d-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-d-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-d-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-d-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-4-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-4-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-4-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-4-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-4-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-4-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.44] s</li>
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
<li>Exec time: [0.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-1-fp16:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.68, 1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.41, 0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.47, 1.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.64, 3.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.29, 0.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.41, 0.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-2-fp16:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.76, 1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-2-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.48, 0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-2-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.58, 0.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-2-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.69, 1.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-2-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.57, 0.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-2-yuyv:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.53, 0.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.96] s</li>
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
<li>Exec time: [0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.60] s</li>
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
<li>Exec time: [1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-1-fp16:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.61, 1.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.40, 0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.46, 0.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.64, 3.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.30, 0.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.38, 0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-2-fp16:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.67, 1.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-2-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.50, 0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-2-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.56, 0.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-2-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.69, 1.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-2-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.48, 0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-2-yuyv:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.51, 0.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.37] s</li>
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
<li>Exec time: [0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-vga-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.54] s</li>
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
<p>igt@kms_color@ctm-green-to-red@pipe-c-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-1-fp16:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.61, 1.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.41, 0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.46, 0.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.65, 3.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.30, 0.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.39, 0.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-2-fp16:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.69, 1.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-2-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.48, 0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-2-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.56, 0.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-2-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.69, 1.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-2-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.48, 0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-2-yuyv:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.51, 0.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.45] s</li>
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
<li>Exec time: [1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-1-fp16:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.59, 1.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.38, 0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.46, 0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.64, 3.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.29, 0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.38, 0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-hdmi-a-1-fp16:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.68, 1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.39, 0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.48, 1.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.64, 1.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.31, 1.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.39, 1.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-hdmi-a-2-fp16:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.76, 1.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-hdmi-a-2-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.49, 0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-hdmi-a-2-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.58, 0.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-hdmi-a-2-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.69, 0.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-hdmi-a-2-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.57, 0.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-hdmi-a-2-yuyv:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.52, 0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.23, 2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.61, 0.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.84, 1.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.20, 6.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.62, 0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.70, 0.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-vga-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.53] s</li>
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
<p>igt@kms_color@ctm-max@pipe-b-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-hdmi-a-1-fp16:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.62, 1.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.40, 0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.45, 1.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.64, 1.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.29, 0.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.37, 0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-hdmi-a-2-fp16:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.67, 1.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-hdmi-a-2-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.49, 0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-hdmi-a-2-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.56, 0.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-hdmi-a-2-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.69, 1.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-hdmi-a-2-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.47, 0.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-hdmi-a-2-yuyv:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.48, 0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.07, 1.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.62, 0.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.79, 1.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.24, 6.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.51, 0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.65, 0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-vga-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-vga-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.64] s</li>
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
<li>Exec time: [1.56] s</li>
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
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-hdmi-a-1-fp16:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.61, 1.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.40, 0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.45, 0.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.63, 1.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.31, 0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.38, 0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-hdmi-a-2-fp16:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.67, 1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-hdmi-a-2-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.48, 0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-hdmi-a-2-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.56, 0.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-hdmi-a-2-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.69, 0.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-hdmi-a-2-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.46, 0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-hdmi-a-2-yuyv:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.50, 0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.03, 1.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.64, 0.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.81, 1.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.22, 6.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.52, 0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.66, 0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-d-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-d-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-d-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.56] s</li>
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
<li>Exec time: [1.40] s</li>
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
<p>igt@kms_color@ctm-max@pipe-d-hdmi-a-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-d-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-d-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-d-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-d-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-d-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-d-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.10, 1.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-d-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.61, 0.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-d-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.78, 1.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-d-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.20, 6.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-d-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.52, 0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-d-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.64, 0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-hdmi-a-1-fp16:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.67, 1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.39, 0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.48, 1.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.63, 1.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.30, 0.97] s</li>
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
<p>igt@kms_color@ctm-negative@pipe-a-hdmi-a-2-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-hdmi-a-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-hdmi-a-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-hdmi-a-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-hdmi-a-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-hdmi-a-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.18, 2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.62, 0.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.82, 1.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.20, 5.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.65, 0.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.73, 0.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-vga-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-vga-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-hdmi-a-1-fp16:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.59, 1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.40, 0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.47, 1.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.63, 1.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.30, 0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.38, 0.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-hdmi-a-2-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-hdmi-a-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-hdmi-a-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-hdmi-a-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-hdmi-a-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-hdmi-a-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.07, 1.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.64, 0.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.78, 1.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.20, 6.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.51, 0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.67, 0.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-vga-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-vga-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-hdmi-a-1-fp16:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.60, 1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.40, 0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.47, 0.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.64, 1.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.31, 0.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.38, 0.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-hdmi-a-2-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-hdmi-a-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-hdmi-a-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-hdmi-a-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-hdmi-a-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-hdmi-a-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.07, 1.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.64, 0.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.76, 1.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.22, 6.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.49, 0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.67, 0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-d-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-d-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-d-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.57] s</li>
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
<li>Exec time: [1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-d-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-d-hdmi-a-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-d-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-d-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-d-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-d-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-d-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-d-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.14, 1.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-d-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.63, 0.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-d-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.78, 1.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-d-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.20, 6.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-d-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-d-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.66, 0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-1-fp16:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.68, 1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.40, 0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.48, 1.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.64, 1.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.30, 0.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.44, 0.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-2-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.22, 2.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.62, 0.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.82, 1.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.17, 6.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.68, 0.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.71, 0.96] s</li>
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
<li>Exec time: [0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.58] s</li>
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
<li>Exec time: [1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-1-fp16:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.59, 1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.39, 0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.46, 1.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.64, 1.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.30, 0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.38, 0.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-2-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.03, 1.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.62, 0.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.78, 1.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.17, 6.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.51, 0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.65, 0.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-vga-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.52] s</li>
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
<p>igt@kms_color@ctm-red-to-blue@pipe-c-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-1-fp16:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.61, 1.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.40, 0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.47, 0.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.63, 1.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.31, 0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.38, 0.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-2-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.07, 2.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.64, 0.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.79, 1.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.17, 6.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.49, 0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.67, 0.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-d-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-d-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.43] s</li>
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
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-d-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.09, 2.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.64, 0.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.76, 1.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.17, 6.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.54, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.65, 0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-hdmi-a-1-fp16:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [0.71, 4.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [1.21, 2.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [1.38, 2.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.02, 1.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.55, 1.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [1.14, 2.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-hdmi-a-2-fp16:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [0.76, 4.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-hdmi-a-2-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [1.46, 2.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-hdmi-a-2-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [1.70, 2.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-hdmi-a-2-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.03, 1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-hdmi-a-2-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.71, 1.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-hdmi-a-2-yuyv:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [1.52, 2.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.32] s</li>
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
<li>Exec time: [12.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-hdmi-a-4-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-hdmi-a-4-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-hdmi-a-4-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-hdmi-a-4-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-hdmi-a-4-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-hdmi-a-4-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-vga-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-vga-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.83] s</li>
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
<p>igt@kms_color@ctm-signed@pipe-b-hdmi-a-1-fp16:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [0.61, 3.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [1.17, 2.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [1.36, 3.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.02, 1.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.56, 1.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [1.12, 2.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-hdmi-a-2-fp16:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [0.67, 3.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-hdmi-a-2-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [1.45, 2.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-hdmi-a-2-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [1.70, 2.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-hdmi-a-2-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.01, 1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-hdmi-a-2-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.68, 0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-hdmi-a-2-yuyv:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [1.50, 2.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.77] s</li>
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
<li>Exec time: [3.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [12.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-hdmi-a-4-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-hdmi-a-4-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-hdmi-a-4-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-hdmi-a-4-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-hdmi-a-4-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-hdmi-a-4-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.96] s</li>
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
<p>igt@kms_color@ctm-signed@pipe-c-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-hdmi-a-1-fp16:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [0.61, 3.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [1.16, 2.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [1.35, 2.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.99, 1.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.56, 0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [1.14, 2.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-hdmi-a-2-fp16:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [0.69, 3.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-hdmi-a-2-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [1.48, 2.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-hdmi-a-2-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [1.68, 2.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-hdmi-a-2-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.01, 1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-hdmi-a-2-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.68, 0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-hdmi-a-2-yuyv:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [1.50, 2.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [12.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-hdmi-a-4-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-hdmi-a-4-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-hdmi-a-4-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-hdmi-a-4-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-hdmi-a-4-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-hdmi-a-4-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-hdmi-a-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [12.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-hdmi-a-4-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-hdmi-a-4-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-hdmi-a-4-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-hdmi-a-4-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-hdmi-a-4-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-hdmi-a-4-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-hdmi-a-1-fp16:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.81, 1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.56, 0.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.61, 0.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 3.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s) 2 pass(s)</li>
<li>Exec time: [0.55, 0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-hdmi-a-2-fp16:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.74, 1.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-hdmi-a-2-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.51, 0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-hdmi-a-2-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.58, 0.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-hdmi-a-2-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.67, 0.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-hdmi-a-2-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.57, 0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-hdmi-a-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [0.52, 0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.99] s</li>
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
<p>igt@kms_color@degamma@pipe-b-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-hdmi-a-1-fp16:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.74, 1.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.54, 0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.58, 0.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 3.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s) 2 pass(s)</li>
<li>Exec time: [0.51, 0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-hdmi-a-2-fp16:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.67, 1.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-hdmi-a-2-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.48, 0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-hdmi-a-2-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.54, 0.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-hdmi-a-2-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.67, 0.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-hdmi-a-2-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.46, 0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-hdmi-a-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [0.48, 0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.94] s</li>
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
<p>igt@kms_color@degamma@pipe-c-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-hdmi-a-1-fp16:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.76, 1.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.54, 0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.60, 0.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.78, 3.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.50, 0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s) 2 pass(s)</li>
<li>Exec time: [0.51, 0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-hdmi-a-2-fp16:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.65, 1.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-hdmi-a-2-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.50, 0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-hdmi-a-2-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.54, 0.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-hdmi-a-2-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.67, 0.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-hdmi-a-2-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.47, 0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-hdmi-a-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [0.48, 0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-d-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-d-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-d-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-d-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-d-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-d-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-d-hdmi-a-1-fp16:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.74, 1.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-d-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.54, 0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-d-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.58, 0.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-d-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.78, 3.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-d-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.51, 0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-d-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.51, 0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-d-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-d-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-d-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-d-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-d-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-d-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-hdmi-a-1-fp16:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.70, 1.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.40, 0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.46, 0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.63, 3.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.32, 0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.38, 0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-vga-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-vga-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-hdmi-a-1-fp16:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.61, 1.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.39, 0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.44, 0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.64, 3.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.29, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.38, 0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-vga-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-vga-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-c-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-c-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-c-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-c-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-c-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-c-hdmi-a-1-fp16:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.60, 1.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-c-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.39, 0.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-c-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.43, 0.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-c-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.63, 3.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-c-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.30, 0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-c-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.37, 0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-c-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-c-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-c-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-c-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-c-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-c-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-d-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-d-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-d-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-d-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-d-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-d-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-d-hdmi-a-1-fp16:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.59, 1.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-d-hdmi-a-1-nv12:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.39, 0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-d-hdmi-a-1-p010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.44, 0.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-d-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.64, 3.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-d-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.30, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-d-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.37, 0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-d-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-d-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-d-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-d-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-d-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-d-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-a-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-a-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.00, 0.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-a-hdmi-a-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-a-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-a-hdmi-a-4-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-a-vga-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-b-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-b-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.00, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-b-hdmi-a-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-b-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-b-hdmi-a-4-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-b-vga-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-c-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-c-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-c-hdmi-a-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-c-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-c-hdmi-a-4-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-d-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-d-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-d-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-d-hdmi-a-4-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
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
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.32, 1.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-a-hdmi-a-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-a-hdmi-a-4-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-a-vga-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.55] s</li>
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
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.31, 0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-b-hdmi-a-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-b-hdmi-a-4-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-b-vga-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-c-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-c-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.32, 0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-c-hdmi-a-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-c-hdmi-a-4-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-d-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-d-hdmi-a-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-d-hdmi-a-4-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.54] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15414_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-keep-cache:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-6/igt@api_intel_bb@blit-reloc-keep-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-16/igt@api_intel_bb@blit-reloc-keep-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@crc32:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-4/igt@api_intel_bb@crc32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230">i915#6230</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-4/igt@device_reset@unbind-cold-reset-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078">i915#11078</a>)</li>
</ul>
</li>
<li>
<p>igt@dmabuf@all-tests:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-9/igt@dmabuf@all-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15931">i915#15931</a>)</li>
</ul>
</li>
<li>
<p>igt@drm_buddy@drm_buddy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@drm_buddy@drm_buddy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15678">i915#15678</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-2/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-15/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-1/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-5/igt@gem_ccs@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-9/igt@gem_create@create-ext-cpu-access-big.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_freq@sysfs@gt0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-dg2-5/igt@gem_ctx_freq@sysfs@gt0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-1/igt@gem_ctx_freq@sysfs@gt0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9561">i915#9561</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@smoketest:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-snb4/igt@gem_ctx_persistence@smoketest.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099">i915#1099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-2/igt@gem_ctx_sseu@engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@noheartbeat:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-8/igt@gem_exec_balancer@noheartbeat.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555">i915#8555</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-17/igt@gem_exec_balancer@noheartbeat.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555">i915#8555</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-5/igt@gem_exec_balancer@noheartbeat.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555">i915#8555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-2/igt@gem_exec_balancer@parallel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-1/igt@gem_exec_balancer@parallel-out-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_big@single:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-7/igt@gem_exec_big@single.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15816">i915#15816</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-1/igt@gem_exec_capture@capture.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11965">i915#11965</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk9/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334">i915#6334</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture@vecs0-lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-8/igt@gem_exec_capture@capture@vecs0-lmem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11965">i915#11965</a>) +4 other tests fail</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-19/igt@gem_exec_capture@capture@vecs0-lmem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11965">i915#11965</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-prw-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-7/igt@gem_exec_flush@basic-uc-prw-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-19/igt@gem_exec_flush@basic-uc-prw-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-ro-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-8/igt@gem_exec_flush@basic-wb-ro-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-17/igt@gem_exec_flush@basic-wb-ro-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-4/igt@gem_exec_reloc@basic-gtt-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-cpu:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-1/igt@gem_exec_reloc@basic-wc-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-wc-noreloc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-7/igt@gem_exec_reloc@basic-write-wc-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-15/igt@gem_exec_reloc@basic-write-wc-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@2-spare-fences:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-1/igt@gem_fenced_exec_thrash@2-spare-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-16/igt@gem_fenced_exec_thrash@2-spare-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-7/igt@gem_fenced_exec_thrash@2-spare-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-1/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-8/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-9/igt@gem_lmem_swapping@heavy-verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-verify.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk9/igt@gem_lmem_swapping@verify-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-5/igt@gem_media_vme.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284">i915#284</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-2/igt@gem_media_vme.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284">i915#284</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-18/igt@gem_media_vme.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284">i915#284</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-4/igt@gem_media_vme.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284">i915#284</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-4/igt@gem_media_vme.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284">i915#284</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_offset@clear-via-pagefault:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-mtlp-1/igt@gem_mmap_offset@clear-via-pagefault.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-7/igt@gem_mmap_offset@clear-via-pagefault.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16021">i915#16021</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16168">i915#16168</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16349">i915#16349</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-8/igt@gem_partial_pwrite_pread@reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +4 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-17/igt@gem_partial_pwrite_pread@reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-display:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-1/igt@gem_partial_pwrite_pread@reads-display.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-protected-buffer:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-5/igt@gem_pxp@create-protected-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-15/igt@gem_pxp@create-protected-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-context:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-1/igt@gem_pxp@hw-rejects-pxp-context.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398">i915#13398</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-execution-after-suspend-resume:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-6/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-7/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@linear-to-vebox-y-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-7/igt@gem_render_copy@linear-to-vebox-y-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk4/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html">SKIP</a> +597 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-y-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-2/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-5/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4885">i915#4885</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-18/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4885">i915#4885</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-4/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4885">i915#4885</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk10/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13809">i915#13809</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16193">i915#16193</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_partial_pwrite_pread@reads:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-2/igt@gem_tiled_partial_pwrite_pread@reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-unsync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-4/igt@gem_userptr_blits@coherency-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@relocations:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-4/igt@gem_userptr_blits@relocations.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@gem_userptr_blits@relocations.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-15/igt@gem_userptr_blits@relocations.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-6/igt@gem_userptr_blits@relocations.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-3/igt@gem_userptr_blits@unsync-unmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-glk6/igt@gem_workarounds@suspend-resume-context.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk8/igt@gem_workarounds@suspend-resume-context.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>)</li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-3/igt@gem_workarounds@suspend-resume-context.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@gem_workarounds@suspend-resume-context.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-2/igt@gen9_exec_parse@allowed-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-1/igt@gen9_exec_parse@allowed-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +2 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-1/igt@gen9_exec_parse@allowed-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-14/igt@gen9_exec_parse@allowed-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-7/igt@gen9_exec_parse@basic-rejected.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-zero-length:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-1/igt@gen9_exec_parse@batch-zero-length.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-idle@bcs0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-18/igt@i915_drm_fdinfo@busy-idle@bcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073">i915#14073</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-idle@rcs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-8/igt@i915_drm_fdinfo@busy-idle@rcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073">i915#14073</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@most-busy-idle-check-all@vecs1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-5/igt@i915_drm_fdinfo@most-busy-idle-check-all@vecs1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073">i915#14073</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@intel_connector_register:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk11/igt@i915_module_load@fault-injection@intel_connector_register.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342">i915#15342</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-1/igt@i915_pm_freq_api@freq-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#8399</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-10/igt@i915_pm_freq_api@freq-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-4/igt@i915_pm_freq_mult@media-freq@gt0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590">i915#6590</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-6/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7443">i915#7443</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-6/igt@i915_suspend@fence-restore-untiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-1/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-x-tiled-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-1/igt@kms_addfb_basic@basic-x-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk9/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761">i915#12761</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14995">i915#14995</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-8/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531">i915#9531</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-1/igt@kms_atomic_transition@plane-all-modeset-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk10/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-5/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-1/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-14/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-2/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-8/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-5/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-4/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-12/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +4 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-16/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-1/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-6/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk10/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-hdmi-a-2.html">SKIP</a> +177 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-10/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-7/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +65 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-12/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-8/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk11/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> +156 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14694">i915#14694</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-5/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk2/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-1/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-16/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-3/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-7/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-4/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +71 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-2/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-12/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +184 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-4/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10434</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-5/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-1/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-ctm3x4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-5/igt@kms_chamelium_color_pipeline@plane-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-16/igt@kms_chamelium_color_pipeline@plane-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-4/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +3 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-4/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +4 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-12/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-6/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-multiple:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@kms_chamelium_frames@dp-crc-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-1/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-9/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-dg2-6/igt@kms_color@ctm-0-25.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-5/igt@kms_color@ctm-0-25.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/315">i915#315</a>) +2 other tests fail</li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-2/igt@kms_color@ctm-0-25.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-2/igt@kms_color@ctm-0-25.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/315">i915#315</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk3/igt@kms_color@ctm-0-75.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/315">i915#315</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-tglu-7/igt@kms_color@ctm-blue-to-red.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-3/igt@kms_color@ctm-blue-to-red.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/315">i915#315</a>) +2 other tests fail</li>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-glk6/igt@kms_color@ctm-blue-to-red.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk2/igt@kms_color@ctm-blue-to-red.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/315">i915#315</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-dg2-3/igt@kms_color@degamma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-1/igt@kms_color@degamma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6893">i915#6893</a>)</li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-dg1-16/igt@kms_color@degamma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-14/igt@kms_color@degamma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6893">i915#6893</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk10/igt@kms_color@degamma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6893">i915#6893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-vga-1-xrgb2101010 (NEW):</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-snb5/igt@kms_color@degamma@pipe-a-vga-1-xrgb2101010.html">SKIP</a> +116 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-5/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms-hdcp14:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-4/igt@kms_content_protection@atomic-dpms-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-13/igt@kms_content_protection@atomic-dpms-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-4/igt@kms_content_protection@atomic-dpms-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-1/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-7/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-4/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-hdcp14:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-3/igt@kms_content_protection@dp-mst-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-19/igt@kms_content_protection@dp-mst-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-3/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-18/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-8/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-8/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-3/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-4/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-4/igt@kms_cursor_crc@cursor-random-128x42.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-7/igt@kms_cursor_crc@cursor-random-128x42.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-6/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-3/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x42:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-2/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814">i915#8814</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-7/igt@kms_cursor_crc@cursor-sliding-256x85.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-10/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-bo:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-dg1-15/igt@kms_cursor_legacy@single-bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-16/igt@kms_cursor_legacy@single-bo.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-4/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-4/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749">i915#13749</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-1/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915#13748</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-2/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915#13748</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-1/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707">i915#13707</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-5/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707">i915#13707</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-16/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707">i915#13707</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-3/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707">i915#13707</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-7/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707">i915#13707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-8/igt@kms_draw_crc@draw-method-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812">i915#8812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-1/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-bigjoiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-8/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-12/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-2/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +5 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-1/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-3/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk6/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9878">i915#9878</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-3/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955">i915#3955</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-5/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3469">i915#3469</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-3/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16084">i915#16084</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-18/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16084">i915#16084</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-5/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9337">i915#9337</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-4/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9337">i915#9337</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-1/igt@kms_flip@2x-flip-vs-dpms-on-nop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk5/igt@kms_flip@2x-flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314">i915#12314</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113">i915#6113</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-8/igt@kms_flip@2x-flip-vs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-9/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-7/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +8 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-17/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-3/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027">i915#13027</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk8/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314">i915#12314</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk8/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314">i915#12314</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-15/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-9/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk4/igt@kms_frontbuffer_tracking@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056">i915#10056</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-1/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-3/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-3/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> +68 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-1/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +7 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-14/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-1/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-4/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-stridechange:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-14/igt@kms_frontbuffer_tracking@fbchdr-stridechange.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-tiling-4:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-4/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-tiling-linear:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-3/igt@kms_frontbuffer_tracking@fbchdr-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +11 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-rte:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> +55 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-1/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-7/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-glk8/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk1/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-1/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-3/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +53 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-3/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> +111 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-19/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-7/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-pwrite:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-8/igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +17 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-1/igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-4k:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-mtlp-3/igt@kms_hdmi_inject@inject-4k.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-1/igt@kms_hdmi_inject@inject-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15725">i915#15725</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-3/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16012">i915#16012</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-7/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16012">i915#16012</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-3/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-1-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16012">i915#16012</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-2-xrgb2101010:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-7/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-2-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16012">i915#16012</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-4-xrgb2101010:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-17/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-4-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16012">i915#16012</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-2-xrgb16161616f:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-4/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-2-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011">i915#16011</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-1/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011">i915#16011</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-1-xrgb16161616f:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-1/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-1-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011">i915#16011</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-15/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-1-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011">i915#16011</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-18/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011">i915#16011</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-1-xrgb16161616f:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-4/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-1-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011">i915#16011</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-5/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460">i915#15460</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-7/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460">i915#15460</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-17/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460">i915#15460</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-3/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460">i915#15460</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-3/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460">i915#15460</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-1/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459">i915#15459</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-3/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-8/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-12/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-2/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-8/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-5/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +3 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-3/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-1/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-10/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-13/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-5/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-15/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-6/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-b-plane-5:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-2/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-b-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-8/igt@kms_plane@pixel-format-yf-tiled-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-1/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16112">i915#16112</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-16/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16112">i915#16112</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk1/igt@kms_plane_alpha_blend@alpha-opaque-fb.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647">i915#10647</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12169">i915#12169</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk1/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647">i915#10647</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk4/igt@kms_plane_alpha_blend@alpha-transparent-fb.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647">i915#10647</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12177">i915#12177</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk10/igt@kms_plane_alpha_blend@constant-alpha-max.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647">i915#10647</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12169">i915#12169</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk10/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647">i915#10647</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-7/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-3/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-1/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-6/igt@kms_plane_scaling@intel-max-src-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-3/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +3 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-1/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +4 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-15/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-8/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-3/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-1/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812">i915#9812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-5/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-16/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-7/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812">i915#9812</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-6/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-3/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@fences:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-18/igt@kms_pm_rpm@fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +4 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-4/igt@kms_pm_rpm@fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-dg2-5/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-dg1-19/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-15/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-5/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_prime@d3hot:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-5/igt@kms_prime@d3hot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6805">i915#6805</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-7/igt@kms_prime@d3hot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-17/igt@kms_prime@d3hot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-3/igt@kms_prime@d3hot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808">i915#9808</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk10/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-7/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +10 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-6/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316">i915#12316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk11/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk9/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-1/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +5 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-3/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-1/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-snb6/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-16/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-onoff:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-3/igt@kms_psr@fbc-psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-mmap-gtt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-3/igt@kms_psr@fbc-psr2-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-4/igt@kms_psr@fbc-psr2-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-move:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-1/igt@kms_psr@psr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-move:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-8/igt@kms_psr@psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +8 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-17/igt@kms_psr@psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@kms_psr@psr2-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949">i915#15949</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-8/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk1/igt@kms_selftest@drm_framebuffer.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179">i915#13179</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk2/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10959">i915#10959</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk1/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276">i915#12276</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-1/igt@kms_vblank@ts-continuation-suspend@pipe-c-hdmi-a-2.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132">i915#15132</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-8/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-16/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-6/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-7/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808">i915#8808</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-1/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-6/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-4/igt@perf@per-context-mode-unprivileged.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2435">i915#2435</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vcs1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-mtlp-1/igt@perf_pmu@busy-double-start@vcs1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-4/igt@perf_pmu@busy-double-start@vcs1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk3/igt@perf_pmu@module-unload.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15778">i915#15778</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-3/igt@perf_pmu@module-unload.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029">i915#13029</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15778">i915#15778</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk11/igt@perf_pmu@rc6-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16236">i915#16236</a>)</li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-7/igt@perf_pmu@rc6-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-4/igt@perf_pmu@rc6-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13520">i915#13520</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-write-hang:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-5/igt@prime_vgem@fence-write-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-3/igt@sriov_basic@enable-vfs-autoprobe-on.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-18/igt@sriov_basic@enable-vfs-autoprobe-on.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-random:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-7/igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16066">i915#16066</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-4/igt@tools_test@sysfs_l3_parity.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4818">i915#4818</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_eio@hibernate:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-1/igt@gem_eio@hibernate.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7975">i915#7975</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-3/igt@gem_eio@hibernate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-4/igt@gem_eio@kms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13363">i915#13363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-8/igt@gem_eio@kms.html">PASS</a></li>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-tglu-7/igt@gem_eio@kms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13363">i915#13363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-3/igt@gem_eio@kms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_endless@dispatch@bcs0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-dg2-3/igt@gem_exec_endless@dispatch@bcs0.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3778">i915#3778</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7016">i915#7016</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-1/igt@gem_exec_endless@dispatch@bcs0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-dg2-7/igt@gem_exec_suspend@basic-s0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-7/igt@gem_exec_suspend@basic-s0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-glk3/igt@gem_exec_suspend@basic-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13196">i915#13196</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk3/igt@gem_exec_suspend@basic-s3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-tglu-8/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13790">i915#13790</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2681">i915#2681</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-6/igt@i915_pm_rc6_residency@rc6-fence.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-dg1-16/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14888">i915#14888</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-15/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-glk6/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761">i915#12761</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk9/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-glk8/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk2/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-tglu-6/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-tglu-2/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-7/igt@kms_cursor_crc@cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358">i915#12358</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152">i915#14152</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-8/igt@kms_cursor_crc@cursor-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-toggle:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-dg1-18/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-13/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-mtlp-1/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15672">i915#15672</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-3/igt@kms_force_connector_basic@force-connector-state.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-2/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-glk9/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk8/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-mmap-wc.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-7/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011">i915#16011</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@kms_hdr@invalid-metadata-sizes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-2-xrgb2101010:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-7/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-2-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011">i915#16011</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-2-xrgb2101010.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-dg2-3/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-4/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-dg1-15/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-12/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-3/igt@kms_pm_rpm@system-suspend-modeset.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419">i915#14419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-5/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle-check-all@ccs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-mtlp-7/igt@perf_pmu@busy-idle-check-all@ccs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-5/igt@perf_pmu@busy-idle-check-all@ccs0.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle-check-all@vcs0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-dg2-1/igt@perf_pmu@busy-idle-check-all@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-7/igt@perf_pmu@busy-idle-check-all@vcs0.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle-check-all@vecs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-dg1-18/igt@perf_pmu@busy-idle-check-all@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-15/igt@perf_pmu@busy-idle-check-all@vecs0.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-cpu-gtt-noreloc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-6/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-1/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-read:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-2/igt@gem_exec_reloc@basic-wc-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@gem_exec_reloc@basic-wc-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@semaphore-power:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-6/igt@gem_exec_schedule@semaphore-power.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7276">i915#7276</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-1/igt@gem_exec_schedule@semaphore-power.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7276">i915#7276</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-3/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-multi:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-6/igt@gem_lmem_swapping@parallel-multi.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-7/igt@gem_lmem_swapping@parallel-multi.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-2/igt@gem_lmem_swapping@parallel-random-verify-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-verify-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@display:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-8/igt@gem_pread@display.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@gem_pread@display.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-self:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-6/igt@gem_pwrite@basic-self.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-3/igt@gem_pwrite@basic-self.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@access-control:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-6/igt@gem_userptr_blits@access-control.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-5/igt@gem_userptr_blits@access-control.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@__uc_init:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-6/igt@i915_module_load@fault-injection@__uc_init.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15479">i915#15479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-3/igt@i915_module_load@fault-injection@__uc_init.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15479">i915#15479</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-7/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-6/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-7/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-3/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-dg1-15/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-12/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-glk8/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk3/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14694">i915#14694</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-5/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-2/igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-6/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-3/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-mode-timings:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-4/igt@kms_chamelium_edid@hdmi-mode-timings.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@kms_chamelium_edid@hdmi-mode-timings.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-5/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-2/igt@kms_cursor_crc@cursor-offscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-7/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">SKIP</a> +37 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-7/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-8/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-6/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081">i915#16081</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-4/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081">i915#16081</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-glk5/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314">i915#12314</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk6/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-glk5/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314">i915#12314</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-glk6/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-6/igt@kms_flip@2x-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-8/igt@kms_flip@2x-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-mtlp-6/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-mtlp-1/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15672">i915#15672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-5/igt@kms_frontbuffer_tracking@hdr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16056">i915#16056</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-rte:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-1/igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-dg1-18/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-12/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-3/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-4/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-6/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-7/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-5/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-4/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259">i915#14259</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259">i915#14259</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-4/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340">i915#9340</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-5/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-6/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-4/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-3/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-8/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-6/igt@kms_psr@fbc-psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-5/igt@kms_psr@fbc-psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-plane-move:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-dg1-16/igt@kms_psr@pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-dg1-19/igt@kms_psr@pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-8/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-5/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#11920</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#11920</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-5/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-6/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8977/shard-rkl-6/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15414/shard-rkl-8/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8977 -&gt; IGTPW_15414</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18707: 6583dd200482a34bb17e5dc54551f91f53b79798 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15414: 15414<br />
  IGT_8977: c8bdb0bc2140e337e1d79969430c3d7a5c088c9e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============7868814991301003163==--
