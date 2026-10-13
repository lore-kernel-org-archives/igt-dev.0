Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0060FCC6B0E
	for <igt-dev@archiver.kernel.org>; Tue, 13 Oct 2026 07:40:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8554F10F53F;
	Tue, 13 Oct 2026 07:40:12 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68E1A10F53E;
 Tue, 13 Oct 2026 07:39:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6147768753065281742=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_series_starting_with_=5Bi-?=
 =?utf-8?q?g-t=2C1/5=5D_lib/igt=5Ffb=3A_add_igt=5Fformat=5Fget=5Fsubsampling?=
 =?utf-8?q?=28=29_function?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 13 Oct 2026 07:39:25 -0000
Message-ID: <179187716541.16334.13381338580171082565@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261012122939.233749-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20261012122939.233749-1-juhapekka.heikkila@gmail.com>
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

--===============6147768753065281742==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/5] lib/igt_fb: add igt_format_get_subsampling() function
URL   : https://patchwork.freedesktop.org/series/175949/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_9140_FULL -> XEIGTPW_15972_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_15972_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_15972_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_15972_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled (NEW):
    - shard-bmg:          NOTRUN -> [FAIL][1] +8 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-bmg-7/igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled.html

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled (NEW):
    - shard-ptl:          NOTRUN -> [SKIP][2] +5 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-4/igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled.html

  * igt@kms_plane_scaling@plane-upscale-max-crc-y-tiled (NEW):
    - shard-bmg:          NOTRUN -> [SKIP][3] +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-bmg-5/igt@kms_plane_scaling@plane-upscale-max-crc-y-tiled.html

  * igt@kms_plane_scaling@plane-upscale-max-crc-yf-tiled (NEW):
    - shard-lnl:          NOTRUN -> [SKIP][4] +2 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-4/igt@kms_plane_scaling@plane-upscale-max-crc-yf-tiled.html

  
New tests
---------

  New tests have been introduced between XEIGT_9140_FULL and XEIGTPW_15972_FULL:

### New IGT tests (252) ###

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [22.88, 30.50] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-nv12-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [0.76] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-nv12-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [0.71] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-p010-horizontal:
    - Statuses : 1 fail(s)
    - Exec time: [0.88] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-p010-vertical:
    - Statuses : 1 fail(s)
    - Exec time: [3.05] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-rgb565-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [0.75] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-rgb565-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [0.66] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-xrgb16161616f-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.10] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-xrgb16161616f-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.05] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-xrgb2101010-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.84] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-xrgb2101010-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.83] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-xrgb8888-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [0.72] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-xrgb8888-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [0.65] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-xv30-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [0.87] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-xv30-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [0.85] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-xv36-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.01] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-xv36-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [0.99] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-xyuv8888-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [0.88] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-xyuv8888-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [0.81] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-y210-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [0.84] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-y210-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [0.82] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-yuyv-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [0.78] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-yuyv-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [0.76] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-nv12-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.37] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-nv12-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.37] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-p010-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-p010-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-rgb565-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.40] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-rgb565-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.46] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-xrgb16161616f-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.35] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-xrgb16161616f-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-xrgb2101010-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-xrgb2101010-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.37] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-xrgb8888-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.48] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-xrgb8888-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.45] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-xv30-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-xv30-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-xv36-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.37] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-xv36-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-xyuv8888-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-xyuv8888-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.37] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-y210-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.37] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-y210-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.37] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-yuyv-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.37] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-yuyv-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.37] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear:
    - Statuses : 1 pass(s)
    - Exec time: [20.82] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-2-nv12-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [0.76] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-2-nv12-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [0.77] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-2-p010-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [0.81] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-2-p010-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [0.81] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-2-rgb565-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [0.74] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-2-rgb565-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [0.68] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-2-xrgb16161616f-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.09] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-2-xrgb16161616f-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.05] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-2-xrgb2101010-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.86] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-2-xrgb2101010-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.82] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-2-xrgb8888-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [0.72] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-2-xrgb8888-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [0.66] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-2-xv30-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [0.86] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-2-xv30-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [0.83] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-2-xv36-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.06] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-2-xv36-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.02] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-2-xyuv8888-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [0.87] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-2-xyuv8888-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [0.84] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-2-y210-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [0.89] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-2-y210-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [0.85] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-2-yuyv-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [0.79] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-2-yuyv-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [0.78] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled:
    - Statuses : 1 fail(s) 1 pass(s) 1 skip(s)
    - Exec time: [0.04, 30.63] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-1-nv12-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [0.76] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-1-nv12-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [0.76] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-1-p010-horizontal:
    - Statuses : 1 fail(s)
    - Exec time: [0.87] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-1-p010-vertical:
    - Statuses : 1 fail(s)
    - Exec time: [2.69] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-1-rgb565-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [0.74] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-1-rgb565-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [0.66] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-1-xrgb16161616f-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.10] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-1-xrgb16161616f-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.01] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-1-xrgb2101010-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.83] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-1-xrgb2101010-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.81] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-1-xrgb8888-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [0.70] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-1-xrgb8888-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [0.67] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-1-xv30-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [0.85] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-1-xv30-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [0.82] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-1-xv36-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.04] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-1-xv36-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [0.99] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-1-xyuv8888-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [0.86] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-1-xyuv8888-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [0.82] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-1-y210-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [0.83] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-1-y210-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [0.82] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-1-yuyv-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [0.75] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-1-yuyv-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [0.76] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-nv12-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-nv12-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-p010-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.35] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-p010-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-rgb565-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.43] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-rgb565-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.45] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-xrgb16161616f-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.40] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-xrgb16161616f-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.40] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-xrgb2101010-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.40] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-xrgb2101010-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-xrgb8888-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.48] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-xrgb8888-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.35] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-xv30-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-xv30-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-xv36-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-xv36-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-xyuv8888-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-xyuv8888-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.37] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-y210-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.37] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-y210-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-yuyv-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.40] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-yuyv-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.37] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled:
    - Statuses : 3 skip(s)
    - Exec time: [0.02, 0.12] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-yf-tiled:
    - Statuses : 3 skip(s)
    - Exec time: [0.02, 0.11] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled:
    - Statuses : 1 fail(s) 2 pass(s)
    - Exec time: [18.20, 31.40] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-dp-1-nv12-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [0.69] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-dp-1-nv12-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [0.67] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-dp-1-p010-horizontal:
    - Statuses : 1 fail(s)
    - Exec time: [0.72] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-dp-1-p010-vertical:
    - Statuses : 1 fail(s)
    - Exec time: [3.09] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-dp-1-rgb565-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [0.74] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-dp-1-rgb565-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [0.68] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-dp-1-xrgb16161616f-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [0.75] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-dp-1-xrgb16161616f-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [0.66] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-dp-1-xrgb2101010-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [0.81] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-dp-1-xrgb2101010-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [0.71] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-dp-1-xrgb8888-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [0.73] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-dp-1-xrgb8888-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [0.66] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-dp-1-xv30-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [0.73] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-dp-1-xv30-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [0.70] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-dp-1-xv36-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [0.74] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-dp-1-xv36-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [0.72] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-dp-1-xyuv8888-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [0.72] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-dp-1-xyuv8888-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [0.70] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-dp-1-y210-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [0.67] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-dp-1-y210-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [0.70] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-dp-1-yuyv-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [0.71] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-dp-1-yuyv-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [0.67] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-edp-1-nv12-horizontal:
    - Statuses : 2 pass(s)
    - Exec time: [1.37, 1.42] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-edp-1-nv12-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.37, 1.39] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-edp-1-p010-horizontal:
    - Statuses : 2 pass(s)
    - Exec time: [1.35, 1.38] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-edp-1-p010-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.35, 1.45] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-edp-1-rgb565-horizontal:
    - Statuses : 2 pass(s)
    - Exec time: [1.46, 1.51] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-edp-1-rgb565-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.49, 1.56] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-edp-1-xrgb16161616f-horizontal:
    - Statuses : 2 pass(s)
    - Exec time: [1.37, 1.41] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-edp-1-xrgb16161616f-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.36, 1.41] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-edp-1-xrgb2101010-horizontal:
    - Statuses : 2 pass(s)
    - Exec time: [1.41, 1.47] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-edp-1-xrgb2101010-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.36, 1.40] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-edp-1-xrgb8888-horizontal:
    - Statuses : 2 pass(s)
    - Exec time: [1.46, 1.47] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-edp-1-xrgb8888-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.48, 1.49] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-edp-1-xv30-horizontal:
    - Statuses : 2 pass(s)
    - Exec time: [1.38, 1.40] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-edp-1-xv30-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.36, 1.43] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-edp-1-xv36-horizontal:
    - Statuses : 2 pass(s)
    - Exec time: [1.36, 1.39] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-edp-1-xv36-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.40] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-edp-1-xyuv8888-horizontal:
    - Statuses : 2 pass(s)
    - Exec time: [1.36, 1.40] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-edp-1-xyuv8888-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.38, 1.41] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-edp-1-y210-horizontal:
    - Statuses : 2 pass(s)
    - Exec time: [1.40, 1.41] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-edp-1-y210-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.36, 1.41] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-edp-1-yuyv-horizontal:
    - Statuses : 2 pass(s)
    - Exec time: [1.37, 1.41] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-edp-1-yuyv-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.37, 1.41] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear:
    - Statuses : 3 pass(s)
    - Exec time: [14.61, 32.28] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-dp-2-nv12-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [0.60] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-dp-2-nv12-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [0.64] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-dp-2-p010-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [0.63] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-dp-2-p010-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [0.61] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-dp-2-rgb565-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [0.69] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-dp-2-rgb565-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [0.64] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-dp-2-xrgb16161616f-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [0.69] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-dp-2-xrgb16161616f-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [0.64] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-dp-2-xrgb2101010-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [0.87] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-dp-2-xrgb2101010-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [0.71] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-dp-2-xrgb8888-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [0.66] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-dp-2-xrgb8888-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [0.64] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-dp-2-xv30-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [0.69] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-dp-2-xv30-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [0.61] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-dp-2-xv36-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [0.72] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-dp-2-xv36-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [0.62] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-dp-2-xyuv8888-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [0.68] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-dp-2-xyuv8888-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [0.60] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-dp-2-y210-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [0.65] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-dp-2-y210-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [0.60] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-dp-2-yuyv-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [0.61] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-dp-2-yuyv-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [0.63] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-edp-1-nv12-horizontal:
    - Statuses : 2 pass(s)
    - Exec time: [1.38, 1.45] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-edp-1-nv12-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.38, 1.42] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-edp-1-p010-horizontal:
    - Statuses : 2 pass(s)
    - Exec time: [1.36, 1.44] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-edp-1-p010-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.36, 1.47] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-edp-1-rgb565-horizontal:
    - Statuses : 2 pass(s)
    - Exec time: [1.43, 1.55] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-edp-1-rgb565-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.46, 1.49] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-edp-1-xrgb16161616f-horizontal:
    - Statuses : 2 pass(s)
    - Exec time: [1.38, 1.50] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-edp-1-xrgb16161616f-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.34, 1.51] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-edp-1-xrgb2101010-horizontal:
    - Statuses : 2 pass(s)
    - Exec time: [1.44, 1.48] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-edp-1-xrgb2101010-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.35, 1.46] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-edp-1-xrgb8888-horizontal:
    - Statuses : 2 pass(s)
    - Exec time: [1.50, 1.51] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-edp-1-xrgb8888-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.45, 1.46] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-edp-1-xv30-horizontal:
    - Statuses : 2 pass(s)
    - Exec time: [1.37, 1.45] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-edp-1-xv30-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.38, 1.40] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-edp-1-xv36-horizontal:
    - Statuses : 2 pass(s)
    - Exec time: [1.36, 1.41] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-edp-1-xv36-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.37, 1.38] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-edp-1-xyuv8888-horizontal:
    - Statuses : 2 pass(s)
    - Exec time: [1.36, 1.51] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-edp-1-xyuv8888-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.37, 1.50] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-edp-1-y210-horizontal:
    - Statuses : 2 pass(s)
    - Exec time: [1.38, 1.40] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-edp-1-y210-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.37, 1.46] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-edp-1-yuyv-horizontal:
    - Statuses : 2 pass(s)
    - Exec time: [1.40, 1.51] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-edp-1-yuyv-vertical:
    - Statuses : 2 pass(s)
    - Exec time: [1.38, 1.51] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.05, 30.64] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-nv12-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [0.69] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-nv12-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [0.67] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-p010-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [0.67] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-p010-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [0.67] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-rgb565-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [0.75] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-rgb565-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [0.62] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-xrgb16161616f-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [0.75] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-xrgb16161616f-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [0.66] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-xrgb2101010-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [0.85] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-xrgb2101010-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [0.72] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-xrgb8888-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [0.70] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-xrgb8888-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [0.66] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-xv30-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [0.72] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-xv30-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [0.67] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-xv36-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [0.73] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-xv36-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [0.68] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-xyuv8888-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [0.72] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-xyuv8888-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [0.69] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-y210-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [0.68] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-y210-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [0.70] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-yuyv-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [0.71] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-yuyv-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [0.66] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-1-nv12-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-1-nv12-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-1-p010-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.37] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-1-p010-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-1-rgb565-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.49] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-1-rgb565-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.49] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-1-xrgb16161616f-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-1-xrgb16161616f-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.37] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-1-xrgb2101010-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.42] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-1-xrgb2101010-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.37] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-1-xrgb8888-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.45] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-1-xrgb8888-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.49] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-1-xv30-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-1-xv30-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.35] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-1-xv36-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.40] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-1-xv36-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-1-xyuv8888-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-1-xyuv8888-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.37] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-1-y210-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-1-y210-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-1-yuyv-horizontal:
    - Statuses : 1 pass(s)
    - Exec time: [1.37] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-1-yuyv-vertical:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-y-tiled:
    - Statuses : 2 skip(s)
    - Exec time: [0.05, 0.12] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-yf-tiled:
    - Statuses : 3 skip(s)
    - Exec time: [0.01, 0.12] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_15972_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-ptl:          [PASS][5] -> [ABORT][6] ([Intel XE#9394]) +1 other test abort
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9140/shard-ptl-8/igt@kms_async_flips@async-flip-suspend-resume.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-4/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-c-dp-1:
    - shard-bmg:          NOTRUN -> [ABORT][7] ([Intel XE#9399] / [Intel XE#9409]) +1 other test abort
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-bmg-7/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-dp-1.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-ptl:          NOTRUN -> [SKIP][8] ([Intel XE#5901]) +2 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-8/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#1407]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-3/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-ptl:          NOTRUN -> [SKIP][10] ([Intel XE#6925])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-ptl:          NOTRUN -> [SKIP][11] ([Intel XE#7085]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-4/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#7059] / [Intel XE#7085])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-bmg-7/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2327])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-bmg-5/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-addfb:
    - shard-ptl:          NOTRUN -> [SKIP][14] ([Intel XE#5850])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-3/igt@kms_big_fb@x-tiled-addfb.html

  * igt@kms_big_fb@x-tiled-addfb-size-offset-overflow:
    - shard-ptl:          NOTRUN -> [SKIP][15] ([Intel XE#5851])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-7/igt@kms_big_fb@x-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-ptl:          NOTRUN -> [SKIP][16] ([Intel XE#5808]) +14 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-7/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#1124]) +4 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-4/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#1124]) +4 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-bmg-5/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-2-displays-target-2160x1440p:
    - shard-ptl:          NOTRUN -> [SKIP][19] ([Intel XE#7679]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-7/igt@kms_bw@connected-linear-tiling-2-displays-target-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-target-3840x2160p:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#7679])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-7/igt@kms_bw@connected-linear-tiling-2-displays-target-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#7679])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-bmg-8/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#8365])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-3/igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-target-3840x2160p:
    - shard-bmg:          [PASS][23] -> [SKIP][24] ([Intel XE#367])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9140/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-3840x2160p.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-bmg-6/igt@kms_bw@linear-tiling-1-displays-target-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-target-1920x1080p:
    - shard-ptl:          NOTRUN -> [SKIP][25] ([Intel XE#367])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-4/igt@kms_bw@linear-tiling-2-displays-target-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-target-2560x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#367])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-8/igt@kms_bw@linear-tiling-2-displays-target-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#367]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-bmg-2/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#2887]) +6 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-1/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#2669] / [Intel XE#7389]) +3 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-5/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2887]) +7 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-bmg-3/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:
    - shard-ptl:          NOTRUN -> [SKIP][31] ([Intel XE#5822]) +12 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][32] ([Intel XE#7084] / [Intel XE#8150])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-dp-1:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2652]) +3 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-dp-1.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#3432])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#306] / [Intel XE#7358])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-7/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-ptl:          NOTRUN -> [SKIP][36] ([Intel XE#5824]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-6/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_color@degamma:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2325] / [Intel XE#7358])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-bmg-6/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#7358])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-bmg-6/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d:
    - shard-ptl:          NOTRUN -> [SKIP][39] ([Intel XE#8391]) +5 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-2/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#7358]) +2 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-5/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2252]) +2 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-bmg-4/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html

  * igt@kms_chamelium_hpd@dp-hpd-fast:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#373]) +3 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-3/igt@kms_chamelium_hpd@dp-hpd-fast.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-ptl:          NOTRUN -> [SKIP][43] ([Intel XE#2252]) +5 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-7/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_color_pipeline@plane-ctm3x4@pipe-a-plane-3:
    - shard-ptl:          NOTRUN -> [SKIP][44] ([Intel XE#6969]) +15 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-8/igt@kms_color_pipeline@plane-ctm3x4@pipe-a-plane-3.html
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#6969]) +5 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-1/igt@kms_color_pipeline@plane-ctm3x4@pipe-a-plane-3.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-ptl:          NOTRUN -> [SKIP][46] ([Intel XE#5832] / [Intel XE#6974])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-6/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@dp-mst-type-1-suspend-resume:
    - shard-ptl:          NOTRUN -> [SKIP][47] ([Intel XE#6974])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-5/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#6974])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-bmg-4/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html

  * igt@kms_content_protection@lic-type-0:
    - shard-ptl:          NOTRUN -> [SKIP][49] ([Intel XE#7642])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-4/igt@kms_content_protection@lic-type-0.html
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#7642]) +2 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-4/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-1:
    - shard-bmg:          NOTRUN -> [FAIL][51] ([Intel XE#3304] / [Intel XE#7374])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-bmg-7/igt@kms_content_protection@lic-type-0@pipe-a-dp-1.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2320])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-offscreen-64x21:
    - shard-ptl:          NOTRUN -> [SKIP][53] ([Intel XE#5900]) +3 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-2/igt@kms_cursor_crc@cursor-offscreen-64x21.html

  * igt@kms_cursor_crc@cursor-random-64x21:
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#1424])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-7/igt@kms_cursor_crc@cursor-random-64x21.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-ptl:          NOTRUN -> [SKIP][55] ([Intel XE#5846])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-4/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#2321] / [Intel XE#7355]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-1/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-ptl:          NOTRUN -> [SKIP][57] ([Intel XE#5962]) +2 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-2/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#309] / [Intel XE#7343])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-ptl:          NOTRUN -> [SKIP][59] ([Intel XE#5962] / [Intel XE#7343])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-4/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-ptl:          NOTRUN -> [SKIP][60] ([Intel XE#6035])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dp_link_training@non-uhbr-mst-direct-train:
    - shard-ptl:          NOTRUN -> [SKIP][61] ([Intel XE#9532])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-8/igt@kms_dp_link_training@non-uhbr-mst-direct-train.html
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#9532])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-bmg-1/igt@kms_dp_link_training@non-uhbr-mst-direct-train.html

  * igt@kms_dp_link_training@non-uhbr-sst-direct-train:
    - shard-ptl:          NOTRUN -> [SKIP][63] ([Intel XE#9534])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-2/igt@kms_dp_link_training@non-uhbr-sst-direct-train.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#9533])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-bmg-5/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:
    - shard-ptl:          NOTRUN -> [SKIP][65] ([Intel XE#9009])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-6/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#9009])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-8/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-ptl:          NOTRUN -> [SKIP][67] ([Intel XE#5907]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-2/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#8265]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-8/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-ptl:          [PASS][69] -> [ABORT][70] ([Intel XE#9362]) +2 other tests abort
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9140/shard-ptl-6/igt@kms_fbcon_fbt@fbc-suspend.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-3/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-ptl:          NOTRUN -> [SKIP][71] ([Intel XE#2375])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-1/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@dsc:
    - shard-ptl:          NOTRUN -> [SKIP][72] ([Intel XE#9287])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-5/igt@kms_feature_discovery@dsc.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#1421]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-2/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-ptl:          NOTRUN -> [SKIP][74] ([Intel XE#2316]) +7 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-6/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          NOTRUN -> [FAIL][75] ([Intel XE#301]) +1 other test fail
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible:
    - shard-bmg:          [PASS][76] -> [FAIL][77] ([Intel XE#5408] / [Intel XE#6266]) +1 other test fail
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9140/shard-bmg-9/igt@kms_flip@wf_vblank-ts-check-interruptible.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-bmg-3/igt@kms_flip@wf_vblank-ts-check-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x:
    - shard-ptl:          NOTRUN -> [SKIP][78] ([Intel XE#7179])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-2/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x.html
    - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#7179])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-ptl:          NOTRUN -> [SKIP][80] ([Intel XE#7178]) +2 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#1397] / [Intel XE#1745] / [Intel XE#7385] / [Intel XE#9144])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#1397] / [Intel XE#7385] / [Intel XE#9144])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render:
    - shard-ptl:          NOTRUN -> [SKIP][83] ([Intel XE#5800] / [Intel XE#6312]) +11 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-7/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#2311]) +20 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-indfb-msflip-blt:
    - shard-ptl:          NOTRUN -> [SKIP][85] ([Intel XE#6312]) +14 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-1/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#7905]) +23 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-3/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#4141]) +2 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#6312] / [Intel XE#651]) +5 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-ptl:          NOTRUN -> [SKIP][89] ([Intel XE#5865] / [Intel XE#7399])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-1/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#2352] / [Intel XE#7399])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#6312]) +5 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#7399]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#656] / [Intel XE#7905]) +17 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-ptl:          NOTRUN -> [SKIP][94] ([Intel XE#5812]) +79 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-blt:
    - shard-ptl:          NOTRUN -> [SKIP][95] ([Intel XE#7061] / [Intel XE#7356]) +3 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-6/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#7865]) +12 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-blt:
    - shard-ptl:          NOTRUN -> [SKIP][97] ([Intel XE#7865]) +19 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#2313]) +22 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#7061] / [Intel XE#7356]) +3 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#7061]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-bmg-7/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-mmap-wc.html
    - shard-ptl:          NOTRUN -> [SKIP][101] ([Intel XE#7061])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-4/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-mmap-wc.html

  * igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery:
    - shard-ptl:          NOTRUN -> [SKIP][102] ([Intel XE#9312])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-7/igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-ptl:          NOTRUN -> [SKIP][103] ([Intel XE#7308])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-5/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#6911] / [Intel XE#7466])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-bmg-4/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-ptl:          NOTRUN -> [SKIP][105] ([Intel XE#6900]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-2/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-a-plane-5:
    - shard-ptl:          NOTRUN -> [SKIP][106] ([Intel XE#8303]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-3/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-a-plane-5.html

  * igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping:
    - shard-ptl:          NOTRUN -> [SKIP][107] ([Intel XE#7283]) +3 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-7/igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#7283]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-bmg-3/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:
    - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#7283]) +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-6/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html

  * igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][110] ([Intel XE#5844]) +4 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-7/igt@kms_plane_lowres@tiling-none@pipe-b-edp-1.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-ptl:          NOTRUN -> [SKIP][111] ([Intel XE#4596] / [Intel XE#5854])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-6/igt@kms_plane_multiple@2x-tiling-x.html
    - shard-lnl:          NOTRUN -> [SKIP][112] ([Intel XE#4596] / [Intel XE#5854])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-7/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-ptl:          NOTRUN -> [SKIP][113] ([Intel XE#5020])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-5/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5:
    - shard-lnl:          NOTRUN -> [SKIP][114] ([Intel XE#2763] / [Intel XE#6886]) +3 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-1/igt@kms_plane_scaling@planes-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b:
    - shard-ptl:          NOTRUN -> [SKIP][115] ([Intel XE#6886]) +14 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-2/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][116] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-bmg-5/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#2499])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-bmg-2/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-ptl:          NOTRUN -> [SKIP][118] ([Intel XE#5849])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-6/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@package-g7:
    - shard-ptl:          NOTRUN -> [SKIP][119] ([Intel XE#6813])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-8/igt@kms_pm_rpm@package-g7.html
    - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#6814] / [Intel XE#7428])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-bmg-1/igt@kms_pm_rpm@package-g7.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
    - shard-ptl:          NOTRUN -> [SKIP][121] ([Intel XE#7304]) +2 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-1/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-b-edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][122] ([Intel XE#5858] / [Intel XE#7304]) +3 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][123] ([Intel XE#5858]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][125] ([Intel XE#4608])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#4608] / [Intel XE#7304])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#2893] / [Intel XE#7304]) +1 other test skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-2/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][128] ([Intel XE#1489]) +2 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-bmg-3/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-bmg:          NOTRUN -> [SKIP][129] ([Intel XE#2387] / [Intel XE#7429])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-bmg-6/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-lnl:          NOTRUN -> [SKIP][130] ([Intel XE#1128] / [Intel XE#7413])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-2/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-primary-blt:
    - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-bmg-4/igt@kms_psr@fbc-pr-primary-blt.html

  * igt@kms_psr@fbc-psr2-primary-render@edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][132] ([Intel XE#1406] / [Intel XE#5835]) +1 other test skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-2/igt@kms_psr@fbc-psr2-primary-render@edp-1.html

  * igt@kms_psr@fbc-psr2-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][133] ([Intel XE#1406] / [Intel XE#7345])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-4/igt@kms_psr@fbc-psr2-suspend.html

  * igt@kms_psr@fbc-psr2-suspend@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][134] ([Intel XE#1406] / [Intel XE#4609] / [Intel XE#7345])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-4/igt@kms_psr@fbc-psr2-suspend@edp-1.html

  * igt@kms_psr@pr-cursor-plane-move:
    - shard-ptl:          NOTRUN -> [SKIP][135] ([Intel XE#1406]) +3 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-6/igt@kms_psr@pr-cursor-plane-move.html

  * igt@kms_psr@pr-primary-blt:
    - shard-lnl:          NOTRUN -> [SKIP][136] ([Intel XE#1406]) +1 other test skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-7/igt@kms_psr@pr-primary-blt.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-lnl:          NOTRUN -> [SKIP][137] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-2/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-ptl:          NOTRUN -> [SKIP][138] ([Intel XE#5821])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-8/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-bmg:          NOTRUN -> [SKIP][139] ([Intel XE#3904] / [Intel XE#7342]) +1 other test skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-bmg-1/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-x-tiled-reflect-x-0:
    - shard-ptl:          NOTRUN -> [SKIP][140] ([Intel XE#5813]) +2 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-8/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-lnl:          NOTRUN -> [SKIP][141] ([Intel XE#1127] / [Intel XE#5813])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][142] ([Intel XE#1435] / [Intel XE#8695])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-bmg-8/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-ptl:          NOTRUN -> [SKIP][143] ([Intel XE#5910])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-8/igt@kms_setmode@clone-exclusive-crtc.html
    - shard-lnl:          NOTRUN -> [SKIP][144] ([Intel XE#1435] / [Intel XE#9142])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-4/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:
    - shard-bmg:          NOTRUN -> [SKIP][145] ([Intel XE#6503])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-bmg-6/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html

  * igt@kms_vrr@negative-basic:
    - shard-lnl:          NOTRUN -> [SKIP][146] ([Intel XE#1499] / [Intel XE#9271])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-5/igt@kms_vrr@negative-basic.html

  * igt@xe_compute_preempt@compute-preempt-many-vram:
    - shard-ptl:          NOTRUN -> [SKIP][147] ([Intel XE#5191])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-3/igt@xe_compute_preempt@compute-preempt-many-vram.html

  * igt@xe_configfs@survivability-mode:
    - shard-lnl:          NOTRUN -> [SKIP][148] ([Intel XE#8428])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-6/igt@xe_configfs@survivability-mode.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-ptl:          NOTRUN -> [SKIP][149] ([Intel XE#5878])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-3/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_evict@evict-beng-mixed-threads-large-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][150] ([Intel XE#6540] / [Intel XE#688]) +4 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-6/igt@xe_evict@evict-beng-mixed-threads-large-multi-vm.html

  * igt@xe_evict@evict-cm-threads-small-multi-vm:
    - shard-ptl:          NOTRUN -> [SKIP][151] ([Intel XE#5764]) +11 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-1/igt@xe_evict@evict-cm-threads-small-multi-vm.html

  * igt@xe_evict@evict-small-multi-queue-priority-cm:
    - shard-bmg:          NOTRUN -> [SKIP][152] ([Intel XE#8370])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-bmg-4/igt@xe_evict@evict-small-multi-queue-priority-cm.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
    - shard-ptl:          NOTRUN -> [SKIP][153] ([Intel XE#6144]) +1 other test skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-8/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html

  * igt@xe_exec_balancer@many-cm-virtual-userptr:
    - shard-ptl:          NOTRUN -> [SKIP][154] ([Intel XE#7482]) +16 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-2/igt@xe_exec_balancer@many-cm-virtual-userptr.html

  * igt@xe_exec_balancer@twice-virtual-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][155] ([Intel XE#7482]) +9 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-6/igt@xe_exec_balancer@twice-virtual-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:
    - shard-ptl:          NOTRUN -> [SKIP][156] ([Intel XE#5575] / [Intel XE#7484]) +9 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][157] ([Intel XE#1392]) +2 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-3/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][158] ([Intel XE#2322] / [Intel XE#7372]) +1 other test skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][159] ([Intel XE#8374]) +5 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-5/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind-prefetch.html

  * igt@xe_exec_fault_mode@many-multi-queue-imm:
    - shard-bmg:          NOTRUN -> [SKIP][160] ([Intel XE#8374]) +5 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-bmg-5/igt@xe_exec_fault_mode@many-multi-queue-imm.html

  * igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind:
    - shard-ptl:          NOTRUN -> [SKIP][161] ([Intel XE#8374]) +10 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-7/igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind.html

  * igt@xe_exec_multi_queue@many-execs-preempt-mode-close-fd:
    - shard-bmg:          NOTRUN -> [SKIP][162] ([Intel XE#8364]) +13 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-bmg-2/igt@xe_exec_multi_queue@many-execs-preempt-mode-close-fd.html

  * igt@xe_exec_multi_queue@one-queue-basic:
    - shard-ptl:          NOTRUN -> [SKIP][163] ([Intel XE#8364]) +34 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-4/igt@xe_exec_multi_queue@one-queue-basic.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][164] ([Intel XE#8364]) +16 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-4/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr-invalidate.html

  * igt@xe_exec_reset@cm-multi-queue-gt-reset:
    - shard-ptl:          NOTRUN -> [SKIP][165] ([Intel XE#8369]) +2 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-1/igt@xe_exec_reset@cm-multi-queue-gt-reset.html

  * igt@xe_exec_reset@multi-queue-long-spin-many-queue-switch:
    - shard-bmg:          NOTRUN -> [SKIP][166] ([Intel XE#8369])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-bmg-3/igt@xe_exec_reset@multi-queue-long-spin-many-queue-switch.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-multi-vma:
    - shard-ptl:          NOTRUN -> [SKIP][167] ([Intel XE#6196])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-multi-vma.html
    - shard-lnl:          NOTRUN -> [SKIP][168] ([Intel XE#6196])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-7/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-multi-vma.html

  * igt@xe_exec_threads@threads-multi-queue-fd-basic:
    - shard-bmg:          NOTRUN -> [SKIP][169] ([Intel XE#8378])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-fd-basic.html

  * igt@xe_exec_threads@threads-multi-queue-hang-fd-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [SKIP][170] ([Intel XE#8378]) +1 other test skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-2/igt@xe_exec_threads@threads-multi-queue-hang-fd-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-multi-queue-userptr-rebind:
    - shard-ptl:          NOTRUN -> [SKIP][171] ([Intel XE#8378]) +7 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-4/igt@xe_exec_threads@threads-multi-queue-userptr-rebind.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:
    - shard-bmg:          [PASS][172] -> [ABORT][173] ([Intel XE#9463])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9140/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-bmg:          [PASS][174] -> [ABORT][175] ([Intel XE#6652] / [Intel XE#9470])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9140/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-bmg-4/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_madvise@atomic-cpu:
    - shard-ptl:          NOTRUN -> [SKIP][176] ([Intel XE#7980])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-8/igt@xe_madvise@atomic-cpu.html

  * igt@xe_mempage_offline@inject-single-page:
    - shard-lnl:          NOTRUN -> [SKIP][177] ([Intel XE#9203])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-3/igt@xe_mempage_offline@inject-single-page.html

  * igt@xe_mmap@pci-membarrier-bad-pagesize:
    - shard-ptl:          NOTRUN -> [SKIP][178] ([Intel XE#5100] / [Intel XE#7408])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-5/igt@xe_mmap@pci-membarrier-bad-pagesize.html
    - shard-lnl:          NOTRUN -> [SKIP][179] ([Intel XE#5100] / [Intel XE#7322] / [Intel XE#7408])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-3/igt@xe_mmap@pci-membarrier-bad-pagesize.html

  * igt@xe_mmap@small-bar:
    - shard-ptl:          NOTRUN -> [SKIP][180] ([Intel XE#5867])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-3/igt@xe_mmap@small-bar.html

  * igt@xe_module_load@load:
    - shard-ptl:          ([PASS][181], [PASS][182], [PASS][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205]) -> ([PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210], [PASS][211], [PASS][212], [PASS][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217], [PASS][218], [PASS][219], [PASS][220], [PASS][221], [SKIP][222], [PASS][223], [PASS][224], [PASS][225], [PASS][226], [PASS][227], [PASS][228], [PASS][229], [PASS][230], [PASS][231]) ([Intel XE#9286])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9140/shard-ptl-1/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9140/shard-ptl-4/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9140/shard-ptl-7/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9140/shard-ptl-7/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9140/shard-ptl-1/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9140/shard-ptl-4/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9140/shard-ptl-4/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9140/shard-ptl-5/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9140/shard-ptl-8/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9140/shard-ptl-1/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9140/shard-ptl-8/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9140/shard-ptl-6/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9140/shard-ptl-6/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9140/shard-ptl-6/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9140/shard-ptl-2/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9140/shard-ptl-7/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9140/shard-ptl-7/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9140/shard-ptl-2/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9140/shard-ptl-3/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9140/shard-ptl-3/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9140/shard-ptl-3/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9140/shard-ptl-5/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9140/shard-ptl-8/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9140/shard-ptl-8/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9140/shard-ptl-5/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-8/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-6/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-6/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-8/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-5/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-6/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-3/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-3/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-3/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-8/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-5/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-5/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-7/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-1/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-1/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-1/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-1/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-4/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-4/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-4/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-7/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-7/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-2/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-2/igt@xe_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-2/igt@xe_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-2/igt@xe_module_load@load.html

  * igt@xe_multigpu_svm@mgpu-pagefault-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][232] ([Intel XE#6964]) +1 other test skip
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-3/igt@xe_multigpu_svm@mgpu-pagefault-prefetch.html

  * igt@xe_multigpu_svm@mgpu-xgpu-access-basic:
    - shard-ptl:          NOTRUN -> [SKIP][233] ([Intel XE#6964]) +2 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-6/igt@xe_multigpu_svm@mgpu-xgpu-access-basic.html

  * igt@xe_page_reclaim@basic-mixed:
    - shard-lnl:          NOTRUN -> [SKIP][234] ([Intel XE#7793])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-3/igt@xe_page_reclaim@basic-mixed.html

  * igt@xe_page_reclaim@binds-large-split:
    - shard-ptl:          NOTRUN -> [SKIP][235] ([Intel XE#7793]) +3 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-4/igt@xe_page_reclaim@binds-large-split.html

  * igt@xe_page_reclaim@pde-vs-pd:
    - shard-bmg:          NOTRUN -> [SKIP][236] ([Intel XE#7793]) +1 other test skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-bmg-9/igt@xe_page_reclaim@pde-vs-pd.html

  * igt@xe_pat@pat-index-xelp:
    - shard-lnl:          NOTRUN -> [SKIP][237] ([Intel XE#7590] / [Intel XE#977])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-1/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-sw-hw-reset-compare:
    - shard-ptl:          NOTRUN -> [FAIL][238] ([Intel XE#7695])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-1/igt@xe_pat@pat-sw-hw-reset-compare.html

  * igt@xe_pat@pat-sw-hw-suspend:
    - shard-lnl:          NOTRUN -> [FAIL][239] ([Intel XE#7695])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-2/igt@xe_pat@pat-sw-hw-suspend.html

  * igt@xe_pat@xa-app-transient-media-on:
    - shard-bmg:          NOTRUN -> [SKIP][240] ([Intel XE#7590])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-bmg-2/igt@xe_pat@xa-app-transient-media-on.html
    - shard-ptl:          NOTRUN -> [SKIP][241] ([Intel XE#7590])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-1/igt@xe_pat@xa-app-transient-media-on.html

  * igt@xe_pm@d3cold-basic:
    - shard-bmg:          NOTRUN -> [SKIP][242] ([Intel XE#2284] / [Intel XE#7370])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-bmg-9/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@d3cold-i2c:
    - shard-lnl:          NOTRUN -> [SKIP][243] ([Intel XE#5694] / [Intel XE#7370])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-2/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-ptl:          NOTRUN -> [SKIP][244] ([Intel XE#6867])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-2/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [PASS][245] -> [ABORT][246] ([Intel XE#9362]) +3 other tests abort
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9140/shard-lnl-3/igt@xe_pm@s4-basic.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-7/igt@xe_pm@s4-basic.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-ptl:          NOTRUN -> [SKIP][247] ([Intel XE#5611] / [Intel XE#7456])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-3/igt@xe_pm@vram-d3cold-threshold.html
    - shard-lnl:          NOTRUN -> [SKIP][248] ([Intel XE#579] / [Intel XE#7329] / [Intel XE#7456])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-8/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pmu@all-fn-engine-activity-load:
    - shard-lnl:          NOTRUN -> [SKIP][249] ([Intel XE#4650] / [Intel XE#7347])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-8/igt@xe_pmu@all-fn-engine-activity-load.html

  * igt@xe_prefetch_fault@l2-prefetch-fault-svm:
    - shard-bmg:          NOTRUN -> [SKIP][250] ([Intel XE#8815])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-bmg-1/igt@xe_prefetch_fault@l2-prefetch-fault-svm.html

  * igt@xe_pxp@pxp-stale-queue-post-termination-irq:
    - shard-bmg:          NOTRUN -> [SKIP][251] ([Intel XE#4733] / [Intel XE#7417]) +1 other test skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-bmg-2/igt@xe_pxp@pxp-stale-queue-post-termination-irq.html

  * igt@xe_pxp@pxp-termination-key-update-post-suspend:
    - shard-ptl:          NOTRUN -> [ABORT][252] ([Intel XE#9362]) +3 other tests abort
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-5/igt@xe_pxp@pxp-termination-key-update-post-suspend.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-ptl:          NOTRUN -> [SKIP][253] ([Intel XE#6019]) +1 other test skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-3/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-lnl:          NOTRUN -> [SKIP][254] ([Intel XE#4130] / [Intel XE#7366]) +1 other test skip
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-4/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  * igt@xe_sriov_vram@vf-access-provisioned:
    - shard-ptl:          NOTRUN -> [SKIP][255] ([Intel XE#6376] / [Intel XE#7422])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-3/igt@xe_sriov_vram@vf-access-provisioned.html

  * igt@xe_sync_file@sync_file_race:
    - shard-ptl:          NOTRUN -> [FAIL][256] ([Intel XE#9457])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-1/igt@xe_sync_file@sync_file_race.html

  * igt@xe_vm@bind-array-enobufs:
    - shard-ptl:          NOTRUN -> [FAIL][257] ([Intel XE#9424])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-6/igt@xe_vm@bind-array-enobufs.html

  * igt@xe_vm@overcommit-nonfault-vram-lr-external-nodefer:
    - shard-lnl:          NOTRUN -> [SKIP][258] ([Intel XE#7892])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-7/igt@xe_vm@overcommit-nonfault-vram-lr-external-nodefer.html

  
#### Possible fixes ####

  * igt@kms_flip@wf_vblank-ts-check@a-edp1:
    - shard-lnl:          [FAIL][259] ([Intel XE#5408] / [Intel XE#6266]) -> [PASS][260] +1 other test pass
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9140/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-8/igt@kms_flip@wf_vblank-ts-check@a-edp1.html

  * igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane-0:
    - shard-ptl:          [FAIL][261] ([Intel XE#9340]) -> [PASS][262] +1 other test pass
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9140/shard-ptl-5/igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane-0.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-2/igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane-0.html

  * igt@kms_sharpness_filter@filter-suspend:
    - shard-ptl:          [ABORT][263] ([Intel XE#9375]) -> [PASS][264] +1 other test pass
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9140/shard-ptl-1/igt@kms_sharpness_filter@filter-suspend.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-7/igt@kms_sharpness_filter@filter-suspend.html

  * igt@kms_vrr@flip-basic:
    - shard-ptl:          [FAIL][265] ([Intel XE#4227] / [Intel XE#7397]) -> [PASS][266] +1 other test pass
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9140/shard-ptl-3/igt@kms_vrr@flip-basic.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-5/igt@kms_vrr@flip-basic.html

  * igt@xe_exec_threads@threads-hang-userptr-invalidate-race:
    - shard-lnl:          [FAIL][267] ([Intel XE#9096]) -> [PASS][268]
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9140/shard-lnl-8/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-6/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-lnl:          [ABORT][269] ([Intel XE#6652]) -> [PASS][270]
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9140/shard-lnl-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-8/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_pm@d3hot-mmap-system:
    - shard-ptl:          [FAIL][271] -> [PASS][272]
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9140/shard-ptl-6/igt@xe_pm@d3hot-mmap-system.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-7/igt@xe_pm@d3hot-mmap-system.html

  * igt@xe_pm@s2idle-vm-bind-prefetch:
    - shard-ptl:          [ABORT][273] ([Intel XE#9362]) -> [PASS][274]
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9140/shard-ptl-5/igt@xe_pm@s2idle-vm-bind-prefetch.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-6/igt@xe_pm@s2idle-vm-bind-prefetch.html

  
#### Warnings ####

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-lnl:          [SKIP][275] ([Intel XE#309] / [Intel XE#7343]) -> [SKIP][276] ([Intel XE#309] / [Intel XE#7343] / [Intel XE#7935])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9140/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][277] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][278] ([Intel XE#3544])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9140/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-bmg-9/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][279] ([Intel XE#1729] / [Intel XE#7424]) -> [SKIP][280] ([Intel XE#2426] / [Intel XE#5848])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9140/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][281] ([Intel XE#2509] / [Intel XE#7437]) -> [SKIP][282] ([Intel XE#2426] / [Intel XE#5848])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9140/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
  [Intel XE#5191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5191
  [Intel XE#5408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5611]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5611
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#5800]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800
  [Intel XE#5808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808
  [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#5821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5821
  [Intel XE#5822]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822
  [Intel XE#5824]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5824
  [Intel XE#5832]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5832
  [Intel XE#5835]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5835
  [Intel XE#5844]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5844
  [Intel XE#5846]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5846
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5849
  [Intel XE#5850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5850
  [Intel XE#5851]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5851
  [Intel XE#5854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854
  [Intel XE#5858]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858
  [Intel XE#5865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5865
  [Intel XE#5867]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5867
  [Intel XE#5878]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5878
  [Intel XE#5900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900
  [Intel XE#5901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5901
  [Intel XE#5907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907
  [Intel XE#5910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5910
  [Intel XE#5962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962
  [Intel XE#6019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6019
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#6144]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6144
  [Intel XE#6196]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6196
  [Intel XE#6266]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
  [Intel XE#6813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6813
  [Intel XE#6814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6814
  [Intel XE#6867]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6867
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6925
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308
  [Intel XE#7322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7322
  [Intel XE#7329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7329
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345
  [Intel XE#7347]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7347
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7366
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385
  [Intel XE#7389]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7408
  [Intel XE#7413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7422
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7428
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7456]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7456
  [Intel XE#7466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7892]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7892
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935
  [Intel XE#7980]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7980
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8303]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8391
  [Intel XE#8428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8428
  [Intel XE#8695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8695
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#8815]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8815
  [Intel XE#9009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9009
  [Intel XE#9096]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096
  [Intel XE#9142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9142
  [Intel XE#9144]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144
  [Intel XE#9203]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9203
  [Intel XE#9271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271
  [Intel XE#9286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9286
  [Intel XE#9287]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9287
  [Intel XE#9312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9312
  [Intel XE#9340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9340
  [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
  [Intel XE#9375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9375
  [Intel XE#9394]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9394
  [Intel XE#9399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9399
  [Intel XE#9409]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9409
  [Intel XE#9424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9424
  [Intel XE#9457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9457
  [Intel XE#9463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463
  [Intel XE#9470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9470
  [Intel XE#9532]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9532
  [Intel XE#9533]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9533
  [Intel XE#9534]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9534
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977


Build changes
-------------

  * IGT: IGT_9140 -> IGTPW_15972
  * Linux: xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1 -> xe-5934-dcbee9cfcd4097656a88dbaf196fbc5403764a58

  IGTPW_15972: 80a8a47f8c2349c00d8b7deb47e7df1e53fcb035 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9140: 3b0daa274edb520204660fa1e15424b66ce0aea0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1: 20282d4c78403c9eda071ebdd0c3d6fb287f64a1
  xe-5934-dcbee9cfcd4097656a88dbaf196fbc5403764a58: dcbee9cfcd4097656a88dbaf196fbc5403764a58

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/index.html

--===============6147768753065281742==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/5] lib/igt_fb:=
 add igt_format_get_subsampling() function</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/175949/">https://patchwork.freedesktop.org/series/175949/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_15972/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_15972/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9140_FULL -&gt; XEIGTPW_15972_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_15972_FULL absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_15972_FULL, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_15=
972_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled (NEW):</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-bmg-7/igt@kms_plane_scaling@plane-upscale-=
max-crc-4-tiled.html">FAIL</a> +8 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled (NEW):</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-4/igt@kms_plane_scaling@plane-upscale-=
max-crc-x-tiled.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-y-tiled (NEW):</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-bmg-5/igt@kms_plane_scaling@plane-upscale-=
max-crc-y-tiled.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-yf-tiled (NEW):</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-lnl-4/igt@kms_plane_scaling@plane-upscale-=
max-crc-yf-tiled.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_9140_FULL and XEIGTPW_15972=
_FULL:</p>
<h3>New IGT tests (252)</h3>
<ul>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [22.88, 30.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-nv12-h=
orizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-nv12-v=
ertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-p010-h=
orizontal:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-p010-v=
ertical:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-rgb565=
-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-rgb565=
-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-xrgb16=
161616f-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-xrgb16=
161616f-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-xrgb21=
01010-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-xrgb21=
01010-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-xrgb88=
88-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-xrgb88=
88-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-xv30-h=
orizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-xv30-v=
ertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-xv36-h=
orizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-xv36-v=
ertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-xyuv88=
88-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-xyuv88=
88-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-y210-h=
orizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-y210-v=
ertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-yuyv-h=
orizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-yuyv-v=
ertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-nv12-=
horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-nv12-=
vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-p010-=
horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-p010-=
vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-rgb56=
5-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-rgb56=
5-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-xrgb1=
6161616f-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-xrgb1=
6161616f-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-xrgb2=
101010-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-xrgb2=
101010-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-xrgb8=
888-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-xrgb8=
888-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-xv30-=
horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-xv30-=
vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-xv36-=
horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-xv36-=
vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-xyuv8=
888-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-xyuv8=
888-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-y210-=
horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-y210-=
vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-yuyv-=
horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-yuyv-=
vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [20.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-2-nv12-ho=
rizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-2-nv12-ve=
rtical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-2-p010-ho=
rizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-2-p010-ve=
rtical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-2-rgb565-=
horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-2-rgb565-=
vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-2-xrgb161=
61616f-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-2-xrgb161=
61616f-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-2-xrgb210=
1010-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-2-xrgb210=
1010-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-2-xrgb888=
8-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-2-xrgb888=
8-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-2-xv30-ho=
rizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-2-xv30-ve=
rtical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-2-xv36-ho=
rizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-2-xv36-ve=
rtical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-2-xyuv888=
8-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-2-xyuv888=
8-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-2-y210-ho=
rizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-2-y210-ve=
rtical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-2-yuyv-ho=
rizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-2-yuyv-ve=
rtical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.04, 30.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-1-nv12-h=
orizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-1-nv12-v=
ertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-1-p010-h=
orizontal:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-1-p010-v=
ertical:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-1-rgb565=
-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-1-rgb565=
-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-1-xrgb16=
161616f-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-1-xrgb16=
161616f-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-1-xrgb21=
01010-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-1-xrgb21=
01010-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-1-xrgb88=
88-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-1-xrgb88=
88-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-1-xv30-h=
orizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-1-xv30-v=
ertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-1-xv36-h=
orizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-1-xv36-v=
ertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-1-xyuv88=
88-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-1-xyuv88=
88-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-1-y210-h=
orizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-1-y210-v=
ertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-1-yuyv-h=
orizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-1-yuyv-v=
ertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-nv12-=
horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-nv12-=
vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-p010-=
horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-p010-=
vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-rgb56=
5-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-rgb56=
5-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-xrgb1=
6161616f-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-xrgb1=
6161616f-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-xrgb2=
101010-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-xrgb2=
101010-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-xrgb8=
888-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-xrgb8=
888-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-xv30-=
horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-xv30-=
vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-xv36-=
horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-xv36-=
vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-xyuv8=
888-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-xyuv8=
888-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-y210-=
horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-y210-=
vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-yuyv-=
horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-yuyv-=
vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.02, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-yf-tiled:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.02, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled:</p>
<ul>
<li>Statuses : 1 fail(s) 2 pass(s)</li>
<li>Exec time: [18.20, 31.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-dp-1-nv12-hor=
izontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-dp-1-nv12-ver=
tical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-dp-1-p010-hor=
izontal:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-dp-1-p010-ver=
tical:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-dp-1-rgb565-h=
orizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-dp-1-rgb565-v=
ertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-dp-1-xrgb1616=
1616f-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-dp-1-xrgb1616=
1616f-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-dp-1-xrgb2101=
010-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-dp-1-xrgb2101=
010-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-dp-1-xrgb8888=
-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-dp-1-xrgb8888=
-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-dp-1-xv30-hor=
izontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-dp-1-xv30-ver=
tical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-dp-1-xv36-hor=
izontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-dp-1-xv36-ver=
tical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-dp-1-xyuv8888=
-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-dp-1-xyuv8888=
-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-dp-1-y210-hor=
izontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-dp-1-y210-ver=
tical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-dp-1-yuyv-hor=
izontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-dp-1-yuyv-ver=
tical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-edp-1-nv12-ho=
rizontal:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.37, 1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-edp-1-nv12-ve=
rtical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.37, 1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-edp-1-p010-ho=
rizontal:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.35, 1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-edp-1-p010-ve=
rtical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.35, 1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-edp-1-rgb565-=
horizontal:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.46, 1.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-edp-1-rgb565-=
vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.49, 1.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-edp-1-xrgb161=
61616f-horizontal:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.37, 1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-edp-1-xrgb161=
61616f-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.36, 1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-edp-1-xrgb210=
1010-horizontal:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.41, 1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-edp-1-xrgb210=
1010-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.36, 1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-edp-1-xrgb888=
8-horizontal:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.46, 1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-edp-1-xrgb888=
8-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.48, 1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-edp-1-xv30-ho=
rizontal:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.38, 1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-edp-1-xv30-ve=
rtical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.36, 1.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-edp-1-xv36-ho=
rizontal:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.36, 1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-edp-1-xv36-ve=
rtical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-edp-1-xyuv888=
8-horizontal:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.36, 1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-edp-1-xyuv888=
8-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.38, 1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-edp-1-y210-ho=
rizontal:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.40, 1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-edp-1-y210-ve=
rtical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.36, 1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-edp-1-yuyv-ho=
rizontal:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.37, 1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-edp-1-yuyv-ve=
rtical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.37, 1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [14.61, 32.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-dp-2-nv12-hori=
zontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-dp-2-nv12-vert=
ical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-dp-2-p010-hori=
zontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-dp-2-p010-vert=
ical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-dp-2-rgb565-ho=
rizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-dp-2-rgb565-ve=
rtical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-dp-2-xrgb16161=
616f-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-dp-2-xrgb16161=
616f-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-dp-2-xrgb21010=
10-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-dp-2-xrgb21010=
10-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-dp-2-xrgb8888-=
horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-dp-2-xrgb8888-=
vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-dp-2-xv30-hori=
zontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-dp-2-xv30-vert=
ical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-dp-2-xv36-hori=
zontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-dp-2-xv36-vert=
ical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-dp-2-xyuv8888-=
horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-dp-2-xyuv8888-=
vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-dp-2-y210-hori=
zontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-dp-2-y210-vert=
ical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-dp-2-yuyv-hori=
zontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-dp-2-yuyv-vert=
ical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-edp-1-nv12-hor=
izontal:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.38, 1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-edp-1-nv12-ver=
tical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.38, 1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-edp-1-p010-hor=
izontal:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.36, 1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-edp-1-p010-ver=
tical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.36, 1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-edp-1-rgb565-h=
orizontal:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.43, 1.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-edp-1-rgb565-v=
ertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.46, 1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-edp-1-xrgb1616=
1616f-horizontal:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.38, 1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-edp-1-xrgb1616=
1616f-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.34, 1.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-edp-1-xrgb2101=
010-horizontal:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.44, 1.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-edp-1-xrgb2101=
010-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.35, 1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-edp-1-xrgb8888=
-horizontal:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.50, 1.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-edp-1-xrgb8888=
-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.45, 1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-edp-1-xv30-hor=
izontal:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.37, 1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-edp-1-xv30-ver=
tical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.38, 1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-edp-1-xv36-hor=
izontal:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.36, 1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-edp-1-xv36-ver=
tical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.37, 1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-edp-1-xyuv8888=
-horizontal:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.36, 1.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-edp-1-xyuv8888=
-vertical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.37, 1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-edp-1-y210-hor=
izontal:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.38, 1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-edp-1-y210-ver=
tical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.37, 1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-edp-1-yuyv-hor=
izontal:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.40, 1.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-edp-1-yuyv-ver=
tical:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.38, 1.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.05, 30.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-nv12-hor=
izontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-nv12-ver=
tical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-p010-hor=
izontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-p010-ver=
tical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-rgb565-h=
orizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-rgb565-v=
ertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-xrgb1616=
1616f-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-xrgb1616=
1616f-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-xrgb2101=
010-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-xrgb2101=
010-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-xrgb8888=
-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-xrgb8888=
-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-xv30-hor=
izontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-xv30-ver=
tical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-xv36-hor=
izontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-xv36-ver=
tical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-xyuv8888=
-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-xyuv8888=
-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-y210-hor=
izontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-y210-ver=
tical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-yuyv-hor=
izontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-yuyv-ver=
tical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-1-nv12-ho=
rizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-1-nv12-ve=
rtical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-1-p010-ho=
rizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-1-p010-ve=
rtical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-1-rgb565-=
horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-1-rgb565-=
vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-1-xrgb161=
61616f-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-1-xrgb161=
61616f-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-1-xrgb210=
1010-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-1-xrgb210=
1010-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-1-xrgb888=
8-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-1-xrgb888=
8-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-1-xv30-ho=
rizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-1-xv30-ve=
rtical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-1-xv36-ho=
rizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-1-xv36-ve=
rtical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-1-xyuv888=
8-horizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-1-xyuv888=
8-vertical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-1-y210-ho=
rizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-1-y210-ve=
rtical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-1-yuyv-ho=
rizontal:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-1-yuyv-ve=
rtical:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-y-tiled:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.05, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-yf-tiled:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.01, 0.12] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15972_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9140/shard-ptl-8/igt@kms_async_flips@async-flip-suspend-resume.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
5972/shard-ptl-4/igt@kms_async_flips@async-flip-suspend-resume.html">ABORT<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9394">I=
ntel XE#9394</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-c-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-bmg-7/igt@kms_async_flips@async-flip-suspe=
nd-resume@pipe-c-dp-1.html">ABORT</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/9399">Intel XE#9399</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/9409">Intel XE#9409</a>) +1 other =
test abort</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-8/igt@kms_big_fb@4-tiled-32bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/5901">Intel XE#5901</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-lnl-3/igt@kms_big_fb@4-tiled-32bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1407">Intel XE#1407</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-2/igt@kms_big_fb@4-tiled-max-hw-stride=
-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/6925">Intel XE#6925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-4/igt@kms_big_fb@linear-max-hw-stride-=
32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-bmg-7/igt@kms_big_fb@linear-max-hw-stride-=
32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-bmg-5/igt@kms_big_fb@x-tiled-64bpp-rotate-=
270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-addfb:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-3/igt@kms_big_fb@x-tiled-addfb.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/585=
0">Intel XE#5850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-7/igt@kms_big_fb@x-tiled-addfb-size-of=
fset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/5851">Intel XE#5851</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-7/igt@kms_big_fb@x-tiled-max-hw-stride=
-64bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/5808">Intel XE#5808</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-lnl-4/igt@kms_big_fb@yf-tiled-16bpp-rotate=
-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-bmg-5/igt@kms_big_fb@yf-tiled-16bpp-rotate=
-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-target-2160x1440p:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-7/igt@kms_bw@connected-linear-tiling-2=
-displays-target-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-target-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-lnl-7/igt@kms_bw@connected-linear-tiling-2=
-displays-target-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-bmg-8/igt@kms_bw@connected-linear-tiling-3=
-displays-target-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-lnl-3/igt@kms_bw@connected-linear-tiling-4=
-displays-target-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8365">Intel XE#8365</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9140/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-3840x2160=
p.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_15972/shard-bmg-6/igt@kms_bw@linear-tiling-1-displays-target-3840x21=
60p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-1920x1080p:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-4/igt@kms_bw@linear-tiling-2-displays-=
target-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-lnl-8/igt@kms_bw@linear-tiling-2-displays-=
target-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-bmg-2/igt@kms_bw@linear-tiling-2-displays-=
target-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-lnl-1/igt@kms_ccs@ccs-on-another-bo-4-tile=
d-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2887">Intel XE#2887</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-lnl-5/igt@kms_ccs@crc-primary-basic-4-tile=
d-bmg-ccs@pipe-c-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2669">Intel XE#2669</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7389">Intel XE#7389</a>) +3 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-bmg-3/igt@kms_ccs@crc-primary-basic-4-tile=
d-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-3/igt@kms_ccs@crc-primary-rotation-180=
-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/5822">Intel XE#5822</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-ti=
led-bmg-ccs@pipe-c-dp-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-ti=
led-lnl-ccs@pipe-b-dp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +3 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-yf-t=
iled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-lnl-7/igt@kms_chamelium_color@ctm-max.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
306">Intel XE#306</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-6/igt@kms_chamelium_color@ctm-negative=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/5824">Intel XE#5824</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-bmg-6/igt@kms_chamelium_color@degamma.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2325">Intel XE#2325</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lu=
t1d:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-bmg-6/igt@kms_chamelium_color_pipeline@pla=
ne-fixed-matrix-yuv-rgb-bt601-lim-lut1d.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d:=
</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-2/igt@kms_chamelium_color_pipeline@pla=
ne-fixed-matrix-yuv-rgb-bt601-lut1d.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/8391">Intel XE#8391</a>) +5 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-lnl-5/igt@kms_chamelium_color_pipeline@pla=
ne-lut1d-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7358">Intel XE#7358</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-bmg-4/igt@kms_chamelium_edid@hdmi-edid-cha=
nge-during-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-fast:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-lnl-3/igt@kms_chamelium_hpd@dp-hpd-fast.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-7/igt@kms_chamelium_hpd@hdmi-hpd-with-=
enabled-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2252">Intel XE#2252</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-ctm3x4@pipe-a-plane-3:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-8/igt@kms_color_pipeline@plane-ctm3x4@=
pipe-a-plane-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6969">Intel XE#6969</a>) +15 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-lnl-1/igt@kms_color_pipeline@plane-ctm3x4@=
pipe-a-plane-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6969">Intel XE#6969</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-6/igt@kms_content_protection@dp-mst-ty=
pe-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/5832">Intel XE#5832</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1-suspend-resume:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-5/igt@kms_content_protection@dp-mst-ty=
pe-1-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-bmg-4/igt@kms_content_protection@dp-mst-ty=
pe-1-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-4/igt@kms_content_protection@lic-type-=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/7642">Intel XE#7642</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-lnl-4/igt@kms_content_protection@lic-type-=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/7642">Intel XE#7642</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-bmg-7/igt@kms_content_protection@lic-type-=
0@pipe-a-dp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-=
32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-64x21:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-2/igt@kms_cursor_crc@cursor-offscreen-=
64x21.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/5900">Intel XE#5900</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x21:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-lnl-7/igt@kms_cursor_crc@cursor-random-64x=
21.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-4/igt@kms_cursor_crc@cursor-rapid-move=
ment-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/5846">Intel XE#5846</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-lnl-1/igt@kms_cursor_crc@cursor-rapid-move=
ment-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2321">Intel XE#2321</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-2/igt@kms_cursor_legacy@2x-cursor-vs-f=
lip-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/5962">Intel XE#5962</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-lnl-2/igt@kms_cursor_legacy@2x-flip-vs-cur=
sor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/309">Intel XE#309</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-4/igt@kms_cursor_legacy@cursorb-vs-fli=
pb-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/5962">Intel XE#5962</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-1/igt@kms_cursor_legacy@short-busy-fli=
p-before-cursor-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6035">Intel XE#6035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst-direct-train:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-8/igt@kms_dp_link_training@non-uhbr-ms=
t-direct-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/9532">Intel XE#9532</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-bmg-1/igt@kms_dp_link_training@non-uhbr-ms=
t-direct-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/9532">Intel XE#9532</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst-direct-train:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-2/igt@kms_dp_link_training@non-uhbr-ss=
t-direct-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/9534">Intel XE#9534</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-bmg-5/igt@kms_dp_link_training@uhbr-mst.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/9533">Intel XE#9533</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-6/igt@kms_dp_linktrain_fallback@uhbr-t=
o-hbr-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/9009">Intel XE#9009</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-lnl-8/igt@kms_dp_linktrain_fallback@uhbr-t=
o-hbr-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/9009">Intel XE#9009</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-2/igt@kms_dsc@dsc-with-formats.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/590=
7">Intel XE#5907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-lnl-8/igt@kms_dsc@dsc-with-output-formats-=
with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/8265">Intel XE#8265</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9140/shard-ptl-6/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-3=
/igt@kms_fbcon_fbt@fbc-suspend.html">ABORT</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) +2 other tests=
 abort</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-1/igt@kms_feature_discovery@dp-mst.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2375">Intel XE#2375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dsc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-5/igt@kms_feature_discovery@dsc.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/92=
87">Intel XE#9287</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-lnl-2/igt@kms_flip@2x-flip-vs-absolute-wf_=
vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-6/igt@kms_flip@2x-flip-vs-suspend-inte=
rruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2316">Intel XE#2316</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@=
a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9140/shard-bmg-9/igt@kms_flip@wf_vblank-ts-check-interruptible.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
5972/shard-bmg-3/igt@kms_flip@wf_vblank-ts-check-interruptible.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408">In=
tel XE#5408</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/6266">Intel XE#6266</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-2/igt@kms_flip_scaled_crc@flip-32bpp-l=
inear-to-32bpp-linear-reflect-x.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-l=
inear-to-32bpp-linear-reflect-x.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:<=
/p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-3/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-l=
inear-to-16bpp-linear-downscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385">Int=
el XE#7385</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/9144">Intel XE#9144</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pi=
pe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-l=
inear-to-16bpp-linear-downscaling@pipe-a-default-mode.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#13=
97</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/738=
5">Intel XE#7385</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/9144">Intel XE#9144</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-7/igt@kms_frontbuffer_tracking@drrs-1p=
-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/5800">Intel XE#5800</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) =
+11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p=
-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +20 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-1/igt@kms_frontbuffer_tracking@drrshdr=
-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +14 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-lnl-3/igt@kms_frontbuffer_tracking@drrshdr=
-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +23 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-=
primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs=
-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)=
 +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-1/igt@kms_frontbuffer_tracking@fbcdrrs=
-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/5865">Intel XE#5865</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs=
-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2352">Intel XE#2352</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-draw-blt:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs=
hdr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +5 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs=
hdr-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/7399">Intel XE#7399</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>)=
 +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-4/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/5812">Intel XE#5812</a>) +79 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-6/igt@kms_frontbuffer_tracking@fbcpsr-=
argb161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +3 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-w=
c:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsrh=
dr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +12 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-6/igt@kms_frontbuffer_tracking@hdr-1p-=
primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +19 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-=
primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +22 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-arg=
b161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +3 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-bmg-7/igt@kms_frontbuffer_tracking@psrhdr-=
argb161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +1 other test skip</l=
i>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-4/igt@kms_frontbuffer_tracking@psrhdr-=
argb161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-7/igt@kms_hdmi_audio_bw@suspend-mem-au=
dio-recovery.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/9312">Intel XE#9312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-5/igt@kms_hdmi_inject@inject-audio.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/7308">Intel XE#7308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-bmg-4/igt@kms_joiner@invalid-modeset-force=
-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/6911">Intel XE#6911</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7466">Intel XE#7466</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-2/igt@kms_joiner@invalid-modeset-ultra=
-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6900">Intel XE#6900</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-a-plane-5:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-3/igt@kms_plane@pixel-format-4-tiled-l=
nl-ccs-modifier@pipe-a-plane-5.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/8303">Intel XE#8303</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-7/igt@kms_plane@pixel-format-x-tiled-m=
odifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +3 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-bmg-3/igt@kms_plane@pixel-format-y-tiled-g=
en12-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-lnl-6/igt@kms_plane@pixel-format-yf-tiled-=
ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-7/igt@kms_plane_lowres@tiling-none@pip=
e-b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/5844">Intel XE#5844</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-6/igt@kms_plane_multiple@2x-tiling-x.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4596">Intel XE#4596</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/5854">Intel XE#5854</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-lnl-7/igt@kms_plane_multiple@2x-tiling-x.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4596">Intel XE#4596</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/5854">Intel XE#5854</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-5/igt@kms_plane_multiple@tiling-y.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-lnl-1/igt@kms_plane_scaling@planes-downsca=
le-factor-0-5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +3 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b:<=
/p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-2/igt@kms_plane_scaling@planes-downsca=
le-factor-0-5-upscale-20x20@pipe-b.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +14 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-bmg-5/igt@kms_pm_backlight@fade-with-dpms.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7376">Intel XE#7376</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7760">Intel XE#7760</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-bmg-2/igt@kms_pm_lpsp@kms-lpsp.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499">I=
ntel XE#2499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-6/igt@kms_pm_rpm@modeset-non-lpsp-stre=
ss-no-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/5849">Intel XE#5849</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@package-g7:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-8/igt@kms_pm_rpm@package-g7.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6813">=
Intel XE#6813</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-bmg-1/igt@kms_pm_rpm@package-g7.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6814">=
Intel XE#6814</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7428">Intel XE#7428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-1/igt@kms_psr2_sf@fbc-pr-overlay-plane=
-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +2 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-b-edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-4/igt@kms_psr2_sf@fbc-psr2-cursor-plan=
e-update-sf@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/5858">Intel XE#5858</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +3 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@p=
ipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-5/igt@kms_psr2_sf@fbc-psr2-overlay-pla=
ne-move-continuous-exceed-fully-sf@pipe-a-edp-1.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858">Intel XE#5858</a>=
) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-plane-move-=
sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-plane-move-=
sf-dmg-area@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-plane-move-=
sf-dmg-area@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-lnl-2/igt@kms_psr2_sf@pr-overlay-plane-upd=
ate-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-bmg-3/igt@kms_psr2_sf@pr-primary-plane-upd=
ate-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-bmg-6/igt@kms_psr2_su@page_flip-nv12.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
387">Intel XE#2387</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7429">Intel XE#7429</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-lnl-2/igt@kms_psr2_su@page_flip-p010.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
128">Intel XE#1128</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7413">Intel XE#7413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-bmg-4/igt@kms_psr@fbc-pr-primary-blt.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render@edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-2/igt@kms_psr@fbc-psr2-primary-render@=
edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/5835">Intel XE#5835</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-lnl-4/igt@kms_psr@fbc-psr2-suspend.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/140=
6">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7345">Intel XE#7345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-suspend@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-lnl-4/igt@kms_psr@fbc-psr2-suspend@edp-1.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4609">Intel XE#4609</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-plane-move:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-6/igt@kms_psr@pr-cursor-plane-move.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1406">Intel XE#1406</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-lnl-7/igt@kms_psr@pr-primary-blt.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406"=
>Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-lnl-2/igt@kms_rotation_crc@bad-pixel-forma=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-8/igt@kms_rotation_crc@primary-4-tiled=
-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/5821">Intel XE#5821</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-bmg-1/igt@kms_rotation_crc@primary-rotatio=
n-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3904">Intel XE#3904</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7342">Intel XE#7342</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-x-tiled-reflect-x-0:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-8/igt@kms_rotation_crc@primary-x-tiled=
-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/5813">Intel XE#5813</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-lnl-6/igt@kms_rotation_crc@primary-y-tiled=
-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1127">Intel XE#1127</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-bmg-8/igt@kms_setmode@basic-clone-single-c=
rtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1435">Intel XE#1435</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/8695">Intel XE#8695</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-8/igt@kms_setmode@clone-exclusive-crtc=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/5910">Intel XE#5910</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-lnl-4/igt@kms_setmode@clone-exclusive-crtc=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1435">Intel XE#1435</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/9142">Intel XE#9142</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-bmg-6/igt@kms_sharpness_filter@invalid-fil=
ter-with-scaling-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-lnl-5/igt@kms_vrr@negative-basic.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499"=
>Intel XE#1499</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/9271">Intel XE#9271</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many-vram:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-3/igt@xe_compute_preempt@compute-preem=
pt-many-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/5191">Intel XE#5191</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_configfs@survivability-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-lnl-6/igt@xe_configfs@survivability-mode.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/8428">Intel XE#8428</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-3/igt@xe_create@multigpu-create-massiv=
e-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/5878">Intel XE#5878</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-lnl-6/igt@xe_evict@evict-beng-mixed-thread=
s-large-multi-vm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +4 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-small-multi-vm:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-1/igt@xe_evict@evict-cm-threads-small-=
multi-vm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/5764">Intel XE#5764</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-priority-cm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-bmg-4/igt@xe_evict@evict-small-multi-queue=
-priority-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/8370">Intel XE#8370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-8/igt@xe_evict_ccs@evict-overcommit-st=
andalone-instantfree-reopen.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6144">Intel XE#6144</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-cm-virtual-userptr:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-2/igt@xe_exec_balancer@many-cm-virtual=
-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7482">Intel XE#7482</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-virtual-userptr-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-lnl-6/igt@xe_exec_balancer@twice-virtual-u=
serptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7482">Intel XE#7482</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-rebind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-4/igt@xe_exec_basic@multigpu-many-exec=
queues-many-vm-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484">Intel X=
E#7484</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-lnl-3/igt@xe_exec_basic@multigpu-no-exec-b=
indexecqueue-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exec-u=
serptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind-prefet=
ch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-lnl-5/igt@xe_exec_fault_mode@many-execqueu=
es-multi-queue-userptr-rebind-prefetch.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +5 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-imm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-bmg-5/igt@xe_exec_fault_mode@many-multi-qu=
eue-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/8374">Intel XE#8374</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-7/igt@xe_exec_fault_mode@many-multi-qu=
eue-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-preempt-mode-close-fd:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-bmg-2/igt@xe_exec_multi_queue@many-execs-p=
reempt-mode-close-fd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-basic:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-4/igt@xe_exec_multi_queue@one-queue-ba=
sic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/8364">Intel XE#8364</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr-invalidate:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-lnl-4/igt@xe_exec_multi_queue@one-queue-pr=
eempt-mode-fault-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +16 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-gt-reset:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-1/igt@xe_exec_reset@cm-multi-queue-gt-=
reset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/8369">Intel XE#8369</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-long-spin-many-queue-switch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-bmg-3/igt@xe_exec_reset@multi-queue-long-s=
pin-many-queue-switch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-multi-vma=
:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-1/igt@xe_exec_system_allocator@pat-ind=
ex-madvise-pat-idx-uc-comp-multi-vma.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6196">Intel XE#6196</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-lnl-7/igt@xe_exec_system_allocator@pat-ind=
ex-madvise-pat-idx-uc-comp-multi-vma.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6196">Intel XE#6196</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-fd-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-bmg-5/igt@xe_exec_threads@threads-multi-qu=
eue-fd-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/8378">Intel XE#8378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-hang-fd-userptr-invalidate-race:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-lnl-2/igt@xe_exec_threads@threads-multi-qu=
eue-hang-fd-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-userptr-rebind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-4/igt@xe_exec_threads@threads-multi-qu=
eue-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9140/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-x=
e_guc_ct_init.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_15972/shard-bmg-8/igt@xe_fault_injection@inject-fault-pr=
obe-function-xe_guc_ct_init.html">ABORT</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/9463">Intel XE#9463</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9140/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send=
_recv.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_15972/shard-bmg-4/igt@xe_fault_injection@probe-fail-guc-xe_guc_c=
t_send_recv.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/6652">Intel XE#6652</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/9470">Intel XE#9470</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_madvise@atomic-cpu:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-8/igt@xe_madvise@atomic-cpu.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7980">=
Intel XE#7980</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mempage_offline@inject-single-page:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-lnl-3/igt@xe_mempage_offline@inject-single=
-page.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/9203">Intel XE#9203</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-bad-pagesize:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-5/igt@xe_mmap@pci-membarrier-bad-pages=
ize.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/5100">Intel XE#5100</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7408">Intel XE#7408</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-lnl-3/igt@xe_mmap@pci-membarrier-bad-pages=
ize.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/5100">Intel XE#5100</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7322">Intel XE#7322</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7408">Intel XE#7408</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-3/igt@xe_mmap@small-bar.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5867">Inte=
l XE#5867</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-ptl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_9140/shard-ptl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9140/shard-ptl-4/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_9140/shard-ptl-7/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9140/shard-ptl-7/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_9140/shard-ptl-1/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9140/shard-ptl-4/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_9140/shard-ptl-4/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9140/shard-ptl-5/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_9140/shard-ptl-8/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9140/shard-ptl-1=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_9140/shard-ptl-8/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9140/shard-pt=
l-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGT_9140/shard-ptl-6/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9140/shard=
-ptl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGT_9140/shard-ptl-2/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9140/sh=
ard-ptl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGT_9140/shard-ptl-7/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9140=
/shard-ptl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGT_9140/shard-ptl-3/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9=
140/shard-ptl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_9140/shard-ptl-3/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
T_9140/shard-ptl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGT_9140/shard-ptl-8/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGT_9140/shard-ptl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGT_9140/shard-ptl-5/igt@xe_module_=
load@load.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_15972/shard-ptl-8/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-=
6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_15972/shard-ptl-6/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/s=
hard-ptl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-5/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_15972/shard-ptl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-3/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_15972/shard-ptl-3/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-3/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_15972/shard-ptl-8/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-p=
tl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-5/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1597=
2/shard-ptl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-1/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_15972/shard-ptl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-1/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_15972/shard-ptl-1/igt@xe_module_load@load.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-4/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_15972/shard-ptl-4/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shar=
d-ptl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-7/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
5972/shard-ptl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-2/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_15972/shard-ptl-2/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-2/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_15972/shard-ptl-2/igt@xe_module_load@load.html">PASS</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9286">Int=
el XE#9286</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-pagefault-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-lnl-3/igt@xe_multigpu_svm@mgpu-pagefault-p=
refetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-xgpu-access-basic:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-6/igt@xe_multigpu_svm@mgpu-xgpu-access=
-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/6964">Intel XE#6964</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@basic-mixed:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-lnl-3/igt@xe_page_reclaim@basic-mixed.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@binds-large-split:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-4/igt@xe_page_reclaim@binds-large-spli=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/7793">Intel XE#7793</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@pde-vs-pd:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-bmg-9/igt@xe_page_reclaim@pde-vs-pd.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/77=
93">Intel XE#7793</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-lnl-1/igt@xe_pat@pat-index-xelp.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">=
Intel XE#7590</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-reset-compare:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-1/igt@xe_pat@pat-sw-hw-reset-compare.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/7695">Intel XE#7695</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-lnl-2/igt@xe_pat@pat-sw-hw-suspend.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/769=
5">Intel XE#7695</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@xa-app-transient-media-on:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-bmg-2/igt@xe_pat@xa-app-transient-media-on=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/7590">Intel XE#7590</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-1/igt@xe_pat@xa-app-transient-media-on=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-bmg-9/igt@xe_pm@d3cold-basic.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Int=
el XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-lnl-2/igt@xe_pm@d3cold-i2c.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694">Intel=
 XE#5694</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-2/igt@xe_pm@s3-vm-bind-prefetch.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/68=
67">Intel XE#6867</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9140/shard-lnl-3/igt@xe_pm@s4-basic.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-7/igt@xe_pm@=
s4-basic.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/9362">Intel XE#9362</a>) +3 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-3/igt@xe_pm@vram-d3cold-threshold.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
5611">Intel XE#5611</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7456">Intel XE#7456</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-lnl-8/igt@xe_pm@vram-d3cold-threshold.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
579">Intel XE#579</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7329">Intel XE#7329</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7456">Intel XE#7456</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@all-fn-engine-activity-load:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-lnl-8/igt@xe_pmu@all-fn-engine-activity-lo=
ad.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4650">Intel XE#4650</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7347">Intel XE#7347</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_prefetch_fault@l2-prefetch-fault-svm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-bmg-1/igt@xe_prefetch_fault@l2-prefetch-fa=
ult-svm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/8815">Intel XE#8815</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-queue-post-termination-irq:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-bmg-2/igt@xe_pxp@pxp-stale-queue-post-term=
ination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4733">Intel XE#4733</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-suspend:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-5/igt@xe_pxp@pxp-termination-key-updat=
e-post-suspend.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/9362">Intel XE#9362</a>) +3 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-3/igt@xe_query@multigpu-query-uc-fw-ve=
rsion-huc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/6019">Intel XE#6019</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-lnl-4/igt@xe_sriov_auto_provisioning@resou=
rces-released-on-vfs-disabling.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7366">Intel XE#7366</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vram@vf-access-provisioned:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-3/igt@xe_sriov_vram@vf-access-provisio=
ned.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/6376">Intel XE#6376</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7422">Intel XE#7422</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sync_file@sync_file_race:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-1/igt@xe_sync_file@sync_file_race.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
9457">Intel XE#9457</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-array-enobufs:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-ptl-6/igt@xe_vm@bind-array-enobufs.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/942=
4">Intel XE#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@overcommit-nonfault-vram-lr-external-nodefer:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15972/shard-lnl-7/igt@xe_vm@overcommit-nonfault-vram-l=
r-external-nodefer.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7892">Intel XE#7892</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9140/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408">Int=
el XE#5408</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/6266">Intel XE#6266</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_15972/shard-lnl-8/igt@kms_flip@wf_vblank-ts-check@a-edp=
1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane=
-0:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9140/shard-ptl-5/igt@kms_plane@pixel-format-4-tiled-modifier-source-c=
lamping@pipe-a-plane-0.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/9340">Intel XE#9340</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-2/igt@kms_plane@p=
ixel-format-4-tiled-modifier-source-clamping@pipe-a-plane-0.html">PASS</a> =
+1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-suspend:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9140/shard-ptl-1/igt@kms_sharpness_filter@filter-suspend.html">ABORT<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9375">I=
ntel XE#9375</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_15972/shard-ptl-7/igt@kms_sharpness_filter@filter-suspend.html">PAS=
S</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9140/shard-ptl-3/igt@kms_vrr@flip-basic.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel=
 XE#7397</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_15972/shard-ptl-5/igt@kms_vrr@flip-basic.html">PASS</a> +1 other test p=
ass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9140/shard-lnl-8/igt@xe_exec_threads@threads-hang-userptr-invalidate-=
race.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/9096">Intel XE#9096</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15972/shard-lnl-6/igt@xe_exec_threads@threads-hang-=
userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9140/shard-lnl-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send=
_recv.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/6652">Intel XE#6652</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_15972/shard-lnl-8/igt@xe_fault_injection@probe-fa=
il-guc-xe_guc_ct_send_recv.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-system:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9140/shard-ptl-6/igt@xe_pm@d3hot-mmap-system.html">FAIL</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-ptl-7/i=
gt@xe_pm@d3hot-mmap-system.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-prefetch:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9140/shard-ptl-5/igt@xe_pm@s2idle-vm-bind-prefetch.html">ABORT</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel X=
E#9362</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_15972/shard-ptl-6/igt@xe_pm@s2idle-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9140/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transi=
tions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/309">Intel XE#309</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7343">Intel XE#7343</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-lnl-8/igt@kms_cursor_legac=
y@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935"=
>Intel XE#7935</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9140/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3=
374</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/35=
44">Intel XE#3544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_15972/shard-bmg-9/igt@kms_hdr@brightness-with-hdr.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">In=
tel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9140/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">I=
ntel XE#1729</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/7424">Intel XE#7424</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_15972/shard-bmg-2/igt@kms_tiled_display@basic-test-pa=
ttern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2426">Intel XE#2426</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9140/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamel=
ium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2509">Intel XE#2509</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7437">Intel XE#7437</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/shard-bmg-8/igt@kms_tiled_displa=
y@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848=
</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9140 -&gt; IGTPW_15972</li>
<li>Linux: xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1 -&gt; xe-5934-d=
cbee9cfcd4097656a88dbaf196fbc5403764a58</li>
</ul>
<p>IGTPW_15972: 80a8a47f8c2349c00d8b7deb47e7df1e53fcb035 @ https://gitlab.f=
reedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9140: 3b0daa274edb520204660fa1e15424b66ce0aea0 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1: 20282d4c78403c9eda071eb=
dd0c3d6fb287f64a1<br />
  xe-5934-dcbee9cfcd4097656a88dbaf196fbc5403764a58: dcbee9cfcd4097656a88dba=
f196fbc5403764a58</p>

</body>
</html>

--===============6147768753065281742==--
