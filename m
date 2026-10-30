Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6707C606A31C
	for <igt-dev@archiver.kernel.org>; Fri, 30 Oct 2026 10:44:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0601810E89E;
	Fri, 30 Oct 2026 10:44:48 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C05B510E89E;
 Fri, 30 Oct 2026 10:43:54 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8330882041720560004=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_series_starting_with_=5Bi-?=
 =?utf-8?q?g-t=2C01/10=5D_lib/igt=5Ffb=3A_add_igt=5Fformat=5Fget=5Fsubsampli?=
 =?utf-8?q?ng=28=29_function_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 30 Oct 2026 10:43:54 -0000
Message-ID: <179335703476.92813.7303032936636385319@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261028145202.3128915-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20261028145202.3128915-1-juhapekka.heikkila@gmail.com>
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

--===============8330882041720560004==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,01/10] lib/igt_fb: add igt_format_get_subsampling() function (rev2)
URL   : https://patchwork.freedesktop.org/series/177043/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_9171_FULL -> XEIGTPW_16071_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_16071_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_16071_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_16071_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-dp-2-p010 (NEW):
    - shard-bmg:          NOTRUN -> [FAIL][1] +14 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-bmg-9/igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-dp-2-p010.html

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-270-y-tiled (NEW):
    - shard-bmg:          NOTRUN -> [SKIP][2] +10 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-bmg-8/igt@kms_plane_scaling@plane-downscale-max-crc-rotation-270-y-tiled.html

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-90-y-tiled (NEW):
    - shard-lnl:          NOTRUN -> [SKIP][3] +9 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-lnl-2/igt@kms_plane_scaling@plane-downscale-max-crc-rotation-90-y-tiled.html

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled (NEW):
    - shard-ptl:          NOTRUN -> [SKIP][4] +13 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-ptl-7/igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled.html

  
New tests
---------

  New tests have been introduced between XEIGT_9171_FULL and XEIGTPW_16071_FULL:

### New IGT tests (1003) ###

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled:
    - Statuses : 1 fail(s) 2 pass(s)
    - Exec time: [75.45, 98.10] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [1.46] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.64] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [2.02] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [3.60] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [1.66] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [1.99] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.67] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-y210:
    - Statuses : 1 pass(s)
    - Exec time: [1.68] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.51] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-nv12:
    - Statuses : 2 pass(s)
    - Exec time: [2.21, 2.27] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-p010:
    - Statuses : 2 pass(s)
    - Exec time: [2.20, 2.30] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-rgb565:
    - Statuses : 2 pass(s)
    - Exec time: [2.38, 2.40] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-xrgb16161616f:
    - Statuses : 2 pass(s)
    - Exec time: [2.21, 2.28] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [2.25, 2.26] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [2.39, 2.41] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-xv30:
    - Statuses : 2 pass(s)
    - Exec time: [2.19, 2.28] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-xv36:
    - Statuses : 2 pass(s)
    - Exec time: [2.20, 2.21] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-xyuv8888:
    - Statuses : 2 pass(s)
    - Exec time: [2.21, 2.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-y210:
    - Statuses : 2 pass(s)
    - Exec time: [2.21, 2.27] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-yuyv:
    - Statuses : 2 pass(s)
    - Exec time: [2.19, 2.28] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-dp-2-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [1.46] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.64] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-dp-2-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-dp-2-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [1.97] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [3.63] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-dp-2-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [1.67] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-dp-2-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [2.00] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-dp-2-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.69] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-dp-2-y210:
    - Statuses : 1 pass(s)
    - Exec time: [1.68] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.50] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-edp-1-nv12:
    - Statuses : 2 pass(s)
    - Exec time: [2.20, 2.27] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-edp-1-p010:
    - Statuses : 2 pass(s)
    - Exec time: [2.20, 2.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-edp-1-rgb565:
    - Statuses : 2 pass(s)
    - Exec time: [2.35, 2.44] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-edp-1-xrgb16161616f:
    - Statuses : 2 pass(s)
    - Exec time: [2.21, 2.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-edp-1-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [2.17, 2.24] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-edp-1-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [2.31, 2.39] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-edp-1-xv30:
    - Statuses : 2 pass(s)
    - Exec time: [2.20, 2.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-edp-1-xv36:
    - Statuses : 2 pass(s)
    - Exec time: [2.21, 2.28] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-edp-1-xyuv8888:
    - Statuses : 2 pass(s)
    - Exec time: [2.21, 2.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-edp-1-y210:
    - Statuses : 2 pass(s)
    - Exec time: [2.19, 2.28] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-edp-1-yuyv:
    - Statuses : 2 pass(s)
    - Exec time: [2.20, 2.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-dp-2-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [1.46] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.61] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-dp-2-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-dp-2-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [1.96] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [3.61] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-dp-2-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [1.67] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-dp-2-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [1.99] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-dp-2-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.67] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-dp-2-y210:
    - Statuses : 1 pass(s)
    - Exec time: [1.67] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.50] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-edp-1-nv12:
    - Statuses : 2 pass(s)
    - Exec time: [2.20, 2.27] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-edp-1-p010:
    - Statuses : 2 pass(s)
    - Exec time: [2.19, 2.21] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-edp-1-rgb565:
    - Statuses : 2 pass(s)
    - Exec time: [2.27, 2.38] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-edp-1-xrgb16161616f:
    - Statuses : 2 pass(s)
    - Exec time: [2.20, 2.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-edp-1-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [2.19, 2.22] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-edp-1-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [2.30, 2.31] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-edp-1-xv30:
    - Statuses : 2 pass(s)
    - Exec time: [2.20, 2.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-edp-1-xv36:
    - Statuses : 2 pass(s)
    - Exec time: [2.18, 2.20] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-edp-1-xyuv8888:
    - Statuses : 2 pass(s)
    - Exec time: [2.18, 2.20] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-edp-1-y210:
    - Statuses : 2 pass(s)
    - Exec time: [2.21, 2.28] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-edp-1-yuyv:
    - Statuses : 2 pass(s)
    - Exec time: [2.22, 2.28] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-dp-2-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [1.46] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.64] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-dp-2-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [1.31] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-dp-2-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [1.96] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [3.63] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-dp-2-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [1.67] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-dp-2-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [1.99] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-dp-2-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.68] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-dp-2-y210:
    - Statuses : 1 pass(s)
    - Exec time: [1.68] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.49] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-edp-1-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [2.20] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-edp-1-p010:
    - Statuses : 1 pass(s)
    - Exec time: [2.20] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-edp-1-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [2.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-edp-1-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [2.20] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.22] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [2.30] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-edp-1-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [2.21] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-edp-1-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [2.21] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-edp-1-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [2.19] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-edp-1-y210:
    - Statuses : 1 pass(s)
    - Exec time: [2.23] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [2.21] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear:
    - Statuses : 3 pass(s)
    - Exec time: [75.85, 98.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-2-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [1.46] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-2-p010:
    - Statuses : 1 pass(s)
    - Exec time: [1.63] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-2-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-2-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [2.08] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [3.63] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.30] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-2-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [1.66] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-2-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [2.00] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-2-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.71] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-2-y210:
    - Statuses : 1 pass(s)
    - Exec time: [1.68] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.50] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-edp-1-nv12:
    - Statuses : 2 pass(s)
    - Exec time: [2.20, 2.28] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-edp-1-p010:
    - Statuses : 2 pass(s)
    - Exec time: [2.20, 2.27] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-edp-1-rgb565:
    - Statuses : 2 pass(s)
    - Exec time: [2.41, 2.42] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-edp-1-xrgb16161616f:
    - Statuses : 2 pass(s)
    - Exec time: [2.22, 2.30] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-edp-1-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [2.23, 2.25] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-edp-1-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [2.40, 2.42] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-edp-1-xv30:
    - Statuses : 2 pass(s)
    - Exec time: [2.21, 2.30] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-edp-1-xv36:
    - Statuses : 2 pass(s)
    - Exec time: [2.19, 2.27] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-edp-1-xyuv8888:
    - Statuses : 2 pass(s)
    - Exec time: [2.19, 2.28] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-edp-1-y210:
    - Statuses : 2 pass(s)
    - Exec time: [2.21, 2.30] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-edp-1-yuyv:
    - Statuses : 2 pass(s)
    - Exec time: [2.21, 2.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-2-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [1.49] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-2-p010:
    - Statuses : 1 pass(s)
    - Exec time: [1.59] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-2-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-2-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [1.98] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [3.62] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.30] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-2-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [1.67] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-2-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [1.99] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-2-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.66] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-2-y210:
    - Statuses : 1 pass(s)
    - Exec time: [1.69] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.50] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-edp-1-nv12:
    - Statuses : 2 pass(s)
    - Exec time: [2.20, 2.28] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-edp-1-p010:
    - Statuses : 2 pass(s)
    - Exec time: [2.21, 2.28] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-edp-1-rgb565:
    - Statuses : 2 pass(s)
    - Exec time: [2.35, 2.43] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-edp-1-xrgb16161616f:
    - Statuses : 2 pass(s)
    - Exec time: [2.20, 2.28] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-edp-1-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [2.25] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-edp-1-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [2.38, 2.40] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-edp-1-xv30:
    - Statuses : 2 pass(s)
    - Exec time: [2.20, 2.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-edp-1-xv36:
    - Statuses : 2 pass(s)
    - Exec time: [2.21, 2.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-edp-1-xyuv8888:
    - Statuses : 2 pass(s)
    - Exec time: [2.20, 2.28] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-edp-1-y210:
    - Statuses : 2 pass(s)
    - Exec time: [2.21, 2.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-edp-1-yuyv:
    - Statuses : 2 pass(s)
    - Exec time: [2.20, 2.28] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-dp-2-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [1.44] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-dp-2-p010:
    - Statuses : 1 pass(s)
    - Exec time: [1.65] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-dp-2-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [1.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-dp-2-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [2.08] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [3.96] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-dp-2-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [1.73] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-dp-2-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [1.99] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-dp-2-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.74] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-dp-2-y210:
    - Statuses : 1 pass(s)
    - Exec time: [1.73] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.52] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-edp-1-nv12:
    - Statuses : 2 pass(s)
    - Exec time: [2.21, 2.28] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-edp-1-p010:
    - Statuses : 2 pass(s)
    - Exec time: [2.21, 2.28] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-edp-1-rgb565:
    - Statuses : 2 pass(s)
    - Exec time: [2.27, 2.36] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-edp-1-xrgb16161616f:
    - Statuses : 2 pass(s)
    - Exec time: [2.20, 2.28] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-edp-1-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [2.20, 2.22] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-edp-1-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [2.28, 2.31] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-edp-1-xv30:
    - Statuses : 2 pass(s)
    - Exec time: [2.20, 2.28] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-edp-1-xv36:
    - Statuses : 2 pass(s)
    - Exec time: [2.20, 2.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-edp-1-xyuv8888:
    - Statuses : 2 pass(s)
    - Exec time: [2.21, 2.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-edp-1-y210:
    - Statuses : 2 pass(s)
    - Exec time: [2.19, 2.30] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-edp-1-yuyv:
    - Statuses : 2 pass(s)
    - Exec time: [2.20, 2.28] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-dp-2-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [1.46] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-dp-2-p010:
    - Statuses : 1 pass(s)
    - Exec time: [1.58] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-dp-2-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [1.30] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-dp-2-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [2.08] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [3.96] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.31] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-dp-2-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [1.71] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-dp-2-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [1.99] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-dp-2-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.67] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-dp-2-y210:
    - Statuses : 1 pass(s)
    - Exec time: [1.71] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.50] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-edp-1-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [2.20] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-edp-1-p010:
    - Statuses : 1 pass(s)
    - Exec time: [2.20] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-edp-1-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [2.28] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-edp-1-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [2.21] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.22] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [2.31] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-edp-1-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [2.21] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-edp-1-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [2.21] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-edp-1-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [2.21] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-edp-1-y210:
    - Statuses : 1 pass(s)
    - Exec time: [2.20] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [2.20] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled:
    - Statuses : 3 pass(s)
    - Exec time: [75.50, 97.94] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-a-dp-2-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [1.48] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-a-dp-2-p010:
    - Statuses : 1 pass(s)
    - Exec time: [1.59] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-a-dp-2-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-a-dp-2-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [2.10] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-a-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [3.61] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-a-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-a-dp-2-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [1.66] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-a-dp-2-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [1.98] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-a-dp-2-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.65] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-a-dp-2-y210:
    - Statuses : 1 pass(s)
    - Exec time: [1.65] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-a-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.50] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-a-edp-1-nv12:
    - Statuses : 2 pass(s)
    - Exec time: [2.20, 2.28] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-a-edp-1-p010:
    - Statuses : 2 pass(s)
    - Exec time: [2.21, 2.27] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-a-edp-1-rgb565:
    - Statuses : 2 pass(s)
    - Exec time: [2.40, 2.41] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-a-edp-1-xrgb16161616f:
    - Statuses : 2 pass(s)
    - Exec time: [2.20, 2.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-a-edp-1-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [2.18, 2.23] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-a-edp-1-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [2.30, 2.38] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-a-edp-1-xv30:
    - Statuses : 2 pass(s)
    - Exec time: [2.21, 2.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-a-edp-1-xv36:
    - Statuses : 2 pass(s)
    - Exec time: [2.20, 2.28] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-a-edp-1-xyuv8888:
    - Statuses : 2 pass(s)
    - Exec time: [2.19, 2.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-a-edp-1-y210:
    - Statuses : 2 pass(s)
    - Exec time: [2.21, 2.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-a-edp-1-yuyv:
    - Statuses : 2 pass(s)
    - Exec time: [2.20, 2.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-b-dp-2-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [1.45] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-b-dp-2-p010:
    - Statuses : 1 pass(s)
    - Exec time: [1.62] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-b-dp-2-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-b-dp-2-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [1.97] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-b-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [3.61] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-b-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-b-dp-2-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [1.64] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-b-dp-2-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [1.97] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-b-dp-2-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.64] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-b-dp-2-y210:
    - Statuses : 1 pass(s)
    - Exec time: [1.68] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-b-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.50] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-b-edp-1-nv12:
    - Statuses : 2 pass(s)
    - Exec time: [2.21, 2.28] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-b-edp-1-p010:
    - Statuses : 2 pass(s)
    - Exec time: [2.18, 2.20] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-b-edp-1-rgb565:
    - Statuses : 2 pass(s)
    - Exec time: [2.35, 2.45] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-b-edp-1-xrgb16161616f:
    - Statuses : 2 pass(s)
    - Exec time: [2.19, 2.27] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-b-edp-1-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [2.18, 2.24] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-b-edp-1-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [2.32, 2.40] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-b-edp-1-xv30:
    - Statuses : 2 pass(s)
    - Exec time: [2.20, 2.26] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-b-edp-1-xv36:
    - Statuses : 2 pass(s)
    - Exec time: [2.20, 2.22] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-b-edp-1-xyuv8888:
    - Statuses : 2 pass(s)
    - Exec time: [2.21, 2.28] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-b-edp-1-y210:
    - Statuses : 2 pass(s)
    - Exec time: [2.21, 2.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-b-edp-1-yuyv:
    - Statuses : 2 pass(s)
    - Exec time: [2.22, 2.30] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-c-dp-2-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [1.46] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-c-dp-2-p010:
    - Statuses : 1 pass(s)
    - Exec time: [1.56] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-c-dp-2-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-c-dp-2-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [1.97] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-c-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [3.62] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-c-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-c-dp-2-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [1.66] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-c-dp-2-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [1.94] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-c-dp-2-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.65] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-c-dp-2-y210:
    - Statuses : 1 pass(s)
    - Exec time: [1.67] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-c-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.49] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-c-edp-1-nv12:
    - Statuses : 2 pass(s)
    - Exec time: [2.21, 2.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-c-edp-1-p010:
    - Statuses : 2 pass(s)
    - Exec time: [2.20, 2.28] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-c-edp-1-rgb565:
    - Statuses : 2 pass(s)
    - Exec time: [2.29, 2.37] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-c-edp-1-xrgb16161616f:
    - Statuses : 2 pass(s)
    - Exec time: [2.20, 2.30] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-c-edp-1-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [2.20, 2.23] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-c-edp-1-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [2.29, 2.31] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-c-edp-1-xv30:
    - Statuses : 2 pass(s)
    - Exec time: [2.21, 2.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-c-edp-1-xv36:
    - Statuses : 2 pass(s)
    - Exec time: [2.20, 2.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-c-edp-1-xyuv8888:
    - Statuses : 2 pass(s)
    - Exec time: [2.18, 2.20] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-c-edp-1-y210:
    - Statuses : 2 pass(s)
    - Exec time: [2.17, 2.20] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-c-edp-1-yuyv:
    - Statuses : 2 pass(s)
    - Exec time: [2.20, 2.28] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-d-dp-2-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [1.45] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-d-dp-2-p010:
    - Statuses : 1 pass(s)
    - Exec time: [1.58] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-d-dp-2-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-d-dp-2-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [1.98] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-d-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [3.62] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-d-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-d-dp-2-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [1.65] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-d-dp-2-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [1.96] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-d-dp-2-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.67] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-d-dp-2-y210:
    - Statuses : 1 pass(s)
    - Exec time: [1.67] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-d-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.48] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-d-edp-1-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [2.20] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-d-edp-1-p010:
    - Statuses : 1 pass(s)
    - Exec time: [2.20] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-d-edp-1-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [2.28] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-d-edp-1-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [2.19] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-d-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.23] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-d-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [2.30] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-d-edp-1-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [2.21] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-d-edp-1-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [2.20] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-d-edp-1-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [2.21] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-d-edp-1-y210:
    - Statuses : 1 pass(s)
    - Exec time: [2.20] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-d-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [2.21] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear:
    - Statuses : 3 pass(s)
    - Exec time: [75.78, 98.07] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-a-dp-2-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [1.46] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-a-dp-2-p010:
    - Statuses : 1 pass(s)
    - Exec time: [1.59] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-a-dp-2-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-a-dp-2-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [2.18] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-a-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [3.95] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-a-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.30] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-a-dp-2-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [1.66] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-a-dp-2-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [2.08] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-a-dp-2-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.66] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-a-dp-2-y210:
    - Statuses : 1 pass(s)
    - Exec time: [1.70] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-a-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.50] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-a-edp-1-nv12:
    - Statuses : 2 pass(s)
    - Exec time: [2.20, 2.28] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-a-edp-1-p010:
    - Statuses : 2 pass(s)
    - Exec time: [2.21, 2.27] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-a-edp-1-rgb565:
    - Statuses : 2 pass(s)
    - Exec time: [2.36, 2.37] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-a-edp-1-xrgb16161616f:
    - Statuses : 2 pass(s)
    - Exec time: [2.19, 2.28] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-a-edp-1-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [2.23, 2.26] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-a-edp-1-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [2.40] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-a-edp-1-xv30:
    - Statuses : 2 pass(s)
    - Exec time: [2.20, 2.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-a-edp-1-xv36:
    - Statuses : 2 pass(s)
    - Exec time: [2.21, 2.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-a-edp-1-xyuv8888:
    - Statuses : 2 pass(s)
    - Exec time: [2.22, 2.28] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-a-edp-1-y210:
    - Statuses : 2 pass(s)
    - Exec time: [2.19, 2.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-a-edp-1-yuyv:
    - Statuses : 2 pass(s)
    - Exec time: [2.20, 2.28] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-b-dp-2-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [1.47] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-b-dp-2-p010:
    - Statuses : 1 pass(s)
    - Exec time: [1.63] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-b-dp-2-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-b-dp-2-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [2.11] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-b-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [3.96] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-b-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.30] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-b-dp-2-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [1.72] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-b-dp-2-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [1.97] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-b-dp-2-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.70] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-b-dp-2-y210:
    - Statuses : 1 pass(s)
    - Exec time: [1.73] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-b-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.53] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-b-edp-1-nv12:
    - Statuses : 2 pass(s)
    - Exec time: [2.21, 2.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-b-edp-1-p010:
    - Statuses : 2 pass(s)
    - Exec time: [2.20, 2.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-b-edp-1-rgb565:
    - Statuses : 2 pass(s)
    - Exec time: [2.34, 2.43] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-b-edp-1-xrgb16161616f:
    - Statuses : 2 pass(s)
    - Exec time: [2.21, 2.27] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-b-edp-1-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [2.16, 2.22] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-b-edp-1-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [2.32, 2.42] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-b-edp-1-xv30:
    - Statuses : 2 pass(s)
    - Exec time: [2.20, 2.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-b-edp-1-xv36:
    - Statuses : 2 pass(s)
    - Exec time: [2.21, 2.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-b-edp-1-xyuv8888:
    - Statuses : 2 pass(s)
    - Exec time: [2.19, 2.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-b-edp-1-y210:
    - Statuses : 2 pass(s)
    - Exec time: [2.21, 2.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-b-edp-1-yuyv:
    - Statuses : 2 pass(s)
    - Exec time: [2.20, 2.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-c-dp-2-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [1.47] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-c-dp-2-p010:
    - Statuses : 1 pass(s)
    - Exec time: [1.62] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-c-dp-2-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-c-dp-2-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [2.10] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-c-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [3.96] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-c-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-c-dp-2-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [1.72] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-c-dp-2-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [1.98] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-c-dp-2-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.70] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-c-dp-2-y210:
    - Statuses : 1 pass(s)
    - Exec time: [1.66] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-c-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.49] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-c-edp-1-nv12:
    - Statuses : 2 pass(s)
    - Exec time: [2.21, 2.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-c-edp-1-p010:
    - Statuses : 2 pass(s)
    - Exec time: [2.20, 2.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-c-edp-1-rgb565:
    - Statuses : 2 pass(s)
    - Exec time: [2.28, 2.36] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-c-edp-1-xrgb16161616f:
    - Statuses : 2 pass(s)
    - Exec time: [2.21, 2.28] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-c-edp-1-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [2.20, 2.21] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-c-edp-1-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [2.28, 2.30] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-c-edp-1-xv30:
    - Statuses : 2 pass(s)
    - Exec time: [2.20, 2.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-c-edp-1-xv36:
    - Statuses : 2 pass(s)
    - Exec time: [2.20, 2.28] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-c-edp-1-xyuv8888:
    - Statuses : 2 pass(s)
    - Exec time: [2.21, 2.27] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-c-edp-1-y210:
    - Statuses : 2 pass(s)
    - Exec time: [2.21, 2.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-c-edp-1-yuyv:
    - Statuses : 2 pass(s)
    - Exec time: [2.20, 2.28] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-d-dp-2-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [1.47] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-d-dp-2-p010:
    - Statuses : 1 pass(s)
    - Exec time: [1.58] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-d-dp-2-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [1.30] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-d-dp-2-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [2.07] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-d-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [3.96] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-d-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-d-dp-2-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [1.73] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-d-dp-2-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [2.09] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-d-dp-2-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.72] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-d-dp-2-y210:
    - Statuses : 1 pass(s)
    - Exec time: [1.71] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-d-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.51] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-d-edp-1-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [2.20] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-d-edp-1-p010:
    - Statuses : 1 pass(s)
    - Exec time: [2.21] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-d-edp-1-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [2.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-d-edp-1-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [2.21] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-d-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.21] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-d-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [2.31] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-d-edp-1-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [2.20] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-d-edp-1-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [2.21] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-d-edp-1-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [2.20] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-d-edp-1-y210:
    - Statuses : 1 pass(s)
    - Exec time: [2.21] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-d-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [2.20] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.04, 79.21] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-a-dp-2-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [1.46] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-a-dp-2-p010:
    - Statuses : 1 pass(s)
    - Exec time: [1.59] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-a-dp-2-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [1.35] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-a-dp-2-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [2.07] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-a-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [3.62] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-a-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-a-dp-2-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [1.66] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-a-dp-2-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [1.98] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-a-dp-2-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.67] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-a-dp-2-y210:
    - Statuses : 1 pass(s)
    - Exec time: [1.65] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-a-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.48] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-b-dp-2-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [1.45] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-b-dp-2-p010:
    - Statuses : 1 pass(s)
    - Exec time: [1.61] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-b-dp-2-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-b-dp-2-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [1.98] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-b-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [3.61] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-b-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-b-dp-2-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [1.66] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-b-dp-2-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [2.0] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-b-dp-2-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.68] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-b-dp-2-y210:
    - Statuses : 1 pass(s)
    - Exec time: [1.65] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-b-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.49] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-c-dp-2-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [1.47] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-c-dp-2-p010:
    - Statuses : 1 pass(s)
    - Exec time: [1.60] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-c-dp-2-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-c-dp-2-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [1.96] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-c-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [3.61] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-c-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-c-dp-2-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [1.66] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-c-dp-2-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [1.99] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-c-dp-2-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.66] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-c-dp-2-y210:
    - Statuses : 1 pass(s)
    - Exec time: [1.65] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-c-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.48] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-d-dp-2-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [1.46] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-d-dp-2-p010:
    - Statuses : 1 pass(s)
    - Exec time: [1.58] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-d-dp-2-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [1.31] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-d-dp-2-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [1.97] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-d-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [3.62] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-d-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-d-dp-2-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [1.66] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-d-dp-2-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [1.98] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-d-dp-2-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.66] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-d-dp-2-y210:
    - Statuses : 1 pass(s)
    - Exec time: [1.67] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-d-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.51] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-y-tiled:
    - Statuses : 3 skip(s)
    - Exec time: [0.01, 0.05] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-yf-tiled:
    - Statuses : 1 skip(s)
    - Exec time: [0.02] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-270-y-tiled:
    - Statuses : 3 skip(s)
    - Exec time: [0.02, 0.05] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-90-y-tiled:
    - Statuses : 3 skip(s)
    - Exec time: [0.02, 0.05] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled:
    - Statuses : 1 fail(s) 1 pass(s) 1 skip(s)
    - Exec time: [0.02, 79.92] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-2-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [1.48] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.63] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-2-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [1.35] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-2-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [2.10] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [3.62] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-2-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [1.66] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-2-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [1.99] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-2-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.68] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-2-y210:
    - Statuses : 1 pass(s)
    - Exec time: [1.67] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.50] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [2.27] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-p010:
    - Statuses : 1 pass(s)
    - Exec time: [2.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [2.45] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [2.27] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.25] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [2.38] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [2.30] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [2.27] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [2.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-y210:
    - Statuses : 1 pass(s)
    - Exec time: [2.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [2.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-dp-2-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [1.46] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.62] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-dp-2-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-dp-2-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [1.97] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [3.62] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-dp-2-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [1.69] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-dp-2-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [1.98] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-dp-2-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.67] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-dp-2-y210:
    - Statuses : 1 pass(s)
    - Exec time: [1.66] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.51] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-edp-1-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [2.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-edp-1-p010:
    - Statuses : 1 pass(s)
    - Exec time: [2.28] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-edp-1-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [2.42] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-edp-1-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [2.28] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.23] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [2.38] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-edp-1-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [2.28] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-edp-1-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [2.28] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-edp-1-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [2.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-edp-1-y210:
    - Statuses : 1 pass(s)
    - Exec time: [2.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [2.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-dp-2-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [1.48] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.59] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-dp-2-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-dp-2-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [1.97] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [3.62] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-dp-2-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [1.70] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-dp-2-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [2.06] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-dp-2-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.70] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-dp-2-y210:
    - Statuses : 1 pass(s)
    - Exec time: [1.70] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.49] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-edp-1-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [2.27] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-edp-1-p010:
    - Statuses : 1 pass(s)
    - Exec time: [2.31] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-edp-1-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [2.35] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-edp-1-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [2.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.19] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [2.29] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-edp-1-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [2.20] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-edp-1-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [2.28] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-edp-1-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [2.28] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-edp-1-y210:
    - Statuses : 1 pass(s)
    - Exec time: [2.27] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [2.28] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-dp-2-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [1.48] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.63] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-dp-2-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-dp-2-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [2.04] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [3.62] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-dp-2-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [1.68] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-dp-2-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [1.99] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-dp-2-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.68] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-dp-2-y210:
    - Statuses : 1 pass(s)
    - Exec time: [1.66] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.52] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled:
    - Statuses : 3 skip(s)
    - Exec time: [0.02, 0.06] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-yf-tiled:
    - Statuses : 3 skip(s)
    - Exec time: [0.02, 0.05] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled:
    - Statuses : 3 pass(s)
    - Exec time: [62.17, 93.87] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-dp-2-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-dp-2-p010:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-dp-2-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-dp-2-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [1.44] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.74] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-dp-2-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [1.37] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-dp-2-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [1.47] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-dp-2-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-dp-2-y210:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.35] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-edp-1-nv12:
    - Statuses : 2 pass(s)
    - Exec time: [2.10, 2.16] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-edp-1-p010:
    - Statuses : 2 pass(s)
    - Exec time: [2.10, 2.19] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-edp-1-rgb565:
    - Statuses : 2 pass(s)
    - Exec time: [2.29, 2.34] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-edp-1-xrgb16161616f:
    - Statuses : 2 pass(s)
    - Exec time: [2.11, 2.18] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-edp-1-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [2.11, 2.14] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-edp-1-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [2.30] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-edp-1-xv30:
    - Statuses : 2 pass(s)
    - Exec time: [2.10, 2.18] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-edp-1-xv36:
    - Statuses : 2 pass(s)
    - Exec time: [2.11, 2.18] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-edp-1-xyuv8888:
    - Statuses : 2 pass(s)
    - Exec time: [2.11, 2.17] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-edp-1-y210:
    - Statuses : 2 pass(s)
    - Exec time: [2.11, 2.17] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-edp-1-yuyv:
    - Statuses : 2 pass(s)
    - Exec time: [2.11, 2.19] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-b-dp-2-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [1.35] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-b-dp-2-p010:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-b-dp-2-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-b-dp-2-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [1.44] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-b-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.74] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-b-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-b-dp-2-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-b-dp-2-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [1.42] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-b-dp-2-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-b-dp-2-y210:
    - Statuses : 1 pass(s)
    - Exec time: [1.40] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-b-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-b-edp-1-nv12:
    - Statuses : 2 pass(s)
    - Exec time: [2.10, 2.19] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-b-edp-1-p010:
    - Statuses : 2 pass(s)
    - Exec time: [2.10, 2.17] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-b-edp-1-rgb565:
    - Statuses : 2 pass(s)
    - Exec time: [2.26, 2.33] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-b-edp-1-xrgb16161616f:
    - Statuses : 2 pass(s)
    - Exec time: [2.11, 2.18] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-b-edp-1-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [2.14, 2.15] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-b-edp-1-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [2.28, 2.31] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-b-edp-1-xv30:
    - Statuses : 2 pass(s)
    - Exec time: [2.12, 2.19] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-b-edp-1-xv36:
    - Statuses : 2 pass(s)
    - Exec time: [2.10, 2.17] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-b-edp-1-xyuv8888:
    - Statuses : 2 pass(s)
    - Exec time: [2.10, 2.19] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-b-edp-1-y210:
    - Statuses : 2 pass(s)
    - Exec time: [2.10, 2.17] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-b-edp-1-yuyv:
    - Statuses : 2 pass(s)
    - Exec time: [2.08, 2.19] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-c-dp-2-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-c-dp-2-p010:
    - Statuses : 1 pass(s)
    - Exec time: [1.37] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-c-dp-2-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-c-dp-2-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [1.45] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-c-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.75] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-c-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-c-dp-2-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-c-dp-2-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [1.44] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-c-dp-2-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.37] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-c-dp-2-y210:
    - Statuses : 1 pass(s)
    - Exec time: [1.37] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-c-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.35] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-c-edp-1-nv12:
    - Statuses : 2 pass(s)
    - Exec time: [2.11, 2.17] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-c-edp-1-p010:
    - Statuses : 2 pass(s)
    - Exec time: [2.10, 2.18] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-c-edp-1-rgb565:
    - Statuses : 2 pass(s)
    - Exec time: [2.20, 2.32] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-c-edp-1-xrgb16161616f:
    - Statuses : 2 pass(s)
    - Exec time: [2.11, 2.20] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-c-edp-1-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [2.09, 2.17] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-c-edp-1-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [2.19, 2.29] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-c-edp-1-xv30:
    - Statuses : 2 pass(s)
    - Exec time: [2.10, 2.18] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-c-edp-1-xv36:
    - Statuses : 2 pass(s)
    - Exec time: [2.10, 2.18] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-c-edp-1-xyuv8888:
    - Statuses : 2 pass(s)
    - Exec time: [2.10] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-c-edp-1-y210:
    - Statuses : 2 pass(s)
    - Exec time: [2.11, 2.17] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-c-edp-1-yuyv:
    - Statuses : 2 pass(s)
    - Exec time: [2.10, 2.17] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-d-dp-2-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [1.35] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-d-dp-2-p010:
    - Statuses : 1 pass(s)
    - Exec time: [1.37] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-d-dp-2-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-d-dp-2-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [1.45] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-d-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.75] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-d-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-d-dp-2-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-d-dp-2-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [1.43] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-d-dp-2-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-d-dp-2-y210:
    - Statuses : 1 pass(s)
    - Exec time: [1.37] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-d-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.35] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-d-edp-1-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [2.11] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-d-edp-1-p010:
    - Statuses : 1 pass(s)
    - Exec time: [2.10] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-d-edp-1-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [2.23] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-d-edp-1-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [2.11] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-d-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.08] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-d-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [2.20] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-d-edp-1-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [2.10] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-d-edp-1-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [2.10] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-d-edp-1-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [2.10] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-d-edp-1-y210:
    - Statuses : 1 pass(s)
    - Exec time: [2.11] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-d-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [2.10] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear:
    - Statuses : 3 pass(s)
    - Exec time: [62.62, 93.84] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-dp-2-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-dp-2-p010:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-dp-2-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-dp-2-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [1.45] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.99] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-dp-2-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-dp-2-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [1.47] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-dp-2-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-dp-2-y210:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-edp-1-nv12:
    - Statuses : 2 pass(s)
    - Exec time: [2.12, 2.18] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-edp-1-p010:
    - Statuses : 2 pass(s)
    - Exec time: [2.09, 2.19] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-edp-1-rgb565:
    - Statuses : 2 pass(s)
    - Exec time: [2.28, 2.29] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-edp-1-xrgb16161616f:
    - Statuses : 2 pass(s)
    - Exec time: [2.12, 2.18] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-edp-1-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [2.12, 2.13] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-edp-1-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [2.28, 2.31] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-edp-1-xv30:
    - Statuses : 2 pass(s)
    - Exec time: [2.12, 2.19] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-edp-1-xv36:
    - Statuses : 2 pass(s)
    - Exec time: [2.10, 2.19] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-edp-1-xyuv8888:
    - Statuses : 2 pass(s)
    - Exec time: [2.10, 2.19] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-edp-1-y210:
    - Statuses : 2 pass(s)
    - Exec time: [2.11, 2.18] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-edp-1-yuyv:
    - Statuses : 2 pass(s)
    - Exec time: [2.10, 2.18] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-b-dp-2-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-b-dp-2-p010:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-b-dp-2-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [1.31] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-b-dp-2-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [1.46] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-b-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.98] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-b-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.30] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-b-dp-2-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-b-dp-2-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [1.45] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-b-dp-2-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.37] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-b-dp-2-y210:
    - Statuses : 1 pass(s)
    - Exec time: [1.37] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-b-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.35] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-b-edp-1-nv12:
    - Statuses : 2 pass(s)
    - Exec time: [2.10, 2.17] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-b-edp-1-p010:
    - Statuses : 2 pass(s)
    - Exec time: [2.10, 2.18] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-b-edp-1-rgb565:
    - Statuses : 2 pass(s)
    - Exec time: [2.26, 2.33] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-b-edp-1-xrgb16161616f:
    - Statuses : 2 pass(s)
    - Exec time: [2.11, 2.18] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-b-edp-1-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [2.12, 2.13] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-b-edp-1-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [2.29, 2.31] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-b-edp-1-xv30:
    - Statuses : 2 pass(s)
    - Exec time: [2.10, 2.19] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-b-edp-1-xv36:
    - Statuses : 2 pass(s)
    - Exec time: [2.10, 2.19] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-b-edp-1-xyuv8888:
    - Statuses : 2 pass(s)
    - Exec time: [2.10, 2.18] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-b-edp-1-y210:
    - Statuses : 2 pass(s)
    - Exec time: [2.10, 2.18] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-b-edp-1-yuyv:
    - Statuses : 2 pass(s)
    - Exec time: [2.10, 2.21] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-c-dp-2-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-c-dp-2-p010:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-c-dp-2-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [1.31] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-c-dp-2-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [1.44] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-c-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.00] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-c-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.31] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-c-dp-2-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [1.35] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-c-dp-2-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [1.47] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-c-dp-2-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.37] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-c-dp-2-y210:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-c-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-c-edp-1-nv12:
    - Statuses : 2 pass(s)
    - Exec time: [2.10, 2.18] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-c-edp-1-p010:
    - Statuses : 2 pass(s)
    - Exec time: [2.10, 2.20] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-c-edp-1-rgb565:
    - Statuses : 2 pass(s)
    - Exec time: [2.22, 2.29] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-c-edp-1-xrgb16161616f:
    - Statuses : 2 pass(s)
    - Exec time: [2.11, 2.18] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-c-edp-1-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [2.08, 2.16] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-c-edp-1-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [2.21, 2.28] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-c-edp-1-xv30:
    - Statuses : 2 pass(s)
    - Exec time: [2.11, 2.18] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-c-edp-1-xv36:
    - Statuses : 2 pass(s)
    - Exec time: [2.09, 2.19] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-c-edp-1-xyuv8888:
    - Statuses : 2 pass(s)
    - Exec time: [2.09, 2.19] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-c-edp-1-y210:
    - Statuses : 2 pass(s)
    - Exec time: [2.10, 2.17] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-c-edp-1-yuyv:
    - Statuses : 2 pass(s)
    - Exec time: [2.11, 2.18] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-d-dp-2-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-d-dp-2-p010:
    - Statuses : 1 pass(s)
    - Exec time: [1.37] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-d-dp-2-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [1.30] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-d-dp-2-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [1.45] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-d-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.75] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-d-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-d-dp-2-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [1.37] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-d-dp-2-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [1.44] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-d-dp-2-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-d-dp-2-y210:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-d-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-d-edp-1-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [2.11] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-d-edp-1-p010:
    - Statuses : 1 pass(s)
    - Exec time: [2.10] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-d-edp-1-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [2.23] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-d-edp-1-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [2.10] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-d-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.09] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-d-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [2.19] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-d-edp-1-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [2.11] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-d-edp-1-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [2.10] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-d-edp-1-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [2.10] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-d-edp-1-y210:
    - Statuses : 1 pass(s)
    - Exec time: [2.09] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-d-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [2.10] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled:
    - Statuses : 3 pass(s)
    - Exec time: [62.35, 93.81] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-a-dp-2-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [1.30] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-a-dp-2-p010:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-a-dp-2-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-a-dp-2-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [1.48] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-a-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.99] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-a-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.30] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-a-dp-2-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-a-dp-2-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [1.47] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-a-dp-2-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-a-dp-2-y210:
    - Statuses : 1 pass(s)
    - Exec time: [1.37] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-a-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-a-edp-1-nv12:
    - Statuses : 2 pass(s)
    - Exec time: [2.10, 2.19] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-a-edp-1-p010:
    - Statuses : 2 pass(s)
    - Exec time: [2.11, 2.19] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-a-edp-1-rgb565:
    - Statuses : 2 pass(s)
    - Exec time: [2.25, 2.27] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-a-edp-1-xrgb16161616f:
    - Statuses : 2 pass(s)
    - Exec time: [2.12, 2.19] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-a-edp-1-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [2.11, 2.13] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-a-edp-1-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [2.28, 2.31] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-a-edp-1-xv30:
    - Statuses : 2 pass(s)
    - Exec time: [2.11, 2.17] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-a-edp-1-xv36:
    - Statuses : 2 pass(s)
    - Exec time: [2.10, 2.19] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-a-edp-1-xyuv8888:
    - Statuses : 2 pass(s)
    - Exec time: [2.10, 2.19] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-a-edp-1-y210:
    - Statuses : 2 pass(s)
    - Exec time: [2.11, 2.18] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-a-edp-1-yuyv:
    - Statuses : 2 pass(s)
    - Exec time: [2.10, 2.17] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-b-dp-2-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-b-dp-2-p010:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-b-dp-2-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [1.31] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-b-dp-2-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [1.44] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-b-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.99] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-b-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.31] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-b-dp-2-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-b-dp-2-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [1.45] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-b-dp-2-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.37] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-b-dp-2-y210:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-b-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-b-edp-1-nv12:
    - Statuses : 2 pass(s)
    - Exec time: [2.10, 2.18] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-b-edp-1-p010:
    - Statuses : 2 pass(s)
    - Exec time: [2.11, 2.19] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-b-edp-1-rgb565:
    - Statuses : 2 pass(s)
    - Exec time: [2.27, 2.35] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-b-edp-1-xrgb16161616f:
    - Statuses : 2 pass(s)
    - Exec time: [2.11, 2.19] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-b-edp-1-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [2.10, 2.14] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-b-edp-1-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [2.29, 2.31] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-b-edp-1-xv30:
    - Statuses : 2 pass(s)
    - Exec time: [2.10, 2.19] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-b-edp-1-xv36:
    - Statuses : 2 pass(s)
    - Exec time: [2.10, 2.18] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-b-edp-1-xyuv8888:
    - Statuses : 2 pass(s)
    - Exec time: [2.09, 2.17] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-b-edp-1-y210:
    - Statuses : 2 pass(s)
    - Exec time: [2.10, 2.17] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-b-edp-1-yuyv:
    - Statuses : 2 pass(s)
    - Exec time: [2.10, 2.17] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-c-dp-2-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [1.35] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-c-dp-2-p010:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-c-dp-2-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [1.31] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-c-dp-2-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [1.46] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-c-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.75] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-c-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.30] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-c-dp-2-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-c-dp-2-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [1.44] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-c-dp-2-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-c-dp-2-y210:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-c-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-c-edp-1-nv12:
    - Statuses : 2 pass(s)
    - Exec time: [2.10, 2.19] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-c-edp-1-p010:
    - Statuses : 2 pass(s)
    - Exec time: [2.11, 2.17] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-c-edp-1-rgb565:
    - Statuses : 2 pass(s)
    - Exec time: [2.21, 2.28] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-c-edp-1-xrgb16161616f:
    - Statuses : 2 pass(s)
    - Exec time: [2.10, 2.19] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-c-edp-1-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [2.10, 2.15] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-c-edp-1-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [2.20, 2.29] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-c-edp-1-xv30:
    - Statuses : 2 pass(s)
    - Exec time: [2.12, 2.16] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-c-edp-1-xv36:
    - Statuses : 2 pass(s)
    - Exec time: [2.10, 2.18] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-c-edp-1-xyuv8888:
    - Statuses : 2 pass(s)
    - Exec time: [2.10, 2.19] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-c-edp-1-y210:
    - Statuses : 2 pass(s)
    - Exec time: [2.10, 2.19] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-c-edp-1-yuyv:
    - Statuses : 2 pass(s)
    - Exec time: [2.10, 2.18] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-d-dp-2-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-d-dp-2-p010:
    - Statuses : 1 pass(s)
    - Exec time: [1.35] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-d-dp-2-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [1.30] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-d-dp-2-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [1.46] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-d-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.76] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-d-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.30] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-d-dp-2-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-d-dp-2-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [1.42] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-d-dp-2-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-d-dp-2-y210:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-d-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-d-edp-1-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [2.10] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-d-edp-1-p010:
    - Statuses : 1 pass(s)
    - Exec time: [2.10] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-d-edp-1-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [2.22] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-d-edp-1-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [2.10] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-d-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.08] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-d-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [2.21] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-d-edp-1-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [2.11] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-d-edp-1-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [2.10] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-d-edp-1-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [2.10] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-d-edp-1-y210:
    - Statuses : 1 pass(s)
    - Exec time: [2.10] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-d-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [2.10] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear:
    - Statuses : 3 pass(s)
    - Exec time: [62.36, 93.85] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-a-dp-2-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [1.35] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-a-dp-2-p010:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-a-dp-2-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [1.35] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-a-dp-2-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [1.45] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-a-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.75] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-a-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-a-dp-2-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-a-dp-2-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [1.45] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-a-dp-2-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-a-dp-2-y210:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-a-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-a-edp-1-nv12:
    - Statuses : 2 pass(s)
    - Exec time: [2.11, 2.19] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-a-edp-1-p010:
    - Statuses : 2 pass(s)
    - Exec time: [2.10, 2.18] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-a-edp-1-rgb565:
    - Statuses : 2 pass(s)
    - Exec time: [2.29, 2.30] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-a-edp-1-xrgb16161616f:
    - Statuses : 2 pass(s)
    - Exec time: [2.10, 2.18] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-a-edp-1-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [2.12, 2.14] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-a-edp-1-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [2.28, 2.30] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-a-edp-1-xv30:
    - Statuses : 2 pass(s)
    - Exec time: [2.09, 2.17] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-a-edp-1-xv36:
    - Statuses : 2 pass(s)
    - Exec time: [2.11, 2.20] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-a-edp-1-xyuv8888:
    - Statuses : 2 pass(s)
    - Exec time: [2.11, 2.19] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-a-edp-1-y210:
    - Statuses : 2 pass(s)
    - Exec time: [2.10, 2.18] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-a-edp-1-yuyv:
    - Statuses : 2 pass(s)
    - Exec time: [2.10, 2.18] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-b-dp-2-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-b-dp-2-p010:
    - Statuses : 1 pass(s)
    - Exec time: [1.37] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-b-dp-2-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-b-dp-2-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [1.45] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-b-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.75] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-b-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-b-dp-2-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-b-dp-2-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [1.44] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-b-dp-2-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-b-dp-2-y210:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-b-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-b-edp-1-nv12:
    - Statuses : 2 pass(s)
    - Exec time: [2.10, 2.18] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-b-edp-1-p010:
    - Statuses : 2 pass(s)
    - Exec time: [2.11, 2.18] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-b-edp-1-rgb565:
    - Statuses : 2 pass(s)
    - Exec time: [2.27, 2.34] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-b-edp-1-xrgb16161616f:
    - Statuses : 2 pass(s)
    - Exec time: [2.10, 2.17] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-b-edp-1-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [2.12, 2.13] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-b-edp-1-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [2.28, 2.31] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-b-edp-1-xv30:
    - Statuses : 2 pass(s)
    - Exec time: [2.10, 2.18] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-b-edp-1-xv36:
    - Statuses : 2 pass(s)
    - Exec time: [2.11, 2.19] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-b-edp-1-xyuv8888:
    - Statuses : 2 pass(s)
    - Exec time: [2.11, 2.19] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-b-edp-1-y210:
    - Statuses : 2 pass(s)
    - Exec time: [2.10, 2.18] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-b-edp-1-yuyv:
    - Statuses : 2 pass(s)
    - Exec time: [2.10, 2.18] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-c-dp-2-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-c-dp-2-p010:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-c-dp-2-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-c-dp-2-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [1.45] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-c-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.75] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-c-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-c-dp-2-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-c-dp-2-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [1.44] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-c-dp-2-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.40] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-c-dp-2-y210:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-c-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-c-edp-1-nv12:
    - Statuses : 2 pass(s)
    - Exec time: [2.12, 2.18] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-c-edp-1-p010:
    - Statuses : 2 pass(s)
    - Exec time: [2.10, 2.19] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-c-edp-1-rgb565:
    - Statuses : 2 pass(s)
    - Exec time: [2.22, 2.30] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-c-edp-1-xrgb16161616f:
    - Statuses : 2 pass(s)
    - Exec time: [2.10, 2.19] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-c-edp-1-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [2.09, 2.17] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-c-edp-1-xrgb8888:
    - Statuses : 2 pass(s)
    - Exec time: [2.20, 2.29] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-c-edp-1-xv30:
    - Statuses : 2 pass(s)
    - Exec time: [2.10, 2.19] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-c-edp-1-xv36:
    - Statuses : 2 pass(s)
    - Exec time: [2.10, 2.19] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-c-edp-1-xyuv8888:
    - Statuses : 2 pass(s)
    - Exec time: [2.10] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-c-edp-1-y210:
    - Statuses : 2 pass(s)
    - Exec time: [2.10, 2.15] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-c-edp-1-yuyv:
    - Statuses : 2 pass(s)
    - Exec time: [2.09, 2.18] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-d-dp-2-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-d-dp-2-p010:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-d-dp-2-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-d-dp-2-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [1.45] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-d-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.76] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-d-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-d-dp-2-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-d-dp-2-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [1.46] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-d-dp-2-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-d-dp-2-y210:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-d-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-d-edp-1-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [2.10] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-d-edp-1-p010:
    - Statuses : 1 pass(s)
    - Exec time: [2.10] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-d-edp-1-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [2.21] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-d-edp-1-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [2.10] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-d-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.10] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-d-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [2.20] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-d-edp-1-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [2.11] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-d-edp-1-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [2.10] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-d-edp-1-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [2.11] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-d-edp-1-y210:
    - Statuses : 1 pass(s)
    - Exec time: [2.10] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-d-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [2.11] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled:
    - Statuses : 1 fail(s) 1 pass(s) 1 skip(s)
    - Exec time: [0.02, 72.56] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-a-dp-2-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-a-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.45] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-a-dp-2-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-a-dp-2-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [1.48] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-a-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.75] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-a-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-a-dp-2-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [1.40] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-a-dp-2-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [1.45] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-a-dp-2-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-a-dp-2-y210:
    - Statuses : 1 pass(s)
    - Exec time: [1.41] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-a-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-a-edp-1-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [2.18] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-a-edp-1-p010:
    - Statuses : 1 pass(s)
    - Exec time: [2.19] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-a-edp-1-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [2.30] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-a-edp-1-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [2.20] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-a-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.12] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-a-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [2.28] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-a-edp-1-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [2.17] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-a-edp-1-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [2.19] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-a-edp-1-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [2.19] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-a-edp-1-y210:
    - Statuses : 1 pass(s)
    - Exec time: [2.18] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-a-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [2.17] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-b-dp-2-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [1.35] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-b-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.42] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-b-dp-2-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-b-dp-2-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [1.44] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-b-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.74] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-b-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-b-dp-2-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-b-dp-2-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [1.47] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-b-dp-2-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.40] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-b-dp-2-y210:
    - Statuses : 1 pass(s)
    - Exec time: [1.40] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-b-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-b-edp-1-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [2.19] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-b-edp-1-p010:
    - Statuses : 1 pass(s)
    - Exec time: [2.18] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-b-edp-1-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [2.35] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-b-edp-1-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [2.19] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-b-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.12] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-b-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [2.28] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-b-edp-1-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [2.19] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-b-edp-1-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [2.15] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-b-edp-1-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [2.17] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-b-edp-1-y210:
    - Statuses : 1 pass(s)
    - Exec time: [2.19] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-b-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [2.18] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-c-dp-2-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-c-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.42] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-c-dp-2-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-c-dp-2-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [1.44] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-c-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.75] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-c-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-c-dp-2-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [1.41] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-c-dp-2-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [1.43] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-c-dp-2-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.40] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-c-dp-2-y210:
    - Statuses : 1 pass(s)
    - Exec time: [1.40] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-c-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-c-edp-1-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [2.19] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-c-edp-1-p010:
    - Statuses : 1 pass(s)
    - Exec time: [2.18] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-c-edp-1-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [2.21] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-c-edp-1-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [2.19] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-c-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.15] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-c-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [2.29] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-c-edp-1-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [2.17] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-c-edp-1-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [2.19] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-c-edp-1-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [2.20] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-c-edp-1-y210:
    - Statuses : 1 pass(s)
    - Exec time: [2.18] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-c-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [2.17] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-d-dp-2-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [1.35] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-d-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.41] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-d-dp-2-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-d-dp-2-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [1.44] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-d-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.75] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-d-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-d-dp-2-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [1.40] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-d-dp-2-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [1.44] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-d-dp-2-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-d-dp-2-y210:
    - Statuses : 1 pass(s)
    - Exec time: [1.41] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-d-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.35] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-y-tiled:
    - Statuses : 3 skip(s)
    - Exec time: [0.02, 0.06] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-yf-tiled:
    - Statuses : 3 skip(s)
    - Exec time: [0.04, 0.06] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-270-y-tiled:
    - Statuses : 3 skip(s)
    - Exec time: [0.02, 0.05] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-90-y-tiled:
    - Statuses : 3 skip(s)
    - Exec time: [0.02, 0.05] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.05, 72.76] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-p010:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [1.48] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.74] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [1.45] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-y210:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.35] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-1-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [2.24] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-1-p010:
    - Statuses : 1 pass(s)
    - Exec time: [2.17] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-1-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [2.34] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-1-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [2.19] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.12] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [2.34] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-1-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [2.17] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-1-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [2.19] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-1-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [2.19] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-1-y210:
    - Statuses : 1 pass(s)
    - Exec time: [2.13] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [2.19] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-dp-2-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [1.35] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-dp-2-p010:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-dp-2-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [1.31] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-dp-2-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [1.44] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.75] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-dp-2-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-dp-2-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [1.45] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-dp-2-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.40] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-dp-2-y210:
    - Statuses : 1 pass(s)
    - Exec time: [1.37] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-edp-1-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [2.18] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-edp-1-p010:
    - Statuses : 1 pass(s)
    - Exec time: [2.17] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-edp-1-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [2.35] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-edp-1-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [2.18] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.14] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [2.27] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-edp-1-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [2.17] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-edp-1-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [2.19] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-edp-1-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [2.18] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-edp-1-y210:
    - Statuses : 1 pass(s)
    - Exec time: [2.20] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [2.17] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-dp-2-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [1.35] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-dp-2-p010:
    - Statuses : 1 pass(s)
    - Exec time: [1.37] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-dp-2-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-dp-2-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [1.45] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.74] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-dp-2-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-dp-2-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [1.45] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-dp-2-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-dp-2-y210:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.35] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-edp-1-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [2.19] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-edp-1-p010:
    - Statuses : 1 pass(s)
    - Exec time: [2.17] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-edp-1-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [2.31] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-edp-1-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [2.18] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.17] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [2.28] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-edp-1-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [2.18] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-edp-1-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [2.19] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-edp-1-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [2.19] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-edp-1-y210:
    - Statuses : 1 pass(s)
    - Exec time: [2.18] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [2.17] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-d-dp-2-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [1.35] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-d-dp-2-p010:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-d-dp-2-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [1.31] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-d-dp-2-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [1.46] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-d-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.75] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-d-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-d-dp-2-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [1.40] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-d-dp-2-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [1.45] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-d-dp-2-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.40] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-d-dp-2-y210:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-d-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-y-tiled:
    - Statuses : 1 skip(s)
    - Exec time: [0.05] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-yf-tiled:
    - Statuses : 2 skip(s)
    - Exec time: [0.05] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_16071_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [PASS][5] -> [FAIL][6] ([Intel XE#3718] / [Intel XE#6078])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][7] ([Intel XE#6078])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-ptl:          NOTRUN -> [SKIP][8] ([Intel XE#5808]) +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-ptl-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#1124])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-lnl-7/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_bw@linear-tiling-1-displays-target-2160x1440p:
    - shard-bmg:          [PASS][10] -> [SKIP][11] ([Intel XE#367])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-2160x1440p.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-target-2160x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-target-2560x1440p:
    - shard-ptl:          NOTRUN -> [SKIP][12] ([Intel XE#367])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-ptl-5/igt@kms_bw@linear-tiling-3-displays-target-2560x1440p.html
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#367])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-bmg-4/igt@kms_bw@linear-tiling-3-displays-target-2560x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#2887])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-lnl-8/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2:
    - shard-bmg:          [PASS][15] -> [INCOMPLETE][16] ([Intel XE#7084] / [Intel XE#8150]) +1 other test incomplete
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-dp-1:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2652]) +7 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-dp-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:
    - shard-ptl:          NOTRUN -> [SKIP][18] ([Intel XE#5822]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-ptl-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2887])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#7358])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-lnl-7/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html

  * igt@kms_chamelium_edid@dp-mode-timings:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2252]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-bmg-5/igt@kms_chamelium_edid@dp-mode-timings.html
    - shard-ptl:          NOTRUN -> [SKIP][22] ([Intel XE#2252])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-ptl-6/igt@kms_chamelium_edid@dp-mode-timings.html

  * igt@kms_color_pipeline@plane-lut3d-green-only:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#6969] / [Intel XE#7006]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-lnl-5/igt@kms_color_pipeline@plane-lut3d-green-only.html

  * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-4:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#6969]) +13 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-lnl-5/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-4.html

  * igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-1:
    - shard-bmg:          NOTRUN -> [FAIL][25] ([Intel XE#3304])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-bmg-7/igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-1.html

  * igt@kms_content_protection@srm:
    - shard-ptl:          NOTRUN -> [SKIP][26] ([Intel XE#7642])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-ptl-2/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-1:
    - shard-bmg:          NOTRUN -> [FAIL][27] ([Intel XE#6707] / [Intel XE#7439])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-bmg-7/igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-1.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-ptl:          NOTRUN -> [SKIP][28] ([Intel XE#5846])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-ptl-7/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-bmg:          [PASS][29] -> [FAIL][30] ([Intel XE#7809])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [PASS][31] -> [FAIL][32] ([Intel XE#301]) +1 other test fail
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#656] / [Intel XE#7905]) +5 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-render:
    - shard-ptl:          NOTRUN -> [SKIP][34] ([Intel XE#7061] / [Intel XE#7356])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-ptl-4/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary:
    - shard-ptl:          NOTRUN -> [SKIP][35] ([Intel XE#5800] / [Intel XE#6312]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-ptl-7/igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2311]) +3 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-bmg-2/igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#4141])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#6312] / [Intel XE#651]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#7061] / [Intel XE#7356])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-move:
    - shard-ptl:          NOTRUN -> [SKIP][40] ([Intel XE#6312]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-ptl-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#7061])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-render.html
    - shard-ptl:          NOTRUN -> [SKIP][42] ([Intel XE#7061])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-ptl-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-stridechange:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#6312])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-stridechange.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#7865]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-lnl-8/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#7905]) +4 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-lnl-4/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> [SKIP][46] ([Intel XE#5812]) +12 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-ptl-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-blt:
    - shard-ptl:          NOTRUN -> [SKIP][47] ([Intel XE#7865]) +2 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-ptl-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2313]) +3 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#7061])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-lnl-2/igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-mmap-wc.html

  * igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery:
    - shard-ptl:          NOTRUN -> [SKIP][50] ([Intel XE#9312])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-ptl-8/igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-lnl-8/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#1489]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-bmg-4/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html
    - shard-ptl:          NOTRUN -> [SKIP][53] ([Intel XE#7304]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-ptl-6/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@pr-no-drrs:
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#1406]) +2 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-lnl-5/igt@kms_psr@pr-no-drrs.html

  * igt@kms_psr@pr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2234] / [Intel XE#2850])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-bmg-5/igt@kms_psr@pr-suspend.html
    - shard-ptl:          NOTRUN -> [SKIP][56] ([Intel XE#1406])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-ptl-6/igt@kms_psr@pr-suspend.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-ptl:          NOTRUN -> [SKIP][57] ([Intel XE#5821])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-ptl-6/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_vrr@cmrr-video-mode:
    - shard-ptl:          [PASS][58] -> [FAIL][59] ([Intel XE#9547]) +1 other test fail
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-ptl-4/igt@kms_vrr@cmrr-video-mode.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-ptl-6/igt@kms_vrr@cmrr-video-mode.html

  * igt@kms_vrr@flipline@pipe-a-edp-1:
    - shard-ptl:          NOTRUN -> [FAIL][60] ([Intel XE#4227] / [Intel XE#7397]) +1 other test fail
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-ptl-3/igt@kms_vrr@flipline@pipe-a-edp-1.html

  * igt@xe_evict@evict-beng-cm-threads-large:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#6540] / [Intel XE#688])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-lnl-7/igt@xe_evict@evict-beng-cm-threads-large.html

  * igt@xe_evict@evict-small-cm:
    - shard-ptl:          NOTRUN -> [SKIP][62] ([Intel XE#5764])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-ptl-4/igt@xe_evict@evict-small-cm.html

  * igt@xe_exec_balancer@once-parallel-userptr-invalidate-race:
    - shard-ptl:          NOTRUN -> [SKIP][63] ([Intel XE#7482]) +4 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-ptl-4/igt@xe_exec_balancer@once-parallel-userptr-invalidate-race.html

  * igt@xe_exec_balancer@twice-virtual-basic:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#7482]) +3 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-lnl-4/igt@xe_exec_balancer@twice-virtual-basic.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr:
    - shard-ptl:          NOTRUN -> [SKIP][65] ([Intel XE#5575] / [Intel XE#7484])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-ptl-4/igt@xe_exec_basic@multigpu-no-exec-userptr.html
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2322] / [Intel XE#7372])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-bmg-6/igt@xe_exec_basic@multigpu-no-exec-userptr.html

  * igt@xe_exec_fault_mode@atomic-many:
    - shard-bmg:          [PASS][67] -> [FAIL][68] ([Intel XE#8578])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-bmg-8/igt@xe_exec_fault_mode@atomic-many.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-bmg-6/igt@xe_exec_fault_mode@atomic-many.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind-imm:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#8374])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-lnl-2/igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind-imm.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind:
    - shard-ptl:          NOTRUN -> [SKIP][70] ([Intel XE#8374])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-ptl-6/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind.html

  * igt@xe_exec_multi_queue@few-execs-close-fd-smem:
    - shard-ptl:          NOTRUN -> [SKIP][71] ([Intel XE#8364]) +5 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-ptl-7/igt@xe_exec_multi_queue@few-execs-close-fd-smem.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#8364]) +8 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-lnl-5/igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd.html

  * igt@xe_exec_multi_queue@max-queues-preempt-mode-dyn-priority-smem:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#8364]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-bmg-9/igt@xe_exec_multi_queue@max-queues-preempt-mode-dyn-priority-smem.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#8378])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate-race:
    - shard-ptl:          NOTRUN -> [SKIP][75] ([Intel XE#8378]) +2 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-ptl-1/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate-race.html

  * igt@xe_gpgpu_fill@offset-4x4:
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#7954])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-lnl-5/igt@xe_gpgpu_fill@offset-4x4.html

  * igt@xe_multigpu_svm@mgpu-latency-copy-prefetch:
    - shard-ptl:          NOTRUN -> [SKIP][77] ([Intel XE#6964])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-ptl-3/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#6964])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-bmg-6/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html

  * igt@xe_page_reclaim@random:
    - shard-ptl:          NOTRUN -> [SKIP][79] ([Intel XE#7793])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-ptl-6/igt@xe_page_reclaim@random.html

  * igt@xe_peer2peer@read:
    - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#1061] / [Intel XE#7326] / [Intel XE#7353])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-lnl-5/igt@xe_peer2peer@read.html

  * igt@xe_pm@s2idle-exec-after:
    - shard-ptl:          [PASS][81] -> [ABORT][82] ([Intel XE#9362])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-ptl-4/igt@xe_pm@s2idle-exec-after.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-ptl-5/igt@xe_pm@s2idle-exec-after.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-lnl:          [PASS][83] -> [ABORT][84] ([Intel XE#9362])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-lnl-4/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm_residency@gt-c6-freeze@gt0:
    - shard-bmg:          [PASS][85] -> [FAIL][86] ([Intel XE#9254]) +1 other test fail
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-bmg-8/igt@xe_pm_residency@gt-c6-freeze@gt0.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-bmg-9/igt@xe_pm_residency@gt-c6-freeze@gt0.html

  * igt@xe_query@multigpu-query-config:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#944])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-bmg-2/igt@xe_query@multigpu-query-config.html
    - shard-ptl:          NOTRUN -> [SKIP][88] ([Intel XE#6019])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-ptl-1/igt@xe_query@multigpu-query-config.html

  * igt@xe_sriov_vram@vf-access-after-resize-up:
    - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#6376] / [Intel XE#7330] / [Intel XE#7422])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-lnl-2/igt@xe_sriov_vram@vf-access-after-resize-up.html

  
#### Possible fixes ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-lnl:          [FAIL][90] ([Intel XE#8628]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-lnl-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-lnl-5/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_flip@plain-flip-ts-check@a-hdmi-a3:
    - shard-bmg:          [FAIL][92] ([Intel XE#3098]) -> [PASS][93] +1 other test pass
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-bmg-5/igt@kms_flip@plain-flip-ts-check@a-hdmi-a3.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-bmg-3/igt@kms_flip@plain-flip-ts-check@a-hdmi-a3.html

  * igt@kms_hdmi_audio_bw@audio-bw-hblank160:
    - shard-bmg:          [FAIL][94] ([Intel XE#9313]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-bmg-7/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-bmg-2/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][96] ([Intel XE#1503]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-bmg-5/igt@kms_hdr@invalid-hdr.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-bmg-2/igt@kms_hdr@invalid-hdr.html

  * igt@kms_pm_dc@dc5-dpms-suspend-resume:
    - shard-lnl:          [FAIL][98] ([Intel XE#8399]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-lnl-4/igt@kms_pm_dc@dc5-dpms-suspend-resume.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-lnl-2/igt@kms_pm_dc@dc5-dpms-suspend-resume.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][100] ([Intel XE#6321] / [Intel XE#8355]) -> [PASS][101] +1 other test pass
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_pm@s4-mocs:
    - shard-lnl:          [DMESG-WARN][102] ([Intel XE#7727]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-lnl-7/igt@xe_pm@s4-mocs.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-lnl-2/igt@xe_pm@s4-mocs.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-ptl:          [ABORT][104] ([Intel XE#9362]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-ptl-2/igt@xe_pm@s4-multiple-execs.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-ptl-7/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-lnl:          [ABORT][106] ([Intel XE#9362]) -> [PASS][107] +1 other test pass
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-lnl-5/igt@xe_pm@s4-vm-bind-prefetch.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-lnl-8/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-bmg:          [FAIL][108] ([Intel XE#6569]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-bmg-1/igt@xe_sriov_flr@flr-vfs-parallel.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-bmg-3/igt@xe_sriov_flr@flr-vfs-parallel.html

  
#### Warnings ####

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-lnl:          [SKIP][110] ([Intel XE#1407]) -> [ABORT][111] ([Intel XE#4760])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-lnl-8/igt@kms_big_fb@linear-8bpp-rotate-270.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-lnl-4/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][112] ([Intel XE#2426] / [Intel XE#5848]) -> [FAIL][113] ([Intel XE#1729] / [Intel XE#7424])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][114] ([Intel XE#2509] / [Intel XE#7437]) -> [SKIP][115] ([Intel XE#2426] / [Intel XE#5848])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#5800]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800
  [Intel XE#5808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808
  [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
  [Intel XE#5821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5821
  [Intel XE#5822]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822
  [Intel XE#5846]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5846
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#6019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6019
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
  [Intel XE#7006]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326
  [Intel XE#7330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7330
  [Intel XE#7353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7422
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7809]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7809
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7954]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7954
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399
  [Intel XE#8578]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8578
  [Intel XE#8628]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8628
  [Intel XE#9254]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9254
  [Intel XE#9312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9312
  [Intel XE#9313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9313
  [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#9547]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9547


Build changes
-------------

  * IGT: IGT_9171 -> IGTPW_16071

  IGTPW_16071: 16071
  IGT_9171: 9171
  xe-6031-e650cd4c5bd5d3b068ed7a1eb3c55cde4386b355: e650cd4c5bd5d3b068ed7a1eb3c55cde4386b355

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/index.html

--===============8330882041720560004==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,01/10] lib/igt_fb: add igt_format_get_subsampling() function (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/177043/">https://patchwork.freedesktop.org/series/177043/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9171_FULL -&gt; XEIGTPW_16071_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_16071_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_16071_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_16071_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-dp-2-p010 (NEW):</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-bmg-9/igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-dp-2-p010.html">FAIL</a> +14 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-270-y-tiled (NEW):</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-bmg-8/igt@kms_plane_scaling@plane-downscale-max-crc-rotation-270-y-tiled.html">SKIP</a> +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-90-y-tiled (NEW):</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-lnl-2/igt@kms_plane_scaling@plane-downscale-max-crc-rotation-90-y-tiled.html">SKIP</a> +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled (NEW):</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-ptl-7/igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_9171_FULL and XEIGTPW_16071_FULL:</p>
<h3>New IGT tests (1003)</h3>
<ul>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled:</p>
<ul>
<li>Statuses : 1 fail(s) 2 pass(s)</li>
<li>Exec time: [75.45, 98.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.21, 2.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-p010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.20, 2.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-rgb565:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.38, 2.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-xrgb16161616f:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.21, 2.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.25, 2.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.39, 2.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-xv30:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.19, 2.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-xv36:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.20, 2.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-xyuv8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.21, 2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-y210:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.21, 2.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.19, 2.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-dp-2-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-dp-2-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-dp-2-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-dp-2-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-dp-2-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-dp-2-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.20, 2.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-edp-1-p010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.20, 2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-edp-1-rgb565:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.35, 2.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-edp-1-xrgb16161616f:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.21, 2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.17, 2.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.31, 2.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-edp-1-xv30:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.20, 2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-edp-1-xv36:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.21, 2.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-edp-1-xyuv8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.21, 2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-edp-1-y210:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.19, 2.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.20, 2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-dp-2-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-dp-2-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-dp-2-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-dp-2-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-dp-2-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-dp-2-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-edp-1-nv12:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.20, 2.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-edp-1-p010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.19, 2.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-edp-1-rgb565:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.27, 2.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-edp-1-xrgb16161616f:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.20, 2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.19, 2.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.30, 2.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-edp-1-xv30:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.20, 2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-edp-1-xv36:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.18, 2.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-edp-1-xyuv8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.18, 2.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-edp-1-y210:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.21, 2.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.22, 2.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-dp-2-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-dp-2-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-dp-2-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-dp-2-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-dp-2-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-dp-2-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-edp-1-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-edp-1-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-edp-1-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-edp-1-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-edp-1-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-edp-1-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-edp-1-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [75.85, 98.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-2-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-2-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-2-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-2-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-2-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-2-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-2-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.20, 2.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-edp-1-p010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.20, 2.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-edp-1-rgb565:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.41, 2.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-edp-1-xrgb16161616f:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.22, 2.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.23, 2.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.40, 2.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-edp-1-xv30:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.21, 2.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-edp-1-xv36:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.19, 2.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-edp-1-xyuv8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.19, 2.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-edp-1-y210:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.21, 2.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.21, 2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-2-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-2-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-2-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-2-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-2-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-2-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-2-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.20, 2.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-edp-1-p010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.21, 2.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-edp-1-rgb565:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.35, 2.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-edp-1-xrgb16161616f:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.20, 2.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.38, 2.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-edp-1-xv30:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.20, 2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-edp-1-xv36:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.21, 2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-edp-1-xyuv8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.20, 2.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-edp-1-y210:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.21, 2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.20, 2.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-dp-2-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-dp-2-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-dp-2-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-dp-2-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-dp-2-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-dp-2-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-dp-2-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-edp-1-nv12:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.21, 2.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-edp-1-p010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.21, 2.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-edp-1-rgb565:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.27, 2.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-edp-1-xrgb16161616f:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.20, 2.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.20, 2.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.28, 2.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-edp-1-xv30:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.20, 2.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-edp-1-xv36:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.20, 2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-edp-1-xyuv8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.21, 2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-edp-1-y210:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.19, 2.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.20, 2.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-dp-2-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-dp-2-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-dp-2-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-dp-2-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-dp-2-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-dp-2-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-dp-2-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-edp-1-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-edp-1-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-edp-1-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-edp-1-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-edp-1-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-edp-1-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-edp-1-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-d-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [75.50, 97.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-a-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-a-dp-2-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-a-dp-2-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-a-dp-2-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-a-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-a-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-a-dp-2-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-a-dp-2-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-a-dp-2-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-a-dp-2-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-a-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.20, 2.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-a-edp-1-p010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.21, 2.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-a-edp-1-rgb565:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.40, 2.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-a-edp-1-xrgb16161616f:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.20, 2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-a-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.18, 2.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-a-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.30, 2.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-a-edp-1-xv30:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.21, 2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-a-edp-1-xv36:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.20, 2.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-a-edp-1-xyuv8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.19, 2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-a-edp-1-y210:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.21, 2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.20, 2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-b-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-b-dp-2-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-b-dp-2-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-b-dp-2-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-b-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-b-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-b-dp-2-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-b-dp-2-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-b-dp-2-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-b-dp-2-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-b-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.21, 2.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-b-edp-1-p010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.18, 2.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-b-edp-1-rgb565:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.35, 2.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-b-edp-1-xrgb16161616f:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.19, 2.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-b-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.18, 2.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-b-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.32, 2.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-b-edp-1-xv30:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.20, 2.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-b-edp-1-xv36:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.20, 2.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-b-edp-1-xyuv8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.21, 2.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-b-edp-1-y210:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.21, 2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.22, 2.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-c-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-c-dp-2-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-c-dp-2-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-c-dp-2-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-c-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-c-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-c-dp-2-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-c-dp-2-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-c-dp-2-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-c-dp-2-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-c-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-c-edp-1-nv12:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.21, 2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-c-edp-1-p010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.20, 2.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-c-edp-1-rgb565:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.29, 2.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-c-edp-1-xrgb16161616f:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.20, 2.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-c-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.20, 2.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-c-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.29, 2.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-c-edp-1-xv30:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.21, 2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-c-edp-1-xv36:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.20, 2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-c-edp-1-xyuv8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.18, 2.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-c-edp-1-y210:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.17, 2.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.20, 2.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-d-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-d-dp-2-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-d-dp-2-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-d-dp-2-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-d-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-d-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-d-dp-2-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-d-dp-2-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-d-dp-2-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-d-dp-2-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-d-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-d-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-d-edp-1-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-d-edp-1-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-d-edp-1-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-d-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-d-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-d-edp-1-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-d-edp-1-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-d-edp-1-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-d-edp-1-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-d-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [75.78, 98.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-a-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-a-dp-2-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-a-dp-2-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-a-dp-2-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-a-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-a-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-a-dp-2-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-a-dp-2-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-a-dp-2-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-a-dp-2-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-a-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.20, 2.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-a-edp-1-p010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.21, 2.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-a-edp-1-rgb565:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.36, 2.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-a-edp-1-xrgb16161616f:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.19, 2.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-a-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.23, 2.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-a-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-a-edp-1-xv30:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.20, 2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-a-edp-1-xv36:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.21, 2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-a-edp-1-xyuv8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.22, 2.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-a-edp-1-y210:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.19, 2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.20, 2.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-b-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-b-dp-2-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-b-dp-2-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-b-dp-2-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-b-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-b-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-b-dp-2-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-b-dp-2-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-b-dp-2-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-b-dp-2-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-b-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.21, 2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-b-edp-1-p010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.20, 2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-b-edp-1-rgb565:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.34, 2.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-b-edp-1-xrgb16161616f:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.21, 2.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-b-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.16, 2.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-b-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.32, 2.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-b-edp-1-xv30:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.20, 2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-b-edp-1-xv36:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.21, 2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-b-edp-1-xyuv8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.19, 2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-b-edp-1-y210:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.21, 2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.20, 2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-c-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-c-dp-2-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-c-dp-2-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-c-dp-2-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-c-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-c-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-c-dp-2-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-c-dp-2-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-c-dp-2-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-c-dp-2-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-c-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-c-edp-1-nv12:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.21, 2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-c-edp-1-p010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.20, 2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-c-edp-1-rgb565:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.28, 2.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-c-edp-1-xrgb16161616f:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.21, 2.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-c-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.20, 2.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-c-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.28, 2.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-c-edp-1-xv30:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.20, 2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-c-edp-1-xv36:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.20, 2.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-c-edp-1-xyuv8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.21, 2.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-c-edp-1-y210:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.21, 2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.20, 2.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-d-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-d-dp-2-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-d-dp-2-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-d-dp-2-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-d-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-d-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-d-dp-2-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-d-dp-2-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-d-dp-2-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-d-dp-2-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-d-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-d-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-d-edp-1-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-d-edp-1-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-d-edp-1-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-d-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-d-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-d-edp-1-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-d-edp-1-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-d-edp-1-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-d-edp-1-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-d-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.04, 79.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-a-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-a-dp-2-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-a-dp-2-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-a-dp-2-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-a-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-a-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-a-dp-2-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-a-dp-2-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-a-dp-2-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-a-dp-2-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-a-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-b-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-b-dp-2-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-b-dp-2-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-b-dp-2-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-b-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-b-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-b-dp-2-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-b-dp-2-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-b-dp-2-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-b-dp-2-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-b-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-c-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-c-dp-2-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-c-dp-2-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-c-dp-2-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-c-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-c-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-c-dp-2-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-c-dp-2-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-c-dp-2-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-c-dp-2-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-c-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-d-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-d-dp-2-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-d-dp-2-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-d-dp-2-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-d-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-d-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-d-dp-2-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-d-dp-2-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-d-dp-2-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-d-dp-2-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-d-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-y-tiled:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.01, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-yf-tiled:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-270-y-tiled:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-90-y-tiled:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.02, 79.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-2-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-2-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-2-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-2-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-2-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-2-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-dp-2-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-dp-2-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-dp-2-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-dp-2-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-dp-2-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-dp-2-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-edp-1-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-edp-1-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-edp-1-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-edp-1-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-edp-1-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-edp-1-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-edp-1-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-dp-2-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-dp-2-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-dp-2-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-dp-2-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-dp-2-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-dp-2-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-edp-1-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-edp-1-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-edp-1-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-edp-1-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-edp-1-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-edp-1-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-edp-1-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-dp-2-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-dp-2-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-dp-2-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-dp-2-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-dp-2-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-dp-2-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.02, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-yf-tiled:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [62.17, 93.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-dp-2-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-dp-2-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-dp-2-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-dp-2-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-dp-2-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-dp-2-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-dp-2-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.10, 2.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-edp-1-p010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.10, 2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-edp-1-rgb565:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.29, 2.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-edp-1-xrgb16161616f:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.11, 2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.11, 2.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-edp-1-xv30:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.10, 2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-edp-1-xv36:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.11, 2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-edp-1-xyuv8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.11, 2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-edp-1-y210:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.11, 2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.11, 2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-b-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-b-dp-2-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-b-dp-2-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-b-dp-2-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-b-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-b-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-b-dp-2-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-b-dp-2-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-b-dp-2-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-b-dp-2-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-b-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.10, 2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-b-edp-1-p010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.10, 2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-b-edp-1-rgb565:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.26, 2.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-b-edp-1-xrgb16161616f:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.11, 2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-b-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.14, 2.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-b-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.28, 2.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-b-edp-1-xv30:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.12, 2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-b-edp-1-xv36:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.10, 2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-b-edp-1-xyuv8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.10, 2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-b-edp-1-y210:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.10, 2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.08, 2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-c-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-c-dp-2-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-c-dp-2-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-c-dp-2-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-c-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-c-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-c-dp-2-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-c-dp-2-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-c-dp-2-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-c-dp-2-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-c-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-c-edp-1-nv12:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.11, 2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-c-edp-1-p010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.10, 2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-c-edp-1-rgb565:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.20, 2.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-c-edp-1-xrgb16161616f:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.11, 2.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-c-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.09, 2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-c-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.19, 2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-c-edp-1-xv30:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.10, 2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-c-edp-1-xv36:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.10, 2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-c-edp-1-xyuv8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-c-edp-1-y210:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.11, 2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.10, 2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-d-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-d-dp-2-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-d-dp-2-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-d-dp-2-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-d-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-d-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-d-dp-2-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-d-dp-2-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-d-dp-2-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-d-dp-2-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-d-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-d-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-d-edp-1-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-d-edp-1-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-d-edp-1-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-d-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-d-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-d-edp-1-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-d-edp-1-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-d-edp-1-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-d-edp-1-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled@pipe-d-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [62.62, 93.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-dp-2-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-dp-2-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-dp-2-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-dp-2-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-dp-2-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-dp-2-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-dp-2-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.12, 2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-edp-1-p010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.09, 2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-edp-1-rgb565:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.28, 2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-edp-1-xrgb16161616f:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.12, 2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.12, 2.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.28, 2.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-edp-1-xv30:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.12, 2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-edp-1-xv36:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.10, 2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-edp-1-xyuv8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.10, 2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-edp-1-y210:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.11, 2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.10, 2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-b-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-b-dp-2-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-b-dp-2-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-b-dp-2-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-b-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-b-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-b-dp-2-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-b-dp-2-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-b-dp-2-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-b-dp-2-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-b-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.10, 2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-b-edp-1-p010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.10, 2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-b-edp-1-rgb565:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.26, 2.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-b-edp-1-xrgb16161616f:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.11, 2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-b-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.12, 2.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-b-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.29, 2.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-b-edp-1-xv30:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.10, 2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-b-edp-1-xv36:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.10, 2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-b-edp-1-xyuv8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.10, 2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-b-edp-1-y210:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.10, 2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.10, 2.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-c-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-c-dp-2-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-c-dp-2-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-c-dp-2-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-c-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-c-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-c-dp-2-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-c-dp-2-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-c-dp-2-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-c-dp-2-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-c-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-c-edp-1-nv12:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.10, 2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-c-edp-1-p010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.10, 2.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-c-edp-1-rgb565:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.22, 2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-c-edp-1-xrgb16161616f:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.11, 2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-c-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.08, 2.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-c-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.21, 2.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-c-edp-1-xv30:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.11, 2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-c-edp-1-xv36:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.09, 2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-c-edp-1-xyuv8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.09, 2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-c-edp-1-y210:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.10, 2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.11, 2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-d-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-d-dp-2-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-d-dp-2-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-d-dp-2-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-d-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-d-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-d-dp-2-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-d-dp-2-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-d-dp-2-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-d-dp-2-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-d-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-d-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-d-edp-1-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-d-edp-1-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-d-edp-1-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-d-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-d-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-d-edp-1-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-d-edp-1-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-d-edp-1-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-d-edp-1-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-d-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [62.35, 93.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-a-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-a-dp-2-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-a-dp-2-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-a-dp-2-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-a-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-a-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-a-dp-2-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-a-dp-2-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-a-dp-2-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-a-dp-2-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-a-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.10, 2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-a-edp-1-p010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.11, 2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-a-edp-1-rgb565:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.25, 2.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-a-edp-1-xrgb16161616f:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.12, 2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-a-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.11, 2.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-a-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.28, 2.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-a-edp-1-xv30:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.11, 2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-a-edp-1-xv36:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.10, 2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-a-edp-1-xyuv8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.10, 2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-a-edp-1-y210:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.11, 2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.10, 2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-b-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-b-dp-2-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-b-dp-2-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-b-dp-2-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-b-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-b-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-b-dp-2-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-b-dp-2-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-b-dp-2-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-b-dp-2-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-b-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.10, 2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-b-edp-1-p010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.11, 2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-b-edp-1-rgb565:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.27, 2.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-b-edp-1-xrgb16161616f:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.11, 2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-b-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.10, 2.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-b-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.29, 2.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-b-edp-1-xv30:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.10, 2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-b-edp-1-xv36:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.10, 2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-b-edp-1-xyuv8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.09, 2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-b-edp-1-y210:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.10, 2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.10, 2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-c-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-c-dp-2-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-c-dp-2-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-c-dp-2-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-c-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-c-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-c-dp-2-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-c-dp-2-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-c-dp-2-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-c-dp-2-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-c-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-c-edp-1-nv12:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.10, 2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-c-edp-1-p010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.11, 2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-c-edp-1-rgb565:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.21, 2.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-c-edp-1-xrgb16161616f:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.10, 2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-c-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.10, 2.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-c-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.20, 2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-c-edp-1-xv30:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.12, 2.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-c-edp-1-xv36:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.10, 2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-c-edp-1-xyuv8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.10, 2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-c-edp-1-y210:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.10, 2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.10, 2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-d-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-d-dp-2-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-d-dp-2-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-d-dp-2-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-d-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-d-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-d-dp-2-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-d-dp-2-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-d-dp-2-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-d-dp-2-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-d-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-d-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-d-edp-1-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-d-edp-1-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-d-edp-1-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-d-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-d-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-d-edp-1-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-d-edp-1-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-d-edp-1-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-d-edp-1-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-d-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [62.36, 93.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-a-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-a-dp-2-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-a-dp-2-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-a-dp-2-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-a-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-a-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-a-dp-2-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-a-dp-2-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-a-dp-2-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-a-dp-2-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-a-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.11, 2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-a-edp-1-p010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.10, 2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-a-edp-1-rgb565:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.29, 2.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-a-edp-1-xrgb16161616f:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.10, 2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-a-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.12, 2.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-a-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.28, 2.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-a-edp-1-xv30:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.09, 2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-a-edp-1-xv36:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.11, 2.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-a-edp-1-xyuv8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.11, 2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-a-edp-1-y210:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.10, 2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.10, 2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-b-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-b-dp-2-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-b-dp-2-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-b-dp-2-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-b-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-b-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-b-dp-2-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-b-dp-2-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-b-dp-2-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-b-dp-2-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-b-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.10, 2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-b-edp-1-p010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.11, 2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-b-edp-1-rgb565:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.27, 2.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-b-edp-1-xrgb16161616f:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.10, 2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-b-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.12, 2.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-b-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.28, 2.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-b-edp-1-xv30:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.10, 2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-b-edp-1-xv36:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.11, 2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-b-edp-1-xyuv8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.11, 2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-b-edp-1-y210:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.10, 2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.10, 2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-c-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-c-dp-2-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-c-dp-2-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-c-dp-2-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-c-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-c-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-c-dp-2-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-c-dp-2-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-c-dp-2-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-c-dp-2-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-c-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-c-edp-1-nv12:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.12, 2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-c-edp-1-p010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.10, 2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-c-edp-1-rgb565:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.22, 2.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-c-edp-1-xrgb16161616f:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.10, 2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-c-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.09, 2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-c-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.20, 2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-c-edp-1-xv30:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.10, 2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-c-edp-1-xv36:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.10, 2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-c-edp-1-xyuv8888:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-c-edp-1-y210:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.10, 2.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.09, 2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-d-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-d-dp-2-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-d-dp-2-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-d-dp-2-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-d-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-d-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-d-dp-2-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-d-dp-2-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-d-dp-2-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-d-dp-2-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-d-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-d-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-d-edp-1-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-d-edp-1-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-d-edp-1-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-d-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-d-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-d-edp-1-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-d-edp-1-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-d-edp-1-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-d-edp-1-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-linear@pipe-d-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.02, 72.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-a-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-a-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-a-dp-2-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-a-dp-2-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-a-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-a-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-a-dp-2-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-a-dp-2-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-a-dp-2-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-a-dp-2-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-a-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-a-edp-1-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-a-edp-1-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-a-edp-1-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-a-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-a-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-a-edp-1-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-a-edp-1-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-a-edp-1-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-a-edp-1-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-b-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-b-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-b-dp-2-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-b-dp-2-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-b-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-b-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-b-dp-2-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-b-dp-2-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-b-dp-2-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-b-dp-2-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-b-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-b-edp-1-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-b-edp-1-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-b-edp-1-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-b-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-b-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-b-edp-1-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-b-edp-1-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-b-edp-1-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-b-edp-1-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-c-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-c-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-c-dp-2-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-c-dp-2-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-c-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-c-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-c-dp-2-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-c-dp-2-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-c-dp-2-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-c-dp-2-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-c-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-c-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-c-edp-1-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-c-edp-1-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-c-edp-1-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-c-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-c-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-c-edp-1-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-c-edp-1-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-c-edp-1-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-c-edp-1-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-d-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-d-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-d-dp-2-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-d-dp-2-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-d-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-d-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-d-dp-2-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-d-dp-2-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-d-dp-2-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-d-dp-2-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled@pipe-d-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-y-tiled:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.02, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-yf-tiled:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.04, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-270-y-tiled:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-90-y-tiled:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.05, 72.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-1-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-1-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-1-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-1-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-1-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-1-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-1-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-dp-2-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-dp-2-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-dp-2-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-dp-2-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-dp-2-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-dp-2-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-dp-2-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-edp-1-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-edp-1-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-edp-1-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-edp-1-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-edp-1-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-edp-1-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-edp-1-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-dp-2-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-dp-2-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-dp-2-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-dp-2-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-dp-2-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-dp-2-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-dp-2-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-edp-1-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-edp-1-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-edp-1-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-edp-1-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-edp-1-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-edp-1-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-edp-1-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-d-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-d-dp-2-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-d-dp-2-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-d-dp-2-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-d-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-d-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-d-dp-2-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-d-dp-2-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-d-dp-2-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-d-dp-2-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-d-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-y-tiled:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-yf-tiled:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_16071_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-ptl-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808">Intel XE#5808</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-lnl-7/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-2160x1440p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-target-2560x1440p:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-ptl-5/igt@kms_bw@linear-tiling-3-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-bmg-4/igt@kms_bw@linear-tiling-3-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-lnl-8/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-dp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-ptl-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822">Intel XE#5822</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-lnl-7/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-mode-timings:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-bmg-5/igt@kms_chamelium_edid@dp-mode-timings.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-ptl-6/igt@kms_chamelium_edid@dp-mode-timings.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-lnl-5/igt@kms_color_pipeline@plane-lut3d-green-only.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-4:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-lnl-5/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-bmg-7/igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-ptl-2/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-bmg-7/igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707">Intel XE#6707</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439">Intel XE#7439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-ptl-7/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5846">Intel XE#5846</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7809">Intel XE#7809</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-render:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-ptl-4/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-ptl-7/igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800">Intel XE#5800</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-bmg-2/igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-ptl-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-ptl-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-stridechange:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-stridechange.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-lnl-8/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-lnl-4/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-ptl-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812">Intel XE#5812</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-ptl-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-lnl-2/igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-ptl-8/igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9312">Intel XE#9312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-lnl-8/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-bmg-4/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-ptl-6/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-no-drrs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-lnl-5/igt@kms_psr@pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-bmg-5/igt@kms_psr@pr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-ptl-6/igt@kms_psr@pr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-ptl-6/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5821">Intel XE#5821</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr-video-mode:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-ptl-4/igt@kms_vrr@cmrr-video-mode.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-ptl-6/igt@kms_vrr@cmrr-video-mode.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9547">Intel XE#9547</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-ptl-3/igt@kms_vrr@flipline@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-lnl-7/igt@xe_evict@evict-beng-cm-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-cm:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-ptl-4/igt@xe_evict@evict-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764">Intel XE#5764</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-parallel-userptr-invalidate-race:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-ptl-4/igt@xe_exec_balancer@once-parallel-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-virtual-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-lnl-4/igt@xe_exec_balancer@twice-virtual-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-ptl-4/igt@xe_exec_basic@multigpu-no-exec-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484">Intel XE#7484</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-bmg-6/igt@xe_exec_basic@multigpu-no-exec-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@atomic-many:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-bmg-8/igt@xe_exec_fault_mode@atomic-many.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-bmg-6/igt@xe_exec_fault_mode@atomic-many.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8578">Intel XE#8578</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind-imm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-lnl-2/igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-ptl-6/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-close-fd-smem:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-ptl-7/igt@xe_exec_multi_queue@few-execs-close-fd-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-lnl-5/igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-preempt-mode-dyn-priority-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-bmg-9/igt@xe_exec_multi_queue@max-queues-preempt-mode-dyn-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate-race:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-ptl-1/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_gpgpu_fill@offset-4x4:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-lnl-5/igt@xe_gpgpu_fill@offset-4x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7954">Intel XE#7954</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-copy-prefetch:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-ptl-3/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-bmg-6/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@random:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-ptl-6/igt@xe_page_reclaim@random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-lnl-5/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326">Intel XE#7326</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353">Intel XE#7353</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-exec-after:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-ptl-4/igt@xe_pm@s2idle-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-ptl-5/igt@xe_pm@s2idle-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-lnl-4/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze@gt0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-bmg-8/igt@xe_pm_residency@gt-c6-freeze@gt0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-bmg-9/igt@xe_pm_residency@gt-c6-freeze@gt0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9254">Intel XE#9254</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-bmg-2/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-ptl-1/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6019">Intel XE#6019</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vram@vf-access-after-resize-up:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-lnl-2/igt@xe_sriov_vram@vf-access-after-resize-up.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376">Intel XE#6376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7330">Intel XE#7330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7422">Intel XE#7422</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-lnl-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8628">Intel XE#8628</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-lnl-5/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-bmg-5/igt@kms_flip@plain-flip-ts-check@a-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-bmg-3/igt@kms_flip@plain-flip-ts-check@a-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@audio-bw-hblank160:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-bmg-7/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9313">Intel XE#9313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-bmg-2/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-bmg-5/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-bmg-2/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-suspend-resume:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-lnl-4/igt@kms_pm_dc@dc5-dpms-suspend-resume.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399">Intel XE#8399</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-lnl-2/igt@kms_pm_dc@dc5-dpms-suspend-resume.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE#8355</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-lnl-7/igt@xe_pm@s4-mocs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727">Intel XE#7727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-lnl-2/igt@xe_pm@s4-mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-ptl-2/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-ptl-7/igt@xe_pm@s4-multiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-lnl-5/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-lnl-8/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-bmg-1/igt@xe_sriov_flr@flr-vfs-parallel.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-bmg-3/igt@xe_sriov_flr@flr-vfs-parallel.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-lnl-8/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-lnl-4/igt@kms_big_fb@linear-8bpp-rotate-270.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760">Intel XE#4760</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16071/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9171 -&gt; IGTPW_16071</li>
</ul>
<p>IGTPW_16071: 16071<br />
  IGT_9171: 9171<br />
  xe-6031-e650cd4c5bd5d3b068ed7a1eb3c55cde4386b355: e650cd4c5bd5d3b068ed7a1eb3c55cde4386b355</p>

</body>
</html>

--===============8330882041720560004==--
