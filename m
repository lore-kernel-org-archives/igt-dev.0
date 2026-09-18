Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE1FC982DA
	for <igt-dev@archiver.kernel.org>; Fri, 18 Sep 2026 15:27:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5344D10E103;
	Fri, 18 Sep 2026 15:27:45 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD18510E103;
 Fri, 18 Sep 2026 15:27:03 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7297846671586311967=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_Add_FIXED=5FMATRIX_color?=
 =?utf-8?q?op_tests_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 18 Sep 2026 15:27:03 -0000
Message-ID: <178974522374.181279.8939558671277697201@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260918083350.1021184-1-swati2.sharma@intel.com>
In-Reply-To: <20260918083350.1021184-1-swati2.sharma@intel.com>
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

--===============7297846671586311967==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add FIXED_MATRIX colorop tests (rev6)
URL   : https://patchwork.freedesktop.org/series/165021/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_19175_full -> IGTPW_15863_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_15863_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_15863_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/index.html

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_15863_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d (NEW):
    - shard-dg2:          NOTRUN -> [SKIP][1] +10 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-8/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d.html
    - shard-rkl:          NOTRUN -> [SKIP][2] +7 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-2/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d (NEW):
    - shard-dg1:          NOTRUN -> [SKIP][3] +9 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-18/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d.html
    - shard-tglu:         NOTRUN -> [SKIP][4] +9 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-5/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d.html
    - shard-mtlp:         NOTRUN -> [SKIP][5] +10 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-5/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d.html

  * {igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d@pipe-a-plane-3} (NEW):
    - shard-rkl:          NOTRUN -> [FAIL][6] +111 other tests fail
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-8/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d@pipe-a-plane-3.html

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020@pipe-a-plane-2 (NEW):
    - shard-tglu-1:       NOTRUN -> [FAIL][7] +28 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-1/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020@pipe-a-plane-2.html

  * {igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d@pipe-c-plane-6} (NEW):
    - shard-tglu:         NOTRUN -> [FAIL][8] +231 other tests fail
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-4/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d@pipe-c-plane-6.html

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d@pipe-c-plane-2 (NEW):
    - shard-dg2:          NOTRUN -> [FAIL][9] +251 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-6/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d@pipe-c-plane-2.html

  * {igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-b-plane-3} (NEW):
    - shard-dg1:          NOTRUN -> [FAIL][10] +289 other tests fail
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-16/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-b-plane-3.html

  
New tests
---------

  New tests have been introduced between CI_DRM_19175_full and IGTPW_15863_full:

### New IGT tests (352) ###

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020:
    - Statuses : 5 fail(s) 1 skip(s)
    - Exec time: [2.21, 21.12] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim:
    - Statuses : 4 fail(s) 2 skip(s)
    - Exec time: [0.83, 17.10] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d:
    - Statuses : 3 fail(s) 1 skip(s)
    - Exec time: [2.46, 13.57] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d@pipe-a-plane-0:
    - Statuses : 3 fail(s)
    - Exec time: [0.26, 0.42] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d@pipe-a-plane-1:
    - Statuses : 3 fail(s)
    - Exec time: [0.24, 0.40] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d@pipe-a-plane-2:
    - Statuses : 3 fail(s)
    - Exec time: [0.24, 0.42] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d@pipe-a-plane-3:
    - Statuses : 3 fail(s)
    - Exec time: [0.25, 0.64] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d@pipe-a-plane-4:
    - Statuses : 3 fail(s)
    - Exec time: [0.23, 0.40] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d@pipe-b-plane-0:
    - Statuses : 3 fail(s)
    - Exec time: [0.25, 0.42] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d@pipe-b-plane-1:
    - Statuses : 3 fail(s)
    - Exec time: [0.24, 0.68] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d@pipe-b-plane-2:
    - Statuses : 3 fail(s)
    - Exec time: [0.25, 0.62] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d@pipe-b-plane-3:
    - Statuses : 3 fail(s)
    - Exec time: [0.25, 0.67] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d@pipe-b-plane-4:
    - Statuses : 3 fail(s)
    - Exec time: [0.24, 0.44] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d@pipe-c-plane-0:
    - Statuses : 3 fail(s)
    - Exec time: [0.23, 0.42] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d@pipe-c-plane-1:
    - Statuses : 3 fail(s)
    - Exec time: [0.24, 0.67] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d@pipe-c-plane-2:
    - Statuses : 3 fail(s)
    - Exec time: [0.23, 0.62] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d@pipe-c-plane-3:
    - Statuses : 3 fail(s)
    - Exec time: [0.23, 0.61] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d@pipe-c-plane-4:
    - Statuses : 3 fail(s)
    - Exec time: [0.22, 0.40] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d@pipe-d-plane-0:
    - Statuses : 2 fail(s)
    - Exec time: [0.23, 0.42] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d@pipe-d-plane-1:
    - Statuses : 2 fail(s)
    - Exec time: [0.41, 0.67] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d@pipe-d-plane-2:
    - Statuses : 2 fail(s)
    - Exec time: [0.42, 0.64] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d@pipe-d-plane-3:
    - Statuses : 2 fail(s)
    - Exec time: [0.41, 0.64] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d@pipe-d-plane-4:
    - Statuses : 2 fail(s)
    - Exec time: [0.21, 0.41] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim@pipe-a-plane-0:
    - Statuses : 4 fail(s)
    - Exec time: [0.17, 0.44] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim@pipe-a-plane-1:
    - Statuses : 4 fail(s)
    - Exec time: [0.18, 0.43] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim@pipe-a-plane-2:
    - Statuses : 4 fail(s)
    - Exec time: [0.17, 0.40] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim@pipe-a-plane-3:
    - Statuses : 4 fail(s)
    - Exec time: [0.17, 0.64] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim@pipe-a-plane-4:
    - Statuses : 4 fail(s)
    - Exec time: [0.17, 0.38] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim@pipe-a-plane-5:
    - Statuses : 2 fail(s)
    - Exec time: [0.16, 0.87] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim@pipe-a-plane-6:
    - Statuses : 2 fail(s)
    - Exec time: [0.16, 0.31] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim@pipe-b-plane-0:
    - Statuses : 4 fail(s)
    - Exec time: [0.17, 0.43] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim@pipe-b-plane-1:
    - Statuses : 4 fail(s)
    - Exec time: [0.30, 0.89] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim@pipe-b-plane-2:
    - Statuses : 4 fail(s)
    - Exec time: [0.17, 0.66] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim@pipe-b-plane-3:
    - Statuses : 4 fail(s)
    - Exec time: [0.31, 0.90] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim@pipe-b-plane-4:
    - Statuses : 4 fail(s)
    - Exec time: [0.17, 0.42] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim@pipe-b-plane-5:
    - Statuses : 2 fail(s)
    - Exec time: [0.30, 0.89] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim@pipe-b-plane-6:
    - Statuses : 2 fail(s)
    - Exec time: [0.17, 0.36] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim@pipe-c-plane-0:
    - Statuses : 4 fail(s)
    - Exec time: [0.17, 0.47] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim@pipe-c-plane-1:
    - Statuses : 4 fail(s)
    - Exec time: [0.30, 0.85] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim@pipe-c-plane-2:
    - Statuses : 4 fail(s)
    - Exec time: [0.18, 0.59] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim@pipe-c-plane-3:
    - Statuses : 4 fail(s)
    - Exec time: [0.31, 0.88] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim@pipe-c-plane-4:
    - Statuses : 4 fail(s)
    - Exec time: [0.18, 0.61] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim@pipe-c-plane-5:
    - Statuses : 2 fail(s)
    - Exec time: [0.35, 0.92] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim@pipe-c-plane-6:
    - Statuses : 2 fail(s)
    - Exec time: [0.17, 0.33] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim@pipe-d-plane-0:
    - Statuses : 4 fail(s)
    - Exec time: [0.17, 0.43] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim@pipe-d-plane-1:
    - Statuses : 4 fail(s)
    - Exec time: [0.17, 0.91] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim@pipe-d-plane-2:
    - Statuses : 4 fail(s)
    - Exec time: [0.31, 0.61] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim@pipe-d-plane-3:
    - Statuses : 4 fail(s)
    - Exec time: [0.18, 0.90] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim@pipe-d-plane-4:
    - Statuses : 4 fail(s)
    - Exec time: [0.30, 0.60] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim@pipe-d-plane-5:
    - Statuses : 2 fail(s)
    - Exec time: [0.18, 0.88] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim@pipe-d-plane-6:
    - Statuses : 2 fail(s)
    - Exec time: [0.32, 0.36] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d:
    - Statuses : 5 fail(s) 2 skip(s)
    - Exec time: [0.86, 17.86] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d@pipe-a-plane-0:
    - Statuses : 5 fail(s)
    - Exec time: [0.19, 0.44] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d@pipe-a-plane-1:
    - Statuses : 5 fail(s)
    - Exec time: [0.18, 0.42] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d@pipe-a-plane-2:
    - Statuses : 5 fail(s)
    - Exec time: [0.17, 0.61] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d@pipe-a-plane-3:
    - Statuses : 5 fail(s)
    - Exec time: [0.16, 0.41] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d@pipe-a-plane-4:
    - Statuses : 5 fail(s)
    - Exec time: [0.16, 0.94] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d@pipe-a-plane-5:
    - Statuses : 2 fail(s)
    - Exec time: [0.17, 0.37] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d@pipe-a-plane-6:
    - Statuses : 2 fail(s)
    - Exec time: [0.16, 0.90] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d@pipe-b-plane-0:
    - Statuses : 5 fail(s)
    - Exec time: [0.17, 0.39] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d@pipe-b-plane-1:
    - Statuses : 5 fail(s)
    - Exec time: [0.24, 0.90] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d@pipe-b-plane-2:
    - Statuses : 5 fail(s)
    - Exec time: [0.17, 0.63] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d@pipe-b-plane-3:
    - Statuses : 5 fail(s)
    - Exec time: [0.25, 0.91] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d@pipe-b-plane-4:
    - Statuses : 5 fail(s)
    - Exec time: [0.17, 0.40] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d@pipe-b-plane-5:
    - Statuses : 2 fail(s)
    - Exec time: [0.30, 0.91] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d@pipe-b-plane-6:
    - Statuses : 2 fail(s)
    - Exec time: [0.18, 0.34] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d@pipe-c-plane-0:
    - Statuses : 5 fail(s)
    - Exec time: [0.17, 0.39] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d@pipe-c-plane-1:
    - Statuses : 5 fail(s)
    - Exec time: [0.23, 0.85] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d@pipe-c-plane-2:
    - Statuses : 5 fail(s)
    - Exec time: [0.17, 0.58] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d@pipe-c-plane-3:
    - Statuses : 5 fail(s)
    - Exec time: [0.25, 0.88] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d@pipe-c-plane-4:
    - Statuses : 5 fail(s)
    - Exec time: [0.18, 0.59] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d@pipe-c-plane-5:
    - Statuses : 2 fail(s)
    - Exec time: [0.17, 0.91] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d@pipe-c-plane-6:
    - Statuses : 2 fail(s)
    - Exec time: [0.32, 0.33] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d@pipe-d-plane-0:
    - Statuses : 4 fail(s)
    - Exec time: [0.18, 0.41] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d@pipe-d-plane-1:
    - Statuses : 4 fail(s)
    - Exec time: [0.35, 0.86] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d@pipe-d-plane-2:
    - Statuses : 4 fail(s)
    - Exec time: [0.17, 0.59] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d@pipe-d-plane-3:
    - Statuses : 4 fail(s)
    - Exec time: [0.17, 0.86] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d@pipe-d-plane-4:
    - Statuses : 4 fail(s)
    - Exec time: [0.32, 0.60] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d@pipe-d-plane-5:
    - Statuses : 2 fail(s)
    - Exec time: [0.18, 0.91] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d@pipe-d-plane-6:
    - Statuses : 2 fail(s)
    - Exec time: [0.17, 0.34] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020@pipe-a-plane-0:
    - Statuses : 5 fail(s)
    - Exec time: [0.24, 0.43] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020@pipe-a-plane-1:
    - Statuses : 5 fail(s)
    - Exec time: [0.22, 0.40] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020@pipe-a-plane-2:
    - Statuses : 5 fail(s)
    - Exec time: [0.22, 1.55] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020@pipe-a-plane-3:
    - Statuses : 5 fail(s)
    - Exec time: [0.25, 1.48] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020@pipe-a-plane-4:
    - Statuses : 5 fail(s)
    - Exec time: [0.24, 1.49] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020@pipe-a-plane-5:
    - Statuses : 2 fail(s)
    - Exec time: [0.25, 0.99] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020@pipe-a-plane-6:
    - Statuses : 2 fail(s)
    - Exec time: [0.27, 0.38] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020@pipe-b-plane-0:
    - Statuses : 5 fail(s)
    - Exec time: [0.21, 0.44] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020@pipe-b-plane-1:
    - Statuses : 5 fail(s)
    - Exec time: [0.25, 1.46] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020@pipe-b-plane-2:
    - Statuses : 5 fail(s)
    - Exec time: [0.25, 2.70] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020@pipe-b-plane-3:
    - Statuses : 5 fail(s)
    - Exec time: [0.25, 1.50] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020@pipe-b-plane-4:
    - Statuses : 5 fail(s)
    - Exec time: [0.24, 1.48] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020@pipe-b-plane-5:
    - Statuses : 2 fail(s)
    - Exec time: [0.24, 0.32] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020@pipe-b-plane-6:
    - Statuses : 2 fail(s)
    - Exec time: [0.25, 0.87] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020@pipe-c-plane-0:
    - Statuses : 5 fail(s)
    - Exec time: [0.21, 0.44] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020@pipe-c-plane-1:
    - Statuses : 5 fail(s)
    - Exec time: [0.27, 2.70] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020@pipe-c-plane-2:
    - Statuses : 5 fail(s)
    - Exec time: [0.27, 1.50] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020@pipe-c-plane-3:
    - Statuses : 5 fail(s)
    - Exec time: [0.26, 1.49] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020@pipe-c-plane-4:
    - Statuses : 5 fail(s)
    - Exec time: [0.25, 1.50] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020@pipe-c-plane-5:
    - Statuses : 2 fail(s)
    - Exec time: [0.25, 0.87] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020@pipe-c-plane-6:
    - Statuses : 2 fail(s)
    - Exec time: [0.26, 0.32] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020@pipe-d-plane-0:
    - Statuses : 4 fail(s)
    - Exec time: [0.23, 0.41] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020@pipe-d-plane-1:
    - Statuses : 4 fail(s)
    - Exec time: [0.25, 0.85] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020@pipe-d-plane-2:
    - Statuses : 4 fail(s)
    - Exec time: [0.25, 0.60] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020@pipe-d-plane-3:
    - Statuses : 4 fail(s)
    - Exec time: [0.25, 0.79] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020@pipe-d-plane-4:
    - Statuses : 4 fail(s)
    - Exec time: [0.24, 0.62] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020@pipe-d-plane-5:
    - Statuses : 2 fail(s)
    - Exec time: [0.24, 0.90] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020@pipe-d-plane-6:
    - Statuses : 2 fail(s)
    - Exec time: [0.25, 0.32] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601:
    - Statuses : 5 fail(s) 2 skip(s)
    - Exec time: [0.84, 17.75] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim:
    - Statuses : 4 fail(s) 1 skip(s)
    - Exec time: [0.87, 17.72] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d:
    - Statuses : 4 fail(s) 2 skip(s)
    - Exec time: [0.83, 18.32] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d@pipe-a-plane-0:
    - Statuses : 4 fail(s)
    - Exec time: [0.16, 0.45] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d@pipe-a-plane-1:
    - Statuses : 4 fail(s)
    - Exec time: [0.18, 0.43] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d@pipe-a-plane-2:
    - Statuses : 4 fail(s)
    - Exec time: [0.17, 0.41] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d@pipe-a-plane-3:
    - Statuses : 4 fail(s)
    - Exec time: [0.17, 0.62] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d@pipe-a-plane-4:
    - Statuses : 4 fail(s)
    - Exec time: [0.16, 0.90] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d@pipe-a-plane-5:
    - Statuses : 2 fail(s)
    - Exec time: [0.17, 0.34] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d@pipe-a-plane-6:
    - Statuses : 2 fail(s)
    - Exec time: [0.30, 0.90] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d@pipe-b-plane-0:
    - Statuses : 4 fail(s)
    - Exec time: [0.16, 0.45] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d@pipe-b-plane-1:
    - Statuses : 4 fail(s)
    - Exec time: [0.17, 0.89] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d@pipe-b-plane-2:
    - Statuses : 4 fail(s)
    - Exec time: [0.31, 0.61] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d@pipe-b-plane-3:
    - Statuses : 4 fail(s)
    - Exec time: [0.18, 0.84] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d@pipe-b-plane-4:
    - Statuses : 4 fail(s)
    - Exec time: [0.16, 0.63] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d@pipe-b-plane-5:
    - Statuses : 2 fail(s)
    - Exec time: [0.32, 0.85] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d@pipe-b-plane-6:
    - Statuses : 2 fail(s)
    - Exec time: [0.18, 0.34] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d@pipe-c-plane-0:
    - Statuses : 4 fail(s)
    - Exec time: [0.17, 0.46] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d@pipe-c-plane-1:
    - Statuses : 4 fail(s)
    - Exec time: [0.31, 0.84] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d@pipe-c-plane-2:
    - Statuses : 4 fail(s)
    - Exec time: [0.17, 0.59] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d@pipe-c-plane-3:
    - Statuses : 4 fail(s)
    - Exec time: [0.30, 0.83] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d@pipe-c-plane-4:
    - Statuses : 4 fail(s)
    - Exec time: [0.17, 0.61] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d@pipe-c-plane-5:
    - Statuses : 2 fail(s)
    - Exec time: [0.17, 0.92] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d@pipe-c-plane-6:
    - Statuses : 2 fail(s)
    - Exec time: [0.31, 0.32] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d@pipe-d-plane-0:
    - Statuses : 4 fail(s)
    - Exec time: [0.18, 0.43] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d@pipe-d-plane-1:
    - Statuses : 4 fail(s)
    - Exec time: [0.17, 1.62] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d@pipe-d-plane-2:
    - Statuses : 4 fail(s)
    - Exec time: [0.31, 0.61] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d@pipe-d-plane-3:
    - Statuses : 4 fail(s)
    - Exec time: [0.18, 0.90] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d@pipe-d-plane-4:
    - Statuses : 4 fail(s)
    - Exec time: [0.31, 0.60] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d@pipe-d-plane-5:
    - Statuses : 2 fail(s)
    - Exec time: [0.17, 0.82] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d@pipe-d-plane-6:
    - Statuses : 2 fail(s)
    - Exec time: [0.31, 0.33] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim@pipe-a-plane-0:
    - Statuses : 4 fail(s)
    - Exec time: [0.18, 0.41] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim@pipe-a-plane-1:
    - Statuses : 4 fail(s)
    - Exec time: [0.17, 0.39] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim@pipe-a-plane-2:
    - Statuses : 4 fail(s)
    - Exec time: [0.17, 0.45] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim@pipe-a-plane-3:
    - Statuses : 4 fail(s)
    - Exec time: [0.17, 0.73] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim@pipe-a-plane-4:
    - Statuses : 4 fail(s)
    - Exec time: [0.16, 0.94] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim@pipe-a-plane-5:
    - Statuses : 2 fail(s)
    - Exec time: [0.16, 0.35] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim@pipe-a-plane-6:
    - Statuses : 2 fail(s)
    - Exec time: [0.16, 0.95] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim@pipe-b-plane-0:
    - Statuses : 4 fail(s)
    - Exec time: [0.17, 0.43] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim@pipe-b-plane-1:
    - Statuses : 4 fail(s)
    - Exec time: [0.17, 0.85] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim@pipe-b-plane-2:
    - Statuses : 4 fail(s)
    - Exec time: [0.30, 0.71] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim@pipe-b-plane-3:
    - Statuses : 4 fail(s)
    - Exec time: [0.17, 0.92] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim@pipe-b-plane-4:
    - Statuses : 4 fail(s)
    - Exec time: [0.25, 0.38] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim@pipe-b-plane-5:
    - Statuses : 2 fail(s)
    - Exec time: [0.17, 0.88] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim@pipe-b-plane-6:
    - Statuses : 2 fail(s)
    - Exec time: [0.30, 0.31] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim@pipe-c-plane-0:
    - Statuses : 4 fail(s)
    - Exec time: [0.17, 0.43] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim@pipe-c-plane-1:
    - Statuses : 4 fail(s)
    - Exec time: [0.30, 0.84] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim@pipe-c-plane-2:
    - Statuses : 4 fail(s)
    - Exec time: [0.18, 0.66] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim@pipe-c-plane-3:
    - Statuses : 4 fail(s)
    - Exec time: [0.30, 0.91] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim@pipe-c-plane-4:
    - Statuses : 4 fail(s)
    - Exec time: [0.18, 0.69] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim@pipe-c-plane-5:
    - Statuses : 2 fail(s)
    - Exec time: [0.30, 0.89] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim@pipe-c-plane-6:
    - Statuses : 2 fail(s)
    - Exec time: [0.18, 0.32] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim@pipe-d-plane-0:
    - Statuses : 4 fail(s)
    - Exec time: [0.17, 0.40] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim@pipe-d-plane-1:
    - Statuses : 4 fail(s)
    - Exec time: [0.30, 0.93] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim@pipe-d-plane-2:
    - Statuses : 4 fail(s)
    - Exec time: [0.18, 0.70] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim@pipe-d-plane-3:
    - Statuses : 4 fail(s)
    - Exec time: [0.31, 0.86] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim@pipe-d-plane-4:
    - Statuses : 4 fail(s)
    - Exec time: [0.18, 0.70] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim@pipe-d-plane-5:
    - Statuses : 2 fail(s)
    - Exec time: [0.32, 0.91] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim@pipe-d-plane-6:
    - Statuses : 2 fail(s)
    - Exec time: [0.17, 0.34] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d:
    - Statuses : 4 fail(s) 1 skip(s)
    - Exec time: [0.88, 15.93] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d@pipe-a-plane-0:
    - Statuses : 4 fail(s)
    - Exec time: [0.19, 0.41] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d@pipe-a-plane-1:
    - Statuses : 4 fail(s)
    - Exec time: [0.18, 0.39] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d@pipe-a-plane-2:
    - Statuses : 4 fail(s)
    - Exec time: [0.18, 0.70] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d@pipe-a-plane-3:
    - Statuses : 4 fail(s)
    - Exec time: [0.17, 0.39] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d@pipe-a-plane-4:
    - Statuses : 4 fail(s)
    - Exec time: [0.16, 0.72] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d@pipe-a-plane-5:
    - Statuses : 1 fail(s)
    - Exec time: [0.16] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d@pipe-a-plane-6:
    - Statuses : 1 fail(s)
    - Exec time: [0.31] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d@pipe-b-plane-0:
    - Statuses : 4 fail(s)
    - Exec time: [0.18, 0.39] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d@pipe-b-plane-1:
    - Statuses : 4 fail(s)
    - Exec time: [0.17, 0.78] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d@pipe-b-plane-2:
    - Statuses : 4 fail(s)
    - Exec time: [0.24, 0.71] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d@pipe-b-plane-3:
    - Statuses : 4 fail(s)
    - Exec time: [0.19, 0.71] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d@pipe-b-plane-4:
    - Statuses : 4 fail(s)
    - Exec time: [0.23, 0.72] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d@pipe-b-plane-5:
    - Statuses : 1 fail(s)
    - Exec time: [0.18] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d@pipe-b-plane-6:
    - Statuses : 1 fail(s)
    - Exec time: [0.34] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d@pipe-c-plane-0:
    - Statuses : 4 fail(s)
    - Exec time: [0.17, 0.39] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d@pipe-c-plane-1:
    - Statuses : 4 fail(s)
    - Exec time: [0.17, 0.74] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d@pipe-c-plane-2:
    - Statuses : 4 fail(s)
    - Exec time: [0.23, 0.69] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d@pipe-c-plane-3:
    - Statuses : 4 fail(s)
    - Exec time: [0.17, 0.70] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d@pipe-c-plane-4:
    - Statuses : 4 fail(s)
    - Exec time: [0.17, 0.67] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d@pipe-c-plane-5:
    - Statuses : 1 fail(s)
    - Exec time: [0.31] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d@pipe-c-plane-6:
    - Statuses : 1 fail(s)
    - Exec time: [0.18] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d@pipe-d-plane-0:
    - Statuses : 3 fail(s)
    - Exec time: [0.17, 0.35] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d@pipe-d-plane-1:
    - Statuses : 3 fail(s)
    - Exec time: [0.31, 0.73] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d@pipe-d-plane-2:
    - Statuses : 3 fail(s)
    - Exec time: [0.17, 0.69] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d@pipe-d-plane-3:
    - Statuses : 3 fail(s)
    - Exec time: [0.31, 0.69] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d@pipe-d-plane-4:
    - Statuses : 3 fail(s)
    - Exec time: [0.17, 0.68] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d@pipe-d-plane-5:
    - Statuses : 1 fail(s)
    - Exec time: [0.35] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d@pipe-d-plane-6:
    - Statuses : 1 fail(s)
    - Exec time: [0.17] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601@pipe-a-plane-0:
    - Statuses : 5 fail(s)
    - Exec time: [0.22, 0.41] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601@pipe-a-plane-1:
    - Statuses : 5 fail(s)
    - Exec time: [0.20, 0.39] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601@pipe-a-plane-2:
    - Statuses : 5 fail(s)
    - Exec time: [0.20, 0.38] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601@pipe-a-plane-3:
    - Statuses : 5 fail(s)
    - Exec time: [0.20, 0.64] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601@pipe-a-plane-4:
    - Statuses : 5 fail(s)
    - Exec time: [0.20, 0.92] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601@pipe-a-plane-5:
    - Statuses : 2 fail(s)
    - Exec time: [0.20, 0.31] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601@pipe-a-plane-6:
    - Statuses : 2 fail(s)
    - Exec time: [0.20, 0.90] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601@pipe-b-plane-0:
    - Statuses : 5 fail(s)
    - Exec time: [0.20, 0.38] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601@pipe-b-plane-1:
    - Statuses : 5 fail(s)
    - Exec time: [0.20, 0.92] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601@pipe-b-plane-2:
    - Statuses : 5 fail(s)
    - Exec time: [0.20, 0.65] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601@pipe-b-plane-3:
    - Statuses : 5 fail(s)
    - Exec time: [0.20, 0.90] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601@pipe-b-plane-4:
    - Statuses : 5 fail(s)
    - Exec time: [0.20, 0.43] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601@pipe-b-plane-5:
    - Statuses : 2 fail(s)
    - Exec time: [0.21, 0.90] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601@pipe-b-plane-6:
    - Statuses : 2 fail(s)
    - Exec time: [0.19, 0.32] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601@pipe-c-plane-0:
    - Statuses : 5 fail(s)
    - Exec time: [0.20, 0.38] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601@pipe-c-plane-1:
    - Statuses : 5 fail(s)
    - Exec time: [0.20, 0.84] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601@pipe-c-plane-2:
    - Statuses : 5 fail(s)
    - Exec time: [0.21, 0.63] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601@pipe-c-plane-3:
    - Statuses : 5 fail(s)
    - Exec time: [0.20, 0.92] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601@pipe-c-plane-4:
    - Statuses : 5 fail(s)
    - Exec time: [0.20, 0.58] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601@pipe-c-plane-5:
    - Statuses : 2 fail(s)
    - Exec time: [0.21, 0.87] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601@pipe-c-plane-6:
    - Statuses : 2 fail(s)
    - Exec time: [0.20, 0.31] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601@pipe-d-plane-0:
    - Statuses : 4 fail(s)
    - Exec time: [0.20, 0.44] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601@pipe-d-plane-1:
    - Statuses : 4 fail(s)
    - Exec time: [0.20, 0.90] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601@pipe-d-plane-2:
    - Statuses : 4 fail(s)
    - Exec time: [0.20, 0.62] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601@pipe-d-plane-3:
    - Statuses : 4 fail(s)
    - Exec time: [0.20, 0.91] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601@pipe-d-plane-4:
    - Statuses : 4 fail(s)
    - Exec time: [0.21, 0.60] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601@pipe-d-plane-5:
    - Statuses : 2 fail(s)
    - Exec time: [0.21, 0.94] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601@pipe-d-plane-6:
    - Statuses : 2 fail(s)
    - Exec time: [0.21, 0.33] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709:
    - Statuses : 4 fail(s) 1 skip(s)
    - Exec time: [0.89, 23.48] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim:
    - Statuses : 4 fail(s) 2 skip(s)
    - Exec time: [0.84, 18.41] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d:
    - Statuses : 3 fail(s) 1 skip(s)
    - Exec time: [0.88, 18.49] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d@pipe-a-plane-0:
    - Statuses : 3 fail(s)
    - Exec time: [0.26, 0.42] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d@pipe-a-plane-1:
    - Statuses : 3 fail(s)
    - Exec time: [0.25, 0.40] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d@pipe-a-plane-2:
    - Statuses : 3 fail(s)
    - Exec time: [0.25, 0.44] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d@pipe-a-plane-3:
    - Statuses : 3 fail(s)
    - Exec time: [0.30, 0.64] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d@pipe-a-plane-4:
    - Statuses : 3 fail(s)
    - Exec time: [0.24, 0.88] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d@pipe-a-plane-5:
    - Statuses : 1 fail(s)
    - Exec time: [0.33] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d@pipe-a-plane-6:
    - Statuses : 1 fail(s)
    - Exec time: [0.88] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d@pipe-b-plane-0:
    - Statuses : 3 fail(s)
    - Exec time: [0.25, 0.41] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d@pipe-b-plane-1:
    - Statuses : 3 fail(s)
    - Exec time: [0.39, 0.87] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d@pipe-b-plane-2:
    - Statuses : 3 fail(s)
    - Exec time: [0.31, 0.65] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d@pipe-b-plane-3:
    - Statuses : 3 fail(s)
    - Exec time: [0.42, 0.88] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d@pipe-b-plane-4:
    - Statuses : 3 fail(s)
    - Exec time: [0.25, 0.42] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d@pipe-b-plane-5:
    - Statuses : 1 fail(s)
    - Exec time: [0.95] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d@pipe-b-plane-6:
    - Statuses : 1 fail(s)
    - Exec time: [0.36] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d@pipe-c-plane-0:
    - Statuses : 3 fail(s)
    - Exec time: [0.23, 0.44] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d@pipe-c-plane-1:
    - Statuses : 3 fail(s)
    - Exec time: [0.41, 0.87] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d@pipe-c-plane-2:
    - Statuses : 3 fail(s)
    - Exec time: [0.32, 0.63] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d@pipe-c-plane-3:
    - Statuses : 3 fail(s)
    - Exec time: [0.41, 0.92] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d@pipe-c-plane-4:
    - Statuses : 3 fail(s)
    - Exec time: [0.23, 0.37] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d@pipe-c-plane-5:
    - Statuses : 1 fail(s)
    - Exec time: [0.90] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d@pipe-c-plane-6:
    - Statuses : 1 fail(s)
    - Exec time: [0.32] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d@pipe-d-plane-0:
    - Statuses : 3 fail(s)
    - Exec time: [0.22, 0.38] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d@pipe-d-plane-1:
    - Statuses : 3 fail(s)
    - Exec time: [0.40, 1.66] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d@pipe-d-plane-2:
    - Statuses : 3 fail(s)
    - Exec time: [0.33, 0.62] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d@pipe-d-plane-3:
    - Statuses : 3 fail(s)
    - Exec time: [0.40, 0.93] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d@pipe-d-plane-4:
    - Statuses : 3 fail(s)
    - Exec time: [0.21, 0.38] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d@pipe-d-plane-5:
    - Statuses : 1 fail(s)
    - Exec time: [0.92] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d@pipe-d-plane-6:
    - Statuses : 1 fail(s)
    - Exec time: [0.32] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-a-plane-0:
    - Statuses : 4 fail(s)
    - Exec time: [0.17, 0.39] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-a-plane-1:
    - Statuses : 4 fail(s)
    - Exec time: [0.17, 0.41] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-a-plane-2:
    - Statuses : 4 fail(s)
    - Exec time: [0.18, 0.61] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-a-plane-3:
    - Statuses : 4 fail(s)
    - Exec time: [0.17, 0.41] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-a-plane-4:
    - Statuses : 4 fail(s)
    - Exec time: [0.17, 0.60] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-a-plane-5:
    - Statuses : 2 fail(s)
    - Exec time: [0.16, 0.94] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-a-plane-6:
    - Statuses : 2 fail(s)
    - Exec time: [0.16, 0.34] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-b-plane-0:
    - Statuses : 4 fail(s)
    - Exec time: [0.17, 0.43] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-b-plane-1:
    - Statuses : 4 fail(s)
    - Exec time: [0.17, 0.88] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-b-plane-2:
    - Statuses : 4 fail(s)
    - Exec time: [0.31, 0.62] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-b-plane-3:
    - Statuses : 4 fail(s)
    - Exec time: [0.18, 0.93] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-b-plane-4:
    - Statuses : 4 fail(s)
    - Exec time: [0.23, 0.40] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-b-plane-5:
    - Statuses : 2 fail(s)
    - Exec time: [0.18, 0.89] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-b-plane-6:
    - Statuses : 2 fail(s)
    - Exec time: [0.30, 0.35] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-c-plane-0:
    - Statuses : 4 fail(s)
    - Exec time: [0.17, 0.44] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-c-plane-1:
    - Statuses : 4 fail(s)
    - Exec time: [0.17, 0.88] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-c-plane-2:
    - Statuses : 4 fail(s)
    - Exec time: [0.31, 0.60] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-c-plane-3:
    - Statuses : 4 fail(s)
    - Exec time: [0.18, 0.89] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-c-plane-4:
    - Statuses : 4 fail(s)
    - Exec time: [0.31, 0.59] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-c-plane-5:
    - Statuses : 2 fail(s)
    - Exec time: [0.18, 0.90] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-c-plane-6:
    - Statuses : 2 fail(s)
    - Exec time: [0.30, 0.37] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-d-plane-0:
    - Statuses : 4 fail(s)
    - Exec time: [0.17, 0.44] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-d-plane-1:
    - Statuses : 4 fail(s)
    - Exec time: [0.17, 1.69] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-d-plane-2:
    - Statuses : 4 fail(s)
    - Exec time: [0.31, 0.61] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-d-plane-3:
    - Statuses : 4 fail(s)
    - Exec time: [0.18, 0.89] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-d-plane-4:
    - Statuses : 4 fail(s)
    - Exec time: [0.35, 0.62] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-d-plane-5:
    - Statuses : 2 fail(s)
    - Exec time: [0.17, 0.91] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-d-plane-6:
    - Statuses : 2 fail(s)
    - Exec time: [0.31, 0.40] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d:
    - Statuses : 5 fail(s) 2 skip(s)
    - Exec time: [0.83, 18.32] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d@pipe-a-plane-0:
    - Statuses : 5 fail(s)
    - Exec time: [0.19, 0.47] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d@pipe-a-plane-1:
    - Statuses : 5 fail(s)
    - Exec time: [0.17, 0.42] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d@pipe-a-plane-2:
    - Statuses : 5 fail(s)
    - Exec time: [0.17, 0.43] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d@pipe-a-plane-3:
    - Statuses : 5 fail(s)
    - Exec time: [0.17, 0.62] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d@pipe-a-plane-4:
    - Statuses : 5 fail(s)
    - Exec time: [0.16, 0.86] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d@pipe-a-plane-5:
    - Statuses : 2 fail(s)
    - Exec time: [0.16, 0.32] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d@pipe-a-plane-6:
    - Statuses : 2 fail(s)
    - Exec time: [0.34, 0.84] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d@pipe-b-plane-0:
    - Statuses : 5 fail(s)
    - Exec time: [0.17, 0.39] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d@pipe-b-plane-1:
    - Statuses : 5 fail(s)
    - Exec time: [0.25, 0.86] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d@pipe-b-plane-2:
    - Statuses : 5 fail(s)
    - Exec time: [0.17, 0.62] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d@pipe-b-plane-3:
    - Statuses : 5 fail(s)
    - Exec time: [0.23, 0.89] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d@pipe-b-plane-4:
    - Statuses : 5 fail(s)
    - Exec time: [0.17, 0.47] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d@pipe-b-plane-5:
    - Statuses : 2 fail(s)
    - Exec time: [0.33, 0.89] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d@pipe-b-plane-6:
    - Statuses : 2 fail(s)
    - Exec time: [0.17, 0.33] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d@pipe-c-plane-0:
    - Statuses : 5 fail(s)
    - Exec time: [0.17, 0.43] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d@pipe-c-plane-1:
    - Statuses : 5 fail(s)
    - Exec time: [0.23, 1.59] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d@pipe-c-plane-2:
    - Statuses : 5 fail(s)
    - Exec time: [0.17, 0.62] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d@pipe-c-plane-3:
    - Statuses : 5 fail(s)
    - Exec time: [0.23, 0.88] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d@pipe-c-plane-4:
    - Statuses : 5 fail(s)
    - Exec time: [0.17, 0.59] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d@pipe-c-plane-5:
    - Statuses : 2 fail(s)
    - Exec time: [0.17, 0.89] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d@pipe-c-plane-6:
    - Statuses : 2 fail(s)
    - Exec time: [0.32] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d@pipe-d-plane-0:
    - Statuses : 4 fail(s)
    - Exec time: [0.17, 0.50] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d@pipe-d-plane-1:
    - Statuses : 4 fail(s)
    - Exec time: [0.31, 0.88] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d@pipe-d-plane-2:
    - Statuses : 4 fail(s)
    - Exec time: [0.18, 0.63] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d@pipe-d-plane-3:
    - Statuses : 4 fail(s)
    - Exec time: [0.31, 0.92] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d@pipe-d-plane-4:
    - Statuses : 4 fail(s)
    - Exec time: [0.18, 0.63] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d@pipe-d-plane-5:
    - Statuses : 2 fail(s)
    - Exec time: [0.30, 0.88] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d@pipe-d-plane-6:
    - Statuses : 2 fail(s)
    - Exec time: [0.18, 0.35] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709@pipe-a-plane-0:
    - Statuses : 4 fail(s)
    - Exec time: [0.22, 0.41] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709@pipe-a-plane-1:
    - Statuses : 4 fail(s)
    - Exec time: [0.21, 0.41] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709@pipe-a-plane-2:
    - Statuses : 4 fail(s)
    - Exec time: [0.31, 1.82] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709@pipe-a-plane-3:
    - Statuses : 4 fail(s)
    - Exec time: [0.23, 1.54] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709@pipe-a-plane-4:
    - Statuses : 4 fail(s)
    - Exec time: [0.44, 1.65] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709@pipe-a-plane-5:
    - Statuses : 1 fail(s)
    - Exec time: [0.37] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709@pipe-a-plane-6:
    - Statuses : 1 fail(s)
    - Exec time: [0.89] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709@pipe-b-plane-0:
    - Statuses : 4 fail(s)
    - Exec time: [0.21, 1.69] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709@pipe-b-plane-1:
    - Statuses : 4 fail(s)
    - Exec time: [0.40, 1.69] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709@pipe-b-plane-2:
    - Statuses : 4 fail(s)
    - Exec time: [0.37, 1.61] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709@pipe-b-plane-3:
    - Statuses : 4 fail(s)
    - Exec time: [0.40, 1.70] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709@pipe-b-plane-4:
    - Statuses : 4 fail(s)
    - Exec time: [0.24, 1.59] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709@pipe-b-plane-5:
    - Statuses : 1 fail(s)
    - Exec time: [0.90] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709@pipe-b-plane-6:
    - Statuses : 1 fail(s)
    - Exec time: [0.34] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709@pipe-c-plane-0:
    - Statuses : 4 fail(s)
    - Exec time: [0.20, 1.58] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709@pipe-c-plane-1:
    - Statuses : 4 fail(s)
    - Exec time: [0.40, 1.73] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709@pipe-c-plane-2:
    - Statuses : 4 fail(s)
    - Exec time: [0.39, 1.71] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709@pipe-c-plane-3:
    - Statuses : 4 fail(s)
    - Exec time: [0.40, 1.70] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709@pipe-c-plane-4:
    - Statuses : 4 fail(s)
    - Exec time: [0.23, 1.72] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709@pipe-c-plane-5:
    - Statuses : 1 fail(s)
    - Exec time: [0.88] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709@pipe-c-plane-6:
    - Statuses : 1 fail(s)
    - Exec time: [0.31] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709@pipe-d-plane-0:
    - Statuses : 3 fail(s)
    - Exec time: [0.21, 0.43] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709@pipe-d-plane-1:
    - Statuses : 3 fail(s)
    - Exec time: [0.42, 0.89] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709@pipe-d-plane-2:
    - Statuses : 3 fail(s)
    - Exec time: [0.34, 0.59] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709@pipe-d-plane-3:
    - Statuses : 3 fail(s)
    - Exec time: [0.39, 0.85] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709@pipe-d-plane-4:
    - Statuses : 3 fail(s)
    - Exec time: [0.34, 0.59] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709@pipe-d-plane-5:
    - Statuses : 1 fail(s)
    - Exec time: [0.93] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709@pipe-d-plane-6:
    - Statuses : 1 fail(s)
    - Exec time: [0.34] s

  

Known issues
------------

  Here are the changes found in IGTPW_15863_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - shard-dg2:          NOTRUN -> [SKIP][11] ([i915#8411])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-4/igt@api_intel_bb@blit-reloc-keep-cache.html
    - shard-mtlp:         NOTRUN -> [SKIP][12] ([i915#8411])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-1/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-dg1:          NOTRUN -> [SKIP][13] ([i915#8411]) +2 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-12/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-rkl:          NOTRUN -> [SKIP][14] ([i915#11078])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-8/igt@device_reset@unbind-cold-reset-rebind.html
    - shard-tglu:         NOTRUN -> [SKIP][15] ([i915#11078])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-7/igt@device_reset@unbind-cold-reset-rebind.html
    - shard-mtlp:         NOTRUN -> [SKIP][16] ([i915#11078])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-2/igt@device_reset@unbind-cold-reset-rebind.html
    - shard-dg2:          NOTRUN -> [SKIP][17] ([i915#11078])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-1/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@gem_basic@multigpu-create-close:
    - shard-dg1:          NOTRUN -> [SKIP][18] ([i915#7697])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-19/igt@gem_basic@multigpu-create-close.html
    - shard-tglu:         NOTRUN -> [SKIP][19] ([i915#7697]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-8/igt@gem_basic@multigpu-create-close.html

  * igt@gem_busy@semaphore:
    - shard-dg2:          NOTRUN -> [SKIP][20] ([i915#3936])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-6/igt@gem_busy@semaphore.html
    - shard-dg1:          NOTRUN -> [SKIP][21] ([i915#3936])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-14/igt@gem_busy@semaphore.html
    - shard-mtlp:         NOTRUN -> [SKIP][22] ([i915#3936])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-7/igt@gem_busy@semaphore.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-rkl:          NOTRUN -> [SKIP][23] ([i915#3555] / [i915#9323])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-4/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-tglu-1:       NOTRUN -> [SKIP][24] ([i915#9323])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-1/igt@gem_ccs@block-multicopy-compressed.html
    - shard-dg1:          NOTRUN -> [SKIP][25] ([i915#9323])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-14/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-dg1:          NOTRUN -> [SKIP][26] ([i915#3555] / [i915#9323]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-14/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@large-ctrl-surf-copy:
    - shard-dg1:          NOTRUN -> [SKIP][27] ([i915#13008])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-16/igt@gem_ccs@large-ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume:
    - shard-tglu:         NOTRUN -> [SKIP][28] ([i915#9323])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-9/igt@gem_ccs@suspend-resume.html

  * igt@gem_ctx_persistence@engines-persistence:
    - shard-snb:          NOTRUN -> [SKIP][29] ([i915#1099]) +6 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-snb4/igt@gem_ctx_persistence@engines-persistence.html

  * igt@gem_ctx_persistence@heartbeat-hang:
    - shard-dg1:          NOTRUN -> [SKIP][30] ([i915#8555]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-15/igt@gem_ctx_persistence@heartbeat-hang.html

  * igt@gem_ctx_persistence@heartbeat-many:
    - shard-dg2:          NOTRUN -> [SKIP][31] ([i915#8555])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-8/igt@gem_ctx_persistence@heartbeat-many.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-rkl:          NOTRUN -> [SKIP][32] ([i915#280]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-3/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-dg2:          NOTRUN -> [SKIP][33] ([i915#280])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-6/igt@gem_ctx_sseu@mmap-args.html
    - shard-dg1:          NOTRUN -> [SKIP][34] ([i915#280])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-14/igt@gem_ctx_sseu@mmap-args.html
    - shard-tglu:         NOTRUN -> [SKIP][35] ([i915#280])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-3/igt@gem_ctx_sseu@mmap-args.html
    - shard-mtlp:         NOTRUN -> [SKIP][36] ([i915#280])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-7/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@kms:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][37] ([i915#13363])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-8/igt@gem_eio@kms.html
    - shard-tglu:         [PASS][38] -> [DMESG-WARN][39] ([i915#13363])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-tglu-7/igt@gem_eio@kms.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-7/igt@gem_eio@kms.html

  * igt@gem_eio@reset-stress@blt:
    - shard-mtlp:         NOTRUN -> [SKIP][40] ([i915#15314])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-7/igt@gem_eio@reset-stress@blt.html

  * igt@gem_eio@reset-stress@bsd:
    - shard-snb:          NOTRUN -> [FAIL][41] ([i915#8898]) +1 other test fail
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-snb4/igt@gem_eio@reset-stress@bsd.html

  * igt@gem_exec_balancer@bonded-pair:
    - shard-mtlp:         NOTRUN -> [SKIP][42] ([i915#4771])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-6/igt@gem_exec_balancer@bonded-pair.html

  * igt@gem_exec_balancer@invalid-bonds:
    - shard-dg2:          NOTRUN -> [SKIP][43] ([i915#4036])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-5/igt@gem_exec_balancer@invalid-bonds.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-tglu:         NOTRUN -> [SKIP][44] ([i915#4525]) +4 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-10/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-tglu-1:       NOTRUN -> [SKIP][45] ([i915#4525])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-1/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_big@single:
    - shard-mtlp:         [PASS][46] -> [FAIL][47] ([i915#15871])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-mtlp-1/igt@gem_exec_big@single.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-2/igt@gem_exec_big@single.html

  * igt@gem_exec_capture@capture-invisible@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][48] ([i915#6334]) +2 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-17/igt@gem_exec_capture@capture-invisible@lmem0.html

  * igt@gem_exec_fence@submit3:
    - shard-dg2:          NOTRUN -> [SKIP][49] ([i915#4812])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-3/igt@gem_exec_fence@submit3.html
    - shard-mtlp:         NOTRUN -> [SKIP][50] ([i915#4812])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-6/igt@gem_exec_fence@submit3.html

  * igt@gem_exec_flush@basic-wb-pro-default:
    - shard-dg1:          NOTRUN -> [SKIP][51] ([i915#3539] / [i915#4852]) +2 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-19/igt@gem_exec_flush@basic-wb-pro-default.html

  * igt@gem_exec_reloc@basic-gtt-read:
    - shard-dg2:          NOTRUN -> [SKIP][52] ([i915#3281]) +6 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-4/igt@gem_exec_reloc@basic-gtt-read.html

  * igt@gem_exec_reloc@basic-gtt-read-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][53] ([i915#14544] / [i915#3281])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-read-noreloc.html

  * igt@gem_exec_reloc@basic-wc-gtt-noreloc:
    - shard-dg1:          NOTRUN -> [SKIP][54] ([i915#3281]) +11 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-19/igt@gem_exec_reloc@basic-wc-gtt-noreloc.html

  * igt@gem_exec_reloc@basic-write-read-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][55] ([i915#3281]) +18 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-2/igt@gem_exec_reloc@basic-write-read-noreloc.html

  * igt@gem_exec_reloc@basic-write-wc:
    - shard-mtlp:         NOTRUN -> [SKIP][56] ([i915#3281]) +5 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-4/igt@gem_exec_reloc@basic-write-wc.html

  * igt@gem_exec_schedule@preempt-queue-contexts:
    - shard-dg1:          NOTRUN -> [SKIP][57] ([i915#4812]) +3 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-16/igt@gem_exec_schedule@preempt-queue-contexts.html
    - shard-mtlp:         NOTRUN -> [SKIP][58] ([i915#4537] / [i915#4812])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-3/igt@gem_exec_schedule@preempt-queue-contexts.html
    - shard-dg2:          NOTRUN -> [SKIP][59] ([i915#4537] / [i915#4812]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-4/igt@gem_exec_schedule@preempt-queue-contexts.html

  * igt@gem_fence_thrash@bo-copy:
    - shard-dg2:          NOTRUN -> [SKIP][60] ([i915#4860])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-5/igt@gem_fence_thrash@bo-copy.html

  * igt@gem_fence_thrash@bo-write-verify-threaded-none:
    - shard-dg1:          NOTRUN -> [SKIP][61] ([i915#4860])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-15/igt@gem_fence_thrash@bo-write-verify-threaded-none.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglu:         NOTRUN -> [SKIP][62] ([i915#2190])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-2/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][63] ([i915#4613]) +2 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-4/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-mtlp:         NOTRUN -> [SKIP][64] ([i915#4613])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-3/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-tglu:         NOTRUN -> [SKIP][65] ([i915#4613]) +4 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-2/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-glk:          NOTRUN -> [SKIP][66] ([i915#4613]) +2 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-glk5/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_media_vme:
    - shard-rkl:          NOTRUN -> [SKIP][67] ([i915#284])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-7/igt@gem_media_vme.html

  * igt@gem_mmap_gtt@bad-object:
    - shard-dg2:          NOTRUN -> [SKIP][68] ([i915#4077]) +5 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-8/igt@gem_mmap_gtt@bad-object.html

  * igt@gem_mmap_gtt@basic-write-cpu-read-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][69] ([i915#4077]) +4 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-1/igt@gem_mmap_gtt@basic-write-cpu-read-gtt.html

  * igt@gem_mmap_gtt@close-race:
    - shard-dg1:          NOTRUN -> [SKIP][70] ([i915#4077]) +16 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-14/igt@gem_mmap_gtt@close-race.html

  * igt@gem_mmap_wc@bad-offset:
    - shard-mtlp:         NOTRUN -> [SKIP][71] ([i915#4083]) +4 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-6/igt@gem_mmap_wc@bad-offset.html

  * igt@gem_mmap_wc@copy:
    - shard-dg2:          NOTRUN -> [SKIP][72] ([i915#4083]) +6 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-7/igt@gem_mmap_wc@copy.html

  * igt@gem_mmap_wc@write-read:
    - shard-dg1:          NOTRUN -> [SKIP][73] ([i915#4083]) +6 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-12/igt@gem_mmap_wc@write-read.html

  * igt@gem_partial_pwrite_pread@reads-snoop:
    - shard-dg2:          NOTRUN -> [SKIP][74] ([i915#3282]) +2 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-8/igt@gem_partial_pwrite_pread@reads-snoop.html

  * igt@gem_partial_pwrite_pread@reads-uncached:
    - shard-rkl:          NOTRUN -> [SKIP][75] ([i915#3282]) +9 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-7/igt@gem_partial_pwrite_pread@reads-uncached.html

  * igt@gem_partial_pwrite_pread@write:
    - shard-rkl:          NOTRUN -> [SKIP][76] ([i915#14544] / [i915#3282])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@gem_partial_pwrite_pread@write.html

  * igt@gem_pread@exhaustion:
    - shard-snb:          NOTRUN -> [WARN][77] ([i915#2658])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-snb1/igt@gem_pread@exhaustion.html
    - shard-tglu:         NOTRUN -> [WARN][78] ([i915#2658])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-9/igt@gem_pread@exhaustion.html

  * igt@gem_pxp@create-regular-context-2:
    - shard-dg2:          NOTRUN -> [SKIP][79] ([i915#4270]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-3/igt@gem_pxp@create-regular-context-2.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-tglu-1:       NOTRUN -> [SKIP][80] ([i915#13398])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-1/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@gem_pxp@reject-modify-context-protection-off-2:
    - shard-dg1:          NOTRUN -> [SKIP][81] ([i915#4270]) +2 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-17/igt@gem_pxp@reject-modify-context-protection-off-2.html

  * igt@gem_readwrite@beyond-eob:
    - shard-dg1:          NOTRUN -> [SKIP][82] ([i915#3282]) +8 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-19/igt@gem_readwrite@beyond-eob.html

  * igt@gem_readwrite@new-obj:
    - shard-mtlp:         NOTRUN -> [SKIP][83] ([i915#3282]) +4 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-3/igt@gem_readwrite@new-obj.html

  * igt@gem_render_copy@mixed-tiled-to-yf-tiled-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][84] ([i915#8428]) +2 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-4/igt@gem_render_copy@mixed-tiled-to-yf-tiled-ccs.html

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
    - shard-glk:          NOTRUN -> [SKIP][85] +539 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-glk5/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html

  * igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][86] ([i915#5190] / [i915#8428]) +4 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-8/igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled.html

  * igt@gem_set_tiling_vs_gtt:
    - shard-dg1:          NOTRUN -> [SKIP][87] ([i915#4079]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-19/igt@gem_set_tiling_vs_gtt.html

  * igt@gem_tiled_pread_basic@basic:
    - shard-dg1:          NOTRUN -> [SKIP][88] ([i915#15657])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-15/igt@gem_tiled_pread_basic@basic.html

  * igt@gem_unfence_active_buffers:
    - shard-dg1:          NOTRUN -> [SKIP][89] ([i915#4879])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-18/igt@gem_unfence_active_buffers.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-dg1:          NOTRUN -> [SKIP][90] ([i915#3297]) +5 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-12/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-tglu:         NOTRUN -> [SKIP][91] ([i915#3297] / [i915#3323])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-8/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-glk:          NOTRUN -> [SKIP][92] ([i915#3323])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-glk6/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-tglu-1:       NOTRUN -> [SKIP][93] ([i915#3297])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-1/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
    - shard-dg2:          NOTRUN -> [SKIP][94] ([i915#3297] / [i915#4880])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-4/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html
    - shard-dg1:          NOTRUN -> [SKIP][95] ([i915#3297] / [i915#4880])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-16/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html
    - shard-mtlp:         NOTRUN -> [SKIP][96] ([i915#3297]) +2 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-3/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-tglu:         NOTRUN -> [SKIP][97] ([i915#3297]) +2 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-8/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-dg2:          NOTRUN -> [SKIP][98] ([i915#3297])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-8/igt@gem_userptr_blits@unsync-unmap-after-close.html
    - shard-rkl:          NOTRUN -> [SKIP][99] ([i915#3297])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-5/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gen3_render_linear_blits:
    - shard-dg2:          NOTRUN -> [SKIP][100] +6 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-5/igt@gen3_render_linear_blits.html

  * igt@gen7_exec_parse@load-register-reg:
    - shard-mtlp:         NOTRUN -> [SKIP][101] +10 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-8/igt@gen7_exec_parse@load-register-reg.html

  * igt@gen9_exec_parse@bb-large:
    - shard-tglu-1:       NOTRUN -> [SKIP][102] ([i915#2527] / [i915#2856])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-1/igt@gen9_exec_parse@bb-large.html

  * igt@gen9_exec_parse@bb-oversize:
    - shard-rkl:          NOTRUN -> [SKIP][103] ([i915#2527]) +6 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-8/igt@gen9_exec_parse@bb-oversize.html
    - shard-dg1:          NOTRUN -> [SKIP][104] ([i915#2527]) +3 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-15/igt@gen9_exec_parse@bb-oversize.html
    - shard-tglu:         NOTRUN -> [SKIP][105] ([i915#2527] / [i915#2856]) +5 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-7/igt@gen9_exec_parse@bb-oversize.html
    - shard-mtlp:         NOTRUN -> [SKIP][106] ([i915#2856]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-4/igt@gen9_exec_parse@bb-oversize.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-dg2:          NOTRUN -> [SKIP][107] ([i915#2856]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-3/igt@gen9_exec_parse@bb-start-param.html

  * igt@i915_drm_fdinfo@isolation@rcs0:
    - shard-dg1:          NOTRUN -> [SKIP][108] ([i915#14073]) +5 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-15/igt@i915_drm_fdinfo@isolation@rcs0.html

  * igt@i915_fb_tiling@basic-x-tiling:
    - shard-dg1:          NOTRUN -> [SKIP][109] ([i915#13786])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-19/igt@i915_fb_tiling@basic-x-tiling.html

  * igt@i915_module_load@fault-injection@intel_connector_register:
    - shard-glk:          NOTRUN -> [ABORT][110] ([i915#15342]) +1 other test abort
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-glk5/igt@i915_module_load@fault-injection@intel_connector_register.html

  * igt@i915_module_load@reload-no-display:
    - shard-snb:          NOTRUN -> [DMESG-WARN][111] ([i915#14545])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-snb6/igt@i915_module_load@reload-no-display.html

  * igt@i915_module_load@resize-bar:
    - shard-dg2:          NOTRUN -> [DMESG-WARN][112] ([i915#14545])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-8/igt@i915_module_load@resize-bar.html
    - shard-rkl:          NOTRUN -> [SKIP][113] ([i915#6412])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-2/igt@i915_module_load@resize-bar.html
    - shard-dg1:          NOTRUN -> [SKIP][114] ([i915#7178])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-12/igt@i915_module_load@resize-bar.html
    - shard-tglu:         NOTRUN -> [SKIP][115] ([i915#6412])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-2/igt@i915_module_load@resize-bar.html
    - shard-mtlp:         NOTRUN -> [SKIP][116] ([i915#6412])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-2/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][117] ([i915#8399])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-2/igt@i915_pm_freq_api@freq-suspend.html
    - shard-tglu:         NOTRUN -> [SKIP][118] ([i915#8399])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-10/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-dg1:          NOTRUN -> [SKIP][119] ([i915#6590]) +1 other test skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-14/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-tglu:         NOTRUN -> [SKIP][120] ([i915#16080] / [i915#16166])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-7/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglu:         NOTRUN -> [WARN][121] ([i915#13790] / [i915#2681]) +1 other test warn
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-9/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-tglu-1:       NOTRUN -> [SKIP][122] ([i915#14498])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-1/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-glk:          [PASS][123] -> [INCOMPLETE][124] ([i915#13356])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-glk9/igt@i915_pm_rpm@system-suspend.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-glk2/igt@i915_pm_rpm@system-suspend.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][125] ([i915#13356])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@i915_pm_rps@basic-api:
    - shard-dg1:          NOTRUN -> [SKIP][126] ([i915#11681] / [i915#6621])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-17/igt@i915_pm_rps@basic-api.html
    - shard-mtlp:         NOTRUN -> [SKIP][127] ([i915#11681] / [i915#6621])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-2/igt@i915_pm_rps@basic-api.html

  * igt@i915_pm_rps@min-max-config-idle:
    - shard-dg2:          NOTRUN -> [SKIP][128] ([i915#11681] / [i915#6621]) +1 other test skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-8/igt@i915_pm_rps@min-max-config-idle.html

  * igt@i915_pm_rps@thresholds:
    - shard-dg1:          NOTRUN -> [SKIP][129] ([i915#11681]) +2 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-19/igt@i915_pm_rps@thresholds.html

  * igt@i915_pm_rps@thresholds-idle:
    - shard-mtlp:         NOTRUN -> [SKIP][130] ([i915#11681])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-7/igt@i915_pm_rps@thresholds-idle.html
    - shard-dg2:          NOTRUN -> [SKIP][131] ([i915#11681])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-6/igt@i915_pm_rps@thresholds-idle.html

  * igt@i915_pm_rps@waitboost:
    - shard-mtlp:         [PASS][132] -> [FAIL][133] ([i915#15365])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-mtlp-2/igt@i915_pm_rps@waitboost.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-2/igt@i915_pm_rps@waitboost.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-tglu:         NOTRUN -> [SKIP][134] ([i915#5723])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-9/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_suspend@debugfs-reader:
    - shard-glk:          NOTRUN -> [INCOMPLETE][135] ([i915#13356] / [i915#16182] / [i915#4817])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-glk4/igt@i915_suspend@debugfs-reader.html

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][136] ([i915#4212])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-1/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][137] ([i915#4215])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-19/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-mtlp:         NOTRUN -> [SKIP][138] ([i915#12454] / [i915#12712])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - shard-dg1:          NOTRUN -> [SKIP][139] ([i915#4212])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-12/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-rkl:          [PASS][140] -> [INCOMPLETE][141] ([i915#12761]) +1 other test incomplete
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-7/igt@kms_async_flips@async-flip-suspend-resume.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_async_flips@async-flip-suspend-resume.html
    - shard-glk10:        NOTRUN -> [INCOMPLETE][142] ([i915#12761] / [i915#13356])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-glk10/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-2:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][143] ([i915#12761] / [i915#13356] / [i915#14995])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-glk10/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-2.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-dg2:          NOTRUN -> [SKIP][144] ([i915#9531])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-8/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-tglu:         NOTRUN -> [SKIP][145] ([i915#9531])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-3/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-glk:          NOTRUN -> [SKIP][146] ([i915#1769])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-glk5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-rkl:          NOTRUN -> [SKIP][147] ([i915#1769] / [i915#3555])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-snb:          NOTRUN -> [SKIP][148] ([i915#1769])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-snb6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
    - shard-tglu-1:       NOTRUN -> [SKIP][149] ([i915#5286]) +3 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-1/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][150] ([i915#5286]) +6 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-8/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-rkl:          NOTRUN -> [SKIP][151] ([i915#14544] / [i915#5286]) +1 other test skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_big_fb@4-tiled-addfb.html
    - shard-dg1:          NOTRUN -> [SKIP][152] ([i915#5286]) +1 other test skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-18/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-tglu:         NOTRUN -> [SKIP][153] ([i915#5286]) +7 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-dg1:          NOTRUN -> [SKIP][154] ([i915#4538] / [i915#5286]) +7 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-17/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
    - shard-mtlp:         [PASS][155] -> [FAIL][156] ([i915#15733] / [i915#5138])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][157] ([i915#3638]) +4 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-5/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-tglu:         NOTRUN -> [SKIP][158] ([i915#3828]) +3 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-7/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html
    - shard-mtlp:         NOTRUN -> [SKIP][159] ([i915#3828])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-6/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html
    - shard-rkl:          NOTRUN -> [SKIP][160] ([i915#3828])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-4/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-dg2:          NOTRUN -> [SKIP][161] ([i915#3828]) +1 other test skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-4/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html
    - shard-dg1:          NOTRUN -> [SKIP][162] ([i915#3828])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-16/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][163] ([i915#3638]) +4 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-14/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][164] ([i915#4538] / [i915#5190]) +7 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-6/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][165] ([i915#4538]) +7 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-18/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2:          NOTRUN -> [SKIP][166] ([i915#5190]) +1 other test skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-4/igt@kms_big_fb@yf-tiled-addfb.html
    - shard-mtlp:         NOTRUN -> [SKIP][167] ([i915#6187])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-3/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-rkl:          NOTRUN -> [SKIP][168] ([i915#14544]) +18 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][169] ([i915#14544] / [i915#6095]) +4 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][170] ([i915#6095]) +19 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-1/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-edp-1.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][171] ([i915#6095]) +109 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-4/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][172] ([i915#12313]) +3 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-6/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][173] ([i915#12313]) +1 other test skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-3/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][174] ([i915#10307] / [i915#6095]) +95 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-4/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][175] ([i915#12313])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][176] ([i915#10307] / [i915#10434] / [i915#6095]) +4 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-4/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][177] ([i915#14098] / [i915#14544] / [i915#6095]) +3 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-rkl:          [PASS][178] -> [INCOMPLETE][179] ([i915#14694] / [i915#15582]) +1 other test incomplete
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][180] ([i915#14098] / [i915#6095]) +44 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-5/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
    - shard-glk:          NOTRUN -> [INCOMPLETE][181] ([i915#13356] / [i915#14694] / [i915#15582]) +1 other test incomplete
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-glk1/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][182] ([i915#12313]) +2 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-18/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][183] ([i915#12313] / [i915#14544])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][184] ([i915#12313]) +1 other test skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-tglu-1:       NOTRUN -> [SKIP][185] ([i915#6095]) +39 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][186] ([i915#6095]) +185 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-12/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-3.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][187] ([i915#6095]) +64 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-2/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_chamelium_audio@hdmi-audio-after-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][188] ([i915#11151] / [i915#14544])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4:
    - shard-mtlp:         NOTRUN -> [SKIP][189] ([i915#16464] / [i915#16471]) +1 other test skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-8/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4.html
    - shard-dg2:          NOTRUN -> [SKIP][190] ([i915#16471])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-7/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4.html
    - shard-rkl:          NOTRUN -> [SKIP][191] ([i915#14544] / [i915#16471])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:
    - shard-dg1:          NOTRUN -> [SKIP][192] ([i915#16471]) +3 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-18/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:
    - shard-tglu:         NOTRUN -> [SKIP][193] ([i915#16471])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-9/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:
    - shard-rkl:          NOTRUN -> [SKIP][194] ([i915#16471]) +2 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-5/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-rkl:          NOTRUN -> [SKIP][195] ([i915#11151] / [i915#7828]) +9 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-3/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_frames@dp-frame-dump:
    - shard-tglu-1:       NOTRUN -> [SKIP][196] ([i915#11151] / [i915#7828]) +3 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-1/igt@kms_chamelium_frames@dp-frame-dump.html

  * igt@kms_chamelium_frames@hdmi-crc-multiple:
    - shard-dg2:          NOTRUN -> [SKIP][197] ([i915#11151] / [i915#7828]) +2 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-6/igt@kms_chamelium_frames@hdmi-crc-multiple.html
    - shard-mtlp:         NOTRUN -> [SKIP][198] ([i915#11151] / [i915#7828]) +1 other test skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-7/igt@kms_chamelium_frames@hdmi-crc-multiple.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-dg1:          NOTRUN -> [SKIP][199] ([i915#11151] / [i915#7828]) +10 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-19/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-rkl:          NOTRUN -> [SKIP][200] ([i915#11151] / [i915#14544] / [i915#7828])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@vga-hpd-without-ddc:
    - shard-tglu:         NOTRUN -> [SKIP][201] ([i915#11151] / [i915#7828]) +10 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-5/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html

  * igt@kms_color_pipeline@plane-ctm3x4-lut1d@pipe-b-plane-4:
    - shard-dg1:          NOTRUN -> [SKIP][202] ([i915#16990]) +31 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-12/igt@kms_color_pipeline@plane-ctm3x4-lut1d@pipe-b-plane-4.html

  * igt@kms_color_pipeline@plane-ctm3x4@pipe-b-plane-3:
    - shard-tglu:         NOTRUN -> [SKIP][203] ([i915#16990]) +15 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-10/igt@kms_color_pipeline@plane-ctm3x4@pipe-b-plane-3.html

  * {igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d@pipe-b-plane-3} (NEW):
    - shard-mtlp:         NOTRUN -> [FAIL][204] ([i915#15733]) +251 other tests fail
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-2/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d@pipe-b-plane-3.html

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-a-plane-3:
    - shard-mtlp:         NOTRUN -> [SKIP][205] ([i915#16990]) +7 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-7/igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-a-plane-3.html

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-a-plane-4:
    - shard-rkl:          NOTRUN -> [SKIP][206] ([i915#16990]) +5 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-2/igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-a-plane-4.html

  * igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-4:
    - shard-tglu-1:       NOTRUN -> [SKIP][207] ([i915#16990]) +15 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-1/igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-4.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][208] ([i915#15330] / [i915#3116] / [i915#3299]) +1 other test skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-3/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-rkl:          NOTRUN -> [SKIP][209] ([i915#15330] / [i915#3116])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-8/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
    - shard-tglu-1:       NOTRUN -> [SKIP][210] ([i915#15330])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-1/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html

  * igt@kms_content_protection@dp-mst-type-1-suspend-resume:
    - shard-tglu:         NOTRUN -> [SKIP][211] ([i915#15330]) +1 other test skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-8/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html
    - shard-mtlp:         NOTRUN -> [SKIP][212] ([i915#15330])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-3/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html
    - shard-dg2:          NOTRUN -> [SKIP][213] ([i915#15330])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-4/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html
    - shard-rkl:          NOTRUN -> [SKIP][214] ([i915#15330])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-3/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html
    - shard-dg1:          NOTRUN -> [SKIP][215] ([i915#15330])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-18/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg2:          NOTRUN -> [SKIP][216] ([i915#15865]) +1 other test skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-5/igt@kms_content_protection@mei-interface.html
    - shard-tglu:         NOTRUN -> [SKIP][217] ([i915#15865]) +5 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-3/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@suspend-resume:
    - shard-tglu-1:       NOTRUN -> [SKIP][218] ([i915#15865])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-1/igt@kms_content_protection@suspend-resume.html

  * igt@kms_content_protection@type1:
    - shard-rkl:          NOTRUN -> [SKIP][219] ([i915#15865]) +4 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-5/igt@kms_content_protection@type1.html
    - shard-dg1:          NOTRUN -> [SKIP][220] ([i915#15865]) +4 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-19/igt@kms_content_protection@type1.html
    - shard-mtlp:         NOTRUN -> [SKIP][221] ([i915#15865]) +1 other test skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-8/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg1:          NOTRUN -> [SKIP][222] ([i915#13049]) +1 other test skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-18/igt@kms_cursor_crc@cursor-onscreen-512x170.html
    - shard-tglu:         NOTRUN -> [SKIP][223] ([i915#13049])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-5/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-256x85:
    - shard-rkl:          [PASS][224] -> [FAIL][225] ([i915#13566])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-5/igt@kms_cursor_crc@cursor-random-256x85.html
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-4/igt@kms_cursor_crc@cursor-random-256x85.html

  * igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1:
    - shard-tglu:         [PASS][226] -> [FAIL][227] ([i915#13566]) +1 other test fail
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-tglu-5/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-3/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [FAIL][228] ([i915#13566]) +2 other tests fail
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-4/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-2.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][229] ([i915#13049]) +1 other test skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-2/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-tglu:         NOTRUN -> [SKIP][230] ([i915#3555]) +5 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-4/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-dg1:          NOTRUN -> [SKIP][231] ([i915#3555]) +6 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-18/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-rkl:          NOTRUN -> [SKIP][232] ([i915#14544] / [i915#3555])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-tglu-1:       NOTRUN -> [SKIP][233] ([i915#13049])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][234] ([i915#12358] / [i915#14152]) +1 other test incomplete
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-3/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][235] ([i915#9809]) +3 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-rkl:          NOTRUN -> [SKIP][236] ([i915#4103])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg1:          NOTRUN -> [SKIP][237] ([i915#4103])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-17/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-dg2:          NOTRUN -> [SKIP][238] ([i915#13046] / [i915#5354]) +3 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-4/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk11:        NOTRUN -> [FAIL][239] ([i915#15804])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-glk11/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-glk:          NOTRUN -> [FAIL][240] ([i915#15804])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-dg2:          NOTRUN -> [SKIP][241] ([i915#9067])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-6/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
    - shard-dg1:          NOTRUN -> [SKIP][242] ([i915#9067])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-14/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
    - shard-tglu:         NOTRUN -> [SKIP][243] ([i915#9067])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-3/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
    - shard-mtlp:         NOTRUN -> [SKIP][244] ([i915#9067])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-7/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-tglu:         NOTRUN -> [SKIP][245] ([i915#4103])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-rkl:          NOTRUN -> [SKIP][246] ([i915#14544] / [i915#4103])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-dg2:          NOTRUN -> [SKIP][247] ([i915#9833])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-3/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
    - shard-rkl:          NOTRUN -> [SKIP][248] ([i915#9723])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
    - shard-tglu:         NOTRUN -> [SKIP][249] ([i915#9723])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-7/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
    - shard-mtlp:         NOTRUN -> [SKIP][250] ([i915#9833])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-dg1:          NOTRUN -> [SKIP][251] ([i915#9723])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-16/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-rkl:          NOTRUN -> [SKIP][252] ([i915#13749])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-7/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-dg1:          NOTRUN -> [SKIP][253] ([i915#13749])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-12/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-tglu:         NOTRUN -> [SKIP][254] ([i915#16867])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-4/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-rkl:          NOTRUN -> [SKIP][255] ([i915#13707])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-8/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2:          NOTRUN -> [SKIP][256] ([i915#16361])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-8/igt@kms_dsc@dsc-basic.html
    - shard-mtlp:         NOTRUN -> [SKIP][257] ([i915#16361])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-4/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultrajoiner:
    - shard-rkl:          NOTRUN -> [SKIP][258] ([i915#14544] / [i915#16361])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultrajoiner.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-tglu:         NOTRUN -> [SKIP][259] ([i915#16361]) +4 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-2/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-output-formats-bigjoiner:
    - shard-dg1:          NOTRUN -> [SKIP][260] ([i915#16361]) +5 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-19/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner:
    - shard-rkl:          NOTRUN -> [SKIP][261] ([i915#16361]) +5 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-3/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html
    - shard-tglu-1:       NOTRUN -> [SKIP][262] ([i915#16361]) +1 other test skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-1/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][263] ([i915#13356] / [i915#9878])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-glk8/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr:
    - shard-tglu:         NOTRUN -> [SKIP][264] ([i915#16680])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-5/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-tglu-1:       NOTRUN -> [SKIP][265] ([i915#16680])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-1/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-dg1:          NOTRUN -> [SKIP][266] ([i915#16680])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-14/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-2x:
    - shard-dg2:          NOTRUN -> [SKIP][267] ([i915#16081])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-8/igt@kms_feature_discovery@display-2x.html
    - shard-tglu:         NOTRUN -> [SKIP][268] ([i915#16081])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-9/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg1:          NOTRUN -> [SKIP][269] ([i915#16081])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-15/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-rkl:          NOTRUN -> [SKIP][270] ([i915#14544] / [i915#16081])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_feature_discovery@display-4x.html
    - shard-mtlp:         NOTRUN -> [SKIP][271] ([i915#16081])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-8/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr1:
    - shard-tglu:         NOTRUN -> [SKIP][272] ([i915#658])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-3/igt@kms_feature_discovery@psr1.html

  * igt@kms_feature_discovery@psr2:
    - shard-rkl:          NOTRUN -> [SKIP][273] ([i915#658])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-8/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-tglu:         NOTRUN -> [SKIP][274] ([i915#3637] / [i915#9934]) +6 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-7/igt@kms_flip@2x-blocking-absolute-wf_vblank.html
    - shard-mtlp:         NOTRUN -> [SKIP][275] ([i915#3637] / [i915#9934]) +4 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-4/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-dg2:          NOTRUN -> [SKIP][276] ([i915#9934]) +5 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-7/igt@kms_flip@2x-dpms-vs-vblank-race.html
    - shard-tglu-1:       NOTRUN -> [SKIP][277] ([i915#3637] / [i915#9934]) +2 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-1/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][278] ([i915#9934]) +10 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-5/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][279] ([i915#9934])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-1/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          NOTRUN -> [FAIL][280] ([i915#13027]) +1 other test fail
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-glk6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][281] ([i915#12745] / [i915#13356] / [i915#4839] / [i915#6113])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-glk3/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-glk:          NOTRUN -> [INCOMPLETE][282] ([i915#12745] / [i915#13356] / [i915#4839])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-glk3/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
    - shard-rkl:          NOTRUN -> [SKIP][283] ([i915#14544] / [i915#9934]) +1 other test skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][284] ([i915#12745] / [i915#13356]) +1 other test incomplete
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-glk3/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][285] ([i915#9934]) +15 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-16/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@flip-vs-fences-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][286] ([i915#8381])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-17/igt@kms_flip@flip-vs-fences-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][287] ([i915#15643])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][288] ([i915#15643]) +1 other test skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-rkl:          NOTRUN -> [SKIP][289] ([i915#14544] / [i915#15643]) +1 other test skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][290] ([i915#15643]) +4 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-16/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][291] ([i915#15643]) +3 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][292] ([i915#15643]) +1 other test skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][293] ([i915#15643] / [i915#5190]) +2 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_force_connector_basic@force-connector-state:
    - shard-mtlp:         [PASS][294] -> [SKIP][295] ([i915#15672])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-mtlp-2/igt@kms_force_connector_basic@force-connector-state.html
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-1/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][296] ([i915#15104] / [i915#15990]) +3 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc.html
    - shard-dg2:          NOTRUN -> [SKIP][297] ([i915#15104] / [i915#15990])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][298] ([i915#15990] / [i915#8708]) +7 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][299] ([i915#15991] / [i915#1825]) +17 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][300] ([i915#14544] / [i915#1825])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][301] +109 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-16/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-tglu:         NOTRUN -> [SKIP][302] ([i915#5439])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-8/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff:
    - shard-rkl:          NOTRUN -> [SKIP][303] ([i915#15989]) +27 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-3/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][304] ([i915#15989]) +13 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-glk:          [PASS][305] -> [SKIP][306] +3 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-glk1/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-msflip-blt:
    - shard-tglu:         NOTRUN -> [SKIP][307] +158 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-9/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-pgflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][308] +117 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-7/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-pgflip-blt.html
    - shard-tglu-1:       NOTRUN -> [SKIP][309] +39 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-1/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][310] ([i915#15991]) +27 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-6/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbchdr-stridechange:
    - shard-tglu-1:       NOTRUN -> [SKIP][311] ([i915#15989]) +7 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-1/igt@kms_frontbuffer_tracking@fbchdr-stridechange.html
    - shard-dg1:          NOTRUN -> [SKIP][312] ([i915#15989]) +23 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-17/igt@kms_frontbuffer_tracking@fbchdr-stridechange.html

  * igt@kms_frontbuffer_tracking@fbchdr-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][313] ([i915#15989]) +27 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-4/igt@kms_frontbuffer_tracking@fbchdr-suspend.html

  * igt@kms_frontbuffer_tracking@fbchdr-tiling-4:
    - shard-tglu-1:       NOTRUN -> [SKIP][314] ([i915#5439])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-1/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html
    - shard-dg1:          NOTRUN -> [SKIP][315] ([i915#5439])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-17/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][316] ([i915#1825]) +6 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html
    - shard-mtlp:         NOTRUN -> [SKIP][317] ([i915#15990] / [i915#8708]) +3 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][318] ([i915#15102]) +57 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][319] ([i915#10055])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
    - shard-mtlp:         NOTRUN -> [SKIP][320] ([i915#10055])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-blt:
    - shard-rkl:          NOTRUN -> [SKIP][321] ([i915#14544] / [i915#15102]) +10 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][322] ([i915#15990]) +4 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-move:
    - shard-dg1:          NOTRUN -> [SKIP][323] ([i915#15102]) +54 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-mmap-cpu:
    - shard-mtlp:         NOTRUN -> [SKIP][324] ([i915#15989]) +20 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][325] ([i915#15990]) +31 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][326] ([i915#15990]) +12 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-indfb-draw-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][327] ([i915#15991]) +25 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-3/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-shrfb-scaledprimary:
    - shard-rkl:          [PASS][328] -> [SKIP][329] ([i915#15989]) +5 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-shrfb-scaledprimary.html
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-5/igt@kms_frontbuffer_tracking@hdr-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-rkl:          NOTRUN -> [SKIP][330] ([i915#9766])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-7/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][331] ([i915#15102]) +26 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:
    - shard-glk11:        NOTRUN -> [SKIP][332] +76 other tests skip
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-glk11/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move:
    - shard-dg2:          NOTRUN -> [SKIP][333] ([i915#15991] / [i915#5354]) +20 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
    - shard-tglu-1:       NOTRUN -> [SKIP][334] ([i915#15102]) +17 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-1/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][335] ([i915#15990] / [i915#8708]) +18 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-pgflip-blt:
    - shard-tglu:         NOTRUN -> [SKIP][336] ([i915#15102]) +67 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-3/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-mtlp:         NOTRUN -> [SKIP][337] ([i915#15725])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-1/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-rkl:          NOTRUN -> [SKIP][338] ([i915#12713] / [i915#16644])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-5/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-swap:
    - shard-dg1:          NOTRUN -> [SKIP][339] ([i915#3555] / [i915#8228]) +1 other test skip
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-14/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle:
    - shard-tglu-1:       NOTRUN -> [SKIP][340] ([i915#3555] / [i915#8228])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-1/igt@kms_hdr@static-toggle.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][341] ([i915#3555] / [i915#8228])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-8/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][342] ([i915#15460])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-7/igt@kms_joiner@basic-big-joiner.html
    - shard-rkl:          NOTRUN -> [SKIP][343] ([i915#15460])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-5/igt@kms_joiner@basic-big-joiner.html
    - shard-tglu:         NOTRUN -> [SKIP][344] ([i915#15460]) +1 other test skip
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-5/igt@kms_joiner@basic-big-joiner.html
    - shard-mtlp:         NOTRUN -> [SKIP][345] ([i915#15460])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-8/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][346] ([i915#15459]) +1 other test skip
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-3/igt@kms_joiner@basic-force-big-joiner.html
    - shard-rkl:          NOTRUN -> [SKIP][347] ([i915#15459])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-2/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][348] ([i915#15458])
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - shard-dg1:          NOTRUN -> [SKIP][349] ([i915#15458]) +1 other test skip
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-14/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_mst@mst-suspend-read-crc:
    - shard-rkl:          NOTRUN -> [SKIP][350] ([i915#16451])
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-8/igt@kms_mst@mst-suspend-read-crc.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-mtlp:         NOTRUN -> [SKIP][351] ([i915#15815])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-rkl:          NOTRUN -> [SKIP][352] ([i915#15815])
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_stress@stress-xrgb8888-4tiled:
    - shard-rkl:          NOTRUN -> [SKIP][353] ([i915#14712])
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-8/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:
    - shard-glk10:        NOTRUN -> [SKIP][354] +189 other tests skip
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-glk10/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-b-plane-5:
    - shard-dg2:          NOTRUN -> [SKIP][355] ([i915#16386]) +1 other test skip
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-8/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:
    - shard-rkl:          NOTRUN -> [SKIP][356] ([i915#15709]) +6 other tests skip
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-7/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping:
    - shard-tglu:         NOTRUN -> [SKIP][357] ([i915#15709]) +6 other tests skip
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-2/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping:
    - shard-dg1:          NOTRUN -> [SKIP][358] ([i915#15709]) +5 other tests skip
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-18/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier:
    - shard-mtlp:         NOTRUN -> [SKIP][359] ([i915#15709]) +1 other test skip
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-2/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-7:
    - shard-dg1:          NOTRUN -> [SKIP][360] ([i915#16386]) +3 other tests skip
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-19/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-7.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier:
    - shard-dg2:          NOTRUN -> [SKIP][361] ([i915#15709]) +1 other test skip
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-8/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7:
    - shard-tglu:         NOTRUN -> [SKIP][362] ([i915#16386]) +3 other tests skip
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-3/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier:
    - shard-tglu-1:       NOTRUN -> [SKIP][363] ([i915#15709]) +2 other tests skip
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-1/igt@kms_plane@pixel-format-yf-tiled-modifier.html

  * igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:
    - shard-dg1:          NOTRUN -> [SKIP][364] ([i915#16112])
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-12/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb:
    - shard-glk:          NOTRUN -> [FAIL][365] ([i915#10647] / [i915#12169])
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-glk1/igt@kms_plane_alpha_blend@alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][366] ([i915#10647]) +1 other test fail
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-glk1/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1.html

  * igt@kms_plane_lowres@tiling-4:
    - shard-mtlp:         NOTRUN -> [SKIP][367] ([i915#10226] / [i915#11614] / [i915#3555] / [i915#8821])
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-2/igt@kms_plane_lowres@tiling-4.html

  * igt@kms_plane_lowres@tiling-4@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][368] ([i915#11614] / [i915#3582]) +3 other tests skip
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-2/igt@kms_plane_lowres@tiling-4@pipe-c-edp-1.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-mtlp:         NOTRUN -> [SKIP][369] ([i915#3555] / [i915#8821])
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-1/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][370] ([i915#13958] / [i915#14544])
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][371] ([i915#14259])
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-3/igt@kms_plane_multiple@tiling-4.html
    - shard-tglu-1:       NOTRUN -> [SKIP][372] ([i915#14259])
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-1/igt@kms_plane_multiple@tiling-4.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-dg2:          NOTRUN -> [SKIP][373] ([i915#13046] / [i915#5354] / [i915#9423])
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-5/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2:          NOTRUN -> [SKIP][374] ([i915#6953] / [i915#9423])
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-6/igt@kms_plane_scaling@intel-max-src-size.html
    - shard-dg1:          NOTRUN -> [SKIP][375] ([i915#6953])
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-14/igt@kms_plane_scaling@intel-max-src-size.html
    - shard-mtlp:         NOTRUN -> [SKIP][376] ([i915#6953])
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-7/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][377] ([i915#15329]) +7 other tests skip
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-8/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-c:
    - shard-tglu:         NOTRUN -> [SKIP][378] ([i915#15329]) +9 other tests skip
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-10/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-c.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-rkl:          NOTRUN -> [SKIP][379] ([i915#12343] / [i915#5354])
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-3/igt@kms_pm_backlight@bad-brightness.html
    - shard-dg1:          NOTRUN -> [SKIP][380] ([i915#12343] / [i915#5354]) +1 other test skip
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-14/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-tglu:         NOTRUN -> [SKIP][381] ([i915#12343] / [i915#9812])
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-5/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][382] ([i915#12343])
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-5/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-rkl:          NOTRUN -> [SKIP][383] ([i915#12343])
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-4/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-dg1:          NOTRUN -> [SKIP][384] ([i915#12343])
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-16/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-tglu:         NOTRUN -> [SKIP][385] ([i915#12343])
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-3/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc5-pageflip-negative:
    - shard-tglu-1:       NOTRUN -> [SKIP][386] ([i915#9685])
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-1/igt@kms_pm_dc@dc5-pageflip-negative.html

  * igt@kms_pm_dc@dc5-psr-suspend-resume:
    - shard-tglu:         NOTRUN -> [SKIP][387] ([i915#16914])
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-2/igt@kms_pm_dc@dc5-psr-suspend-resume.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-tglu:         NOTRUN -> [FAIL][388] ([i915#16479])
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-5/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-rkl:          NOTRUN -> [SKIP][389] ([i915#14544] / [i915#15073])
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-tglu-1:       NOTRUN -> [SKIP][390] ([i915#15073])
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
    - shard-dg1:          [PASS][391] -> [SKIP][392] ([i915#15073])
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-dg1-18/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-14/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@i2c:
    - shard-dg1:          [PASS][393] -> [DMESG-WARN][394] ([i915#4423]) +1 other test dmesg-warn
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-dg1-12/igt@kms_pm_rpm@i2c.html
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-18/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-dg2:          NOTRUN -> [SKIP][395] ([i915#15073])
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-1/igt@kms_pm_rpm@modeset-lpsp-stress.html
    - shard-dg1:          NOTRUN -> [SKIP][396] ([i915#15073]) +2 other tests skip
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-12/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2:          [PASS][397] -> [SKIP][398] ([i915#15073]) +2 other tests skip
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-dg2-8/igt@kms_pm_rpm@modeset-non-lpsp.html
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@package-g7:
    - shard-rkl:          NOTRUN -> [SKIP][399] ([i915#14544] / [i915#15403])
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_pm_rpm@package-g7.html
    - shard-dg1:          NOTRUN -> [SKIP][400] ([i915#15403])
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-18/igt@kms_pm_rpm@package-g7.html

  * igt@kms_pm_rpm@system-suspend-idle:
    - shard-rkl:          [PASS][401] -> [INCOMPLETE][402] ([i915#14419])
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-7/igt@kms_pm_rpm@system-suspend-idle.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-7/igt@kms_pm_rpm@system-suspend-idle.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-tglu:         NOTRUN -> [SKIP][403] ([i915#6524]) +1 other test skip
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-2/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_prime@d3hot:
    - shard-tglu-1:       NOTRUN -> [SKIP][404] ([i915#6524])
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-1/igt@kms_prime@d3hot.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-tglu:         NOTRUN -> [SKIP][405] ([i915#11520]) +7 other tests skip
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-7/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-rkl:          NOTRUN -> [SKIP][406] ([i915#11520] / [i915#14544])
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - shard-glk10:        NOTRUN -> [SKIP][407] ([i915#11520]) +4 other tests skip
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-glk10/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][408] ([i915#9808])
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
    - shard-tglu-1:       NOTRUN -> [SKIP][409] ([i915#11520]) +3 other tests skip
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][410] ([i915#11520]) +11 other tests skip
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-glk5/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:
    - shard-mtlp:         NOTRUN -> [SKIP][411] ([i915#12316]) +3 other tests skip
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-4/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-snb:          NOTRUN -> [SKIP][412] ([i915#11520]) +11 other tests skip
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-snb6/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-dg1:          NOTRUN -> [SKIP][413] ([i915#11520]) +11 other tests skip
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-12/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - shard-dg2:          NOTRUN -> [SKIP][414] ([i915#11520]) +3 other tests skip
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-6/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][415] ([i915#11520]) +7 other tests skip
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-8/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:
    - shard-glk11:        NOTRUN -> [SKIP][416] ([i915#11520]) +1 other test skip
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-glk11/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-rkl:          NOTRUN -> [SKIP][417] ([i915#9683])
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-2/igt@kms_psr2_su@frontbuffer-xrgb8888.html
    - shard-tglu:         NOTRUN -> [SKIP][418] ([i915#9683]) +1 other test skip
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-3/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-pr-sprite-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][419] ([i915#1072] / [i915#9732]) +10 other tests skip
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-4/igt@kms_psr@fbc-pr-sprite-mmap-gtt.html

  * igt@kms_psr@fbc-psr-cursor-plane-onoff:
    - shard-tglu:         NOTRUN -> [SKIP][420] ([i915#9732]) +24 other tests skip
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-3/igt@kms_psr@fbc-psr-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-mtlp:         NOTRUN -> [SKIP][421] ([i915#9688]) +8 other tests skip
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-1/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@fbc-psr-primary-blt:
    - shard-rkl:          NOTRUN -> [SKIP][422] ([i915#1072] / [i915#14544] / [i915#9732]) +3 other tests skip
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_psr@fbc-psr-primary-blt.html

  * igt@kms_psr@pr-cursor-plane-onoff:
    - shard-rkl:          NOTRUN -> [SKIP][423] ([i915#1072] / [i915#9732]) +25 other tests skip
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-4/igt@kms_psr@pr-cursor-plane-onoff.html

  * igt@kms_psr@psr-cursor-plane-onoff:
    - shard-tglu-1:       NOTRUN -> [SKIP][424] ([i915#9732]) +8 other tests skip
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-1/igt@kms_psr@psr-cursor-plane-onoff.html

  * igt@kms_psr@psr-primary-mmap-gtt@edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][425] ([i915#4077] / [i915#9688]) +1 other test skip
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-3/igt@kms_psr@psr-primary-mmap-gtt@edp-1.html

  * igt@kms_psr@psr-sprite-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][426] ([i915#1072] / [i915#9732]) +26 other tests skip
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-14/igt@kms_psr@psr-sprite-mmap-cpu.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2:          NOTRUN -> [SKIP][427] ([i915#15949])
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-mtlp:         NOTRUN -> [SKIP][428] ([i915#12755] / [i915#15867]) +2 other tests skip
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-1/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-dg2:          NOTRUN -> [SKIP][429] ([i915#12755] / [i915#15867])
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-6/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg1:          NOTRUN -> [SKIP][430] ([i915#5289]) +1 other test skip
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-17/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
    - shard-mtlp:         NOTRUN -> [SKIP][431] ([i915#5289])
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2:          NOTRUN -> [SKIP][432] ([i915#12755] / [i915#15867] / [i915#5190])
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
    - shard-rkl:          NOTRUN -> [SKIP][433] ([i915#5289]) +1 other test skip
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
    - shard-tglu:         NOTRUN -> [SKIP][434] ([i915#5289]) +1 other test skip
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-glk:          NOTRUN -> [ABORT][435] ([i915#13179]) +1 other test abort
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-glk6/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_setmode@basic:
    - shard-snb:          NOTRUN -> [FAIL][436] ([i915#15106]) +6 other tests fail
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-snb7/igt@kms_setmode@basic.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-dg2:          NOTRUN -> [SKIP][437] ([i915#3555])
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-7/igt@kms_setmode@invalid-clone-exclusive-crtc.html
    - shard-tglu-1:       NOTRUN -> [SKIP][438] ([i915#3555])
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-1/igt@kms_setmode@invalid-clone-exclusive-crtc.html
    - shard-mtlp:         NOTRUN -> [SKIP][439] ([i915#3555] / [i915#8809] / [i915#8823])
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-6/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-rkl:          NOTRUN -> [SKIP][440] ([i915#3555]) +7 other tests skip
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-2/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-glk:          NOTRUN -> [FAIL][441] ([i915#10959])
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-glk5/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-rkl:          NOTRUN -> [SKIP][442] ([i915#14544] / [i915#8623])
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-rkl:          [PASS][443] -> [INCOMPLETE][444] ([i915#12276])
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-5/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-3/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][445] ([i915#12276])
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-3/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-2.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][446] ([i915#12276] / [i915#13356]) +3 other tests incomplete
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-glk11/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vrr@flipline:
    - shard-mtlp:         NOTRUN -> [SKIP][447] ([i915#3555] / [i915#8808])
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-8/igt@kms_vrr@flipline.html
    - shard-rkl:          NOTRUN -> [SKIP][448] ([i915#15243] / [i915#3555])
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-5/igt@kms_vrr@flipline.html

  * igt@kms_vrr@negative-basic:
    - shard-dg1:          NOTRUN -> [SKIP][449] ([i915#3555] / [i915#9906])
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-14/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-dg2:          NOTRUN -> [SKIP][450] ([i915#9906])
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-8/igt@kms_vrr@seamless-rr-switch-vrr.html
    - shard-tglu:         NOTRUN -> [SKIP][451] ([i915#9906]) +1 other test skip
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-8/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-rkl:          NOTRUN -> [SKIP][452] ([i915#2435])
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-2/igt@perf@per-context-mode-unprivileged.html
    - shard-dg1:          NOTRUN -> [SKIP][453] ([i915#2433])
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-12/igt@perf@per-context-mode-unprivileged.html

  * igt@perf_pmu@busy-accuracy-98:
    - shard-snb:          NOTRUN -> [SKIP][454] +644 other tests skip
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-snb1/igt@perf_pmu@busy-accuracy-98.html

  * igt@perf_pmu@busy-start@vecs0:
    - shard-glk:          [PASS][455] -> [DMESG-WARN][456] ([i915#118]) +1 other test dmesg-warn
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-glk4/igt@perf_pmu@busy-start@vecs0.html
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-glk6/igt@perf_pmu@busy-start@vecs0.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-dg2:          NOTRUN -> [SKIP][457] ([i915#8516])
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-5/igt@perf_pmu@rc6-all-gts.html
    - shard-rkl:          NOTRUN -> [SKIP][458] ([i915#8516])
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-4/igt@perf_pmu@rc6-all-gts.html
    - shard-dg1:          NOTRUN -> [SKIP][459] ([i915#8516])
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-15/igt@perf_pmu@rc6-all-gts.html
    - shard-tglu:         NOTRUN -> [SKIP][460] ([i915#8516])
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-10/igt@perf_pmu@rc6-all-gts.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-tglu-1:       NOTRUN -> [SKIP][461] ([i915#8516])
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-1/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@prime_udl@share-import:
    - shard-rkl:          NOTRUN -> [SKIP][462] ([i915#16420])
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-5/igt@prime_udl@share-import.html

  * igt@prime_vgem@basic-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][463] ([i915#3708] / [i915#4077])
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-3/igt@prime_vgem@basic-gtt.html

  * igt@prime_vgem@basic-read:
    - shard-rkl:          NOTRUN -> [SKIP][464] ([i915#3291] / [i915#3708])
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-4/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@basic-write:
    - shard-dg1:          NOTRUN -> [SKIP][465] ([i915#3708])
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-17/igt@prime_vgem@basic-write.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-rkl:          NOTRUN -> [SKIP][466] ([i915#14544] / [i915#3708])
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@prime_vgem@fence-flip-hang.html

  * igt@prime_vgem@fence-write-hang:
    - shard-rkl:          NOTRUN -> [SKIP][467] ([i915#3708])
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-4/igt@prime_vgem@fence-write-hang.html

  
#### Possible fixes ####

  * igt@gem_ccs@suspend-resume:
    - shard-dg2:          [INCOMPLETE][468] ([i915#13356] / [i915#16348]) -> [PASS][469] +1 other test pass
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-dg2-4/igt@gem_ccs@suspend-resume.html
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-8/igt@gem_ccs@suspend-resume.html

  * igt@gem_ctx_freq@sysfs@gt0:
    - shard-dg1:          [FAIL][470] ([i915#16505]) -> [PASS][471] +1 other test pass
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-dg1-12/igt@gem_ctx_freq@sysfs@gt0.html
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-18/igt@gem_ctx_freq@sysfs@gt0.html

  * igt@gem_exec_big@single:
    - shard-rkl:          [FAIL][472] ([i915#16604]) -> [PASS][473]
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-4/igt@gem_exec_big@single.html
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-8/igt@gem_exec_big@single.html

  * igt@gem_exec_suspend@basic-s0:
    - shard-dg2:          [INCOMPLETE][474] ([i915#13356]) -> [PASS][475] +1 other test pass
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-dg2-5/igt@gem_exec_suspend@basic-s0.html
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-8/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-snb:          [ABORT][476] ([i915#15840]) -> [PASS][477]
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-snb6/igt@gem_workarounds@suspend-resume-fd.html
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-snb6/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-rkl:          [INCOMPLETE][478] ([i915#13356]) -> [PASS][479]
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-3/igt@i915_pm_rpm@system-suspend.html
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-4/igt@i915_pm_rpm@system-suspend.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-glk:          [INCOMPLETE][480] ([i915#13356] / [i915#15172]) -> [PASS][481]
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-glk8/igt@i915_pm_rpm@system-suspend-execbuf.html
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-glk5/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@kms_color@deep-color:
    - shard-rkl:          [SKIP][482] ([i915#12655] / [i915#3555]) -> [PASS][483]
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-4/igt@kms_color@deep-color.html
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_color@deep-color.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-rkl:          [FAIL][484] ([i915#13566]) -> [PASS][485] +5 other tests pass
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-128x42.html
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1:
    - shard-tglu:         [FAIL][486] ([i915#13566]) -> [PASS][487] +3 other tests pass
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-tglu-4/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1.html
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-8/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-rkl:          [INCOMPLETE][488] ([i915#9878]) -> [PASS][489]
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-4/igt@kms_fbcon_fbt@fbc-suspend.html
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-2/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_feature_discovery@hdr:
    - shard-rkl:          [SKIP][490] ([i915#16600]) -> [PASS][491]
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-7/igt@kms_feature_discovery@hdr.html
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_feature_discovery@hdr.html

  * igt@kms_flip@plain-flip-ts-check:
    - shard-dg2:          [FAIL][492] ([i915#10826]) -> [PASS][493]
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-dg2-4/igt@kms_flip@plain-flip-ts-check.html
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-1/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-plflip-blt:
    - shard-rkl:          [SKIP][494] ([i915#15989]) -> [PASS][495] +5 other tests pass
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-2/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-plflip-blt.html
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-glk:          [SKIP][496] -> [PASS][497] +2 other tests pass
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-glk9/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-glk8/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-rkl:          [SKIP][498] ([i915#15073]) -> [PASS][499] +2 other tests pass
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp.html
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-3/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@perf_pmu@render-node-busy-idle@vcs1:
    - shard-dg2:          [FAIL][500] ([i915#4349]) -> [PASS][501] +5 other tests pass
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-dg2-6/igt@perf_pmu@render-node-busy-idle@vcs1.html
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-6/igt@perf_pmu@render-node-busy-idle@vcs1.html

  
#### Warnings ####

  * igt@gem_bad_reloc@negative-reloc-lut:
    - shard-rkl:          [SKIP][502] ([i915#14544] / [i915#3281]) -> [SKIP][503] ([i915#3281]) +4 other tests skip
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@gem_bad_reloc@negative-reloc-lut.html
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-7/igt@gem_bad_reloc@negative-reloc-lut.html

  * igt@gem_basic@multigpu-create-close:
    - shard-rkl:          [SKIP][504] ([i915#14544] / [i915#7697]) -> [SKIP][505] ([i915#7697])
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@gem_basic@multigpu-create-close.html
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-5/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-rkl:          [SKIP][506] ([i915#3555] / [i915#9323]) -> [SKIP][507] ([i915#14544] / [i915#3555] / [i915#9323])
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-3/igt@gem_ccs@ctrl-surf-copy.html
   [507]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-rkl:          [SKIP][508] ([i915#280]) -> [SKIP][509] ([i915#14544] / [i915#280])
   [508]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-2/igt@gem_ctx_sseu@invalid-args.html
   [509]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_exec_balancer@parallel-dmabuf-import-out-fence:
    - shard-rkl:          [SKIP][510] ([i915#14544] / [i915#4525]) -> [SKIP][511] ([i915#4525])
   [510]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@gem_exec_balancer@parallel-dmabuf-import-out-fence.html
   [511]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-2/igt@gem_exec_balancer@parallel-dmabuf-import-out-fence.html

  * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
    - shard-rkl:          [SKIP][512] ([i915#3281]) -> [SKIP][513] ([i915#14544] / [i915#3281]) +3 other tests skip
   [512]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-8/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html
   [513]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html

  * igt@gem_lmem_swapping@heavy-verify-random:
    - shard-rkl:          [SKIP][514] ([i915#4613]) -> [SKIP][515] ([i915#14544] / [i915#4613])
   [514]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-4/igt@gem_lmem_swapping@heavy-verify-random.html
   [515]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@gem_lmem_swapping@heavy-verify-random.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-rkl:          [SKIP][516] ([i915#14544] / [i915#4613]) -> [SKIP][517] ([i915#4613]) +3 other tests skip
   [516]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@gem_lmem_swapping@verify-ccs.html
   [517]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-8/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_pread@uncached:
    - shard-rkl:          [SKIP][518] ([i915#3282]) -> [SKIP][519] ([i915#14544] / [i915#3282])
   [518]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-5/igt@gem_pread@uncached.html
   [519]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@gem_pread@uncached.html

  * igt@gem_set_tiling_vs_pwrite:
    - shard-rkl:          [SKIP][520] ([i915#14544] / [i915#3282]) -> [SKIP][521] ([i915#3282]) +1 other test skip
   [520]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@gem_set_tiling_vs_pwrite.html
   [521]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-5/igt@gem_set_tiling_vs_pwrite.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-rkl:          [SKIP][522] ([i915#14544] / [i915#3297] / [i915#3323]) -> [SKIP][523] ([i915#3297] / [i915#3323])
   [522]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@gem_userptr_blits@dmabuf-sync.html
   [523]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-8/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-rkl:          [SKIP][524] ([i915#14544] / [i915#3297]) -> [SKIP][525] ([i915#3297])
   [524]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@gem_userptr_blits@readonly-pwrite-unsync.html
   [525]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-8/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-rkl:          [SKIP][526] ([i915#3297]) -> [SKIP][527] ([i915#14544] / [i915#3297]) +1 other test skip
   [526]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-7/igt@gem_userptr_blits@unsync-unmap-cycles.html
   [527]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-glk:          [ABORT][528] ([i915#15840]) -> [INCOMPLETE][529] ([i915#13356] / [i915#14586])
   [528]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-glk4/igt@gem_workarounds@suspend-resume-fd.html
   [529]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-glk2/igt@gem_workarounds@suspend-resume-fd.html

  * igt@gen9_exec_parse@secure-batches:
    - shard-rkl:          [SKIP][530] ([i915#14544] / [i915#2527]) -> [SKIP][531] ([i915#2527])
   [530]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@gen9_exec_parse@secure-batches.html
   [531]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-8/igt@gen9_exec_parse@secure-batches.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-rkl:          [SKIP][532] ([i915#14544] / [i915#16080] / [i915#16166]) -> [SKIP][533] ([i915#16080] / [i915#16166])
   [532]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
   [533]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-4/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_sseu@full-enable:
    - shard-rkl:          [SKIP][534] ([i915#4387]) -> [SKIP][535] ([i915#14544] / [i915#4387])
   [534]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-4/igt@i915_pm_sseu@full-enable.html
   [535]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@i915_pm_sseu@full-enable.html

  * igt@i915_power@sanity:
    - shard-rkl:          [SKIP][536] ([i915#14544] / [i915#7984]) -> [SKIP][537] ([i915#7984])
   [536]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@i915_power@sanity.html
   [537]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-3/igt@i915_power@sanity.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-rkl:          [SKIP][538] ([i915#14544] / [i915#5286]) -> [SKIP][539] ([i915#5286]) +3 other tests skip
   [538]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [539]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-rkl:          [SKIP][540] ([i915#5286]) -> [SKIP][541] ([i915#14544] / [i915#5286]) +1 other test skip
   [540]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [541]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-rkl:          [SKIP][542] ([i915#14544] / [i915#3638]) -> [SKIP][543] ([i915#3638])
   [542]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [543]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-4/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-rkl:          [SKIP][544] ([i915#14544] / [i915#3828]) -> [SKIP][545] ([i915#3828])
   [544]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html
   [545]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-2/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-rkl:          [SKIP][546] ([i915#3638]) -> [SKIP][547] ([i915#14544] / [i915#3638]) +1 other test skip
   [546]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-4/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
   [547]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:
    - shard-rkl:          [SKIP][548] ([i915#14098] / [i915#6095]) -> [SKIP][549] ([i915#14098] / [i915#14544] / [i915#6095]) +7 other tests skip
   [548]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-4/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html
   [549]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html

  * igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          [SKIP][550] ([i915#6095]) -> [SKIP][551] ([i915#14544] / [i915#6095]) +5 other tests skip
   [550]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-4/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-b-hdmi-a-2.html
   [551]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs:
    - shard-rkl:          [SKIP][552] ([i915#14098] / [i915#14544] / [i915#6095]) -> [SKIP][553] ([i915#14098] / [i915#6095]) +11 other tests skip
   [552]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs.html
   [553]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-8/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          [SKIP][554] ([i915#14544] / [i915#6095]) -> [SKIP][555] ([i915#6095]) +7 other tests skip
   [554]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html
   [555]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-rkl:          [SKIP][556] ([i915#11151] / [i915#7828]) -> [SKIP][557] ([i915#11151] / [i915#14544] / [i915#7828]) +3 other tests skip
   [556]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-2/igt@kms_chamelium_edid@dp-edid-resolution-list.html
   [557]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm:
    - shard-rkl:          [SKIP][558] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][559] ([i915#11151] / [i915#7828]) +4 other tests skip
   [558]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@kms_chamelium_hpd@hdmi-hpd-storm.html
   [559]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-4/igt@kms_chamelium_hpd@hdmi-hpd-storm.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-rkl:          [SKIP][560] ([i915#14544] / [i915#15330] / [i915#3116]) -> [SKIP][561] ([i915#15330] / [i915#3116])
   [560]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@kms_content_protection@dp-mst-lic-type-0.html
   [561]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-4/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
    - shard-rkl:          [SKIP][562] ([i915#14544] / [i915#15330]) -> [SKIP][563] ([i915#15330])
   [562]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html
   [563]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-7/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html

  * igt@kms_content_protection@lic-type-1:
    - shard-rkl:          [SKIP][564] ([i915#14544] / [i915#15865]) -> [SKIP][565] ([i915#15865])
   [564]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@kms_content_protection@lic-type-1.html
   [565]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-8/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@uevent:
    - shard-rkl:          [SKIP][566] ([i915#15865]) -> [SKIP][567] ([i915#14544] / [i915#15865]) +1 other test skip
   [566]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-7/igt@kms_content_protection@uevent.html
   [567]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-rkl:          [SKIP][568] ([i915#13049]) -> [SKIP][569] ([i915#13049] / [i915#14544])
   [568]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-5/igt@kms_cursor_crc@cursor-random-512x170.html
   [569]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-rkl:          [SKIP][570] ([i915#14544] / [i915#4103]) -> [SKIP][571] ([i915#4103])
   [570]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [571]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-rkl:          [SKIP][572] ([i915#13748]) -> [SKIP][573] ([i915#13748] / [i915#14544])
   [572]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-5/igt@kms_dp_link_training@uhbr-mst.html
   [573]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:
    - shard-rkl:          [SKIP][574] ([i915#14544] / [i915#16867]) -> [SKIP][575] ([i915#16867])
   [574]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html
   [575]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-8/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html

  * igt@kms_dsc@dsc-basic-ultrajoiner:
    - shard-rkl:          [SKIP][576] ([i915#16361]) -> [SKIP][577] ([i915#14544] / [i915#16361])
   [576]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-4/igt@kms_dsc@dsc-basic-ultrajoiner.html
   [577]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_dsc@dsc-basic-ultrajoiner.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-rkl:          [SKIP][578] ([i915#14544] / [i915#9934]) -> [SKIP][579] ([i915#9934]) +2 other tests skip
   [578]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@kms_flip@2x-flip-vs-modeset.html
   [579]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-2/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-rkl:          [SKIP][580] ([i915#9934]) -> [SKIP][581] ([i915#14544] / [i915#9934]) +2 other tests skip
   [580]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-4/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
   [581]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-rkl:          [SKIP][582] ([i915#14544] / [i915#15643]) -> [SKIP][583] ([i915#15643])
   [582]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
   [583]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-rkl:          [SKIP][584] ([i915#15643]) -> [SKIP][585] ([i915#14544] / [i915#15643])
   [584]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html
   [585]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-pwrite:
    - shard-rkl:          [SKIP][586] -> [SKIP][587] ([i915#14544]) +28 other tests skip
   [586]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-2/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-pwrite.html
   [587]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-rkl:          [SKIP][588] ([i915#14544]) -> [SKIP][589] +48 other tests skip
   [588]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [589]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-plflip-blt:
    - shard-rkl:          [SKIP][590] ([i915#15102]) -> [SKIP][591] ([i915#14544] / [i915#15102]) +8 other tests skip
   [590]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-plflip-blt.html
   [591]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
    - shard-rkl:          [SKIP][592] ([i915#14544] / [i915#15102]) -> [SKIP][593] ([i915#15102]) +20 other tests skip
   [592]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html
   [593]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][594] ([i915#14544] / [i915#1825]) -> [SKIP][595] ([i915#1825]) +1 other test skip
   [594]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt.html
   [595]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-rkl:          [SKIP][596] ([i915#1825]) -> [SKIP][597] ([i915#14544] / [i915#1825]) +2 other tests skip
   [596]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [597]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-tglu:         [SKIP][598] ([i915#12713]) -> [SKIP][599] ([i915#1187] / [i915#12713])
   [598]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-tglu-7/igt@kms_hdr@brightness-with-hdr.html
   [599]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-2/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-rkl:          [SKIP][600] ([i915#14544] / [i915#15459]) -> [SKIP][601] ([i915#15459])
   [600]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [601]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-7/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping:
    - shard-rkl:          [SKIP][602] ([i915#14544] / [i915#15709]) -> [SKIP][603] ([i915#15709]) +2 other tests skip
   [602]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping.html
   [603]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-7/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:
    - shard-rkl:          [SKIP][604] ([i915#15709]) -> [SKIP][605] ([i915#14544] / [i915#15709]) +1 other test skip
   [604]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-4/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html
   [605]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-rkl:          [SKIP][606] ([i915#12343] / [i915#14544] / [i915#5354]) -> [SKIP][607] ([i915#12343] / [i915#5354])
   [606]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@kms_pm_backlight@basic-brightness.html
   [607]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-5/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-rkl:          [SKIP][608] ([i915#9340]) -> [SKIP][609] ([i915#3828])
   [608]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-3/igt@kms_pm_lpsp@kms-lpsp.html
   [609]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-2/igt@kms_pm_lpsp@kms-lpsp.html
    - shard-dg1:          [SKIP][610] ([i915#3828]) -> [SKIP][611] ([i915#9340])
   [610]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-dg1-15/igt@kms_pm_lpsp@kms-lpsp.html
   [611]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-12/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-rkl:          [SKIP][612] ([i915#14544] / [i915#6524]) -> [SKIP][613] ([i915#6524]) +1 other test skip
   [612]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@kms_prime@basic-crc-hybrid.html
   [613]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-5/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-rkl:          [SKIP][614] ([i915#11520] / [i915#14544]) -> [SKIP][615] ([i915#11520])
   [614]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html
   [615]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-8/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-rkl:          [SKIP][616] ([i915#11520]) -> [SKIP][617] ([i915#11520] / [i915#14544]) +1 other test skip
   [616]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-2/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html
   [617]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-rkl:          [SKIP][618] ([i915#14544] / [i915#9683]) -> [SKIP][619] ([i915#9683])
   [618]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@kms_psr2_su@page_flip-p010.html
   [619]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-5/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-rkl:          [SKIP][620] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][621] ([i915#1072] / [i915#9732]) +8 other tests skip
   [620]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@kms_psr@fbc-psr2-sprite-render.html
   [621]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-3/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_psr@psr-dpms:
    - shard-rkl:          [SKIP][622] ([i915#1072] / [i915#9732]) -> [SKIP][623] ([i915#1072] / [i915#14544] / [i915#9732]) +1 other test skip
   [622]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-4/igt@kms_psr@psr-dpms.html
   [623]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_psr@psr-dpms.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-rkl:          [SKIP][624] ([i915#14544] / [i915#3555]) -> [SKIP][625] ([i915#3555])
   [624]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@kms_scaling_modes@scaling-mode-full-aspect.html
   [625]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-2/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-dg1:          [ABORT][626] ([i915#13179]) -> [ABORT][627] ([i915#13179] / [i915#16508]) +1 other test abort
   [626]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-dg1-19/igt@kms_selftest@drm_framebuffer.html
   [627]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-18/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_vrr@flip-dpms:
    - shard-rkl:          [SKIP][628] ([i915#15243] / [i915#3555]) -> [SKIP][629] ([i915#14544] / [i915#15243] / [i915#3555])
   [628]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-4/igt@kms_vrr@flip-dpms.html
   [629]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@flip-suspend:
    - shard-rkl:          [SKIP][630] ([i915#14544] / [i915#15243] / [i915#3555]) -> [SKIP][631] ([i915#15243] / [i915#3555])
   [630]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@kms_vrr@flip-suspend.html
   [631]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-8/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@lobf:
    - shard-rkl:          [SKIP][632] ([i915#11920] / [i915#14544]) -> [SKIP][633] ([i915#11920])
   [632]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@kms_vrr@lobf.html
   [633]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-7/igt@kms_vrr@lobf.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-rkl:          [SKIP][634] ([i915#9906]) -> [SKIP][635] ([i915#14544] / [i915#9906])
   [634]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-2/igt@kms_vrr@seamless-rr-switch-drrs.html
   [635]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_vrr@seamless-rr-switch-drrs.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10055]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055
  [i915#10226]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10226
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#10647]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#10826]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10826
  [i915#10959]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10959
  [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
  [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11614]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11614
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/118
  [i915#1187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187
  [i915#11920]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920
  [i915#12169]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12169
  [i915#12276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
  [i915#12358]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358
  [i915#12454]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454
  [i915#12655]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655
  [i915#12712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12761]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761
  [i915#13008]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008
  [i915#13027]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027
  [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13179]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13363]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13363
  [i915#13398]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707
  [i915#13748]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748
  [i915#13749]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749
  [i915#13786]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13786
  [i915#13790]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13790
  [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
  [i915#14073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14152]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152
  [i915#14259]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259
  [i915#14419]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419
  [i915#14498]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14498
  [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
  [i915#14545]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545
  [i915#14586]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14586
  [i915#14694]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14694
  [i915#14712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712
  [i915#14995]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14995
  [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
  [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
  [i915#15104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104
  [i915#15106]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15106
  [i915#15172]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15172
  [i915#15243]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243
  [i915#15314]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15314
  [i915#15329]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329
  [i915#15330]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330
  [i915#15342]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342
  [i915#15365]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15365
  [i915#15403]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15403
  [i915#15458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458
  [i915#15459]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459
  [i915#15460]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460
  [i915#15582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582
  [i915#15643]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643
  [i915#15657]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15657
  [i915#15672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15672
  [i915#15709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709
  [i915#15725]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15725
  [i915#15733]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15733
  [i915#15804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15804
  [i915#15815]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15815
  [i915#15840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15840
  [i915#15865]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865
  [i915#15867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867
  [i915#15871]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15871
  [i915#15949]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949
  [i915#15989]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989
  [i915#15990]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990
  [i915#15991]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991
  [i915#16080]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16080
  [i915#16081]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081
  [i915#16112]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16112
  [i915#16166]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16166
  [i915#16182]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182
  [i915#16348]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348
  [i915#16361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361
  [i915#16386]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386
  [i915#16420]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16420
  [i915#16451]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16451
  [i915#16464]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16464
  [i915#16471]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471
  [i915#16479]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16479
  [i915#16505]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16505
  [i915#16508]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16508
  [i915#16600]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600
  [i915#16604]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16604
  [i915#16644]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644
  [i915#16680]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680
  [i915#16867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16867
  [i915#16914]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16914
  [i915#16990]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16990
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#2433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433
  [i915#2435]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2435
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658
  [i915#2681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2681
  [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
  [i915#3323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3582
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
  [i915#3936]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3936
  [i915#4036]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4036
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4215]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
  [i915#4387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387
  [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4537]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
  [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
  [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
  [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
  [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
  [i915#4879]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4879
  [i915#4880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880
  [i915#5138]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
  [i915#5723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6113]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113
  [i915#6187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6187
  [i915#6334]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334
  [i915#6412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658
  [i915#6590]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7178]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7178
  [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#7984]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8381]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381
  [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
  [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
  [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808
  [i915#8809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809
  [i915#8821]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821
  [i915#8823]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8823
  [i915#8898]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8898
  [i915#9067]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9340]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
  [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
  [i915#9531]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531
  [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
  [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9766]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766
  [i915#9808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808
  [i915#9809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809
  [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
  [i915#9833]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9833
  [i915#9878]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9878
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9100 -> IGTPW_15863
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_19175: 15f7465765dc45d58738fc05a1c11a785e709c05 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15863: 15863
  IGT_9100: 80e998fdbe300b1ca29901099f35316bd83781e4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/index.html

--===============7297846671586311967==
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
<tr><td><b>Series:</b></td><td>Add FIXED_MATRIX colorop tests (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/165021/">https://patchwork.freedesktop.org/series/165021/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19175_full -&gt; IGTPW_15863_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_15863_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_15863_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/index.html</p>
<h2>Participating hosts (10 -&gt; 10)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_15863_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d (NEW):</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-8/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d.html">SKIP</a> +10 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-2/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d (NEW):</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-18/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d.html">SKIP</a> +9 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-5/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d.html">SKIP</a> +9 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-5/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d.html">SKIP</a> +10 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d@pipe-a-plane-3} (NEW):</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-8/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d@pipe-a-plane-3.html">FAIL</a> +111 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020@pipe-a-plane-2 (NEW):</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-1/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020@pipe-a-plane-2.html">FAIL</a> +28 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d@pipe-c-plane-6} (NEW):</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-4/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d@pipe-c-plane-6.html">FAIL</a> +231 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d@pipe-c-plane-2 (NEW):</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-6/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d@pipe-c-plane-2.html">FAIL</a> +251 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-b-plane-3} (NEW):</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-16/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-b-plane-3.html">FAIL</a> +289 other tests fail</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_19175_full and IGTPW_15863_full:</p>
<h3>New IGT tests (352)</h3>
<ul>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020:</p>
<ul>
<li>Statuses : 5 fail(s) 1 skip(s)</li>
<li>Exec time: [2.21, 21.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim:</p>
<ul>
<li>Statuses : 4 fail(s) 2 skip(s)</li>
<li>Exec time: [0.83, 17.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d:</p>
<ul>
<li>Statuses : 3 fail(s) 1 skip(s)</li>
<li>Exec time: [2.46, 13.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.26, 0.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d@pipe-a-plane-1:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.24, 0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d@pipe-a-plane-2:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.24, 0.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.25, 0.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d@pipe-a-plane-4:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.23, 0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.25, 0.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d@pipe-b-plane-1:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.24, 0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d@pipe-b-plane-2:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.25, 0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.25, 0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d@pipe-b-plane-4:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.24, 0.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d@pipe-c-plane-0:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.23, 0.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d@pipe-c-plane-1:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.24, 0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d@pipe-c-plane-2:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.23, 0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d@pipe-c-plane-3:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.23, 0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d@pipe-c-plane-4:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.22, 0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d@pipe-d-plane-0:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.23, 0.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d@pipe-d-plane-1:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.41, 0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d@pipe-d-plane-2:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.42, 0.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d@pipe-d-plane-3:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.41, 0.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d@pipe-d-plane-4:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.21, 0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.17, 0.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim@pipe-a-plane-1:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.18, 0.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim@pipe-a-plane-2:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.17, 0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.17, 0.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim@pipe-a-plane-4:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.17, 0.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.16, 0.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim@pipe-a-plane-6:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.16, 0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.17, 0.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim@pipe-b-plane-1:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.30, 0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim@pipe-b-plane-2:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.17, 0.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.31, 0.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim@pipe-b-plane-4:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.17, 0.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.30, 0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim@pipe-b-plane-6:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.17, 0.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim@pipe-c-plane-0:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.17, 0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim@pipe-c-plane-1:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.30, 0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim@pipe-c-plane-2:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.18, 0.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim@pipe-c-plane-3:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.31, 0.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim@pipe-c-plane-4:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.18, 0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim@pipe-c-plane-5:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.35, 0.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim@pipe-c-plane-6:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.17, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim@pipe-d-plane-0:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.17, 0.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim@pipe-d-plane-1:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.17, 0.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim@pipe-d-plane-2:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.31, 0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim@pipe-d-plane-3:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.18, 0.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim@pipe-d-plane-4:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.30, 0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim@pipe-d-plane-5:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.18, 0.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim@pipe-d-plane-6:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.32, 0.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d:</p>
<ul>
<li>Statuses : 5 fail(s) 2 skip(s)</li>
<li>Exec time: [0.86, 17.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.19, 0.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d@pipe-a-plane-1:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.18, 0.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d@pipe-a-plane-2:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.17, 0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.16, 0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d@pipe-a-plane-4:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.16, 0.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.17, 0.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d@pipe-a-plane-6:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.16, 0.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.17, 0.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d@pipe-b-plane-1:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.24, 0.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d@pipe-b-plane-2:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.17, 0.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.25, 0.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d@pipe-b-plane-4:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.17, 0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.30, 0.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d@pipe-b-plane-6:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.18, 0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d@pipe-c-plane-0:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.17, 0.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d@pipe-c-plane-1:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.23, 0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d@pipe-c-plane-2:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.17, 0.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d@pipe-c-plane-3:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.25, 0.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d@pipe-c-plane-4:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.18, 0.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d@pipe-c-plane-5:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.17, 0.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d@pipe-c-plane-6:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.32, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d@pipe-d-plane-0:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.18, 0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d@pipe-d-plane-1:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.35, 0.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d@pipe-d-plane-2:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.17, 0.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d@pipe-d-plane-3:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.17, 0.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d@pipe-d-plane-4:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.32, 0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d@pipe-d-plane-5:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.18, 0.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d@pipe-d-plane-6:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.17, 0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.24, 0.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020@pipe-a-plane-1:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.22, 0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020@pipe-a-plane-2:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.22, 1.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.25, 1.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020@pipe-a-plane-4:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.24, 1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.25, 0.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020@pipe-a-plane-6:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.27, 0.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.21, 0.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020@pipe-b-plane-1:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.25, 1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020@pipe-b-plane-2:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.25, 2.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.25, 1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020@pipe-b-plane-4:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.24, 1.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.24, 0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020@pipe-b-plane-6:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.25, 0.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020@pipe-c-plane-0:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.21, 0.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020@pipe-c-plane-1:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.27, 2.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020@pipe-c-plane-2:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.27, 1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020@pipe-c-plane-3:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.26, 1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020@pipe-c-plane-4:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.25, 1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020@pipe-c-plane-5:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.25, 0.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020@pipe-c-plane-6:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.26, 0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020@pipe-d-plane-0:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.23, 0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020@pipe-d-plane-1:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.25, 0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020@pipe-d-plane-2:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.25, 0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020@pipe-d-plane-3:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.25, 0.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020@pipe-d-plane-4:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.24, 0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020@pipe-d-plane-5:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.24, 0.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020@pipe-d-plane-6:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.25, 0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601:</p>
<ul>
<li>Statuses : 5 fail(s) 2 skip(s)</li>
<li>Exec time: [0.84, 17.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim:</p>
<ul>
<li>Statuses : 4 fail(s) 1 skip(s)</li>
<li>Exec time: [0.87, 17.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d:</p>
<ul>
<li>Statuses : 4 fail(s) 2 skip(s)</li>
<li>Exec time: [0.83, 18.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.16, 0.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d@pipe-a-plane-1:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.18, 0.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d@pipe-a-plane-2:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.17, 0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.17, 0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d@pipe-a-plane-4:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.16, 0.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.17, 0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d@pipe-a-plane-6:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.30, 0.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.16, 0.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d@pipe-b-plane-1:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.17, 0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d@pipe-b-plane-2:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.31, 0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.18, 0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d@pipe-b-plane-4:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.16, 0.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.32, 0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d@pipe-b-plane-6:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.18, 0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d@pipe-c-plane-0:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.17, 0.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d@pipe-c-plane-1:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.31, 0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d@pipe-c-plane-2:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.17, 0.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d@pipe-c-plane-3:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.30, 0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d@pipe-c-plane-4:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.17, 0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d@pipe-c-plane-5:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.17, 0.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d@pipe-c-plane-6:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.31, 0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d@pipe-d-plane-0:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.18, 0.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d@pipe-d-plane-1:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.17, 1.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d@pipe-d-plane-2:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.31, 0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d@pipe-d-plane-3:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.18, 0.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d@pipe-d-plane-4:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.31, 0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d@pipe-d-plane-5:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.17, 0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d@pipe-d-plane-6:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.31, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.18, 0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim@pipe-a-plane-1:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.17, 0.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim@pipe-a-plane-2:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.17, 0.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.17, 0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim@pipe-a-plane-4:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.16, 0.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.16, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim@pipe-a-plane-6:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.16, 0.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.17, 0.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim@pipe-b-plane-1:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.17, 0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim@pipe-b-plane-2:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.30, 0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.17, 0.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim@pipe-b-plane-4:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.25, 0.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.17, 0.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim@pipe-b-plane-6:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.30, 0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim@pipe-c-plane-0:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.17, 0.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim@pipe-c-plane-1:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.30, 0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim@pipe-c-plane-2:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.18, 0.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim@pipe-c-plane-3:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.30, 0.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim@pipe-c-plane-4:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.18, 0.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim@pipe-c-plane-5:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.30, 0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim@pipe-c-plane-6:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.18, 0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim@pipe-d-plane-0:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.17, 0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim@pipe-d-plane-1:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.30, 0.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim@pipe-d-plane-2:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.18, 0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim@pipe-d-plane-3:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.31, 0.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim@pipe-d-plane-4:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.18, 0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim@pipe-d-plane-5:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.32, 0.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim@pipe-d-plane-6:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.17, 0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d:</p>
<ul>
<li>Statuses : 4 fail(s) 1 skip(s)</li>
<li>Exec time: [0.88, 15.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.19, 0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d@pipe-a-plane-1:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.18, 0.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d@pipe-a-plane-2:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.18, 0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.17, 0.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d@pipe-a-plane-4:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.16, 0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d@pipe-a-plane-6:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.18, 0.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d@pipe-b-plane-1:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.17, 0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d@pipe-b-plane-2:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.24, 0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.19, 0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d@pipe-b-plane-4:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.23, 0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d@pipe-b-plane-6:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d@pipe-c-plane-0:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.17, 0.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d@pipe-c-plane-1:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.17, 0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d@pipe-c-plane-2:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.23, 0.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d@pipe-c-plane-3:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.17, 0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d@pipe-c-plane-4:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.17, 0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d@pipe-c-plane-5:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d@pipe-c-plane-6:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d@pipe-d-plane-0:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.17, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d@pipe-d-plane-1:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.31, 0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d@pipe-d-plane-2:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.17, 0.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d@pipe-d-plane-3:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.31, 0.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d@pipe-d-plane-4:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.17, 0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d@pipe-d-plane-5:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d@pipe-d-plane-6:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.22, 0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601@pipe-a-plane-1:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.20, 0.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601@pipe-a-plane-2:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.20, 0.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.20, 0.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601@pipe-a-plane-4:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.20, 0.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.20, 0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601@pipe-a-plane-6:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.20, 0.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.20, 0.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601@pipe-b-plane-1:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.20, 0.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601@pipe-b-plane-2:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.20, 0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.20, 0.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601@pipe-b-plane-4:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.20, 0.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.21, 0.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601@pipe-b-plane-6:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.19, 0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601@pipe-c-plane-0:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.20, 0.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601@pipe-c-plane-1:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.20, 0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601@pipe-c-plane-2:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.21, 0.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601@pipe-c-plane-3:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.20, 0.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601@pipe-c-plane-4:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.20, 0.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601@pipe-c-plane-5:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.21, 0.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601@pipe-c-plane-6:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.20, 0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601@pipe-d-plane-0:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.20, 0.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601@pipe-d-plane-1:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.20, 0.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601@pipe-d-plane-2:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.20, 0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601@pipe-d-plane-3:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.20, 0.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601@pipe-d-plane-4:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.21, 0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601@pipe-d-plane-5:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.21, 0.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601@pipe-d-plane-6:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.21, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709:</p>
<ul>
<li>Statuses : 4 fail(s) 1 skip(s)</li>
<li>Exec time: [0.89, 23.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim:</p>
<ul>
<li>Statuses : 4 fail(s) 2 skip(s)</li>
<li>Exec time: [0.84, 18.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d:</p>
<ul>
<li>Statuses : 3 fail(s) 1 skip(s)</li>
<li>Exec time: [0.88, 18.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.26, 0.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d@pipe-a-plane-1:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.25, 0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d@pipe-a-plane-2:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.25, 0.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.30, 0.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d@pipe-a-plane-4:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.24, 0.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d@pipe-a-plane-6:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.25, 0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d@pipe-b-plane-1:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.39, 0.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d@pipe-b-plane-2:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.31, 0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.42, 0.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d@pipe-b-plane-4:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.25, 0.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d@pipe-b-plane-6:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d@pipe-c-plane-0:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.23, 0.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d@pipe-c-plane-1:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.41, 0.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d@pipe-c-plane-2:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.32, 0.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d@pipe-c-plane-3:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.41, 0.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d@pipe-c-plane-4:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.23, 0.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d@pipe-c-plane-5:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d@pipe-c-plane-6:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d@pipe-d-plane-0:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.22, 0.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d@pipe-d-plane-1:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.40, 1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d@pipe-d-plane-2:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.33, 0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d@pipe-d-plane-3:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.40, 0.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d@pipe-d-plane-4:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.21, 0.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d@pipe-d-plane-5:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d@pipe-d-plane-6:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.17, 0.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-a-plane-1:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.17, 0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-a-plane-2:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.18, 0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.17, 0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-a-plane-4:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.17, 0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.16, 0.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-a-plane-6:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.16, 0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.17, 0.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-b-plane-1:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.17, 0.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-b-plane-2:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.31, 0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.18, 0.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-b-plane-4:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.23, 0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.18, 0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-b-plane-6:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.30, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-c-plane-0:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.17, 0.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-c-plane-1:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.17, 0.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-c-plane-2:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.31, 0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-c-plane-3:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.18, 0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-c-plane-4:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.31, 0.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-c-plane-5:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.18, 0.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-c-plane-6:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.30, 0.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-d-plane-0:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.17, 0.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-d-plane-1:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.17, 1.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-d-plane-2:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.31, 0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-d-plane-3:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.18, 0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-d-plane-4:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.35, 0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-d-plane-5:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.17, 0.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-d-plane-6:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.31, 0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d:</p>
<ul>
<li>Statuses : 5 fail(s) 2 skip(s)</li>
<li>Exec time: [0.83, 18.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.19, 0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d@pipe-a-plane-1:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.17, 0.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d@pipe-a-plane-2:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.17, 0.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.17, 0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d@pipe-a-plane-4:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.16, 0.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.16, 0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d@pipe-a-plane-6:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.34, 0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.17, 0.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d@pipe-b-plane-1:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.25, 0.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d@pipe-b-plane-2:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.17, 0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.23, 0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d@pipe-b-plane-4:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.17, 0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.33, 0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d@pipe-b-plane-6:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.17, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d@pipe-c-plane-0:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.17, 0.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d@pipe-c-plane-1:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.23, 1.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d@pipe-c-plane-2:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.17, 0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d@pipe-c-plane-3:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.23, 0.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d@pipe-c-plane-4:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.17, 0.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d@pipe-c-plane-5:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.17, 0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d@pipe-c-plane-6:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d@pipe-d-plane-0:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.17, 0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d@pipe-d-plane-1:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.31, 0.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d@pipe-d-plane-2:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.18, 0.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d@pipe-d-plane-3:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.31, 0.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d@pipe-d-plane-4:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.18, 0.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d@pipe-d-plane-5:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.30, 0.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d@pipe-d-plane-6:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.18, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.22, 0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709@pipe-a-plane-1:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.21, 0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709@pipe-a-plane-2:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.31, 1.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.23, 1.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709@pipe-a-plane-4:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.44, 1.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709@pipe-a-plane-6:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.21, 1.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709@pipe-b-plane-1:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.40, 1.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709@pipe-b-plane-2:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.37, 1.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.40, 1.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709@pipe-b-plane-4:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.24, 1.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709@pipe-b-plane-6:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709@pipe-c-plane-0:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.20, 1.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709@pipe-c-plane-1:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.40, 1.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709@pipe-c-plane-2:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.39, 1.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709@pipe-c-plane-3:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.40, 1.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709@pipe-c-plane-4:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.23, 1.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709@pipe-c-plane-5:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709@pipe-c-plane-6:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709@pipe-d-plane-0:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.21, 0.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709@pipe-d-plane-1:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.42, 0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709@pipe-d-plane-2:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.34, 0.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709@pipe-d-plane-3:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.39, 0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709@pipe-d-plane-4:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.34, 0.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709@pipe-d-plane-5:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709@pipe-d-plane-6:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.34] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15863_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-keep-cache:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-4/igt@api_intel_bb@blit-reloc-keep-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-1/igt@api_intel_bb@blit-reloc-keep-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@blit-reloc-purge-cache:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-12/igt@api_intel_bb@blit-reloc-purge-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-8/igt@device_reset@unbind-cold-reset-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078">i915#11078</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-7/igt@device_reset@unbind-cold-reset-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078">i915#11078</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-2/igt@device_reset@unbind-cold-reset-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078">i915#11078</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-1/igt@device_reset@unbind-cold-reset-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078">i915#11078</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-19/igt@gem_basic@multigpu-create-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-8/igt@gem_basic@multigpu-create-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_busy@semaphore:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-6/igt@gem_busy@semaphore.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3936">i915#3936</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-14/igt@gem_busy@semaphore.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3936">i915#3936</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-7/igt@gem_busy@semaphore.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3936">i915#3936</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-4/igt@gem_ccs@block-copy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-1/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-14/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-14/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@large-ctrl-surf-copy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-16/igt@gem_ccs@large-ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008">i915#13008</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-9/igt@gem_ccs@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-persistence:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-snb4/igt@gem_ctx_persistence@engines-persistence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099">i915#1099</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-hang:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-15/igt@gem_ctx_persistence@heartbeat-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555">i915#8555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-many:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-8/igt@gem_ctx_persistence@heartbeat-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-3/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-6/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-14/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-3/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-7/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-8/igt@gem_eio@kms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13363">i915#13363</a>)</li>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-tglu-7/igt@gem_eio@kms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-7/igt@gem_eio@kms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13363">i915#13363</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress@blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-7/igt@gem_eio@reset-stress@blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15314">i915#15314</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress@bsd:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-snb4/igt@gem_eio@reset-stress@bsd.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8898">i915#8898</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-pair:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-6/igt@gem_exec_balancer@bonded-pair.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771">i915#4771</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@invalid-bonds:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-5/igt@gem_exec_balancer@invalid-bonds.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4036">i915#4036</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-balancer:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-10/igt@gem_exec_balancer@parallel-balancer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-1/igt@gem_exec_balancer@parallel-contexts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_big@single:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-mtlp-1/igt@gem_exec_big@single.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-2/igt@gem_exec_big@single.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15871">i915#15871</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-17/igt@gem_exec_capture@capture-invisible@lmem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334">i915#6334</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-3/igt@gem_exec_fence@submit3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-6/igt@gem_exec_fence@submit3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-pro-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-19/igt@gem_exec_flush@basic-wb-pro-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-read:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-4/igt@gem_exec_reloc@basic-gtt-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-read-noreloc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-read-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-gtt-noreloc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-19/igt@gem_exec_reloc@basic-wc-gtt-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-noreloc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-2/igt@gem_exec_reloc@basic-write-read-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-wc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-4/igt@gem_exec_reloc@basic-write-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-contexts:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-16/igt@gem_exec_schedule@preempt-queue-contexts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>) +3 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-3/igt@gem_exec_schedule@preempt-queue-contexts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537">i915#4537</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-4/igt@gem_exec_schedule@preempt-queue-contexts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537">i915#4537</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-copy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-5/igt@gem_fence_thrash@bo-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-threaded-none:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-15/igt@gem_fence_thrash@bo-write-verify-threaded-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-2/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-4/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-multi:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-3/igt@gem_lmem_swapping@parallel-multi.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-2/igt@gem_lmem_swapping@parallel-random-verify.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-glk5/igt@gem_lmem_swapping@verify-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-7/igt@gem_media_vme.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284">i915#284</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@bad-object:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-8/igt@gem_mmap_gtt@bad-object.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-write-cpu-read-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-1/igt@gem_mmap_gtt@basic-write-cpu-read-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@close-race:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-14/igt@gem_mmap_gtt@close-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@bad-offset:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-6/igt@gem_mmap_wc@bad-offset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@copy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-7/igt@gem_mmap_wc@copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-read:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-12/igt@gem_mmap_wc@write-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-snoop:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-8/igt@gem_partial_pwrite_pread@reads-snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-uncached:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-7/igt@gem_partial_pwrite_pread@reads-uncached.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@gem_partial_pwrite_pread@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-snb1/igt@gem_pread@exhaustion.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658">i915#2658</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-9/igt@gem_pread@exhaustion.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-context-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-3/igt@gem_pxp@create-regular-context-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-buffer:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-1/igt@gem_pxp@hw-rejects-pxp-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398">i915#13398</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-2:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-17/igt@gem_pxp@reject-modify-context-protection-off-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@beyond-eob:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-19/igt@gem_readwrite@beyond-eob.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@new-obj:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-3/igt@gem_readwrite@new-obj.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@mixed-tiled-to-yf-tiled-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-4/igt@gem_render_copy@mixed-tiled-to-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-glk5/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html">SKIP</a> +539 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-8/igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-19/igt@gem_set_tiling_vs_gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic@basic:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-15/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15657">i915#15657</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_unfence_active_buffers:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-18/igt@gem_unfence_active_buffers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4879">i915#4879</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-unsync:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-12/igt@gem_userptr_blits@coherency-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-8/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323">i915#3323</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-glk6/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323">i915#3323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-1/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-4/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880">i915#4880</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-16/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880">i915#4880</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-3/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-pwrite-unsync:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-8/igt@gem_userptr_blits@readonly-pwrite-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-after-close:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-8/igt@gem_userptr_blits@unsync-unmap-after-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-5/igt@gem_userptr_blits@unsync-unmap-after-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gen3_render_linear_blits:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-5/igt@gen3_render_linear_blits.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@load-register-reg:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-8/igt@gen7_exec_parse@load-register-reg.html">SKIP</a> +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-large:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-1/igt@gen9_exec_parse@bb-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-oversize:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-8/igt@gen9_exec_parse@bb-oversize.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +6 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-15/igt@gen9_exec_parse@bb-oversize.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +3 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-7/igt@gen9_exec_parse@bb-oversize.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +5 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-4/igt@gen9_exec_parse@bb-oversize.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-param:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-3/igt@gen9_exec_parse@bb-start-param.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@isolation@rcs0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-15/igt@i915_drm_fdinfo@isolation@rcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073">i915#14073</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_fb_tiling@basic-x-tiling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-19/igt@i915_fb_tiling@basic-x-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13786">i915#13786</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@intel_connector_register:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-glk5/igt@i915_module_load@fault-injection@intel_connector_register.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342">i915#15342</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-no-display:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-snb6/igt@i915_module_load@reload-no-display.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545">i915#14545</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-8/igt@i915_module_load@resize-bar.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545">i915#14545</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-2/igt@i915_module_load@resize-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412">i915#6412</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-12/igt@i915_module_load@resize-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7178">i915#7178</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-2/igt@i915_module_load@resize-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412">i915#6412</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-2/igt@i915_module_load@resize-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412">i915#6412</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-2/igt@i915_pm_freq_api@freq-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#8399</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-10/igt@i915_pm_freq_api@freq-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-14/igt@i915_pm_freq_mult@media-freq@gt0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590">i915#6590</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-7/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16080">i915#16080</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16166">i915#16166</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-9/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13790">i915#13790</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2681">i915#2681</a>) +1 other test warn</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-1/igt@i915_pm_rc6_residency@rc6-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14498">i915#14498</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-glk9/igt@i915_pm_rpm@system-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-glk2/igt@i915_pm_rpm@system-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-execbuf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@i915_pm_rpm@system-suspend-execbuf.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-17/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-2/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-idle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-8/igt@i915_pm_rps@min-max-config-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-19/igt@i915_pm_rps@thresholds.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-idle:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-7/igt@i915_pm_rps@thresholds-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-6/igt@i915_pm_rps@thresholds-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@waitboost:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-mtlp-2/igt@i915_pm_rps@waitboost.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-2/igt@i915_pm_rps@waitboost.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15365">i915#15365</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-9/igt@i915_query@test-query-geometry-subslices.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723">i915#5723</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-glk4/igt@i915_suspend@debugfs-reader.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182">i915#16182</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-1/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-19/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215">i915#4215</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454">i915#12454</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712">i915#12712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@tile-pitch-mismatch:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-12/igt@kms_addfb_basic@tile-pitch-mismatch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-7/igt@kms_async_flips@async-flip-suspend-resume.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_async_flips@async-flip-suspend-resume.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761">i915#12761</a>) +1 other test incomplete</li>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-glk10/igt@kms_async_flips@async-flip-suspend-resume.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761">i915#12761</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-glk10/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761">i915#12761</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14995">i915#14995</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-8/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531">i915#9531</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-3/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531">i915#9531</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-glk5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-snb6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-1/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-8/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-18/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-17/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +7 other tests skip</li>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15733">i915#15733</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138">i915#5138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-5/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-7/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>) +3 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-6/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-4/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-4/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-16/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-14/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-6/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-18/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-4/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-3/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6187">i915#6187</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-1/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-4/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +109 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-6/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +3 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-3/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-4/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +95 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-4/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10434</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14694">i915#14694</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-5/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +44 other tests skip</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-glk1/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14694">i915#14694</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-18/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-12/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +185 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-2/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +64 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-after-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-8/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16464">i915#16464</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-7/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-18/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-9/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-5/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-3/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-frame-dump:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-1/igt@kms_chamelium_frames@dp-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-multiple:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-6/igt@kms_chamelium_frames@hdmi-crc-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-7/igt@kms_chamelium_frames@hdmi-crc-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-19/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-without-ddc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-5/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-ctm3x4-lut1d@pipe-b-plane-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-12/igt@kms_color_pipeline@plane-ctm3x4-lut1d@pipe-b-plane-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-ctm3x4@pipe-b-plane-3:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-10/igt@kms_color_pipeline@plane-ctm3x4@pipe-b-plane-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d@pipe-b-plane-3} (NEW):</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-2/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d@pipe-b-plane-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15733">i915#15733</a>) +251 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-a-plane-3:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-7/igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-a-plane-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-a-plane-4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-2/igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-a-plane-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-4:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-1/igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-3/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-8/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-suspend-resume:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-1/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1-suspend-resume:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-8/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-3/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-4/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-3/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-18/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-5/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-3/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-1/igt@kms_content_protection@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-5/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +4 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-19/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +4 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-8/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-18/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-5/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-5/igt@kms_cursor_crc@cursor-random-256x85.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-4/igt@kms_cursor_crc@cursor-random-256x85.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-tglu-5/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-3/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-4/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-2/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-4/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-18/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-3/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358">i915#12358</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152">i915#14152</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809">i915#9809</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-17/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-4/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046">i915#13046</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-glk11/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15804">i915#15804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15804">i915#15804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-6/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067">i915#9067</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-14/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067">i915#9067</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-3/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067">i915#9067</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-7/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067">i915#9067</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-3/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9833">i915#9833</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-7/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9833">i915#9833</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-16/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-7/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749">i915#13749</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-12/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749">i915#13749</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-4/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16867">i915#16867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-8/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707">i915#13707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-8/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-4/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultrajoiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-2/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-bigjoiner:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-19/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-3/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +5 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-1/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-glk8/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9878">i915#9878</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-5/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680">i915#16680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-1/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680">i915#16680</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-14/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680">i915#16680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-8/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081">i915#16081</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-9/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081">i915#16081</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-15/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081">i915#16081</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081">i915#16081</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-8/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081">i915#16081</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-3/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-8/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-7/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +6 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-4/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-7/igt@kms_flip@2x-dpms-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +5 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-1/igt@kms_flip@2x-dpms-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-5/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-1/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-glk6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027">i915#13027</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-glk3/igt@kms_flip@2x-flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113">i915#6113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-glk3/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-glk3/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-16/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences-interruptible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-17/igt@kms_flip@flip-vs-fences-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381">i915#8381</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-16/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-mtlp-2/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-1/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15672">i915#15672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +3 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-16/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> +109 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-8/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-3/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-glk1/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-9/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> +158 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-7/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> +117 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-1/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-6/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-stridechange:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-1/igt@kms_frontbuffer_tracking@fbchdr-stridechange.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +7 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-17/igt@kms_frontbuffer_tracking@fbchdr-stridechange.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-4/igt@kms_frontbuffer_tracking@fbchdr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-tiling-4:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-1/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-17/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +6 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +57 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055">i915#10055</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055">i915#10055</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +54 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-3/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-shrfb-scaledprimary:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-shrfb-scaledprimary.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-5/igt@kms_frontbuffer_tracking@hdr-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-7/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766">i915#9766</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-glk11/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html">SKIP</a> +76 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-1/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-3/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +67 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-1/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15725">i915#15725</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-5/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644">i915#16644</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-14/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-1/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-8/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-7/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460">i915#15460</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-5/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460">i915#15460</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-5/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460">i915#15460</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-8/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460">i915#15460</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-3/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459">i915#15459</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-2/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459">i915#15459</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-14/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_mst@mst-suspend-read-crc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-8/igt@kms_mst@mst-suspend-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16451">i915#16451</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15815">i915#15815</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15815">i915#15815</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-4tiled:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-8/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712">i915#14712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-glk10/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier.html">SKIP</a> +189 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-b-plane-5:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-8/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-b-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-7/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-2/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-18/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-2/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-7:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-19/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-8/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-3/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-1/igt@kms_plane@pixel-format-yf-tiled-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-12/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16112">i915#16112</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-glk1/igt@kms_plane_alpha_blend@alpha-opaque-fb.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647">i915#10647</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12169">i915#12169</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-glk1/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647">i915#10647</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-2/igt@kms_plane_lowres@tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10226">i915#10226</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11614">i915#11614</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821">i915#8821</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-2/igt@kms_plane_lowres@tiling-4@pipe-c-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11614">i915#11614</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3582">i915#3582</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-1/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821">i915#8821</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-3/igt@kms_plane_multiple@tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259">i915#14259</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-1/igt@kms_plane_multiple@tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259">i915#14259</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-5/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046">i915#13046</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-6/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-14/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-7/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-8/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-c:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-10/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-3/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-14/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-5/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812">i915#9812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-5/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-4/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-16/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-3/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-pageflip-negative:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-1/igt@kms_pm_dc@dc5-pageflip-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr-suspend-resume:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-2/igt@kms_pm_dc@dc5-psr-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16914">i915#16914</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-5/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16479">i915#16479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-dg1-18/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-14/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-dg1-12/igt@kms_pm_rpm@i2c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-18/igt@kms_pm_rpm@i2c.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-1/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-12/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-dg2-8/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@package-g7:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_pm_rpm@package-g7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15403">i915#15403</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-18/igt@kms_pm_rpm@package-g7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15403">i915#15403</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-idle:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-7/igt@kms_pm_rpm@system-suspend-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-7/igt@kms_pm_rpm@system-suspend-idle.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419">i915#14419</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-2/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_prime@d3hot:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-1/igt@kms_prime@d3hot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-7/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-glk10/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808">i915#9808</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-glk5/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-4/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316">i915#12316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-snb6/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-12/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-6/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-8/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-glk11/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-2/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-3/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-4/igt@kms_psr@fbc-pr-sprite-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-plane-onoff:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-3/igt@kms_psr@fbc-psr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-no-drrs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-1/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_psr@fbc-psr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-plane-onoff:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-4/igt@kms_psr@pr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-onoff:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-1/igt@kms_psr@psr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-mmap-gtt@edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-3/igt@kms_psr@psr-primary-mmap-gtt@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-mmap-cpu:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-14/igt@kms_psr@psr-sprite-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949">i915#15949</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-1/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-6/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-17/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-glk6/igt@kms_selftest@drm_framebuffer.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179">i915#13179</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-snb7/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15106">i915#15106</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-7/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-1/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-6/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809">i915#8809</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8823">i915#8823</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-2/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-glk5/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10959">i915#10959</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-5/igt@kms_vblank@ts-continuation-dpms-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-3/igt@kms_vblank@ts-continuation-dpms-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276">i915#12276</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-3/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276">i915#12276</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-glk11/igt@kms_vblank@ts-continuation-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276">i915#12276</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) +3 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-mtlp-8/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808">i915#8808</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-5/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-14/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-8/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-8/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-2/igt@perf@per-context-mode-unprivileged.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2435">i915#2435</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-12/igt@perf@per-context-mode-unprivileged.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433">i915#2433</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-accuracy-98:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-snb1/igt@perf_pmu@busy-accuracy-98.html">SKIP</a> +644 other tests skip</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-start@vecs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-glk4/igt@perf_pmu@busy-start@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-glk6/igt@perf_pmu@busy-start@vecs0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/118">i915#118</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-all-gts:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-5/igt@perf_pmu@rc6-all-gts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516">i915#8516</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-4/igt@perf_pmu@rc6-all-gts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516">i915#8516</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-15/igt@perf_pmu@rc6-all-gts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516">i915#8516</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-10/igt@perf_pmu@rc6-all-gts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516">i915#8516</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@other-idle-gt0:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-1/igt@perf_pmu@rc6@other-idle-gt0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516">i915#8516</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_udl@share-import:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-5/igt@prime_udl@share-import.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16420">i915#16420</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-3/igt@prime_vgem@basic-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-4/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-17/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@prime_vgem@fence-flip-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-write-hang:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-4/igt@prime_vgem@fence-write-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-dg2-4/igt@gem_ccs@suspend-resume.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348">i915#16348</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-8/igt@gem_ccs@suspend-resume.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_freq@sysfs@gt0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-dg1-12/igt@gem_ctx_freq@sysfs@gt0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16505">i915#16505</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-18/igt@gem_ctx_freq@sysfs@gt0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_exec_big@single:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-4/igt@gem_exec_big@single.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16604">i915#16604</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-8/igt@gem_exec_big@single.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-dg2-5/igt@gem_exec_suspend@basic-s0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-8/igt@gem_exec_suspend@basic-s0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-snb6/igt@gem_workarounds@suspend-resume-fd.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15840">i915#15840</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-snb6/igt@gem_workarounds@suspend-resume-fd.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-3/igt@i915_pm_rpm@system-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-4/igt@i915_pm_rpm@system-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-execbuf:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-glk8/igt@i915_pm_rpm@system-suspend-execbuf.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15172">i915#15172</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-glk5/igt@i915_pm_rpm@system-suspend-execbuf.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-4/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655">i915#12655</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_color@deep-color.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-128x42.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-128x42.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-tglu-4/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-8/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-4/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9878">i915#9878</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-2/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@hdr:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-7/igt@kms_feature_discovery@hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600">i915#16600</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_feature_discovery@hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-dg2-4/igt@kms_flip@plain-flip-ts-check.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10826">i915#10826</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-1/igt@kms_flip@plain-flip-ts-check.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-2/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-plflip-blt.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-glk9/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-glk8/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-indfb-draw-mmap-wc.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-3/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@render-node-busy-idle@vcs1:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-dg2-6/igt@perf_pmu@render-node-busy-idle@vcs1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg2-6/igt@perf_pmu@render-node-busy-idle@vcs1.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_bad_reloc@negative-reloc-lut:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@gem_bad_reloc@negative-reloc-lut.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-7/igt@gem_bad_reloc@negative-reloc-lut.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@gem_basic@multigpu-create-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-5/igt@gem_basic@multigpu-create-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-3/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-2/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-dmabuf-import-out-fence:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@gem_exec_balancer@parallel-dmabuf-import-out-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-2/igt@gem_exec_balancer@parallel-dmabuf-import-out-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc-noreloc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-8/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-4/igt@gem_lmem_swapping@heavy-verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@gem_lmem_swapping@heavy-verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@gem_lmem_swapping@verify-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-8/igt@gem_lmem_swapping@verify-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@uncached:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-5/igt@gem_pread@uncached.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@gem_pread@uncached.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_pwrite:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@gem_set_tiling_vs_pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-5/igt@gem_set_tiling_vs_pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323">i915#3323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-8/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323">i915#3323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-pwrite-unsync:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@gem_userptr_blits@readonly-pwrite-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-8/igt@gem_userptr_blits@readonly-pwrite-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-7/igt@gem_userptr_blits@unsync-unmap-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@gem_userptr_blits@unsync-unmap-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-glk4/igt@gem_workarounds@suspend-resume-fd.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15840">i915#15840</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-glk2/igt@gem_workarounds@suspend-resume-fd.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14586">i915#14586</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@secure-batches:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@gen9_exec_parse@secure-batches.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-8/igt@gen9_exec_parse@secure-batches.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16080">i915#16080</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16166">i915#16166</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-4/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16080">i915#16080</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16166">i915#16166</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-4/igt@i915_pm_sseu@full-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387">i915#4387</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@i915_pm_sseu@full-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387">i915#4387</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_power@sanity:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@i915_power@sanity.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984">i915#7984</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-3/igt@i915_power@sanity.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984">i915#7984</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-4/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-2/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-4/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-4/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-4/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-8/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-2/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@kms_chamelium_hpd@hdmi-hpd-storm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-4/igt@kms_chamelium_hpd@hdmi-hpd-storm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-4/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-suspend-resume:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-7/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-8/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-7/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-5/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-5/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915#13748</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915#13748</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16867">i915#16867</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-8/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16867">i915#16867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic-ultrajoiner:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-4/igt@kms_dsc@dsc-basic-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_dsc@dsc-basic-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@kms_flip@2x-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-2/igt@kms_flip@2x-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-4/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-2/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-pwrite.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-tglu-7/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-tglu-2/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187">i915#1187</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459">i915#15459</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-7/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459">i915#15459</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-7/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-4/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-5/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-3/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340">i915#9340</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-2/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-dg1-15/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-12/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340">i915#9340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-5/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-8/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-2/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-5/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@kms_psr@fbc-psr2-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-3/igt@kms_psr@fbc-psr2-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-4/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-2/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-dg1-19/igt@kms_selftest@drm_framebuffer.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179">i915#13179</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-dg1-18/igt@kms_selftest@drm_framebuffer.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179">i915#13179</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16508">i915#16508</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-4/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-8/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-6/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#11920</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-7/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#11920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/shard-rkl-2/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15863/shard-rkl-6/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9100 -&gt; IGTPW_15863</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19175: 15f7465765dc45d58738fc05a1c11a785e709c05 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15863: 15863<br />
  IGT_9100: 80e998fdbe300b1ca29901099f35316bd83781e4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============7297846671586311967==--
