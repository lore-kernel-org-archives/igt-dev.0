Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B9DC98338
	for <igt-dev@archiver.kernel.org>; Sat, 17 Jan 2026 19:35:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C408810E170;
	Sat, 17 Jan 2026 19:35:45 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C7AA10E170;
 Sat, 17 Jan 2026 19:35:44 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2078123894629876623=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_Improve_pixel-format_test?=
 =?utf-8?q?s?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sat, 17 Jan 2026 19:35:44 -0000
Message-ID: <176867854423.164794.1384197688152050608@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260117184348.38163-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20260117184348.38163-1-ramanaidu.naladala@intel.com>
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

--===============2078123894629876623==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Improve pixel-format tests
URL   : https://patchwork.freedesktop.org/series/160237/
State : success

== Summary ==

CI Bug Log - changes from IGT_8704 -> IGTPW_14362
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/index.html

Participating hosts (43 -> 41)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_14362:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-a-plane-3} (NEW):
    - bat-dg2-14:         NOTRUN -> [SKIP][1] +138 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/bat-dg2-14/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-a-plane-3.html

  * {igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-b-plane-3} (NEW):
    - bat-jsl-1:          NOTRUN -> [SKIP][2] +189 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/bat-jsl-1/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-b-plane-3.html

  * {igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-b-plane-3} (NEW):
    - bat-arls-6:         NOTRUN -> [SKIP][3] +141 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/bat-arls-6/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-b-plane-3.html

  * {igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-a-plane-5} (NEW):
    - bat-mtlp-9:         NOTRUN -> [SKIP][4] +117 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/bat-mtlp-9/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-a-plane-5.html

  * {igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane-5} (NEW):
    - bat-dg1-7:          NOTRUN -> [SKIP][5] +176 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/bat-dg1-7/igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane-5.html

  * {igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clamping@pipe-b-plane-3} (NEW):
    - bat-twl-2:          NOTRUN -> [SKIP][6] +141 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/bat-twl-2/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clamping@pipe-b-plane-3.html

  * {igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-a-plane-0} (NEW):
    - bat-rpls-4:         NOTRUN -> [SKIP][7] +117 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/bat-rpls-4/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-a-plane-0.html

  * {igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-c-plane-0} (NEW):
    - fi-bsw-n3050:       NOTRUN -> [DMESG-WARN][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/fi-bsw-n3050/igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-c-plane-0.html

  * {igt@kms_plane@pixel-format-x-tiled-modifier@pipe-a-plane-7} (NEW):
    - bat-jsl-5:          NOTRUN -> [SKIP][9] +189 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/bat-jsl-5/igt@kms_plane@pixel-format-x-tiled-modifier@pipe-a-plane-7.html

  * {igt@kms_plane@pixel-format-x-tiled-modifier@pipe-c-plane-1} (NEW):
    - fi-bsw-n3050:       NOTRUN -> [DMESG-FAIL][10] +7 other tests dmesg-fail
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/fi-bsw-n3050/igt@kms_plane@pixel-format-x-tiled-modifier@pipe-c-plane-1.html

  * {igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-b-plane-3} (NEW):
    - bat-mtlp-8:         NOTRUN -> [SKIP][11] +117 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/bat-mtlp-8/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-b-plane-3.html
    - bat-dg2-8:          NOTRUN -> [SKIP][12] +138 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/bat-dg2-8/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-b-plane-3.html

  * {igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-a-plane-3} (NEW):
    - bat-twl-1:          NOTRUN -> [SKIP][13] +141 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/bat-twl-1/igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-a-plane-3.html

  * {igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-a-plane-7} (NEW):
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][14] +176 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/fi-tgl-1115g4/igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-a-plane-7.html

  * {igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-0} (NEW):
    - bat-arlh-3:         NOTRUN -> [SKIP][15] +141 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/bat-arlh-3/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-0.html

  * {igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-5} (NEW):
    - bat-adls-6:         NOTRUN -> [SKIP][16] +117 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/bat-adls-6/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-5.html

  * {igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-a-plane-0} (NEW):
    - bat-dg2-9:          NOTRUN -> [SKIP][17] +138 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/bat-dg2-9/igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-a-plane-0.html

  * {igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-b-plane-3} (NEW):
    - bat-arls-5:         NOTRUN -> [SKIP][18] +141 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/bat-arls-5/igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-b-plane-3.html

  * {igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-b-plane-3} (NEW):
    - bat-rplp-1:         NOTRUN -> [SKIP][19] +141 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/bat-rplp-1/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-b-plane-3.html

  * {igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-a-plane-5} (NEW):
    - bat-adlp-9:         NOTRUN -> [SKIP][20] +117 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/bat-adlp-9/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-a-plane-5.html

  * {igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-a-plane-5} (NEW):
    - bat-adlp-6:         NOTRUN -> [SKIP][21] +117 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/bat-adlp-6/igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-a-plane-5.html

  
New tests
---------

  New tests have been introduced between IGT_8704 and IGTPW_14362:

### New IGT tests (684) ###

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier:
    - Statuses : 41 skip(s)
    - Exec time: [0.0, 1.87] s

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping:
    - Statuses : 32 pass(s) 9 skip(s)
    - Exec time: [0.0, 1.82] s

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-a-plane-0:
    - Statuses : 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-a-plane-1:
    - Statuses : 1 pass(s) 11 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-a-plane-2:
    - Statuses : 9 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-a-plane-3:
    - Statuses : 1 pass(s) 20 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-a-plane-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-a-plane-5:
    - Statuses : 15 pass(s) 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-a-plane-7:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-b-plane-0:
    - Statuses : 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-b-plane-1:
    - Statuses : 1 pass(s) 11 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-b-plane-2:
    - Statuses : 9 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-b-plane-3:
    - Statuses : 1 pass(s) 20 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-b-plane-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-b-plane-5:
    - Statuses : 15 pass(s) 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-b-plane-7:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-c-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-c-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-c-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-c-plane-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-0:
    - Statuses : 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-1:
    - Statuses : 12 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-2:
    - Statuses : 11 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-3:
    - Statuses : 21 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-5:
    - Statuses : 19 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-7:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-b-plane-0:
    - Statuses : 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-b-plane-1:
    - Statuses : 12 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-b-plane-2:
    - Statuses : 11 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-b-plane-3:
    - Statuses : 21 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-b-plane-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-b-plane-5:
    - Statuses : 19 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-b-plane-7:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-c-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-c-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-c-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-c-plane-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:
    - Statuses : 41 skip(s)
    - Exec time: [0.0, 1.97] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping:
    - Statuses : 32 pass(s) 9 skip(s)
    - Exec time: [0.0, 1.94] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-a-plane-0:
    - Statuses : 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-a-plane-1:
    - Statuses : 1 pass(s) 11 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-a-plane-2:
    - Statuses : 9 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-a-plane-3:
    - Statuses : 1 pass(s) 20 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-a-plane-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-a-plane-5:
    - Statuses : 15 pass(s) 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-a-plane-7:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-b-plane-0:
    - Statuses : 31 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-b-plane-1:
    - Statuses : 1 pass(s) 11 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-b-plane-2:
    - Statuses : 9 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-b-plane-3:
    - Statuses : 1 pass(s) 20 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-b-plane-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-b-plane-5:
    - Statuses : 15 pass(s) 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-b-plane-7:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-c-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-c-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-c-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-c-plane-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-a-plane-0:
    - Statuses : 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-a-plane-1:
    - Statuses : 12 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-a-plane-2:
    - Statuses : 11 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-a-plane-3:
    - Statuses : 21 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-a-plane-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-a-plane-5:
    - Statuses : 19 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-a-plane-7:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-b-plane-0:
    - Statuses : 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-b-plane-1:
    - Statuses : 12 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-b-plane-2:
    - Statuses : 11 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-b-plane-3:
    - Statuses : 21 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-b-plane-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-b-plane-5:
    - Statuses : 19 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-b-plane-7:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-c-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-c-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-c-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-c-plane-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:
    - Statuses : 41 skip(s)
    - Exec time: [0.0, 1.94] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping:
    - Statuses : 32 pass(s) 9 skip(s)
    - Exec time: [0.0, 1.97] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-0:
    - Statuses : 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-1:
    - Statuses : 1 pass(s) 11 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-2:
    - Statuses : 9 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-3:
    - Statuses : 1 pass(s) 20 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-5:
    - Statuses : 15 pass(s) 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-7:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-0:
    - Statuses : 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-1:
    - Statuses : 1 pass(s) 11 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-2:
    - Statuses : 9 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-3:
    - Statuses : 1 pass(s) 20 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-5:
    - Statuses : 15 pass(s) 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-7:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-c-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-c-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-c-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-c-plane-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-a-plane-0:
    - Statuses : 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-a-plane-1:
    - Statuses : 12 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-a-plane-2:
    - Statuses : 11 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-a-plane-3:
    - Statuses : 21 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-a-plane-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-a-plane-5:
    - Statuses : 19 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-a-plane-7:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-b-plane-0:
    - Statuses : 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-b-plane-1:
    - Statuses : 12 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-b-plane-2:
    - Statuses : 11 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-b-plane-3:
    - Statuses : 21 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-b-plane-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-b-plane-5:
    - Statuses : 19 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-b-plane-7:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-c-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-c-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-c-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-c-plane-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier:
    - Statuses : 41 skip(s)
    - Exec time: [0.0, 1.91] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping:
    - Statuses : 32 pass(s) 9 skip(s)
    - Exec time: [0.0, 1.94] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-a-plane-0:
    - Statuses : 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-a-plane-1:
    - Statuses : 1 pass(s) 11 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-a-plane-2:
    - Statuses : 9 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-a-plane-3:
    - Statuses : 1 pass(s) 20 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-a-plane-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-a-plane-5:
    - Statuses : 15 pass(s) 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-a-plane-7:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-b-plane-0:
    - Statuses : 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-b-plane-1:
    - Statuses : 1 pass(s) 11 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-b-plane-2:
    - Statuses : 9 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-b-plane-3:
    - Statuses : 1 pass(s) 20 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-b-plane-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-b-plane-5:
    - Statuses : 15 pass(s) 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-b-plane-7:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-c-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-c-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-c-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-c-plane-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-a-plane-0:
    - Statuses : 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-a-plane-1:
    - Statuses : 12 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-a-plane-2:
    - Statuses : 11 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-a-plane-3:
    - Statuses : 21 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-a-plane-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-a-plane-5:
    - Statuses : 19 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-a-plane-7:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-b-plane-0:
    - Statuses : 31 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-b-plane-1:
    - Statuses : 12 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-b-plane-2:
    - Statuses : 11 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-b-plane-3:
    - Statuses : 21 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-b-plane-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-b-plane-5:
    - Statuses : 19 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-b-plane-7:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-c-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-c-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-c-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-c-plane-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier:
    - Statuses : 41 skip(s)
    - Exec time: [0.0, 1.95] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:
    - Statuses : 32 pass(s) 9 skip(s)
    - Exec time: [0.0, 1.88] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-a-plane-0:
    - Statuses : 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-a-plane-1:
    - Statuses : 1 pass(s) 11 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-a-plane-2:
    - Statuses : 9 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-a-plane-3:
    - Statuses : 1 pass(s) 20 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-a-plane-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-a-plane-5:
    - Statuses : 15 pass(s) 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-a-plane-7:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-b-plane-0:
    - Statuses : 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-b-plane-1:
    - Statuses : 1 pass(s) 11 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-b-plane-2:
    - Statuses : 9 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-b-plane-3:
    - Statuses : 1 pass(s) 20 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-b-plane-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-b-plane-5:
    - Statuses : 15 pass(s) 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-b-plane-7:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-c-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-c-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-c-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-c-plane-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-a-plane-0:
    - Statuses : 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-a-plane-1:
    - Statuses : 12 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-a-plane-2:
    - Statuses : 11 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-a-plane-3:
    - Statuses : 21 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-a-plane-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-a-plane-5:
    - Statuses : 19 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-a-plane-7:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-b-plane-0:
    - Statuses : 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-b-plane-1:
    - Statuses : 12 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-b-plane-2:
    - Statuses : 11 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-b-plane-3:
    - Statuses : 21 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-b-plane-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-b-plane-5:
    - Statuses : 19 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-b-plane-7:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-c-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-c-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-c-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-c-plane-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-modifier:
    - Statuses : 8 pass(s) 33 skip(s)
    - Exec time: [0.0, 4.65] s

  * igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping:
    - Statuses : 32 pass(s) 9 skip(s)
    - Exec time: [0.0, 4.26] s

  * igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane-0:
    - Statuses : 8 pass(s) 23 skip(s)
    - Exec time: [0.0, 1.18] s

  * igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane-1:
    - Statuses : 1 pass(s) 11 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane-2:
    - Statuses : 9 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane-3:
    - Statuses : 9 pass(s) 12 skip(s)
    - Exec time: [0.0, 0.73] s

  * igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane-5:
    - Statuses : 15 pass(s) 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane-7:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-b-plane-0:
    - Statuses : 8 pass(s) 23 skip(s)
    - Exec time: [0.0, 1.05] s

  * igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-b-plane-1:
    - Statuses : 1 pass(s) 11 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-b-plane-2:
    - Statuses : 9 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-b-plane-3:
    - Statuses : 9 pass(s) 12 skip(s)
    - Exec time: [0.0, 0.71] s

  * igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-b-plane-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-b-plane-5:
    - Statuses : 15 pass(s) 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-b-plane-7:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-c-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-c-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-c-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-c-plane-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-0:
    - Statuses : 8 pass(s) 23 skip(s)
    - Exec time: [0.0, 1.17] s

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-1:
    - Statuses : 12 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-2:
    - Statuses : 11 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-3:
    - Statuses : 8 pass(s) 13 skip(s)
    - Exec time: [0.0, 0.68] s

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5:
    - Statuses : 19 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-7:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-0:
    - Statuses : 8 pass(s) 23 skip(s)
    - Exec time: [0.0, 1.08] s

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-1:
    - Statuses : 12 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-2:
    - Statuses : 11 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-3:
    - Statuses : 8 pass(s) 13 skip(s)
    - Exec time: [0.0, 0.72] s

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5:
    - Statuses : 19 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-7:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-c-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-c-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-c-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-c-plane-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:
    - Statuses : 5 pass(s) 36 skip(s)
    - Exec time: [0.0, 3.51] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping:
    - Statuses : 32 pass(s) 9 skip(s)
    - Exec time: [0.0, 3.40] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-a-plane-0:
    - Statuses : 5 pass(s) 26 skip(s)
    - Exec time: [0.0, 0.60] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-a-plane-1:
    - Statuses : 1 pass(s) 11 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-a-plane-2:
    - Statuses : 9 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-a-plane-3:
    - Statuses : 6 pass(s) 15 skip(s)
    - Exec time: [0.0, 0.37] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-a-plane-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-a-plane-5:
    - Statuses : 15 pass(s) 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-a-plane-7:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-b-plane-0:
    - Statuses : 5 pass(s) 26 skip(s)
    - Exec time: [0.0, 0.57] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-b-plane-1:
    - Statuses : 1 pass(s) 11 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-b-plane-2:
    - Statuses : 9 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-b-plane-3:
    - Statuses : 6 pass(s) 15 skip(s)
    - Exec time: [0.0, 0.36] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-b-plane-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-b-plane-5:
    - Statuses : 15 pass(s) 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-b-plane-7:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-c-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-c-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-c-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-c-plane-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-a-plane-0:
    - Statuses : 5 pass(s) 26 skip(s)
    - Exec time: [0.0, 0.60] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-a-plane-1:
    - Statuses : 12 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-a-plane-2:
    - Statuses : 11 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-a-plane-3:
    - Statuses : 5 pass(s) 16 skip(s)
    - Exec time: [0.0, 0.36] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-a-plane-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-a-plane-5:
    - Statuses : 19 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-a-plane-7:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-b-plane-0:
    - Statuses : 5 pass(s) 26 skip(s)
    - Exec time: [0.0, 0.67] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-b-plane-1:
    - Statuses : 12 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-b-plane-2:
    - Statuses : 11 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-b-plane-3:
    - Statuses : 5 pass(s) 16 skip(s)
    - Exec time: [0.0, 0.40] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-b-plane-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-b-plane-5:
    - Statuses : 19 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-b-plane-7:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-c-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-c-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-c-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-c-plane-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier:
    - Statuses : 5 pass(s) 36 skip(s)
    - Exec time: [0.0, 2.94] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clamping:
    - Statuses : 32 pass(s) 9 skip(s)
    - Exec time: [0.0, 3.07] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clamping@pipe-a-plane-0:
    - Statuses : 5 pass(s) 26 skip(s)
    - Exec time: [0.0, 0.40] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clamping@pipe-a-plane-1:
    - Statuses : 1 pass(s) 11 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clamping@pipe-a-plane-2:
    - Statuses : 9 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clamping@pipe-a-plane-3:
    - Statuses : 6 pass(s) 15 skip(s)
    - Exec time: [0.0, 0.38] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clamping@pipe-a-plane-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clamping@pipe-a-plane-5:
    - Statuses : 15 pass(s) 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clamping@pipe-a-plane-7:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clamping@pipe-b-plane-0:
    - Statuses : 5 pass(s) 26 skip(s)
    - Exec time: [0.0, 0.45] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clamping@pipe-b-plane-1:
    - Statuses : 1 pass(s) 11 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clamping@pipe-b-plane-2:
    - Statuses : 9 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clamping@pipe-b-plane-3:
    - Statuses : 6 pass(s) 15 skip(s)
    - Exec time: [0.0, 0.36] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clamping@pipe-b-plane-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clamping@pipe-b-plane-5:
    - Statuses : 15 pass(s) 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clamping@pipe-b-plane-7:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clamping@pipe-c-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clamping@pipe-c-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clamping@pipe-c-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clamping@pipe-c-plane-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-a-plane-0:
    - Statuses : 5 pass(s) 26 skip(s)
    - Exec time: [0.0, 0.42] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-a-plane-1:
    - Statuses : 12 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-a-plane-2:
    - Statuses : 11 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-a-plane-3:
    - Statuses : 5 pass(s) 16 skip(s)
    - Exec time: [0.0, 0.32] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-a-plane-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-a-plane-5:
    - Statuses : 19 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-a-plane-7:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-b-plane-0:
    - Statuses : 5 pass(s) 26 skip(s)
    - Exec time: [0.0, 0.37] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-b-plane-1:
    - Statuses : 12 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-b-plane-2:
    - Statuses : 11 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-b-plane-3:
    - Statuses : 5 pass(s) 16 skip(s)
    - Exec time: [0.0, 0.32] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-b-plane-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-b-plane-5:
    - Statuses : 19 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-b-plane-7:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-c-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-c-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-c-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-c-plane-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier:
    - Statuses : 5 pass(s) 36 skip(s)
    - Exec time: [0.0, 3.08] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:
    - Statuses : 32 pass(s) 9 skip(s)
    - Exec time: [0.0, 2.85] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-a-plane-0:
    - Statuses : 5 pass(s) 26 skip(s)
    - Exec time: [0.0, 0.40] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-a-plane-1:
    - Statuses : 1 pass(s) 11 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-a-plane-2:
    - Statuses : 9 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-a-plane-3:
    - Statuses : 6 pass(s) 15 skip(s)
    - Exec time: [0.0, 0.32] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-a-plane-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-a-plane-5:
    - Statuses : 15 pass(s) 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-a-plane-7:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-b-plane-0:
    - Statuses : 5 pass(s) 26 skip(s)
    - Exec time: [0.0, 0.37] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-b-plane-1:
    - Statuses : 1 pass(s) 11 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-b-plane-2:
    - Statuses : 9 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-b-plane-3:
    - Statuses : 6 pass(s) 15 skip(s)
    - Exec time: [0.0, 0.32] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-b-plane-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-b-plane-5:
    - Statuses : 15 pass(s) 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-b-plane-7:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-c-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-c-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-c-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-c-plane-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-a-plane-0:
    - Statuses : 5 pass(s) 26 skip(s)
    - Exec time: [0.0, 0.40] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-a-plane-1:
    - Statuses : 12 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-a-plane-2:
    - Statuses : 11 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-a-plane-3:
    - Statuses : 5 pass(s) 16 skip(s)
    - Exec time: [0.0, 0.35] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-a-plane-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-a-plane-5:
    - Statuses : 19 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-a-plane-7:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-b-plane-0:
    - Statuses : 5 pass(s) 26 skip(s)
    - Exec time: [0.0, 0.45] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-b-plane-1:
    - Statuses : 12 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-b-plane-2:
    - Statuses : 11 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-b-plane-3:
    - Statuses : 5 pass(s) 16 skip(s)
    - Exec time: [0.0, 0.37] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-b-plane-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-b-plane-5:
    - Statuses : 19 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-b-plane-7:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-c-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-c-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-c-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-c-plane-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-linear-modifier:
    - Statuses : 1 dmesg-fail(s) 31 pass(s) 9 skip(s)
    - Exec time: [0.0, 27.19] s

  * igt@kms_plane@pixel-format-linear-modifier-source-clamping:
    - Statuses : 1 dmesg-fail(s) 31 pass(s) 9 skip(s)
    - Exec time: [0.0, 25.96] s

  * igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-a-plane-0:
    - Statuses : 31 pass(s)
    - Exec time: [0.64, 6.98] s

  * igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-a-plane-1:
    - Statuses : 12 pass(s)
    - Exec time: [0.0, 3.55] s

  * igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-a-plane-2:
    - Statuses : 11 pass(s)
    - Exec time: [0.0, 1.56] s

  * igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-a-plane-3:
    - Statuses : 21 pass(s)
    - Exec time: [0.0, 4.60] s

  * igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-a-plane-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-a-plane-5:
    - Statuses : 19 pass(s)
    - Exec time: [0.0, 2.70] s

  * igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-a-plane-7:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-b-plane-0:
    - Statuses : 31 pass(s)
    - Exec time: [0.64, 6.78] s

  * igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-b-plane-1:
    - Statuses : 12 pass(s)
    - Exec time: [0.0, 3.55] s

  * igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-b-plane-2:
    - Statuses : 11 pass(s)
    - Exec time: [0.0, 1.54] s

  * igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-b-plane-3:
    - Statuses : 21 pass(s)
    - Exec time: [0.0, 4.73] s

  * igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-b-plane-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-b-plane-5:
    - Statuses : 19 pass(s)
    - Exec time: [0.0, 3.05] s

  * igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-b-plane-7:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-c-plane-0:
    - Statuses : 1 pass(s)
    - Exec time: [5.33] s

  * igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-c-plane-1:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [1.17] s

  * igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-c-plane-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.05] s

  * igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-c-plane-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-linear-modifier@pipe-a-plane-0:
    - Statuses : 31 pass(s)
    - Exec time: [0.58, 7.02] s

  * igt@kms_plane@pixel-format-linear-modifier@pipe-a-plane-1:
    - Statuses : 12 pass(s)
    - Exec time: [0.26, 3.57] s

  * igt@kms_plane@pixel-format-linear-modifier@pipe-a-plane-2:
    - Statuses : 11 pass(s)
    - Exec time: [0.20, 1.56] s

  * igt@kms_plane@pixel-format-linear-modifier@pipe-a-plane-3:
    - Statuses : 21 pass(s)
    - Exec time: [0.21, 4.70] s

  * igt@kms_plane@pixel-format-linear-modifier@pipe-a-plane-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.21] s

  * igt@kms_plane@pixel-format-linear-modifier@pipe-a-plane-5:
    - Statuses : 19 pass(s)
    - Exec time: [0.17, 3.05] s

  * igt@kms_plane@pixel-format-linear-modifier@pipe-a-plane-7:
    - Statuses : 4 pass(s)
    - Exec time: [0.11, 0.22] s

  * igt@kms_plane@pixel-format-linear-modifier@pipe-b-plane-0:
    - Statuses : 31 pass(s)
    - Exec time: [0.58, 6.87] s

  * igt@kms_plane@pixel-format-linear-modifier@pipe-b-plane-1:
    - Statuses : 12 pass(s)
    - Exec time: [0.27, 3.57] s

  * igt@kms_plane@pixel-format-linear-modifier@pipe-b-plane-2:
    - Statuses : 11 pass(s)
    - Exec time: [0.20, 1.55] s

  * igt@kms_plane@pixel-format-linear-modifier@pipe-b-plane-3:
    - Statuses : 21 pass(s)
    - Exec time: [0.21, 4.58] s

  * igt@kms_plane@pixel-format-linear-modifier@pipe-b-plane-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.21] s

  * igt@kms_plane@pixel-format-linear-modifier@pipe-b-plane-5:
    - Statuses : 19 pass(s)
    - Exec time: [0.17, 3.31] s

  * igt@kms_plane@pixel-format-linear-modifier@pipe-b-plane-7:
    - Statuses : 4 pass(s)
    - Exec time: [0.10, 0.25] s

  * igt@kms_plane@pixel-format-linear-modifier@pipe-c-plane-0:
    - Statuses : 1 pass(s)
    - Exec time: [4.85] s

  * igt@kms_plane@pixel-format-linear-modifier@pipe-c-plane-1:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [1.10] s

  * igt@kms_plane@pixel-format-linear-modifier@pipe-c-plane-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.04] s

  * igt@kms_plane@pixel-format-linear-modifier@pipe-c-plane-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.23] s

  * igt@kms_plane@pixel-format-x-tiled-modifier:
    - Statuses : 1 dmesg-fail(s) 31 pass(s) 9 skip(s)
    - Exec time: [0.0, 6.34] s

  * igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping:
    - Statuses : 1 dmesg-fail(s) 31 pass(s) 9 skip(s)
    - Exec time: [0.0, 6.34] s

  * igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-a-plane-0:
    - Statuses : 31 pass(s)
    - Exec time: [0.47, 1.63] s

  * igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-a-plane-1:
    - Statuses : 12 pass(s)
    - Exec time: [0.0, 0.65] s

  * igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-a-plane-2:
    - Statuses : 11 pass(s)
    - Exec time: [0.0, 0.50] s

  * igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-a-plane-3:
    - Statuses : 21 pass(s)
    - Exec time: [0.0, 0.83] s

  * igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-a-plane-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-a-plane-5:
    - Statuses : 19 pass(s)
    - Exec time: [0.0, 0.71] s

  * igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-a-plane-7:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-b-plane-0:
    - Statuses : 31 pass(s)
    - Exec time: [0.45, 1.63] s

  * igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-b-plane-1:
    - Statuses : 12 pass(s)
    - Exec time: [0.0, 0.65] s

  * igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-b-plane-2:
    - Statuses : 11 pass(s)
    - Exec time: [0.0, 0.52] s

  * igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-b-plane-3:
    - Statuses : 21 pass(s)
    - Exec time: [0.0, 0.85] s

  * igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-b-plane-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-b-plane-5:
    - Statuses : 19 pass(s)
    - Exec time: [0.0, 0.70] s

  * igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-b-plane-7:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-c-plane-0:
    - Statuses : 1 dmesg-warn(s)
    - Exec time: [4.95] s

  * igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-c-plane-1:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [0.53] s

  * igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-c-plane-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.46] s

  * igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-c-plane-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-a-plane-0:
    - Statuses : 31 pass(s)
    - Exec time: [0.46, 1.38] s

  * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-a-plane-1:
    - Statuses : 11 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.65] s

  * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-a-plane-2:
    - Statuses : 2 pass(s) 9 skip(s)
    - Exec time: [0.0, 0.52] s

  * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-a-plane-3:
    - Statuses : 20 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.83] s

  * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-a-plane-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-a-plane-5:
    - Statuses : 4 pass(s) 15 skip(s)
    - Exec time: [0.0, 0.72] s

  * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-a-plane-7:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-0:
    - Statuses : 31 pass(s)
    - Exec time: [0.42, 1.38] s

  * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-1:
    - Statuses : 11 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.65] s

  * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-2:
    - Statuses : 2 pass(s) 9 skip(s)
    - Exec time: [0.0, 0.48] s

  * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-3:
    - Statuses : 20 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.83] s

  * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5:
    - Statuses : 4 pass(s) 15 skip(s)
    - Exec time: [0.0, 0.70] s

  * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-7:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-c-plane-0:
    - Statuses : 1 pass(s)
    - Exec time: [3.61] s

  * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-c-plane-1:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [0.53] s

  * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-c-plane-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.43] s

  * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-c-plane-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier:
    - Statuses : 9 pass(s) 32 skip(s)
    - Exec time: [0.0, 3.92] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:
    - Statuses : 32 pass(s) 9 skip(s)
    - Exec time: [0.0, 4.0] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-a-plane-0:
    - Statuses : 9 pass(s) 22 skip(s)
    - Exec time: [0.0, 0.37] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-a-plane-1:
    - Statuses : 8 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.38] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-a-plane-2:
    - Statuses : 10 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.28] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-a-plane-3:
    - Statuses : 4 pass(s) 17 skip(s)
    - Exec time: [0.0, 0.34] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-a-plane-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-a-plane-5:
    - Statuses : 17 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.33] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-a-plane-7:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-b-plane-0:
    - Statuses : 9 pass(s) 22 skip(s)
    - Exec time: [0.0, 0.40] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-b-plane-1:
    - Statuses : 8 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.36] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-b-plane-2:
    - Statuses : 10 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.26] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-b-plane-3:
    - Statuses : 4 pass(s) 17 skip(s)
    - Exec time: [0.0, 0.36] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-b-plane-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-b-plane-5:
    - Statuses : 17 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.34] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-b-plane-7:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-c-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-c-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-c-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-c-plane-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-a-plane-0:
    - Statuses : 9 pass(s) 22 skip(s)
    - Exec time: [0.0, 0.38] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-a-plane-1:
    - Statuses : 7 pass(s) 5 skip(s)
    - Exec time: [0.0, 0.33] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-a-plane-2:
    - Statuses : 1 pass(s) 10 skip(s)
    - Exec time: [0.0, 0.27] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-a-plane-3:
    - Statuses : 3 pass(s) 18 skip(s)
    - Exec time: [0.0, 0.36] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-a-plane-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-a-plane-5:
    - Statuses : 2 pass(s) 17 skip(s)
    - Exec time: [0.0, 0.36] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-a-plane-7:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-b-plane-0:
    - Statuses : 9 pass(s) 22 skip(s)
    - Exec time: [0.0, 0.40] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-b-plane-1:
    - Statuses : 7 pass(s) 5 skip(s)
    - Exec time: [0.0, 0.40] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-b-plane-2:
    - Statuses : 1 pass(s) 10 skip(s)
    - Exec time: [0.0, 0.27] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-b-plane-3:
    - Statuses : 3 pass(s) 18 skip(s)
    - Exec time: [0.0, 0.35] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-b-plane-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-b-plane-5:
    - Statuses : 2 pass(s) 17 skip(s)
    - Exec time: [0.0, 0.36] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-b-plane-7:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-c-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-c-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-c-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-c-plane-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier:
    - Statuses : 7 pass(s) 34 skip(s)
    - Exec time: [0.0, 3.62] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:
    - Statuses : 32 pass(s) 9 skip(s)
    - Exec time: [0.0, 3.72] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-a-plane-0:
    - Statuses : 7 pass(s) 24 skip(s)
    - Exec time: [0.0, 0.67] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-a-plane-1:
    - Statuses : 1 pass(s) 11 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-a-plane-2:
    - Statuses : 9 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-a-plane-3:
    - Statuses : 8 pass(s) 13 skip(s)
    - Exec time: [0.0, 0.40] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-a-plane-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-a-plane-5:
    - Statuses : 15 pass(s) 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-a-plane-7:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-b-plane-0:
    - Statuses : 7 pass(s) 24 skip(s)
    - Exec time: [0.0, 0.67] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-b-plane-1:
    - Statuses : 1 pass(s) 11 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-b-plane-2:
    - Statuses : 9 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-b-plane-3:
    - Statuses : 8 pass(s) 13 skip(s)
    - Exec time: [0.0, 0.40] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-b-plane-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-b-plane-5:
    - Statuses : 15 pass(s) 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-b-plane-7:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-c-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-c-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-c-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-c-plane-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-a-plane-0:
    - Statuses : 7 pass(s) 24 skip(s)
    - Exec time: [0.0, 0.67] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-a-plane-1:
    - Statuses : 12 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-a-plane-2:
    - Statuses : 11 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-a-plane-3:
    - Statuses : 7 pass(s) 14 skip(s)
    - Exec time: [0.0, 0.40] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-a-plane-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-a-plane-5:
    - Statuses : 19 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-a-plane-7:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-b-plane-0:
    - Statuses : 7 pass(s) 24 skip(s)
    - Exec time: [0.0, 0.65] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-b-plane-1:
    - Statuses : 12 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-b-plane-2:
    - Statuses : 11 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-b-plane-3:
    - Statuses : 7 pass(s) 14 skip(s)
    - Exec time: [0.0, 0.36] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-b-plane-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-b-plane-5:
    - Statuses : 19 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-b-plane-7:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-c-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-c-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-c-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-c-plane-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier:
    - Statuses : 9 pass(s) 32 skip(s)
    - Exec time: [0.0, 3.07] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping:
    - Statuses : 32 pass(s) 9 skip(s)
    - Exec time: [0.0, 3.09] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-0:
    - Statuses : 9 pass(s) 22 skip(s)
    - Exec time: [0.0, 0.47] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-1:
    - Statuses : 1 pass(s) 11 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-2:
    - Statuses : 9 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-3:
    - Statuses : 10 pass(s) 11 skip(s)
    - Exec time: [0.0, 0.33] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-5:
    - Statuses : 17 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.35] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-7:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-0:
    - Statuses : 9 pass(s) 22 skip(s)
    - Exec time: [0.0, 0.40] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-1:
    - Statuses : 1 pass(s) 11 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-2:
    - Statuses : 9 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-3:
    - Statuses : 10 pass(s) 11 skip(s)
    - Exec time: [0.0, 0.35] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-5:
    - Statuses : 17 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.34] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-7:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-c-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-c-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-c-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-c-plane-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-a-plane-0:
    - Statuses : 9 pass(s) 22 skip(s)
    - Exec time: [0.0, 0.47] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-a-plane-1:
    - Statuses : 12 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-a-plane-2:
    - Statuses : 11 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-a-plane-3:
    - Statuses : 9 pass(s) 12 skip(s)
    - Exec time: [0.0, 0.33] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-a-plane-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-a-plane-5:
    - Statuses : 2 pass(s) 17 skip(s)
    - Exec time: [0.0, 0.35] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-a-plane-7:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-0:
    - Statuses : 9 pass(s) 22 skip(s)
    - Exec time: [0.0, 0.40] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-1:
    - Statuses : 12 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-2:
    - Statuses : 11 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-3:
    - Statuses : 9 pass(s) 12 skip(s)
    - Exec time: [0.0, 0.35] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-5:
    - Statuses : 2 pass(s) 17 skip(s)
    - Exec time: [0.0, 0.31] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-7:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-c-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-c-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-c-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-c-plane-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier:
    - Statuses : 9 pass(s) 32 skip(s)
    - Exec time: [0.0, 3.06] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping:
    - Statuses : 32 pass(s) 9 skip(s)
    - Exec time: [0.0, 3.06] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-a-plane-0:
    - Statuses : 9 pass(s) 22 skip(s)
    - Exec time: [0.0, 0.48] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-a-plane-1:
    - Statuses : 1 pass(s) 11 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-a-plane-2:
    - Statuses : 9 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-a-plane-3:
    - Statuses : 10 pass(s) 11 skip(s)
    - Exec time: [0.0, 0.35] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-a-plane-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-a-plane-5:
    - Statuses : 17 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.33] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-a-plane-7:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-b-plane-0:
    - Statuses : 9 pass(s) 22 skip(s)
    - Exec time: [0.0, 0.40] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-b-plane-1:
    - Statuses : 1 pass(s) 11 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-b-plane-2:
    - Statuses : 9 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-b-plane-3:
    - Statuses : 10 pass(s) 11 skip(s)
    - Exec time: [0.0, 0.35] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-b-plane-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-b-plane-5:
    - Statuses : 17 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.31] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-b-plane-7:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-c-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-c-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-c-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-c-plane-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-0:
    - Statuses : 9 pass(s) 22 skip(s)
    - Exec time: [0.0, 0.45] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-1:
    - Statuses : 12 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-2:
    - Statuses : 11 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-3:
    - Statuses : 9 pass(s) 12 skip(s)
    - Exec time: [0.0, 0.35] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-5:
    - Statuses : 2 pass(s) 17 skip(s)
    - Exec time: [0.0, 0.35] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-b-plane-0:
    - Statuses : 9 pass(s) 22 skip(s)
    - Exec time: [0.0, 0.40] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-b-plane-1:
    - Statuses : 12 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-b-plane-2:
    - Statuses : 11 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-b-plane-3:
    - Statuses : 9 pass(s) 12 skip(s)
    - Exec time: [0.0, 0.33] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-b-plane-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-b-plane-5:
    - Statuses : 2 pass(s) 17 skip(s)
    - Exec time: [0.0, 0.35] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-b-plane-7:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-c-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-c-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-c-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-c-plane-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-modifier:
    - Statuses : 18 pass(s) 23 skip(s)
    - Exec time: [0.0, 7.75] s

  * igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping:
    - Statuses : 32 pass(s) 9 skip(s)
    - Exec time: [0.0, 7.37] s

  * igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-a-plane-0:
    - Statuses : 18 pass(s) 13 skip(s)
    - Exec time: [0.0, 1.10] s

  * igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-a-plane-1:
    - Statuses : 8 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.80] s

  * igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-a-plane-2:
    - Statuses : 11 pass(s)
    - Exec time: [0.0, 0.60] s

  * igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-a-plane-3:
    - Statuses : 13 pass(s) 8 skip(s)
    - Exec time: [0.0, 0.93] s

  * igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-a-plane-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-a-plane-5:
    - Statuses : 19 pass(s)
    - Exec time: [0.0, 0.73] s

  * igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-a-plane-7:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-b-plane-0:
    - Statuses : 18 pass(s) 13 skip(s)
    - Exec time: [0.0, 1.05] s

  * igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-b-plane-1:
    - Statuses : 8 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.78] s

  * igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-b-plane-2:
    - Statuses : 11 pass(s)
    - Exec time: [0.0, 0.62] s

  * igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-b-plane-3:
    - Statuses : 13 pass(s) 8 skip(s)
    - Exec time: [0.0, 0.95] s

  * igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-b-plane-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-b-plane-5:
    - Statuses : 19 pass(s)
    - Exec time: [0.0, 0.71] s

  * igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-b-plane-7:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-c-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-c-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-c-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-c-plane-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-modifier@pipe-a-plane-0:
    - Statuses : 18 pass(s) 13 skip(s)
    - Exec time: [0.0, 1.18] s

  * igt@kms_plane@pixel-format-y-tiled-modifier@pipe-a-plane-1:
    - Statuses : 7 pass(s) 5 skip(s)
    - Exec time: [0.0, 0.77] s

  * igt@kms_plane@pixel-format-y-tiled-modifier@pipe-a-plane-2:
    - Statuses : 2 pass(s) 9 skip(s)
    - Exec time: [0.0, 0.58] s

  * igt@kms_plane@pixel-format-y-tiled-modifier@pipe-a-plane-3:
    - Statuses : 12 pass(s) 9 skip(s)
    - Exec time: [0.0, 1.31] s

  * igt@kms_plane@pixel-format-y-tiled-modifier@pipe-a-plane-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-modifier@pipe-a-plane-5:
    - Statuses : 4 pass(s) 15 skip(s)
    - Exec time: [0.0, 0.71] s

  * igt@kms_plane@pixel-format-y-tiled-modifier@pipe-a-plane-7:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-0:
    - Statuses : 18 pass(s) 13 skip(s)
    - Exec time: [0.0, 1.03] s

  * igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-1:
    - Statuses : 7 pass(s) 5 skip(s)
    - Exec time: [0.0, 0.78] s

  * igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-2:
    - Statuses : 2 pass(s) 9 skip(s)
    - Exec time: [0.0, 0.62] s

  * igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-3:
    - Statuses : 12 pass(s) 9 skip(s)
    - Exec time: [0.0, 0.95] s

  * igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-5:
    - Statuses : 4 pass(s) 15 skip(s)
    - Exec time: [0.0, 0.70] s

  * igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-7:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-modifier@pipe-c-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-modifier@pipe-c-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-modifier@pipe-c-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-modifier@pipe-c-plane-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier:
    - Statuses : 9 pass(s) 32 skip(s)
    - Exec time: [0.0, 3.94] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:
    - Statuses : 32 pass(s) 9 skip(s)
    - Exec time: [0.0, 3.93] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-a-plane-0:
    - Statuses : 9 pass(s) 22 skip(s)
    - Exec time: [0.0, 0.40] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-a-plane-1:
    - Statuses : 8 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.33] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-a-plane-2:
    - Statuses : 10 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.28] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-a-plane-3:
    - Statuses : 4 pass(s) 17 skip(s)
    - Exec time: [0.0, 0.34] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-a-plane-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-a-plane-5:
    - Statuses : 17 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.33] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-a-plane-7:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-b-plane-0:
    - Statuses : 9 pass(s) 22 skip(s)
    - Exec time: [0.0, 0.43] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-b-plane-1:
    - Statuses : 8 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.40] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-b-plane-2:
    - Statuses : 10 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.28] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-b-plane-3:
    - Statuses : 4 pass(s) 17 skip(s)
    - Exec time: [0.0, 0.34] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-b-plane-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-b-plane-5:
    - Statuses : 17 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.33] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-b-plane-7:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-c-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-c-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-c-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-c-plane-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-a-plane-0:
    - Statuses : 9 pass(s) 22 skip(s)
    - Exec time: [0.0, 0.37] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-a-plane-1:
    - Statuses : 7 pass(s) 5 skip(s)
    - Exec time: [0.0, 0.40] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-a-plane-2:
    - Statuses : 1 pass(s) 10 skip(s)
    - Exec time: [0.0, 0.28] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-a-plane-3:
    - Statuses : 3 pass(s) 18 skip(s)
    - Exec time: [0.0, 0.36] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-a-plane-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-a-plane-5:
    - Statuses : 2 pass(s) 17 skip(s)
    - Exec time: [0.0, 0.33] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-a-plane-7:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-b-plane-0:
    - Statuses : 9 pass(s) 22 skip(s)
    - Exec time: [0.0, 0.32] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-b-plane-1:
    - Statuses : 7 pass(s) 5 skip(s)
    - Exec time: [0.0, 0.32] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-b-plane-2:
    - Statuses : 1 pass(s) 10 skip(s)
    - Exec time: [0.0, 0.28] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-b-plane-3:
    - Statuses : 3 pass(s) 18 skip(s)
    - Exec time: [0.0, 0.35] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-b-plane-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-b-plane-5:
    - Statuses : 2 pass(s) 17 skip(s)
    - Exec time: [0.0, 0.33] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-b-plane-7:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-c-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-c-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-c-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-c-plane-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier:
    - Statuses : 9 pass(s) 32 skip(s)
    - Exec time: [0.0, 6.26] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:
    - Statuses : 32 pass(s) 9 skip(s)
    - Exec time: [0.0, 6.30] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-a-plane-0:
    - Statuses : 9 pass(s) 22 skip(s)
    - Exec time: [0.0, 0.83] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-a-plane-1:
    - Statuses : 8 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.68] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-a-plane-2:
    - Statuses : 11 pass(s)
    - Exec time: [0.0, 0.48] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-a-plane-3:
    - Statuses : 4 pass(s) 17 skip(s)
    - Exec time: [0.0, 0.81] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-a-plane-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-a-plane-5:
    - Statuses : 17 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.58] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-a-plane-7:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-b-plane-0:
    - Statuses : 9 pass(s) 22 skip(s)
    - Exec time: [0.0, 0.78] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-b-plane-1:
    - Statuses : 8 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.66] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-b-plane-2:
    - Statuses : 11 pass(s)
    - Exec time: [0.0, 0.48] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-b-plane-3:
    - Statuses : 4 pass(s) 17 skip(s)
    - Exec time: [0.0, 0.86] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-b-plane-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-b-plane-5:
    - Statuses : 17 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.58] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-b-plane-7:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-c-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-c-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-c-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-c-plane-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-a-plane-0:
    - Statuses : 9 pass(s) 22 skip(s)
    - Exec time: [0.0, 0.85] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-a-plane-1:
    - Statuses : 7 pass(s) 5 skip(s)
    - Exec time: [0.0, 0.75] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-a-plane-2:
    - Statuses : 2 pass(s) 9 skip(s)
    - Exec time: [0.0, 0.48] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-a-plane-3:
    - Statuses : 3 pass(s) 18 skip(s)
    - Exec time: [0.0, 0.83] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-a-plane-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-a-plane-5:
    - Statuses : 2 pass(s) 17 skip(s)
    - Exec time: [0.0, 0.60] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-a-plane-7:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-b-plane-0:
    - Statuses : 9 pass(s) 22 skip(s)
    - Exec time: [0.0, 0.82] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-b-plane-1:
    - Statuses : 7 pass(s) 5 skip(s)
    - Exec time: [0.0, 0.67] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-b-plane-2:
    - Statuses : 2 pass(s) 9 skip(s)
    - Exec time: [0.0, 0.47] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-b-plane-3:
    - Statuses : 3 pass(s) 18 skip(s)
    - Exec time: [0.0, 0.83] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-b-plane-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-b-plane-5:
    - Statuses : 2 pass(s) 17 skip(s)
    - Exec time: [0.0, 0.57] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-b-plane-7:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-c-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-c-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-c-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-c-plane-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_14362 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * {igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-b-plane-5} (NEW):
    - bat-adls-6:         NOTRUN -> [SKIP][22] ([i915#8825]) +23 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/bat-adls-6/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-b-plane-5.html

  * {igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-b-plane-1} (NEW):
    - fi-ivb-3770:        NOTRUN -> [SKIP][23] +177 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/fi-ivb-3770/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-b-plane-1.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][24] +177 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/fi-elk-e7500/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-b-plane-1.html

  * {igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-0} (NEW):
    - fi-ilk-650:         NOTRUN -> [SKIP][25] +177 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/fi-ilk-650/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-0.html

  * {igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-b-plane-5} (NEW):
    - bat-dg2-14:         NOTRUN -> [SKIP][26] ([i915#8825]) +29 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/bat-dg2-14/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-b-plane-5.html

  * {igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping} (NEW):
    - fi-bsw-nick:        NOTRUN -> [SKIP][27] +35 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/fi-bsw-nick/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html
    - bat-kbl-2:          NOTRUN -> [SKIP][28] +35 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/bat-kbl-2/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html

  * {igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-b-plane-2} (NEW):
    - fi-hsw-4770:        NOTRUN -> [SKIP][29] +177 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/fi-hsw-4770/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-b-plane-2.html

  * {igt@kms_plane@pixel-format-4-tiled-modifier} (NEW):
    - bat-adlp-6:         NOTRUN -> [SKIP][30] ([i915#8825]) +23 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/bat-adlp-6/igt@kms_plane@pixel-format-4-tiled-modifier.html

  * {igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier} (NEW):
    - fi-rkl-11600:       NOTRUN -> [SKIP][31] ([i915#8825]) +35 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/fi-rkl-11600/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier.html

  * {igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clamping} (NEW):
    - fi-kbl-8809g:       NOTRUN -> [SKIP][32] +35 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/fi-kbl-8809g/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clamping.html
    - bat-dg1-6:          NOTRUN -> [SKIP][33] ([i915#12311] / [i915#8825]) +35 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/bat-dg1-6/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clamping.html

  * {igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-a-plane-0} (NEW):
    - fi-kbl-7567u:       NOTRUN -> [SKIP][34] +141 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/fi-kbl-7567u/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-a-plane-0.html

  * {igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-b-plane-5} (NEW):
    - bat-dg2-8:          NOTRUN -> [SKIP][35] ([i915#8825]) +29 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/bat-dg2-8/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-b-plane-5.html

  * {igt@kms_plane@pixel-format-y-tiled-ccs-modifier} (NEW):
    - bat-dg1-7:          NOTRUN -> [SKIP][36] ([i915#8825]) +25 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/bat-dg1-7/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html
    - bat-dg2-9:          NOTRUN -> [SKIP][37] ([i915#8825]) +29 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/bat-dg2-9/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html

  * {igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-c-plane-2} (NEW):
    - fi-bsw-n3050:       NOTRUN -> [SKIP][38] +128 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/fi-bsw-n3050/igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-c-plane-2.html

  * {igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier} (NEW):
    - fi-cfl-8109u:       NOTRUN -> [SKIP][39] +141 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/fi-cfl-8109u/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier.html

  * {igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-b-plane-1} (NEW):
    - fi-skl-6600u:       NOTRUN -> [SKIP][40] +141 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/fi-skl-6600u/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-b-plane-1.html

  * {igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-b-plane-0} (NEW):
    - fi-cfl-8700k:       NOTRUN -> [SKIP][41] +141 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/fi-cfl-8700k/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-b-plane-0.html

  * {igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-b-plane-5} (NEW):
    - bat-mtlp-9:         NOTRUN -> [SKIP][42] ([i915#8825]) +23 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/bat-mtlp-9/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-b-plane-5.html

  * {igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-b-plane-7} (NEW):
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][43] ([i915#8825]) +25 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/fi-tgl-1115g4/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-b-plane-7.html

  * {igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-5} (NEW):
    - bat-mtlp-8:         NOTRUN -> [SKIP][44] ([i915#8825]) +23 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/bat-mtlp-8/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-5.html

  * {igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping} (NEW):
    - bat-arlh-2:         NOTRUN -> [SKIP][45] ([i915#11346]) +35 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/bat-arlh-2/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping.html

  * {igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-a-plane-2} (NEW):
    - fi-glk-j4005:       NOTRUN -> [SKIP][46] +237 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/fi-glk-j4005/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-a-plane-2.html

  * {igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-b-plane-2} (NEW):
    - bat-apl-1:          NOTRUN -> [SKIP][47] +197 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/bat-apl-1/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-b-plane-2.html

  * {igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping} (NEW):
    - fi-kbl-x1275:       NOTRUN -> [SKIP][48] +35 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/fi-kbl-x1275/igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping.html
    - bat-adlp-11:        NOTRUN -> [SKIP][49] ([i915#8825]) +35 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/bat-adlp-11/igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping.html

  * {igt@kms_plane@pixel-format-y-tiled-modifier@pipe-a-plane-2} (NEW):
    - fi-cfl-guc:         NOTRUN -> [SKIP][50] +141 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/fi-cfl-guc/igt@kms_plane@pixel-format-y-tiled-modifier@pipe-a-plane-2.html

  * {igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-b-plane-5} (NEW):
    - bat-adlp-9:         NOTRUN -> [SKIP][51] ([i915#8825]) +23 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/bat-adlp-9/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-b-plane-5.html
    - bat-rpls-4:         NOTRUN -> [SKIP][52] ([i915#8825]) +23 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/bat-rpls-4/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-b-plane-5.html

  * {igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping} (NEW):
    - bat-atsm-1:         NOTRUN -> [SKIP][53] ([i915#1836]) +35 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/bat-atsm-1/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping.html

  * {igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-b-plane-0} (NEW):
    - fi-pnv-d510:        NOTRUN -> [SKIP][54] +113 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/fi-pnv-d510/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-b-plane-0.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#11346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346
  [i915#12311]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311
  [i915#1836]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1836
  [i915#8825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8704 -> IGTPW_14362
  * Linux: CI_DRM_17821 -> CI_DRM_17837

  CI-20190529: 20190529
  CI_DRM_17821: 733664f1edf3c01cc68e6dd0bbdb135158a98a1d @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_17837: 1956fa9bd80d606f7eb92e877680de38a4f6e8ef @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_14362: 14362
  IGT_8704: 8704

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/index.html

--===============2078123894629876623==
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
<tr><td><b>Series:</b></td><td>Improve pixel-format tests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160237/">https://patchwork.freedesktop.org/series/160237/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8704 -&gt; IGTPW_14362</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/index.html</p>
<h2>Participating hosts (43 -&gt; 41)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_14362:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-a-plane-3} (NEW):</p>
<ul>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/bat-dg2-14/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-a-plane-3.html">SKIP</a> +138 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-b-plane-3} (NEW):</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/bat-jsl-1/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-b-plane-3.html">SKIP</a> +189 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-b-plane-3} (NEW):</p>
<ul>
<li>bat-arls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/bat-arls-6/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-b-plane-3.html">SKIP</a> +141 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-a-plane-5} (NEW):</p>
<ul>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/bat-mtlp-9/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-a-plane-5.html">SKIP</a> +117 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane-5} (NEW):</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/bat-dg1-7/igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane-5.html">SKIP</a> +176 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clamping@pipe-b-plane-3} (NEW):</p>
<ul>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/bat-twl-2/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clamping@pipe-b-plane-3.html">SKIP</a> +141 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-a-plane-0} (NEW):</p>
<ul>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/bat-rpls-4/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-a-plane-0.html">SKIP</a> +117 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-c-plane-0} (NEW):</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/fi-bsw-n3050/igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-c-plane-0.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>{igt@kms_plane@pixel-format-x-tiled-modifier@pipe-a-plane-7} (NEW):</p>
<ul>
<li>bat-jsl-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/bat-jsl-5/igt@kms_plane@pixel-format-x-tiled-modifier@pipe-a-plane-7.html">SKIP</a> +189 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@pixel-format-x-tiled-modifier@pipe-c-plane-1} (NEW):</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/fi-bsw-n3050/igt@kms_plane@pixel-format-x-tiled-modifier@pipe-c-plane-1.html">DMESG-FAIL</a> +7 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-b-plane-3} (NEW):</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/bat-mtlp-8/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-b-plane-3.html">SKIP</a> +117 other tests skip</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/bat-dg2-8/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-b-plane-3.html">SKIP</a> +138 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-a-plane-3} (NEW):</p>
<ul>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/bat-twl-1/igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-a-plane-3.html">SKIP</a> +141 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-a-plane-7} (NEW):</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/fi-tgl-1115g4/igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-a-plane-7.html">SKIP</a> +176 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-0} (NEW):</p>
<ul>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/bat-arlh-3/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-0.html">SKIP</a> +141 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-5} (NEW):</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/bat-adls-6/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-5.html">SKIP</a> +117 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-a-plane-0} (NEW):</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/bat-dg2-9/igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-a-plane-0.html">SKIP</a> +138 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-b-plane-3} (NEW):</p>
<ul>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/bat-arls-5/igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-b-plane-3.html">SKIP</a> +141 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-b-plane-3} (NEW):</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/bat-rplp-1/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-b-plane-3.html">SKIP</a> +141 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-a-plane-5} (NEW):</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/bat-adlp-9/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-a-plane-5.html">SKIP</a> +117 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-a-plane-5} (NEW):</p>
<ul>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/bat-adlp-6/igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-a-plane-5.html">SKIP</a> +117 other tests skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_8704 and IGTPW_14362:</p>
<h3>New IGT tests (684)</h3>
<ul>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier:</p>
<ul>
<li>Statuses : 41 skip(s)</li>
<li>Exec time: [0.0, 1.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping:</p>
<ul>
<li>Statuses : 32 pass(s) 9 skip(s)</li>
<li>Exec time: [0.0, 1.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-a-plane-1:</p>
<ul>
<li>Statuses : 1 pass(s) 11 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-a-plane-2:</p>
<ul>
<li>Statuses : 9 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s) 20 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-a-plane-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 15 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-a-plane-7:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-b-plane-1:</p>
<ul>
<li>Statuses : 1 pass(s) 11 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-b-plane-2:</p>
<ul>
<li>Statuses : 9 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s) 20 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-b-plane-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 15 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-b-plane-7:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-c-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-c-plane-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-c-plane-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-c-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-1:</p>
<ul>
<li>Statuses : 12 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-2:</p>
<ul>
<li>Statuses : 11 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 21 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 19 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-7:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-b-plane-1:</p>
<ul>
<li>Statuses : 12 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-b-plane-2:</p>
<ul>
<li>Statuses : 11 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 21 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-b-plane-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 19 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-b-plane-7:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-c-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-c-plane-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-c-plane-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-c-plane-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:</p>
<ul>
<li>Statuses : 41 skip(s)</li>
<li>Exec time: [0.0, 1.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping:</p>
<ul>
<li>Statuses : 32 pass(s) 9 skip(s)</li>
<li>Exec time: [0.0, 1.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-a-plane-1:</p>
<ul>
<li>Statuses : 1 pass(s) 11 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-a-plane-2:</p>
<ul>
<li>Statuses : 9 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s) 20 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-a-plane-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 15 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-a-plane-7:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 31 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-b-plane-1:</p>
<ul>
<li>Statuses : 1 pass(s) 11 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-b-plane-2:</p>
<ul>
<li>Statuses : 9 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s) 20 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-b-plane-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 15 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-b-plane-7:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-c-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-c-plane-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-c-plane-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-c-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-a-plane-1:</p>
<ul>
<li>Statuses : 12 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-a-plane-2:</p>
<ul>
<li>Statuses : 11 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 21 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-a-plane-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 19 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-a-plane-7:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-b-plane-1:</p>
<ul>
<li>Statuses : 12 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-b-plane-2:</p>
<ul>
<li>Statuses : 11 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 21 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-b-plane-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 19 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-b-plane-7:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-c-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-c-plane-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-c-plane-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-c-plane-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:</p>
<ul>
<li>Statuses : 41 skip(s)</li>
<li>Exec time: [0.0, 1.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping:</p>
<ul>
<li>Statuses : 32 pass(s) 9 skip(s)</li>
<li>Exec time: [0.0, 1.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-1:</p>
<ul>
<li>Statuses : 1 pass(s) 11 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-2:</p>
<ul>
<li>Statuses : 9 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s) 20 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 15 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-7:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-1:</p>
<ul>
<li>Statuses : 1 pass(s) 11 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-2:</p>
<ul>
<li>Statuses : 9 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s) 20 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 15 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-7:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-c-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-c-plane-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-c-plane-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-c-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-a-plane-1:</p>
<ul>
<li>Statuses : 12 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-a-plane-2:</p>
<ul>
<li>Statuses : 11 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 21 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-a-plane-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 19 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-a-plane-7:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-b-plane-1:</p>
<ul>
<li>Statuses : 12 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-b-plane-2:</p>
<ul>
<li>Statuses : 11 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 21 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-b-plane-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 19 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-b-plane-7:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-c-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-c-plane-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-c-plane-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-c-plane-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier:</p>
<ul>
<li>Statuses : 41 skip(s)</li>
<li>Exec time: [0.0, 1.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping:</p>
<ul>
<li>Statuses : 32 pass(s) 9 skip(s)</li>
<li>Exec time: [0.0, 1.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-a-plane-1:</p>
<ul>
<li>Statuses : 1 pass(s) 11 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-a-plane-2:</p>
<ul>
<li>Statuses : 9 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s) 20 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-a-plane-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 15 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-a-plane-7:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-b-plane-1:</p>
<ul>
<li>Statuses : 1 pass(s) 11 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-b-plane-2:</p>
<ul>
<li>Statuses : 9 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s) 20 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-b-plane-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 15 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-b-plane-7:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-c-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-c-plane-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-c-plane-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-c-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-a-plane-1:</p>
<ul>
<li>Statuses : 12 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-a-plane-2:</p>
<ul>
<li>Statuses : 11 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 21 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-a-plane-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 19 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-a-plane-7:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 31 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-b-plane-1:</p>
<ul>
<li>Statuses : 12 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-b-plane-2:</p>
<ul>
<li>Statuses : 11 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 21 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-b-plane-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 19 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-b-plane-7:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-c-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-c-plane-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-c-plane-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-c-plane-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier:</p>
<ul>
<li>Statuses : 41 skip(s)</li>
<li>Exec time: [0.0, 1.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:</p>
<ul>
<li>Statuses : 32 pass(s) 9 skip(s)</li>
<li>Exec time: [0.0, 1.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-a-plane-1:</p>
<ul>
<li>Statuses : 1 pass(s) 11 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-a-plane-2:</p>
<ul>
<li>Statuses : 9 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s) 20 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-a-plane-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 15 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-a-plane-7:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-b-plane-1:</p>
<ul>
<li>Statuses : 1 pass(s) 11 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-b-plane-2:</p>
<ul>
<li>Statuses : 9 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s) 20 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-b-plane-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 15 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-b-plane-7:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-c-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-c-plane-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-c-plane-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-c-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-a-plane-1:</p>
<ul>
<li>Statuses : 12 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-a-plane-2:</p>
<ul>
<li>Statuses : 11 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 21 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-a-plane-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 19 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-a-plane-7:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-b-plane-1:</p>
<ul>
<li>Statuses : 12 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-b-plane-2:</p>
<ul>
<li>Statuses : 11 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 21 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-b-plane-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 19 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-b-plane-7:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-c-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-c-plane-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-c-plane-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-c-plane-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier:</p>
<ul>
<li>Statuses : 8 pass(s) 33 skip(s)</li>
<li>Exec time: [0.0, 4.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping:</p>
<ul>
<li>Statuses : 32 pass(s) 9 skip(s)</li>
<li>Exec time: [0.0, 4.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 8 pass(s) 23 skip(s)</li>
<li>Exec time: [0.0, 1.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane-1:</p>
<ul>
<li>Statuses : 1 pass(s) 11 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane-2:</p>
<ul>
<li>Statuses : 9 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 9 pass(s) 12 skip(s)</li>
<li>Exec time: [0.0, 0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 15 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane-7:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 8 pass(s) 23 skip(s)</li>
<li>Exec time: [0.0, 1.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-b-plane-1:</p>
<ul>
<li>Statuses : 1 pass(s) 11 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-b-plane-2:</p>
<ul>
<li>Statuses : 9 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 9 pass(s) 12 skip(s)</li>
<li>Exec time: [0.0, 0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-b-plane-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 15 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-b-plane-7:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-c-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-c-plane-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-c-plane-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-c-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 8 pass(s) 23 skip(s)</li>
<li>Exec time: [0.0, 1.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-1:</p>
<ul>
<li>Statuses : 12 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-2:</p>
<ul>
<li>Statuses : 11 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 8 pass(s) 13 skip(s)</li>
<li>Exec time: [0.0, 0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 19 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-7:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 8 pass(s) 23 skip(s)</li>
<li>Exec time: [0.0, 1.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-1:</p>
<ul>
<li>Statuses : 12 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-2:</p>
<ul>
<li>Statuses : 11 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 8 pass(s) 13 skip(s)</li>
<li>Exec time: [0.0, 0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 19 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-7:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-c-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-c-plane-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-c-plane-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-c-plane-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:</p>
<ul>
<li>Statuses : 5 pass(s) 36 skip(s)</li>
<li>Exec time: [0.0, 3.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping:</p>
<ul>
<li>Statuses : 32 pass(s) 9 skip(s)</li>
<li>Exec time: [0.0, 3.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 5 pass(s) 26 skip(s)</li>
<li>Exec time: [0.0, 0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-a-plane-1:</p>
<ul>
<li>Statuses : 1 pass(s) 11 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-a-plane-2:</p>
<ul>
<li>Statuses : 9 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 6 pass(s) 15 skip(s)</li>
<li>Exec time: [0.0, 0.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-a-plane-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 15 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-a-plane-7:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 5 pass(s) 26 skip(s)</li>
<li>Exec time: [0.0, 0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-b-plane-1:</p>
<ul>
<li>Statuses : 1 pass(s) 11 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-b-plane-2:</p>
<ul>
<li>Statuses : 9 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 6 pass(s) 15 skip(s)</li>
<li>Exec time: [0.0, 0.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-b-plane-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 15 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-b-plane-7:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-c-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-c-plane-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-c-plane-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-c-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 5 pass(s) 26 skip(s)</li>
<li>Exec time: [0.0, 0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-a-plane-1:</p>
<ul>
<li>Statuses : 12 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-a-plane-2:</p>
<ul>
<li>Statuses : 11 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 5 pass(s) 16 skip(s)</li>
<li>Exec time: [0.0, 0.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-a-plane-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 19 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-a-plane-7:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 5 pass(s) 26 skip(s)</li>
<li>Exec time: [0.0, 0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-b-plane-1:</p>
<ul>
<li>Statuses : 12 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-b-plane-2:</p>
<ul>
<li>Statuses : 11 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 5 pass(s) 16 skip(s)</li>
<li>Exec time: [0.0, 0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-b-plane-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 19 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-b-plane-7:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-c-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-c-plane-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-c-plane-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-c-plane-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier:</p>
<ul>
<li>Statuses : 5 pass(s) 36 skip(s)</li>
<li>Exec time: [0.0, 2.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clamping:</p>
<ul>
<li>Statuses : 32 pass(s) 9 skip(s)</li>
<li>Exec time: [0.0, 3.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 5 pass(s) 26 skip(s)</li>
<li>Exec time: [0.0, 0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clamping@pipe-a-plane-1:</p>
<ul>
<li>Statuses : 1 pass(s) 11 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clamping@pipe-a-plane-2:</p>
<ul>
<li>Statuses : 9 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clamping@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 6 pass(s) 15 skip(s)</li>
<li>Exec time: [0.0, 0.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clamping@pipe-a-plane-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clamping@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 15 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clamping@pipe-a-plane-7:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clamping@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 5 pass(s) 26 skip(s)</li>
<li>Exec time: [0.0, 0.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clamping@pipe-b-plane-1:</p>
<ul>
<li>Statuses : 1 pass(s) 11 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clamping@pipe-b-plane-2:</p>
<ul>
<li>Statuses : 9 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clamping@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 6 pass(s) 15 skip(s)</li>
<li>Exec time: [0.0, 0.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clamping@pipe-b-plane-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clamping@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 15 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clamping@pipe-b-plane-7:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clamping@pipe-c-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clamping@pipe-c-plane-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clamping@pipe-c-plane-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clamping@pipe-c-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 5 pass(s) 26 skip(s)</li>
<li>Exec time: [0.0, 0.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-a-plane-1:</p>
<ul>
<li>Statuses : 12 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-a-plane-2:</p>
<ul>
<li>Statuses : 11 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 5 pass(s) 16 skip(s)</li>
<li>Exec time: [0.0, 0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-a-plane-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 19 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-a-plane-7:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 5 pass(s) 26 skip(s)</li>
<li>Exec time: [0.0, 0.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-b-plane-1:</p>
<ul>
<li>Statuses : 12 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-b-plane-2:</p>
<ul>
<li>Statuses : 11 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 5 pass(s) 16 skip(s)</li>
<li>Exec time: [0.0, 0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-b-plane-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 19 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-b-plane-7:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-c-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-c-plane-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-c-plane-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-c-plane-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier:</p>
<ul>
<li>Statuses : 5 pass(s) 36 skip(s)</li>
<li>Exec time: [0.0, 3.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:</p>
<ul>
<li>Statuses : 32 pass(s) 9 skip(s)</li>
<li>Exec time: [0.0, 2.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 5 pass(s) 26 skip(s)</li>
<li>Exec time: [0.0, 0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-a-plane-1:</p>
<ul>
<li>Statuses : 1 pass(s) 11 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-a-plane-2:</p>
<ul>
<li>Statuses : 9 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 6 pass(s) 15 skip(s)</li>
<li>Exec time: [0.0, 0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-a-plane-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 15 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-a-plane-7:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 5 pass(s) 26 skip(s)</li>
<li>Exec time: [0.0, 0.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-b-plane-1:</p>
<ul>
<li>Statuses : 1 pass(s) 11 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-b-plane-2:</p>
<ul>
<li>Statuses : 9 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 6 pass(s) 15 skip(s)</li>
<li>Exec time: [0.0, 0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-b-plane-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 15 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-b-plane-7:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-c-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-c-plane-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-c-plane-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-c-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 5 pass(s) 26 skip(s)</li>
<li>Exec time: [0.0, 0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-a-plane-1:</p>
<ul>
<li>Statuses : 12 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-a-plane-2:</p>
<ul>
<li>Statuses : 11 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 5 pass(s) 16 skip(s)</li>
<li>Exec time: [0.0, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-a-plane-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 19 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-a-plane-7:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 5 pass(s) 26 skip(s)</li>
<li>Exec time: [0.0, 0.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-b-plane-1:</p>
<ul>
<li>Statuses : 12 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-b-plane-2:</p>
<ul>
<li>Statuses : 11 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 5 pass(s) 16 skip(s)</li>
<li>Exec time: [0.0, 0.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-b-plane-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 19 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-b-plane-7:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-c-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-c-plane-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-c-plane-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-c-plane-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s) 31 pass(s) 9 skip(s)</li>
<li>Exec time: [0.0, 27.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier-source-clamping:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s) 31 pass(s) 9 skip(s)</li>
<li>Exec time: [0.0, 25.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 31 pass(s)</li>
<li>Exec time: [0.64, 6.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-a-plane-1:</p>
<ul>
<li>Statuses : 12 pass(s)</li>
<li>Exec time: [0.0, 3.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-a-plane-2:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.0, 1.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 21 pass(s)</li>
<li>Exec time: [0.0, 4.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-a-plane-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 19 pass(s)</li>
<li>Exec time: [0.0, 2.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-a-plane-7:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 31 pass(s)</li>
<li>Exec time: [0.64, 6.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-b-plane-1:</p>
<ul>
<li>Statuses : 12 pass(s)</li>
<li>Exec time: [0.0, 3.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-b-plane-2:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.0, 1.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 21 pass(s)</li>
<li>Exec time: [0.0, 4.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-b-plane-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 19 pass(s)</li>
<li>Exec time: [0.0, 3.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-b-plane-7:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-c-plane-0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-c-plane-1:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [1.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-c-plane-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-c-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 31 pass(s)</li>
<li>Exec time: [0.58, 7.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier@pipe-a-plane-1:</p>
<ul>
<li>Statuses : 12 pass(s)</li>
<li>Exec time: [0.26, 3.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier@pipe-a-plane-2:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.20, 1.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 21 pass(s)</li>
<li>Exec time: [0.21, 4.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier@pipe-a-plane-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 19 pass(s)</li>
<li>Exec time: [0.17, 3.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier@pipe-a-plane-7:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.11, 0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 31 pass(s)</li>
<li>Exec time: [0.58, 6.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier@pipe-b-plane-1:</p>
<ul>
<li>Statuses : 12 pass(s)</li>
<li>Exec time: [0.27, 3.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier@pipe-b-plane-2:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.20, 1.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 21 pass(s)</li>
<li>Exec time: [0.21, 4.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier@pipe-b-plane-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 19 pass(s)</li>
<li>Exec time: [0.17, 3.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier@pipe-b-plane-7:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.10, 0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier@pipe-c-plane-0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier@pipe-c-plane-1:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [1.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier@pipe-c-plane-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier@pipe-c-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s) 31 pass(s) 9 skip(s)</li>
<li>Exec time: [0.0, 6.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s) 31 pass(s) 9 skip(s)</li>
<li>Exec time: [0.0, 6.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 31 pass(s)</li>
<li>Exec time: [0.47, 1.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-a-plane-1:</p>
<ul>
<li>Statuses : 12 pass(s)</li>
<li>Exec time: [0.0, 0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-a-plane-2:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.0, 0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 21 pass(s)</li>
<li>Exec time: [0.0, 0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-a-plane-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 19 pass(s)</li>
<li>Exec time: [0.0, 0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-a-plane-7:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 31 pass(s)</li>
<li>Exec time: [0.45, 1.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-b-plane-1:</p>
<ul>
<li>Statuses : 12 pass(s)</li>
<li>Exec time: [0.0, 0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-b-plane-2:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.0, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 21 pass(s)</li>
<li>Exec time: [0.0, 0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-b-plane-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 19 pass(s)</li>
<li>Exec time: [0.0, 0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-b-plane-7:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-c-plane-0:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s)</li>
<li>Exec time: [4.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-c-plane-1:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-c-plane-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-c-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 31 pass(s)</li>
<li>Exec time: [0.46, 1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier@pipe-a-plane-1:</p>
<ul>
<li>Statuses : 11 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier@pipe-a-plane-2:</p>
<ul>
<li>Statuses : 2 pass(s) 9 skip(s)</li>
<li>Exec time: [0.0, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 20 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier@pipe-a-plane-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 4 pass(s) 15 skip(s)</li>
<li>Exec time: [0.0, 0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier@pipe-a-plane-7:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 31 pass(s)</li>
<li>Exec time: [0.42, 1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-1:</p>
<ul>
<li>Statuses : 11 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-2:</p>
<ul>
<li>Statuses : 2 pass(s) 9 skip(s)</li>
<li>Exec time: [0.0, 0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 20 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 4 pass(s) 15 skip(s)</li>
<li>Exec time: [0.0, 0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-7:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier@pipe-c-plane-0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier@pipe-c-plane-1:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier@pipe-c-plane-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier@pipe-c-plane-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier:</p>
<ul>
<li>Statuses : 9 pass(s) 32 skip(s)</li>
<li>Exec time: [0.0, 3.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:</p>
<ul>
<li>Statuses : 32 pass(s) 9 skip(s)</li>
<li>Exec time: [0.0, 4.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 9 pass(s) 22 skip(s)</li>
<li>Exec time: [0.0, 0.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-a-plane-1:</p>
<ul>
<li>Statuses : 8 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-a-plane-2:</p>
<ul>
<li>Statuses : 10 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 4 pass(s) 17 skip(s)</li>
<li>Exec time: [0.0, 0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-a-plane-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 17 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-a-plane-7:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 9 pass(s) 22 skip(s)</li>
<li>Exec time: [0.0, 0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-b-plane-1:</p>
<ul>
<li>Statuses : 8 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-b-plane-2:</p>
<ul>
<li>Statuses : 10 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 4 pass(s) 17 skip(s)</li>
<li>Exec time: [0.0, 0.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-b-plane-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 17 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-b-plane-7:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-c-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-c-plane-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-c-plane-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-c-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 9 pass(s) 22 skip(s)</li>
<li>Exec time: [0.0, 0.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-a-plane-1:</p>
<ul>
<li>Statuses : 7 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-a-plane-2:</p>
<ul>
<li>Statuses : 1 pass(s) 10 skip(s)</li>
<li>Exec time: [0.0, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 3 pass(s) 18 skip(s)</li>
<li>Exec time: [0.0, 0.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-a-plane-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 2 pass(s) 17 skip(s)</li>
<li>Exec time: [0.0, 0.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-a-plane-7:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 9 pass(s) 22 skip(s)</li>
<li>Exec time: [0.0, 0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-b-plane-1:</p>
<ul>
<li>Statuses : 7 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-b-plane-2:</p>
<ul>
<li>Statuses : 1 pass(s) 10 skip(s)</li>
<li>Exec time: [0.0, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 3 pass(s) 18 skip(s)</li>
<li>Exec time: [0.0, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-b-plane-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 2 pass(s) 17 skip(s)</li>
<li>Exec time: [0.0, 0.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-b-plane-7:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-c-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-c-plane-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-c-plane-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-c-plane-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier:</p>
<ul>
<li>Statuses : 7 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0, 3.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:</p>
<ul>
<li>Statuses : 32 pass(s) 9 skip(s)</li>
<li>Exec time: [0.0, 3.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 7 pass(s) 24 skip(s)</li>
<li>Exec time: [0.0, 0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-a-plane-1:</p>
<ul>
<li>Statuses : 1 pass(s) 11 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-a-plane-2:</p>
<ul>
<li>Statuses : 9 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 8 pass(s) 13 skip(s)</li>
<li>Exec time: [0.0, 0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-a-plane-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 15 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-a-plane-7:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 7 pass(s) 24 skip(s)</li>
<li>Exec time: [0.0, 0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-b-plane-1:</p>
<ul>
<li>Statuses : 1 pass(s) 11 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-b-plane-2:</p>
<ul>
<li>Statuses : 9 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 8 pass(s) 13 skip(s)</li>
<li>Exec time: [0.0, 0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-b-plane-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 15 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-b-plane-7:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-c-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-c-plane-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-c-plane-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-c-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 7 pass(s) 24 skip(s)</li>
<li>Exec time: [0.0, 0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-a-plane-1:</p>
<ul>
<li>Statuses : 12 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-a-plane-2:</p>
<ul>
<li>Statuses : 11 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 7 pass(s) 14 skip(s)</li>
<li>Exec time: [0.0, 0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-a-plane-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 19 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-a-plane-7:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 7 pass(s) 24 skip(s)</li>
<li>Exec time: [0.0, 0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-b-plane-1:</p>
<ul>
<li>Statuses : 12 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-b-plane-2:</p>
<ul>
<li>Statuses : 11 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 7 pass(s) 14 skip(s)</li>
<li>Exec time: [0.0, 0.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-b-plane-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 19 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-b-plane-7:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-c-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-c-plane-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-c-plane-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-c-plane-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier:</p>
<ul>
<li>Statuses : 9 pass(s) 32 skip(s)</li>
<li>Exec time: [0.0, 3.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping:</p>
<ul>
<li>Statuses : 32 pass(s) 9 skip(s)</li>
<li>Exec time: [0.0, 3.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 9 pass(s) 22 skip(s)</li>
<li>Exec time: [0.0, 0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-1:</p>
<ul>
<li>Statuses : 1 pass(s) 11 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-2:</p>
<ul>
<li>Statuses : 9 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 10 pass(s) 11 skip(s)</li>
<li>Exec time: [0.0, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 17 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-7:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 9 pass(s) 22 skip(s)</li>
<li>Exec time: [0.0, 0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-1:</p>
<ul>
<li>Statuses : 1 pass(s) 11 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-2:</p>
<ul>
<li>Statuses : 9 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 10 pass(s) 11 skip(s)</li>
<li>Exec time: [0.0, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 17 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-7:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-c-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-c-plane-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-c-plane-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-c-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 9 pass(s) 22 skip(s)</li>
<li>Exec time: [0.0, 0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-a-plane-1:</p>
<ul>
<li>Statuses : 12 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-a-plane-2:</p>
<ul>
<li>Statuses : 11 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 9 pass(s) 12 skip(s)</li>
<li>Exec time: [0.0, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-a-plane-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 2 pass(s) 17 skip(s)</li>
<li>Exec time: [0.0, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-a-plane-7:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 9 pass(s) 22 skip(s)</li>
<li>Exec time: [0.0, 0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-1:</p>
<ul>
<li>Statuses : 12 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-2:</p>
<ul>
<li>Statuses : 11 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 9 pass(s) 12 skip(s)</li>
<li>Exec time: [0.0, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 2 pass(s) 17 skip(s)</li>
<li>Exec time: [0.0, 0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-7:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-c-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-c-plane-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-c-plane-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-c-plane-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier:</p>
<ul>
<li>Statuses : 9 pass(s) 32 skip(s)</li>
<li>Exec time: [0.0, 3.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping:</p>
<ul>
<li>Statuses : 32 pass(s) 9 skip(s)</li>
<li>Exec time: [0.0, 3.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 9 pass(s) 22 skip(s)</li>
<li>Exec time: [0.0, 0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-a-plane-1:</p>
<ul>
<li>Statuses : 1 pass(s) 11 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-a-plane-2:</p>
<ul>
<li>Statuses : 9 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 10 pass(s) 11 skip(s)</li>
<li>Exec time: [0.0, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-a-plane-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 17 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-a-plane-7:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 9 pass(s) 22 skip(s)</li>
<li>Exec time: [0.0, 0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-b-plane-1:</p>
<ul>
<li>Statuses : 1 pass(s) 11 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-b-plane-2:</p>
<ul>
<li>Statuses : 9 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 10 pass(s) 11 skip(s)</li>
<li>Exec time: [0.0, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-b-plane-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 17 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-b-plane-7:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-c-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-c-plane-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-c-plane-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-c-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 9 pass(s) 22 skip(s)</li>
<li>Exec time: [0.0, 0.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-1:</p>
<ul>
<li>Statuses : 12 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-2:</p>
<ul>
<li>Statuses : 11 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 9 pass(s) 12 skip(s)</li>
<li>Exec time: [0.0, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 2 pass(s) 17 skip(s)</li>
<li>Exec time: [0.0, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 9 pass(s) 22 skip(s)</li>
<li>Exec time: [0.0, 0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-b-plane-1:</p>
<ul>
<li>Statuses : 12 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-b-plane-2:</p>
<ul>
<li>Statuses : 11 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 9 pass(s) 12 skip(s)</li>
<li>Exec time: [0.0, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-b-plane-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 2 pass(s) 17 skip(s)</li>
<li>Exec time: [0.0, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-b-plane-7:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-c-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-c-plane-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-c-plane-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-c-plane-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier:</p>
<ul>
<li>Statuses : 18 pass(s) 23 skip(s)</li>
<li>Exec time: [0.0, 7.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping:</p>
<ul>
<li>Statuses : 32 pass(s) 9 skip(s)</li>
<li>Exec time: [0.0, 7.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 18 pass(s) 13 skip(s)</li>
<li>Exec time: [0.0, 1.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-a-plane-1:</p>
<ul>
<li>Statuses : 8 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-a-plane-2:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.0, 0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 13 pass(s) 8 skip(s)</li>
<li>Exec time: [0.0, 0.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-a-plane-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 19 pass(s)</li>
<li>Exec time: [0.0, 0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-a-plane-7:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 18 pass(s) 13 skip(s)</li>
<li>Exec time: [0.0, 1.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-b-plane-1:</p>
<ul>
<li>Statuses : 8 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-b-plane-2:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.0, 0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 13 pass(s) 8 skip(s)</li>
<li>Exec time: [0.0, 0.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-b-plane-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 19 pass(s)</li>
<li>Exec time: [0.0, 0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-b-plane-7:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-c-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-c-plane-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-c-plane-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-c-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 18 pass(s) 13 skip(s)</li>
<li>Exec time: [0.0, 1.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier@pipe-a-plane-1:</p>
<ul>
<li>Statuses : 7 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 0.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier@pipe-a-plane-2:</p>
<ul>
<li>Statuses : 2 pass(s) 9 skip(s)</li>
<li>Exec time: [0.0, 0.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 12 pass(s) 9 skip(s)</li>
<li>Exec time: [0.0, 1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier@pipe-a-plane-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 4 pass(s) 15 skip(s)</li>
<li>Exec time: [0.0, 0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier@pipe-a-plane-7:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 18 pass(s) 13 skip(s)</li>
<li>Exec time: [0.0, 1.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-1:</p>
<ul>
<li>Statuses : 7 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-2:</p>
<ul>
<li>Statuses : 2 pass(s) 9 skip(s)</li>
<li>Exec time: [0.0, 0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 12 pass(s) 9 skip(s)</li>
<li>Exec time: [0.0, 0.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 4 pass(s) 15 skip(s)</li>
<li>Exec time: [0.0, 0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-7:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier@pipe-c-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier@pipe-c-plane-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier@pipe-c-plane-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier@pipe-c-plane-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier:</p>
<ul>
<li>Statuses : 9 pass(s) 32 skip(s)</li>
<li>Exec time: [0.0, 3.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:</p>
<ul>
<li>Statuses : 32 pass(s) 9 skip(s)</li>
<li>Exec time: [0.0, 3.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 9 pass(s) 22 skip(s)</li>
<li>Exec time: [0.0, 0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-a-plane-1:</p>
<ul>
<li>Statuses : 8 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-a-plane-2:</p>
<ul>
<li>Statuses : 10 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 4 pass(s) 17 skip(s)</li>
<li>Exec time: [0.0, 0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-a-plane-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 17 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-a-plane-7:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 9 pass(s) 22 skip(s)</li>
<li>Exec time: [0.0, 0.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-b-plane-1:</p>
<ul>
<li>Statuses : 8 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-b-plane-2:</p>
<ul>
<li>Statuses : 10 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 4 pass(s) 17 skip(s)</li>
<li>Exec time: [0.0, 0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-b-plane-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 17 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-b-plane-7:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-c-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-c-plane-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-c-plane-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-c-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 9 pass(s) 22 skip(s)</li>
<li>Exec time: [0.0, 0.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-a-plane-1:</p>
<ul>
<li>Statuses : 7 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-a-plane-2:</p>
<ul>
<li>Statuses : 1 pass(s) 10 skip(s)</li>
<li>Exec time: [0.0, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 3 pass(s) 18 skip(s)</li>
<li>Exec time: [0.0, 0.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-a-plane-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 2 pass(s) 17 skip(s)</li>
<li>Exec time: [0.0, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-a-plane-7:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 9 pass(s) 22 skip(s)</li>
<li>Exec time: [0.0, 0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-b-plane-1:</p>
<ul>
<li>Statuses : 7 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-b-plane-2:</p>
<ul>
<li>Statuses : 1 pass(s) 10 skip(s)</li>
<li>Exec time: [0.0, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 3 pass(s) 18 skip(s)</li>
<li>Exec time: [0.0, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-b-plane-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 2 pass(s) 17 skip(s)</li>
<li>Exec time: [0.0, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-b-plane-7:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-c-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-c-plane-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-c-plane-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-c-plane-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier:</p>
<ul>
<li>Statuses : 9 pass(s) 32 skip(s)</li>
<li>Exec time: [0.0, 6.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:</p>
<ul>
<li>Statuses : 32 pass(s) 9 skip(s)</li>
<li>Exec time: [0.0, 6.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 9 pass(s) 22 skip(s)</li>
<li>Exec time: [0.0, 0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-a-plane-1:</p>
<ul>
<li>Statuses : 8 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-a-plane-2:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.0, 0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 4 pass(s) 17 skip(s)</li>
<li>Exec time: [0.0, 0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-a-plane-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 17 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-a-plane-7:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 9 pass(s) 22 skip(s)</li>
<li>Exec time: [0.0, 0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-b-plane-1:</p>
<ul>
<li>Statuses : 8 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-b-plane-2:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.0, 0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 4 pass(s) 17 skip(s)</li>
<li>Exec time: [0.0, 0.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-b-plane-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 17 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-b-plane-7:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-c-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-c-plane-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-c-plane-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-c-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 9 pass(s) 22 skip(s)</li>
<li>Exec time: [0.0, 0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-a-plane-1:</p>
<ul>
<li>Statuses : 7 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 0.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-a-plane-2:</p>
<ul>
<li>Statuses : 2 pass(s) 9 skip(s)</li>
<li>Exec time: [0.0, 0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 3 pass(s) 18 skip(s)</li>
<li>Exec time: [0.0, 0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-a-plane-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 2 pass(s) 17 skip(s)</li>
<li>Exec time: [0.0, 0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-a-plane-7:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 9 pass(s) 22 skip(s)</li>
<li>Exec time: [0.0, 0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-b-plane-1:</p>
<ul>
<li>Statuses : 7 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-b-plane-2:</p>
<ul>
<li>Statuses : 2 pass(s) 9 skip(s)</li>
<li>Exec time: [0.0, 0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 3 pass(s) 18 skip(s)</li>
<li>Exec time: [0.0, 0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-b-plane-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 2 pass(s) 17 skip(s)</li>
<li>Exec time: [0.0, 0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-b-plane-7:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-c-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-c-plane-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-c-plane-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-c-plane-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_14362 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>{igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-b-plane-5} (NEW):</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/bat-adls-6/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-b-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915#8825</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-b-plane-1} (NEW):</p>
<ul>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/fi-ivb-3770/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-b-plane-1.html">SKIP</a> +177 other tests skip</li>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/fi-elk-e7500/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-b-plane-1.html">SKIP</a> +177 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-0} (NEW):</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/fi-ilk-650/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-0.html">SKIP</a> +177 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-b-plane-5} (NEW):</p>
<ul>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/bat-dg2-14/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-b-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915#8825</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping} (NEW):</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/fi-bsw-nick/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html">SKIP</a> +35 other tests skip</li>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/bat-kbl-2/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html">SKIP</a> +35 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-b-plane-2} (NEW):</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/fi-hsw-4770/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-b-plane-2.html">SKIP</a> +177 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@pixel-format-4-tiled-modifier} (NEW):</p>
<ul>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/bat-adlp-6/igt@kms_plane@pixel-format-4-tiled-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915#8825</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier} (NEW):</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/fi-rkl-11600/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915#8825</a>) +35 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clamping} (NEW):</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/fi-kbl-8809g/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clamping.html">SKIP</a> +35 other tests skip</li>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/bat-dg1-6/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915#8825</a>) +35 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-a-plane-0} (NEW):</p>
<ul>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/fi-kbl-7567u/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-a-plane-0.html">SKIP</a> +141 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-b-plane-5} (NEW):</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/bat-dg2-8/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-b-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915#8825</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@pixel-format-y-tiled-ccs-modifier} (NEW):</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/bat-dg1-7/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915#8825</a>) +25 other tests skip</li>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/bat-dg2-9/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915#8825</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-c-plane-2} (NEW):</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/fi-bsw-n3050/igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-c-plane-2.html">SKIP</a> +128 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier} (NEW):</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/fi-cfl-8109u/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier.html">SKIP</a> +141 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-b-plane-1} (NEW):</p>
<ul>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/fi-skl-6600u/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-b-plane-1.html">SKIP</a> +141 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-b-plane-0} (NEW):</p>
<ul>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/fi-cfl-8700k/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-b-plane-0.html">SKIP</a> +141 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-b-plane-5} (NEW):</p>
<ul>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/bat-mtlp-9/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-b-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915#8825</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-b-plane-7} (NEW):</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/fi-tgl-1115g4/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-b-plane-7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915#8825</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-5} (NEW):</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/bat-mtlp-8/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915#8825</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping} (NEW):</p>
<ul>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/bat-arlh-2/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>) +35 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-a-plane-2} (NEW):</p>
<ul>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/fi-glk-j4005/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-a-plane-2.html">SKIP</a> +237 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-b-plane-2} (NEW):</p>
<ul>
<li>bat-apl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/bat-apl-1/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-b-plane-2.html">SKIP</a> +197 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping} (NEW):</p>
<ul>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/fi-kbl-x1275/igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping.html">SKIP</a> +35 other tests skip</li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/bat-adlp-11/igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915#8825</a>) +35 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@pixel-format-y-tiled-modifier@pipe-a-plane-2} (NEW):</p>
<ul>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/fi-cfl-guc/igt@kms_plane@pixel-format-y-tiled-modifier@pipe-a-plane-2.html">SKIP</a> +141 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-b-plane-5} (NEW):</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/bat-adlp-9/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-b-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915#8825</a>) +23 other tests skip</li>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/bat-rpls-4/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-b-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915#8825</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping} (NEW):</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/bat-atsm-1/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1836">i915#1836</a>) +35 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-b-plane-0} (NEW):</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14362/fi-pnv-d510/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-b-plane-0.html">SKIP</a> +113 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8704 -&gt; IGTPW_14362</li>
<li>Linux: CI_DRM_17821 -&gt; CI_DRM_17837</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_17821: 733664f1edf3c01cc68e6dd0bbdb135158a98a1d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_17837: 1956fa9bd80d606f7eb92e877680de38a4f6e8ef @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_14362: 14362<br />
  IGT_8704: 8704</p>

</body>
</html>

--===============2078123894629876623==--
