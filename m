Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5F0606A32C
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 06:15:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B59D510E197;
	Mon, 16 Nov 2026 06:15:27 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76F1B10E197;
 Mon, 16 Nov 2026 06:14:32 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1577118094888375244=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_Extend_multiple_planes_wit?=
 =?utf-8?q?h_multiple_pixel_formats?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Avandhica S R" <avandhica.s.r@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 16 Nov 2026 06:14:32 -0000
Message-ID: <179480967246.27614.3602083228676649338@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261116035131.452844-1-avandhica.s.r@intel.com>
In-Reply-To: <20261116035131.452844-1-avandhica.s.r@intel.com>
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

--===============1577118094888375244==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Extend multiple planes with multiple pixel formats
URL   : https://patchwork.freedesktop.org/series/178627/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9192_FULL -> XEIGTPW_16149_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_16149_FULL:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010} (NEW):
    - shard-ptl:          NOTRUN -> [SKIP][1] +37 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-7/igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010.html

  * {igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-yf} (NEW):
    - shard-lnl:          NOTRUN -> [SKIP][2] +9 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-lnl-3/igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-yf.html

  * {igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-yf} (NEW):
    - shard-bmg:          NOTRUN -> [SKIP][3] +17 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-2/igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-yf.html

  
New tests
---------

  New tests have been introduced between XEIGT_9192_FULL and XEIGTPW_16149_FULL:

### New IGT tests (576) ###

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.02, 81.45] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-a-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [3.57] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-a-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [3.29] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-a-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [3.30] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-a-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [3.39] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-a-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [3.32] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-a-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [3.31] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-b-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [3.46] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-b-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [3.32] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-b-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [3.30] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-b-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [3.46] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-b-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [3.34] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-b-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [3.30] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-c-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [3.46] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-c-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [3.32] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-c-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [3.35] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-c-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [3.42] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-c-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [3.37] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-c-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [3.34] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-d-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [3.33] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-d-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [3.34] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-d-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [3.34] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-d-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [3.39] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-d-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [3.34] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-d-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [3.34] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.02, 243.15] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-a-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [10.09] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-a-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [10.05] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-a-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [10.04] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-a-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.16] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-a-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.04] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-a-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.07] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-b-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [10.21] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-b-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [10.05] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-b-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [10.05] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-b-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.16] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-b-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.07] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-b-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.06] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-c-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [10.22] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-c-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [10.09] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-c-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [10.06] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-c-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.16] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-c-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.09] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-c-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.07] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-d-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [10.08] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-d-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [10.09] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-d-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [10.06] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-d-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.17] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-d-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.09] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-d-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.07] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.02, 18.91] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-a-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.72] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-a-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.71] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-a-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.74] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-a-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.81] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-a-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.71] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-a-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.71] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-b-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.85] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-b-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.78] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-b-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.76] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-b-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.83] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-b-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.73] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-b-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.72] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-c-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.88] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-c-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.75] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-c-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.71] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-c-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.81] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-c-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.74] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-c-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.71] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-d-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.73] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-d-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.75] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-d-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.71] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-d-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.84] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-d-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.76] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-d-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.71] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.01, 53.15] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-a-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.38] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-a-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.13] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-a-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.15] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-a-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.21] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-a-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.10] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-a-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.16] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-b-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.25] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-b-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.15] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-b-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.13] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-b-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.36] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-b-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.14] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-b-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.27] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-c-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.28] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-c-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.20] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-c-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.14] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-c-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.23] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-c-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.15] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-c-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.09] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-d-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.16] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-d-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.20] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-d-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.13] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-d-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.21] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-d-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.16] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-d-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.10] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.01, 35.44] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-a-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.46] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-a-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.41] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-a-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.41] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-a-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.51] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-a-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.41] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-a-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-b-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.51] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-b-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.41] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-b-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.42] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-b-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.53] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-b-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.40] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-b-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.40] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-c-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.56] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-c-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.44] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-c-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.43] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-c-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.49] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-c-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.43] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-c-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.40] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-d-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.47] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-d-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.46] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-d-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.40] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-d-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.50] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-d-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.43] s

  * igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-d-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.41] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.03, 81.57] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-a-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [3.52] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-a-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [3.33] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-a-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [3.29] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-a-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [3.41] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-a-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [3.32] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-a-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [3.29] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-b-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [3.50] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-b-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [3.32] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-b-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [3.35] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-b-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [3.42] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-b-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [3.31] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-b-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [3.32] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-c-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [3.46] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-c-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [3.39] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-c-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [3.33] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-c-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [3.41] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-c-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [3.34] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-c-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [3.34] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-d-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [3.35] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-d-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [3.34] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-d-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [3.32] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-d-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [3.45] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-d-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [3.36] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-d-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [3.34] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.01, 243.18] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-a-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [10.01] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-a-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [10.06] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-a-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [10.04] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-a-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.14] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-a-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.07] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-a-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.07] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-b-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [10.21] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-b-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [10.05] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-b-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [10.04] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-b-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.18] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-b-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.08] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-b-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.07] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-c-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [10.21] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-c-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [10.14] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-c-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [10.05] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-c-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.16] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-c-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.10] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-c-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.07] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-d-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [10.11] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-d-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [10.11] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-d-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [10.06] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-d-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.18] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-d-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.10] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-d-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.07] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb8888:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.02, 18.82] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb8888@pipe-a-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.74] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb8888@pipe-a-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.71] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb8888@pipe-a-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.71] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb8888@pipe-a-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.81] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb8888@pipe-a-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.71] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb8888@pipe-a-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.73] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb8888@pipe-b-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.86] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb8888@pipe-b-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.71] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb8888@pipe-b-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.70] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb8888@pipe-b-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.83] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb8888@pipe-b-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.72] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb8888@pipe-b-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.74] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb8888@pipe-c-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.87] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb8888@pipe-c-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.75] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb8888@pipe-c-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.71] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb8888@pipe-c-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.81] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb8888@pipe-c-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.72] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb8888@pipe-c-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.71] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb8888@pipe-d-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.75] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb8888@pipe-d-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.74] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb8888@pipe-d-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.72] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb8888@pipe-d-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.83] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb8888@pipe-d-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.75] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb8888@pipe-d-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.70] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.01, 51.42] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-a-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.25] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-a-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.06] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-a-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.05] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-a-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.17] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-a-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.07] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-a-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.09] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-b-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.21] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-b-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.05] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-b-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.05] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-b-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.17] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-b-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.08] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-b-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.07] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-c-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.21] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-c-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.10] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-c-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.05] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-c-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.18] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-c-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.11] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-c-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.08] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-d-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.13] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-d-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.12] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-d-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.06] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-d-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.16] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-d-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.08] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-d-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.06] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.02, 36.12] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-a-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.49] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-a-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.44] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-a-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.43] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-a-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.53] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-a-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.43] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-a-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.46] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-b-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.57] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-b-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.42] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-b-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.42] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-b-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.54] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-b-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.44] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-b-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.44] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-c-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.56] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-c-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.49] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-c-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.41] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-c-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.55] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-c-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.43] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-c-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.46] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-d-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.47] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-d-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.49] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-d-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.41] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-d-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.53] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-d-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.47] s

  * igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-d-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.44] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.02, 85.03] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-a-dp-1-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [3.66] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-a-dp-1-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [3.49] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-a-dp-1-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [3.46] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-a-hdmi-a-3-pipe-b-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.54] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-a-hdmi-a-3-pipe-c-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.51] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-a-hdmi-a-3-pipe-d-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.51] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-b-dp-1-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [3.73] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-b-dp-1-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [3.48] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-b-dp-1-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [3.40] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-b-hdmi-a-3-pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.56] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-b-hdmi-a-3-pipe-c-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.47] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-b-hdmi-a-3-pipe-d-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.47] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-c-dp-1-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [3.53] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-c-dp-1-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [3.42] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-c-dp-1-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [3.58] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-c-hdmi-a-3-pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.54] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-c-hdmi-a-3-pipe-b-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.52] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-c-hdmi-a-3-pipe-d-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.54] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-d-dp-1-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [3.48] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-d-dp-1-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [3.53] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-d-dp-1-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [3.48] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-d-hdmi-a-3-pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.56] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-d-hdmi-a-3-pipe-b-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.46] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-d-hdmi-a-3-pipe-c-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.43] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.03, 256.77] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-a-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [10.59] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-a-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [10.61] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-a-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [10.63] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-a-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.18] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-a-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.62] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-a-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.59] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-b-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [11.02] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-b-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [10.64] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-b-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [10.65] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-b-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.69] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-b-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.60] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-b-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.89] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-c-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [10.72] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-c-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [10.68] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-c-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [10.64] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-c-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.73] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-c-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.66] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-c-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.62] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-d-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [10.66] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-d-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [10.69] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-d-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [10.64] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-d-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.66] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-d-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.95] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-d-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.63] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.01, 18.82] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-a-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.73] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-a-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.71] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-a-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.71] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-a-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.83] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-a-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.71] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-a-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.73] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-b-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.85] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-b-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.71] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-b-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.73] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-b-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.83] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-b-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.74] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-b-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.72] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-c-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.85] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-c-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.76] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-c-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.71] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-c-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.81] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-c-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.75] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-c-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.70] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-d-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.76] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-d-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.74] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-d-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.75] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-d-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.82] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-d-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.73] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-d-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.72] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.02, 51.41] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-a-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.14] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-a-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.06] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-a-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.09] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-a-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.17] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-a-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.07] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-a-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.09] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-b-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.22] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-b-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.07] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-b-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.05] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-b-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.14] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-b-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.08] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-b-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.07] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-c-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.25] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-c-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.12] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-c-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.05] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-c-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.18] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-c-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.08] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-c-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.07] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-d-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.11] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-d-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.10] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-d-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.09] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-d-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.18] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-d-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.10] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-d-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.09] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.01, 37.17] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-a-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.59] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-a-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.53] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-a-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.54] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-a-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.54] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-a-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.49] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-a-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.51] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-b-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.57] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-b-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.43] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-b-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-b-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.53] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-b-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.49] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-b-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.47] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-c-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.62] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-c-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.55] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-c-dp-2-pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.47] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-c-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.57] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-c-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.54] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-c-hdmi-a-3-pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.50] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-d-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.55] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-d-dp-2-pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.52] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-d-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.54] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-d-hdmi-a-3-pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.55] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-d-hdmi-a-3-pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.50] s

  * igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-d-hdmi-a-3-pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.48] s

  * igt@kms_plane_multiple@2x-tiling-y-and-drm_format_xrgb16161616f:
    - Statuses : 3 skip(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_plane_multiple@2x-tiling-y-and-drm_format_xrgb2101010:
    - Statuses : 3 skip(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_plane_multiple@2x-tiling-y-and-drm_format_xrgb8888:
    - Statuses : 3 skip(s)
    - Exec time: [0.01, 0.03] s

  * igt@kms_plane_multiple@2x-tiling-y-and-drm_format_xyuv8888:
    - Statuses : 3 skip(s)
    - Exec time: [0.01, 0.03] s

  * igt@kms_plane_multiple@2x-tiling-y-and-drm_format_yuyv:
    - Statuses : 3 skip(s)
    - Exec time: [0.01, 0.04] s

  * igt@kms_plane_multiple@2x-tiling-yf-and-drm_format_xrgb16161616f:
    - Statuses : 3 skip(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_plane_multiple@2x-tiling-yf-and-drm_format_xrgb2101010:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@kms_plane_multiple@2x-tiling-yf-and-drm_format_xrgb8888:
    - Statuses : 3 skip(s)
    - Exec time: [0.01, 0.03] s

  * igt@kms_plane_multiple@2x-tiling-yf-and-drm_format_xyuv8888:
    - Statuses : 3 skip(s)
    - Exec time: [0.01, 0.04] s

  * igt@kms_plane_multiple@2x-tiling-yf-and-drm_format_yuyv:
    - Statuses : 3 skip(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-4:
    - Statuses : 3 pass(s)
    - Exec time: [13.49, 34.28] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-4@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [4.41] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-4@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [4.11, 4.43] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-4@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [4.24] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-4@pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [4.29] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-4@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [4.72, 4.82] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-4@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [4.18] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-4@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [4.28] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-4@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [4.61, 4.84] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-4@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [4.19] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-4@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [4.41] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-4@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.82] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-4@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [4.21] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-none:
    - Statuses : 3 pass(s)
    - Exec time: [13.62, 36.59] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-none@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [4.64] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-none@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [4.13, 4.24] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-none@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [4.68] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-none@pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [4.53] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-none@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [4.72, 4.81] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-none@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [4.57] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-none@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [4.79] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-none@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [4.72, 4.91] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-none@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [4.33] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-none@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [4.50] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-none@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.65] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-none@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [4.47] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-x:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.04, 34.15] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-x@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [4.44] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-x@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.17] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-x@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [4.21] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-x@pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [4.28] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-x@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.71] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-x@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [4.18] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-x@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [4.28] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-x@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.70] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-x@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [4.17] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-x@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [4.27] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-x@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [4.22] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-y:
    - Statuses : 3 skip(s)
    - Exec time: [0.01, 0.03] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-yf:
    - Statuses : 3 skip(s)
    - Exec time: [0.01, 0.04] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-4:
    - Statuses : 3 pass(s)
    - Exec time: [16.76, 113.40] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-4@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [14.28] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-4@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [5.40, 5.58] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-4@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [14.52] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-4@pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [14.33] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-4@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [5.63, 6.03] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-4@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [13.87] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-4@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [13.96] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-4@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [5.68, 5.96] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-4@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [14.21] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-4@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [14.32] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-4@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.00] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-4@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [13.88] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-none:
    - Statuses : 3 pass(s)
    - Exec time: [16.57, 111.58] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-none@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [13.75] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-none@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [5.33, 5.84] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-none@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [14.48] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-none@pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [13.97] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-none@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [5.63, 6.08] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-none@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [14.79] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-none@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [13.61] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-none@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [5.57, 6.05] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-none@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [13.53] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-none@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [13.60] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-none@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.05] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-none@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [13.82] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-x:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.01, 109.03] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-x@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [13.73] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-x@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [5.40] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-x@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [13.56] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-x@pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [13.66] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-x@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [5.64] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-x@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [13.54] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-x@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [13.65] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-x@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [5.66] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-x@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [13.54] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-x@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [13.67] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-x@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [13.57] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-y:
    - Statuses : 3 skip(s)
    - Exec time: [0.01, 0.03] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-yf:
    - Statuses : 3 skip(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-4:
    - Statuses : 3 pass(s)
    - Exec time: [7.58, 18.53] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-4@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.95] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-4@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [4.00, 4.02] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-4@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.88] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-4@pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.99] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-4@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [4.74, 4.83] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-4@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.89] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-4@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.01] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-4@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [4.81, 4.83] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-4@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.90] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-4@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.98] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-4@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.82] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-4@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.89] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-none:
    - Statuses : 3 pass(s)
    - Exec time: [7.59, 18.27] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-none@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.94] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-none@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [3.95, 3.96] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-none@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.87] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-none@pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.00] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-none@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [4.72] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-none@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.88] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-none@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.97] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-none@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [4.64, 4.82] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-none@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.93] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-none@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.01] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-none@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.72] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-none@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.91] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-x:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.04, 13.46] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-x@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.94] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-x@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.93] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-x@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.89] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-x@pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.99] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-x@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.61] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-x@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.91] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-x@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.98] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-x@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.86] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-x@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.87] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-x@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.99] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-x@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.89] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-y:
    - Statuses : 3 skip(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-yf:
    - Statuses : 3 skip(s)
    - Exec time: [0.01, 0.03] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-4:
    - Statuses : 3 pass(s)
    - Exec time: [13.32, 21.82] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-4@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.86] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-4@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [4.01, 4.20] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-4@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.72] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-4@pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.75] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-4@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [4.64, 4.72] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-4@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.60] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-4@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.84] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-4@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [4.63, 4.84] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-4@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.64] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-4@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.73] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-4@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.71] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-4@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.65] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-none:
    - Statuses : 3 pass(s)
    - Exec time: [13.29, 21.01] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-none@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.65] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-none@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [4.03, 4.06] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-none@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.57] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-none@pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.66] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-none@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [4.60, 4.65] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-none@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.57] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-none@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.67] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-none@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [4.61, 4.82] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-none@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.59] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-none@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.65] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-none@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.80] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-none@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.58] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-x:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.03, 21.14] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-x@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.68] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-x@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.01] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-x@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.70] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-x@pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.67] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-x@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.62] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-x@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.56] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-x@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.66] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-x@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.52] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-x@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.58] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-x@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.67] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-x@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.57] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-y:
    - Statuses : 1 skip(s)
    - Exec time: [0.02] s

  * igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-yf:
    - Statuses : 3 skip(s)
    - Exec time: [0.01, 0.03] s

  * igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-4:
    - Statuses : 1 pass(s)
    - Exec time: [13.16] s

  * igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-4@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.96] s

  * igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-4@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.52] s

  * igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-4@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.62] s

  * igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-none:
    - Statuses : 3 pass(s)
    - Exec time: [13.12, 18.22] s

  * igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-none@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.88] s

  * igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-none@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [4.00, 4.05] s

  * igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-none@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.81] s

  * igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-none@pipe-b-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.77] s

  * igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-none@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [4.61, 4.65] s

  * igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-none@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.75] s

  * igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-none@pipe-c-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.83] s

  * igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-none@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [4.48, 4.74] s

  * igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-none@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.76] s

  * igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-none@pipe-d-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.87] s

  * igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-none@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.73] s

  * igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-none@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.77] s

  * igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-x:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.03, 14.63] s

  * igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-x@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.86] s

  * igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-x@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.96] s

  * igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-x@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.80] s

  * igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-x@pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.86] s

  * igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-x@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.53] s

  * igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-x@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.83] s

  * igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-x@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.90] s

  * igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-x@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.50] s

  * igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-x@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.70] s

  * igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-x@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.88] s

  * igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-x@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.73] s

  * igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-y:
    - Statuses : 3 skip(s)
    - Exec time: [0.01, 0.03] s

  * igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-yf:
    - Statuses : 3 skip(s)
    - Exec time: [0.02] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_16149_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_hwmon@hwmon-write:
    - shard-ptl:          NOTRUN -> [SKIP][4] ([Intel XE#7225])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-1/igt@intel_hwmon@hwmon-write.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-ptl:          NOTRUN -> [SKIP][5] ([Intel XE#5901]) +2 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-2/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2327])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-6/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-ptl:          NOTRUN -> [SKIP][7] ([Intel XE#6925])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#1124]) +5 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-8/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#610] / [Intel XE#7387])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
    - shard-ptl:          NOTRUN -> [SKIP][10] ([Intel XE#5855]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-3/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-ptl:          NOTRUN -> [SKIP][11] ([Intel XE#5808]) +10 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-3/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_bw@linear-tiling-2-displays-target-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#367])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-10/igt@kms_bw@linear-tiling-2-displays-target-1920x1080p.html
    - shard-ptl:          NOTRUN -> [SKIP][13] ([Intel XE#367]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-6/igt@kms_bw@linear-tiling-2-displays-target-1920x1080p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2887]) +6 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-1/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#2887])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-lnl-7/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-1:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2652]) +7 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:
    - shard-ptl:          NOTRUN -> [SKIP][17] ([Intel XE#5822]) +12 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#3432]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-ptl:          NOTRUN -> [SKIP][19] ([Intel XE#9205]) +4 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-4/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2325] / [Intel XE#7358])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-3/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_color_pipeline@plane-ctm3x4:
    - shard-ptl:          NOTRUN -> [SKIP][21] ([Intel XE#8391]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-2/igt@kms_chamelium_color_pipeline@plane-ctm3x4.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#7358]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-1/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-ptl:          NOTRUN -> [SKIP][23] ([Intel XE#2252]) +9 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-4/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2252]) +4 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-2/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-ptl:          NOTRUN -> [SKIP][25] ([Intel XE#5832] / [Intel XE#6974])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-1/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-1-suspend-resume:
    - shard-ptl:          NOTRUN -> [SKIP][26] ([Intel XE#6974])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-4/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          NOTRUN -> [FAIL][27] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +3 other tests fail
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-4/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@legacy-hdcp14:
    - shard-ptl:          NOTRUN -> [SKIP][28] ([Intel XE#7642])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-4/igt@kms_content_protection@legacy-hdcp14.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-ptl:          NOTRUN -> [SKIP][29] ([Intel XE#5900]) +3 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-3/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2321] / [Intel XE#7355])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2320]) +2 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-ptl:          NOTRUN -> [SKIP][32] ([Intel XE#5962]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-4/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-ptl:          NOTRUN -> [SKIP][33] ([Intel XE#5962] / [Intel XE#7343])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-ptl:          NOTRUN -> [SKIP][34] ([Intel XE#6035])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-ptl:          NOTRUN -> [SKIP][35] ([Intel XE#9535])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-6/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#8265]) +3 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-6/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html
    - shard-ptl:          NOTRUN -> [SKIP][37] ([Intel XE#5907]) +3 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-2/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#4422] / [Intel XE#7442])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-8/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2375])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-4/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@hdr:
    - shard-ptl:          NOTRUN -> [SKIP][40] ([Intel XE#9287])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-7/igt@kms_feature_discovery@hdr.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#1421])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-lnl-8/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-ptl:          NOTRUN -> [SKIP][42] ([Intel XE#2316]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-2/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [PASS][43] -> [FAIL][44] ([Intel XE#301])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9192/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:
    - shard-ptl:          NOTRUN -> [SKIP][45] ([Intel XE#5828]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-8/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-ptl:          NOTRUN -> [SKIP][46] ([Intel XE#7178])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#7178] / [Intel XE#7351])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> [SKIP][48] ([Intel XE#5800] / [Intel XE#6312]) +11 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#656] / [Intel XE#7905]) +4 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2311]) +29 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-pri-indfb-draw-blt:
    - shard-ptl:          NOTRUN -> [SKIP][51] ([Intel XE#6312]) +12 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-2/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-shrfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#7905]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-lnl-5/igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#4141]) +8 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-ptl:          NOTRUN -> [SKIP][54] ([Intel XE#5812]) +53 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#6312])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-pgflip-blt:
    - shard-ptl:          NOTRUN -> [SKIP][57] ([Intel XE#7865]) +20 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-8/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-fullscreen:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#7865]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-lnl-5/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt:
    - shard-ptl:          NOTRUN -> [SKIP][59] ([Intel XE#7061] / [Intel XE#7356]) +3 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-7/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2352] / [Intel XE#7399])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
    - shard-ptl:          NOTRUN -> [SKIP][61] ([Intel XE#5865] / [Intel XE#7399])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-8/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#7061]) +2 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-4/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> [SKIP][63] ([Intel XE#7061]) +3 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-6/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2350] / [Intel XE#7503])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-2/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psrhdr-rgb565-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#2313]) +31 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-6/igt@kms_frontbuffer_tracking@psrhdr-rgb565-draw-render.html

  * igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery:
    - shard-ptl:          NOTRUN -> [SKIP][66] ([Intel XE#9312])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-3/igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-ptl:          NOTRUN -> [SKIP][67] ([Intel XE#5917] / [Intel XE#6174])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-8/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#6901]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-10/igt@kms_joiner@basic-big-joiner.html
    - shard-ptl:          NOTRUN -> [SKIP][69] ([Intel XE#6901]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-4/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-ptl:          NOTRUN -> [SKIP][70] ([Intel XE#5873])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-3/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#7283])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-lnl-4/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#7283]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-9/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-y-tiled-modifier:
    - shard-ptl:          NOTRUN -> [SKIP][73] ([Intel XE#7283]) +3 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-6/igt@kms_plane@pixel-format-y-tiled-modifier.html

  * {igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010} (NEW):
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#4596]) +24 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-lnl-8/igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a:
    - shard-ptl:          NOTRUN -> [SKIP][75] ([Intel XE#6886]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a.html

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled:
    - shard-ptl:          NOTRUN -> [SKIP][76] ([Intel XE#9779]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-6/igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled.html

  * igt@kms_plane_scaling@plane-upscale-max-crc-yf-tiled:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#9779])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-6/igt@kms_plane_scaling@plane-upscale-max-crc-yf-tiled.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [PASS][78] -> [FAIL][79] ([Intel XE#8399])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9192/shard-lnl-2/igt@kms_pm_dc@dc5-dpms.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-lnl-5/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_dc@dc5-pageflip-negative:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#6927] / [Intel XE#8854])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-8/igt@kms_pm_dc@dc5-pageflip-negative.html

  * igt@kms_pm_dc@dc5-psr-suspend-resume:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#8854])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-9/igt@kms_pm_dc@dc5-psr-suspend-resume.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-2/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-ptl:          NOTRUN -> [SKIP][83] ([Intel XE#5849]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-6/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#1489]) +3 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-3/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html
    - shard-ptl:          NOTRUN -> [SKIP][85] ([Intel XE#5858] / [Intel XE#7304]) +3 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-5/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][86] ([Intel XE#5858]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-5/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
    - shard-ptl:          NOTRUN -> [SKIP][87] ([Intel XE#7304])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-5/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-ptl:          NOTRUN -> [SKIP][88] ([Intel XE#7413])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-3/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-ptl:          NOTRUN -> [SKIP][89] ([Intel XE#1406] / [Intel XE#5835]) +5 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-5/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@pr-primary-page-flip:
    - shard-ptl:          NOTRUN -> [SKIP][90] ([Intel XE#1406]) +2 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-5/igt@kms_psr@pr-primary-page-flip.html

  * igt@kms_psr@psr-cursor-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#2234] / [Intel XE#2850]) +8 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-9/igt@kms_psr@psr-cursor-plane-onoff.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#3904] / [Intel XE#7342])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-6/igt@kms_rotation_crc@primary-rotation-270.html
    - shard-ptl:          NOTRUN -> [SKIP][93] ([Intel XE#5821]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-4/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-ptl:          NOTRUN -> [SKIP][94] ([Intel XE#5910]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-7/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@xe_ccs@vm-bind-decompress:
    - shard-ptl:          NOTRUN -> [SKIP][95] ([Intel XE#7644])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-7/igt@xe_ccs@vm-bind-decompress.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#6599])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-9/igt@xe_compute@ccs-mode-compute-kernel.html
    - shard-ptl:          NOTRUN -> [SKIP][97] ([Intel XE#6599])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-2/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#2504] / [Intel XE#7319] / [Intel XE#7350])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-6/igt@xe_create@multigpu-create-massive-size.html
    - shard-ptl:          NOTRUN -> [SKIP][99] ([Intel XE#5878])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-7/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_evict@evict-mixed-threads-small:
    - shard-ptl:          NOTRUN -> [SKIP][100] ([Intel XE#5764]) +6 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-6/igt@xe_evict@evict-mixed-threads-small.html

  * igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#7482])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-lnl-1/igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate.html

  * igt@xe_exec_balancer@no-exec-parallel-userptr-rebind:
    - shard-ptl:          NOTRUN -> [SKIP][102] ([Intel XE#7482]) +11 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-2/igt@xe_exec_balancer@no-exec-parallel-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#2322] / [Intel XE#7372]) +2 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exec-rebind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:
    - shard-ptl:          NOTRUN -> [SKIP][104] ([Intel XE#5575] / [Intel XE#7484]) +5 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-7/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race:
    - shard-ptl:          NOTRUN -> [SKIP][105] ([Intel XE#8374]) +8 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-7/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race-imm:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#8374]) +7 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-3/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race-imm.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-imm:
    - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#8374]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-lnl-3/igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-imm.html

  * igt@xe_exec_mix_modes@exec-multi-queue-spinner-interrupted-lr:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#9003])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-4/igt@xe_exec_mix_modes@exec-multi-queue-spinner-interrupted-lr.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#8364]) +8 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-6/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-userptr.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd:
    - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#8364]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-lnl-3/igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-basic:
    - shard-ptl:          NOTRUN -> [SKIP][111] ([Intel XE#8364]) +20 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-3/igt@xe_exec_multi_queue@one-queue-preempt-mode-basic.html

  * igt@xe_exec_reset@cm-multi-queue-close-execqueues:
    - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#8369]) +2 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-9/igt@xe_exec_reset@cm-multi-queue-close-execqueues.html

  * igt@xe_exec_reset@multi-queue-close-execqueues:
    - shard-ptl:          NOTRUN -> [SKIP][113] ([Intel XE#8369]) +2 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-1/igt@xe_exec_reset@multi-queue-close-execqueues.html

  * igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#8378]) +4 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-4/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind.html

  * igt@xe_exec_threads@threads-multi-queue-many-groups:
    - shard-ptl:          NOTRUN -> [SKIP][115] ([Intel XE#8780])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-6/igt@xe_exec_threads@threads-multi-queue-many-groups.html

  * igt@xe_exec_threads@threads-multi-queue-shared-vm-basic:
    - shard-ptl:          NOTRUN -> [SKIP][116] ([Intel XE#8378]) +7 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-4/igt@xe_exec_threads@threads-multi-queue-shared-vm-basic.html

  * igt@xe_mempage_offline@inject-single-page:
    - shard-ptl:          NOTRUN -> [SKIP][117] ([Intel XE#9203])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-5/igt@xe_mempage_offline@inject-single-page.html

  * igt@xe_mmap@pci-membarrier:
    - shard-ptl:          NOTRUN -> [SKIP][118] ([Intel XE#5100] / [Intel XE#7408])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-2/igt@xe_mmap@pci-membarrier.html

  * igt@xe_multigpu_svm@mgpu-coherency-basic:
    - shard-ptl:          NOTRUN -> [SKIP][119] ([Intel XE#6964])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-7/igt@xe_multigpu_svm@mgpu-coherency-basic.html

  * igt@xe_multigpu_svm@mgpu-coherency-conflict:
    - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#6964]) +1 other test skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-7/igt@xe_multigpu_svm@mgpu-coherency-conflict.html

  * igt@xe_page_reclaim@binds-null-vma:
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#7793]) +1 other test skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-2/igt@xe_page_reclaim@binds-null-vma.html

  * igt@xe_page_reclaim@pat-index-xd:
    - shard-ptl:          NOTRUN -> [SKIP][122] ([Intel XE#7793]) +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-8/igt@xe_page_reclaim@pat-index-xd.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-ptl:          NOTRUN -> [SKIP][123] ([Intel XE#5777] / [Intel XE#7590])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-5/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pm@d3cold-i2c:
    - shard-ptl:          NOTRUN -> [SKIP][124] ([Intel XE#5741]) +1 other test skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-6/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][125] ([Intel XE#2284] / [Intel XE#7370]) +1 other test skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-9/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s4-basic:
    - shard-ptl:          [PASS][126] -> [ABORT][127] ([Intel XE#9362])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9192/shard-ptl-4/igt@xe_pm@s4-basic.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-8/igt@xe_pm@s4-basic.html
    - shard-bmg:          [PASS][128] -> [ABORT][129] ([Intel XE#9399])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9192/shard-bmg-6/igt@xe_pm@s4-basic.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-7/igt@xe_pm@s4-basic.html

  * igt@xe_pm_residency@cpg-basic:
    - shard-ptl:          NOTRUN -> [SKIP][130] ([Intel XE#6867]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-7/igt@xe_pm_residency@cpg-basic.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#4733] / [Intel XE#7417]) +1 other test skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-4/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html

  * igt@xe_query@multigpu-query-invalid-query:
    - shard-lnl:          NOTRUN -> [SKIP][132] ([Intel XE#944])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-lnl-7/igt@xe_query@multigpu-query-invalid-query.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-ptl:          NOTRUN -> [SKIP][133] ([Intel XE#6019]) +1 other test skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-7/igt@xe_query@multigpu-query-uc-fw-version-guc.html
    - shard-bmg:          NOTRUN -> [SKIP][134] ([Intel XE#944])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-2/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_survivability@i2c-functionality:
    - shard-ptl:          NOTRUN -> [SKIP][135] ([Intel XE#8415] / [Intel XE#8432])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-3/igt@xe_survivability@i2c-functionality.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-bmg:          [FAIL][136] ([Intel XE#3718] / [Intel XE#6078]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9192/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1:
    - shard-ptl:          [FAIL][138] ([Intel XE#6078]) -> [PASS][139] +1 other test pass
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9192/shard-ptl-3/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-5/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2:
    - shard-bmg:          [FAIL][140] ([Intel XE#6078]) -> [PASS][141]
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9192/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [FAIL][142] ([Intel XE#301]) -> [PASS][143]
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9192/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-c-dp-2-p010:
    - shard-bmg:          [FAIL][144] ([Intel XE#9780]) -> [PASS][145] +9 other tests pass
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9192/shard-bmg-6/igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-c-dp-2-p010.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-2/igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-c-dp-2-p010.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [FAIL][146] ([Intel XE#8399]) -> [PASS][147] +1 other test pass
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9192/shard-lnl-7/igt@kms_pm_dc@dc6-dpms.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-lnl-1/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_vrr@flip-dpms@pipe-a-edp-1:
    - shard-ptl:          [FAIL][148] ([Intel XE#4227] / [Intel XE#7397]) -> [PASS][149] +1 other test pass
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9192/shard-ptl-4/igt@kms_vrr@flip-dpms@pipe-a-edp-1.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-4/igt@kms_vrr@flip-dpms@pipe-a-edp-1.html

  * igt@xe_exec_reset@gt-stress-reset-memory-pressure:
    - shard-lnl:          [DMESG-WARN][150] ([Intel XE#8652]) -> [PASS][151]
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9192/shard-lnl-7/igt@xe_exec_reset@gt-stress-reset-memory-pressure.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-lnl-2/igt@xe_exec_reset@gt-stress-reset-memory-pressure.html

  * igt@xe_oa@non-zero-reason:
    - shard-bmg:          [FAIL][152] ([Intel XE#7334]) -> [PASS][153] +1 other test pass
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9192/shard-bmg-3/igt@xe_oa@non-zero-reason.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-5/igt@xe_oa@non-zero-reason.html

  * igt@xe_pm@s4-mocs:
    - shard-ptl:          [DMESG-WARN][154] ([Intel XE#7727]) -> [PASS][155] +1 other test pass
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9192/shard-ptl-7/igt@xe_pm@s4-mocs.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-6/igt@xe_pm@s4-mocs.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-ptl:          [ABORT][156] ([Intel XE#9362]) -> [PASS][157]
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9192/shard-ptl-6/igt@xe_pm@s4-multiple-execs.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-8/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pmu@engine-activity-accuracy-50:
    - shard-bmg:          [FAIL][158] ([Intel XE#9461]) -> [PASS][159] +3 other tests pass
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9192/shard-bmg-10/igt@xe_pmu@engine-activity-accuracy-50.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-9/igt@xe_pmu@engine-activity-accuracy-50.html

  
#### Warnings ####

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][160] ([Intel XE#3544]) -> [SKIP][161] ([Intel XE#3374] / [Intel XE#3544])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9192/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html

  * igt@xe_survivability@runtime-survivability:
    - shard-bmg:          [DMESG-WARN][162] ([Intel XE#9762]) -> [DMESG-WARN][163] ([Intel XE#9365])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9192/shard-bmg-5/igt@xe_survivability@runtime-survivability.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-7/igt@xe_survivability@runtime-survivability.html

  * igt@xe_wedged@cold-reset-wedged:
    - shard-bmg:          [ABORT][164] ([Intel XE#9781]) -> [SKIP][165] ([Intel XE#9747])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9192/shard-bmg-5/igt@xe_wedged@cold-reset-wedged.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-8/igt@xe_wedged@cold-reset-wedged.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
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
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5741]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5741
  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#5777]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777
  [Intel XE#5800]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800
  [Intel XE#5808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808
  [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
  [Intel XE#5821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5821
  [Intel XE#5822]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822
  [Intel XE#5828]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5828
  [Intel XE#5832]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5832
  [Intel XE#5835]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5835
  [Intel XE#5849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5849
  [Intel XE#5855]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5855
  [Intel XE#5858]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858
  [Intel XE#5865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5865
  [Intel XE#5873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5873
  [Intel XE#5878]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5878
  [Intel XE#5900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900
  [Intel XE#5901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5901
  [Intel XE#5907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907
  [Intel XE#5910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5910
  [Intel XE#5917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5917
  [Intel XE#5962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962
  [Intel XE#6019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6019
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#6174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6174
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
  [Intel XE#6867]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6867
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
  [Intel XE#6925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6925
  [Intel XE#6927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6927
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7225]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7225
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7319]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7319
  [Intel XE#7334]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7334
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7350
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7408
  [Intel XE#7413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484
  [Intel XE#7503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7503
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7644]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7644
  [Intel XE#7727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8391
  [Intel XE#8399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399
  [Intel XE#8415]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8415
  [Intel XE#8432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8432
  [Intel XE#8652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8652
  [Intel XE#8780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8780
  [Intel XE#8854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8854
  [Intel XE#9003]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9003
  [Intel XE#9203]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9203
  [Intel XE#9205]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9205
  [Intel XE#9287]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9287
  [Intel XE#9312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9312
  [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
  [Intel XE#9365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9365
  [Intel XE#9399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9399
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#9461]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9461
  [Intel XE#9535]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9535
  [Intel XE#9747]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9747
  [Intel XE#9762]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9762
  [Intel XE#9779]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9779
  [Intel XE#9780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9780
  [Intel XE#9781]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9781


Build changes
-------------

  * IGT: IGT_9192 -> IGTPW_16149
  * Linux: xe-6137-2b4f99da078af1e9a391d4a4ff51550e30b711f2 -> xe-6146-1e689143b673f45c712bacde9b1c4b8c360efdca

  IGTPW_16149: 16149
  IGT_9192: 9192
  xe-6137-2b4f99da078af1e9a391d4a4ff51550e30b711f2: 2b4f99da078af1e9a391d4a4ff51550e30b711f2
  xe-6146-1e689143b673f45c712bacde9b1c4b8c360efdca: 1e689143b673f45c712bacde9b1c4b8c360efdca

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/index.html

--===============1577118094888375244==
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
<tr><td><b>Series:</b></td><td>Extend multiple planes with multiple pixel formats</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/178627/">https://patchwork.freedesktop.org/series/178627/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9192_FULL -&gt; XEIGTPW_16149_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_16149_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010} (NEW):</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-7/igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010.html">SKIP</a> +37 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-yf} (NEW):</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-lnl-3/igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-yf.html">SKIP</a> +9 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-yf} (NEW):</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-2/igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-yf.html">SKIP</a> +17 other tests skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_9192_FULL and XEIGTPW_16149_FULL:</p>
<h3>New IGT tests (576)</h3>
<ul>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.02, 81.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-a-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-a-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-a-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-a-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-a-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-a-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-b-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-b-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-b-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-b-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-b-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-b-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-c-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-c-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-c-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-c-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-c-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-c-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-d-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-d-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-d-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-d-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-d-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb16161616f@pipe-d-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.02, 243.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-a-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-a-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-a-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-a-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-a-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-a-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-b-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-b-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-b-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-b-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-b-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-b-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-c-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-c-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-c-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-c-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-c-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-c-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-d-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-d-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-d-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-d-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-d-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb2101010@pipe-d-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.02, 18.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-a-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-a-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-a-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-a-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-a-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-a-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-b-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-b-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-b-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-b-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-b-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-b-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-c-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-c-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-c-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-c-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-c-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-c-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.71] s</li>
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
<li>Exec time: [0.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-d-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-d-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-d-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xrgb8888@pipe-d-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.01, 53.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-a-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-a-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.13] s</li>
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
<li>Exec time: [2.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-a-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-a-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-b-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-b-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-b-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-b-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-b-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-b-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-c-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-c-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-c-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-c-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-c-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-c-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-d-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-d-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-d-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-d-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-d-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_xyuv8888@pipe-d-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.01, 35.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-a-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-a-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-a-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-a-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-a-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-a-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-b-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-b-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-b-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-b-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-b-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-b-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-c-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-c-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-c-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-c-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-c-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-c-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-d-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-d-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-d-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-d-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-d-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4-and-drm_format_yuyv@pipe-d-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.03, 81.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-a-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-a-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-a-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-a-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-a-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-a-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-b-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-b-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-b-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-b-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-b-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-b-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-c-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-c-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-c-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-c-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-c-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-c-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-d-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-d-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-d-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-d-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-d-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb16161616f@pipe-d-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.01, 243.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-a-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-a-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-a-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-a-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-a-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-a-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-b-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-b-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-b-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-b-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-b-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-b-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-c-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-c-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-c-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-c-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-c-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-c-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-d-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-d-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-d-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-d-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-d-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010@pipe-d-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.02, 18.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb8888@pipe-a-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb8888@pipe-a-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb8888@pipe-a-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb8888@pipe-a-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb8888@pipe-a-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb8888@pipe-a-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb8888@pipe-b-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb8888@pipe-b-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb8888@pipe-b-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb8888@pipe-b-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb8888@pipe-b-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb8888@pipe-b-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb8888@pipe-c-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb8888@pipe-c-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb8888@pipe-c-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb8888@pipe-c-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb8888@pipe-c-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb8888@pipe-c-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb8888@pipe-d-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb8888@pipe-d-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb8888@pipe-d-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb8888@pipe-d-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb8888@pipe-d-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb8888@pipe-d-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.01, 51.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-a-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-a-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-a-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-a-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-a-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-a-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-b-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-b-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-b-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-b-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-b-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-b-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-c-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-c-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-c-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-c-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-c-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-c-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-d-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-d-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-d-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-d-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-d-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xyuv8888@pipe-d-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.02, 36.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-a-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-a-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-a-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-a-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-a-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-a-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-b-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-b-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-b-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-b-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-b-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-b-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-c-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-c-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-c-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-c-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-c-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-c-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-d-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-d-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-d-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-d-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-d-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none-and-drm_format_yuyv@pipe-d-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.02, 85.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-a-dp-1-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-a-dp-1-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-a-dp-1-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-a-hdmi-a-3-pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-a-hdmi-a-3-pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-a-hdmi-a-3-pipe-d-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-b-dp-1-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-b-dp-1-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-b-dp-1-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-b-hdmi-a-3-pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-b-hdmi-a-3-pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-b-hdmi-a-3-pipe-d-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-c-dp-1-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-c-dp-1-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-c-dp-1-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-c-hdmi-a-3-pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-c-hdmi-a-3-pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-c-hdmi-a-3-pipe-d-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-d-dp-1-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-d-dp-1-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-d-dp-1-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-d-hdmi-a-3-pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-d-hdmi-a-3-pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb16161616f@pipe-d-hdmi-a-3-pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.03, 256.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-a-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-a-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-a-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-a-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-a-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-a-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-b-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-b-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-b-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-b-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-b-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-b-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-c-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-c-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-c-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-c-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-c-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-c-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-d-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-d-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-d-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-d-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-d-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb2101010@pipe-d-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.01, 18.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-a-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.73] s</li>
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
<li>Exec time: [0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-a-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-a-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-a-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-b-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-b-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-b-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-b-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-b-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-b-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-c-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-c-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-c-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-c-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-c-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-c-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-d-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-d-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-d-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-d-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-d-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xrgb8888@pipe-d-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.02, 51.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-a-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-a-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-a-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-a-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-a-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-a-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-b-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-b-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-b-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-b-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-b-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-b-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-c-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-c-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-c-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-c-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-c-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-c-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-d-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-d-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-d-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-d-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-d-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_xyuv8888@pipe-d-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.01, 37.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-a-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-a-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-a-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-a-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-a-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-a-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-b-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-b-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-b-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-b-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-b-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-b-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-c-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-c-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-c-dp-2-pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-c-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-c-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-c-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-d-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-d-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-d-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-d-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-d-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x-and-drm_format_yuyv@pipe-d-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y-and-drm_format_xrgb16161616f:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
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
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y-and-drm_format_xyuv8888:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y-and-drm_format_yuyv:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf-and-drm_format_xrgb16161616f:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf-and-drm_format_xrgb2101010:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf-and-drm_format_xrgb8888:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf-and-drm_format_xyuv8888:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf-and-drm_format_yuyv:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-4:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [13.49, 34.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-4@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-4@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.11, 4.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-4@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-4@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-4@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.72, 4.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-4@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-4@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-4@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.61, 4.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-4@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-4@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-4@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-4@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-none:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [13.62, 36.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-none@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-none@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.13, 4.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-none@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-none@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-none@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.72, 4.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-none@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-none@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-none@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.72, 4.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-none@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-none@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-none@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-none@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-x:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.04, 34.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-x@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-x@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-x@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-x@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-x@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-x@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-x@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-x@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-x@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-x@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-x@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-y:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb16161616f-and-modifier-format-tiling-yf:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-4:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [16.76, 113.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-4@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [14.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-4@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [5.40, 5.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-4@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [14.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-4@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [14.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-4@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [5.63, 6.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-4@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [13.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-4@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [13.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-4@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [5.68, 5.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-4@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [14.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-4@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [14.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-4@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-4@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [13.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-none:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [16.57, 111.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-none@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [13.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-none@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [5.33, 5.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-none@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [14.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-none@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [13.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-none@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [5.63, 6.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-none@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [14.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-none@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [13.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-none@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [5.57, 6.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-none@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [13.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-none@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [13.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-none@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-none@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [13.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-x:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.01, 109.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-x@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [13.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-x@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-x@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [13.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-x@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [13.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-x@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-x@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [13.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-x@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [13.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-x@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-x@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [13.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-x@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [13.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-x@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [13.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-y:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb2101010-and-modifier-format-tiling-yf:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-4:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [7.58, 18.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-4@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-4@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.00, 4.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-4@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-4@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-4@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.74, 4.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-4@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-4@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-4@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.81, 4.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-4@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-4@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-4@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-4@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-none:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [7.59, 18.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-none@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-none@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.95, 3.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-none@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-none@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-none@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-none@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-none@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-none@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.64, 4.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-none@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-none@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-none@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-none@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-x:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.04, 13.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-x@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-x@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-x@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-x@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-x@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-x@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-x@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-x@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-x@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-x@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-x@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-y:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xrgb8888-and-modifier-format-tiling-yf:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-4:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [13.32, 21.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-4@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-4@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.01, 4.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-4@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-4@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-4@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.64, 4.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-4@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-4@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-4@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.63, 4.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-4@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-4@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-4@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-4@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-none:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [13.29, 21.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-none@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-none@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.03, 4.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-none@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-none@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-none@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.60, 4.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-none@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-none@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-none@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.61, 4.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-none@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-none@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-none@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-none@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-x:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.03, 21.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-x@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-x@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-x@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-x@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-x@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-x@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-x@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-x@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-x@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-x@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-x@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-y:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_xyuv8888-and-modifier-format-tiling-yf:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [13.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-4@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-4@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-4@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-none:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [13.12, 18.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-none@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-none@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.00, 4.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-none@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-none@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-none@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.61, 4.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-none@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-none@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-none@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.48, 4.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-none@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-none@pipe-d-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-none@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-none@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-x:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.03, 14.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-x@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-x@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-x@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-x@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-x@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-x@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-x@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-x@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-x@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-x@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-x@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-y:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@pixel-format-drm_format_yuyv-and-modifier-format-tiling-yf:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_16149_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-1/igt@intel_hwmon@hwmon-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7225">Intel XE#7225</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-2/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5901">Intel XE#5901</a>) +2 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-6/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6925">Intel XE#6925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-8/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387">Intel XE#7387</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-3/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5855">Intel XE#5855</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-3/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808">Intel XE#5808</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-10/igt@kms_bw@linear-tiling-2-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-6/igt@kms_bw@linear-tiling-2-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-1/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-lnl-7/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822">Intel XE#5822</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-4/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9205">Intel XE#9205</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-3/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-ctm3x4:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-2/igt@kms_chamelium_color_pipeline@plane-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8391">Intel XE#8391</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-1/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-4/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-2/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-1/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5832">Intel XE#5832</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1-suspend-resume:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-4/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-4/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy-hdcp14:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-4/igt@kms_content_protection@legacy-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-3/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900">Intel XE#5900</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-4/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962">Intel XE#5962</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962">Intel XE#5962</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035">Intel XE#6035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-6/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9535">Intel XE#9535</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-6/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) +3 other tests skip</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-2/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907">Intel XE#5907</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-8/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442">Intel XE#7442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-4/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375">Intel XE#2375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@hdr:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-7/igt@kms_feature_discovery@hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9287">Intel XE#9287</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-lnl-8/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-2/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9192/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-8/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5828">Intel XE#5828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800">Intel XE#5800</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-2/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-lnl-5/igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812">Intel XE#5812</a>) +53 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-8/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-lnl-5/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-7/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-8/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5865">Intel XE#5865</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-4/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-6/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-2/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350">Intel XE#2350</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7503">Intel XE#7503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-6/igt@kms_frontbuffer_tracking@psrhdr-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-3/igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9312">Intel XE#9312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-8/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5917">Intel XE#5917</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6174">Intel XE#6174</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-10/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901">Intel XE#6901</a>) +1 other test skip</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-4/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901">Intel XE#6901</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-3/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5873">Intel XE#5873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-lnl-4/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-9/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-6/igt@kms_plane@pixel-format-y-tiled-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010} (NEW):</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-lnl-8/igt@kms_plane_multiple@2x-tiling-none-and-drm_format_xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-6/igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9779">Intel XE#9779</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-yf-tiled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-6/igt@kms_plane_scaling@plane-upscale-max-crc-yf-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9779">Intel XE#9779</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9192/shard-lnl-2/igt@kms_pm_dc@dc5-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-lnl-5/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399">Intel XE#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-pageflip-negative:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-8/igt@kms_pm_dc@dc5-pageflip-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6927">Intel XE#6927</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8854">Intel XE#8854</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr-suspend-resume:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-9/igt@kms_pm_dc@dc5-psr-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8854">Intel XE#8854</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-2/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-6/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5849">Intel XE#5849</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-3/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-5/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858">Intel XE#5858</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-5/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858">Intel XE#5858</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-5/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-3/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413">Intel XE#7413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-5/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5835">Intel XE#5835</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-page-flip:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-5/igt@kms_psr@pr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-9/igt@kms_psr@psr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-6/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-4/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5821">Intel XE#5821</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-7/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5910">Intel XE#5910</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@vm-bind-decompress:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-7/igt@xe_ccs@vm-bind-decompress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7644">Intel XE#7644</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-9/igt@xe_compute@ccs-mode-compute-kernel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599">Intel XE#6599</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-2/igt@xe_compute@ccs-mode-compute-kernel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599">Intel XE#6599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-6/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504">Intel XE#2504</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7319">Intel XE#7319</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7350">Intel XE#7350</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-7/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5878">Intel XE#5878</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-small:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-6/igt@xe_evict@evict-mixed-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764">Intel XE#5764</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-lnl-1/igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-parallel-userptr-rebind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-2/igt@xe_exec_balancer@no-exec-parallel-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exec-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-7/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484">Intel XE#7484</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-7/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-3/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-imm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-lnl-3/igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-multi-queue-spinner-interrupted-lr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-4/igt@xe_exec_mix_modes@exec-multi-queue-spinner-interrupted-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9003">Intel XE#9003</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-6/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-lnl-3/igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-basic:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-3/igt@xe_exec_multi_queue@one-queue-preempt-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-close-execqueues:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-9/igt@xe_exec_reset@cm-multi-queue-close-execqueues.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-close-execqueues:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-1/igt@xe_exec_reset@multi-queue-close-execqueues.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-4/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-many-groups:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-6/igt@xe_exec_threads@threads-multi-queue-many-groups.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8780">Intel XE#8780</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-shared-vm-basic:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-4/igt@xe_exec_threads@threads-multi-queue-shared-vm-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mempage_offline@inject-single-page:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-5/igt@xe_mempage_offline@inject-single-page.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9203">Intel XE#9203</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-2/igt@xe_mmap@pci-membarrier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100">Intel XE#5100</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7408">Intel XE#7408</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-coherency-basic:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-7/igt@xe_multigpu_svm@mgpu-coherency-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-coherency-conflict:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-7/igt@xe_multigpu_svm@mgpu-coherency-conflict.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@binds-null-vma:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-2/igt@xe_page_reclaim@binds-null-vma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@pat-index-xd:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-8/igt@xe_page_reclaim@pat-index-xd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-5/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777">Intel XE#5777</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-6/igt@xe_pm@d3cold-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5741">Intel XE#5741</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-9/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9192/shard-ptl-4/igt@xe_pm@s4-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-8/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9192/shard-bmg-6/igt@xe_pm@s4-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-7/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9399">Intel XE#9399</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@cpg-basic:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-7/igt@xe_pm_residency@cpg-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6867">Intel XE#6867</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-4/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-query:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-lnl-7/igt@xe_query@multigpu-query-invalid-query.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-7/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6019">Intel XE#6019</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-2/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_survivability@i2c-functionality:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-3/igt@xe_survivability@i2c-functionality.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8415">Intel XE#8415</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8432">Intel XE#8432</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9192/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9192/shard-ptl-3/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-5/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9192/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9192/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-c-dp-2-p010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9192/shard-bmg-6/igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-c-dp-2-p010.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9780">Intel XE#9780</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-2/igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-c-dp-2-p010.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9192/shard-lnl-7/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399">Intel XE#8399</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-lnl-1/igt@kms_pm_dc@dc6-dpms.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9192/shard-ptl-4/igt@kms_vrr@flip-dpms@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-4/igt@kms_vrr@flip-dpms@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-stress-reset-memory-pressure:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9192/shard-lnl-7/igt@xe_exec_reset@gt-stress-reset-memory-pressure.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8652">Intel XE#8652</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-lnl-2/igt@xe_exec_reset@gt-stress-reset-memory-pressure.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-zero-reason:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9192/shard-bmg-3/igt@xe_oa@non-zero-reason.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7334">Intel XE#7334</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-5/igt@xe_oa@non-zero-reason.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9192/shard-ptl-7/igt@xe_pm@s4-mocs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727">Intel XE#7727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-6/igt@xe_pm@s4-mocs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9192/shard-ptl-6/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-ptl-8/igt@xe_pm@s4-multiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-50:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9192/shard-bmg-10/igt@xe_pmu@engine-activity-accuracy-50.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9461">Intel XE#9461</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-9/igt@xe_pmu@engine-activity-accuracy-50.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9192/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_survivability@runtime-survivability:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9192/shard-bmg-5/igt@xe_survivability@runtime-survivability.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9762">Intel XE#9762</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-7/igt@xe_survivability@runtime-survivability.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9365">Intel XE#9365</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@cold-reset-wedged:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9192/shard-bmg-5/igt@xe_wedged@cold-reset-wedged.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9781">Intel XE#9781</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16149/shard-bmg-8/igt@xe_wedged@cold-reset-wedged.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9747">Intel XE#9747</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9192 -&gt; IGTPW_16149</li>
<li>Linux: xe-6137-2b4f99da078af1e9a391d4a4ff51550e30b711f2 -&gt; xe-6146-1e689143b673f45c712bacde9b1c4b8c360efdca</li>
</ul>
<p>IGTPW_16149: 16149<br />
  IGT_9192: 9192<br />
  xe-6137-2b4f99da078af1e9a391d4a4ff51550e30b711f2: 2b4f99da078af1e9a391d4a4ff51550e30b711f2<br />
  xe-6146-1e689143b673f45c712bacde9b1c4b8c360efdca: 1e689143b673f45c712bacde9b1c4b8c360efdca</p>

</body>
</html>

--===============1577118094888375244==--
