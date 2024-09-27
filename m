Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0519ACDD1BA
	for <igt-dev@archiver.kernel.org>; Fri, 27 Sep 2024 15:01:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB76810ECBC;
	Fri, 27 Sep 2024 15:01:46 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26F1510EC93;
 Fri, 27 Sep 2024 15:01:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4511755588123581678=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_Backlight_control_on_HDR-en?=
 =?utf-8?q?abled_eDP_panels_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Santhosh Reddy Guddati" <santhosh.reddy.guddati@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 27 Sep 2024 15:01:45 -0000
Message-ID: <172744930514.1111107.4728251004714751254@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240927102038.1001578-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20240927102038.1001578-1-santhosh.reddy.guddati@intel.com>
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

--===============4511755588123581678==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Backlight control on HDR-enabled eDP panels (rev2)
URL   : https://patchwork.freedesktop.org/series/139050/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15452 -> IGTPW_11824
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_11824 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_11824, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/index.html

Participating hosts (36 -> 36)
------------------------------

  Additional (1): bat-adlp-6 
  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11824:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_hdr@bpc-switch-suspend:
    - bat-apl-1:          NOTRUN -> [DMESG-WARN][1] +3 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-apl-1/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1:
    - fi-kbl-7567u:       NOTRUN -> [DMESG-WARN][2] +1 other test dmesg-warn
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/fi-kbl-7567u/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html

  * {igt@kms_hdr@brightness-with-dpms} (NEW):
    - bat-adlp-9:         NOTRUN -> [SKIP][3] +5 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-adlp-9/igt@kms_hdr@brightness-with-dpms.html
    - bat-twl-2:          NOTRUN -> [FAIL][4] +5 other tests fail
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-twl-2/igt@kms_hdr@brightness-with-dpms.html
    - bat-dg2-11:         NOTRUN -> [SKIP][5] +5 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-dg2-11/igt@kms_hdr@brightness-with-dpms.html
    - bat-twl-1:          NOTRUN -> [SKIP][6] +2 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-twl-1/igt@kms_hdr@brightness-with-dpms.html
    - bat-dg2-14:         NOTRUN -> [SKIP][7] +2 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-dg2-14/igt@kms_hdr@brightness-with-dpms.html
    - bat-rplp-1:         NOTRUN -> [SKIP][8] +2 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-rplp-1/igt@kms_hdr@brightness-with-dpms.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][9] +2 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/fi-tgl-1115g4/igt@kms_hdr@brightness-with-dpms.html

  * {igt@kms_hdr@brightness-with-dpms@pipe-a-dp-3} (NEW):
    - bat-arls-5:         NOTRUN -> [SKIP][10] +5 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-arls-5/igt@kms_hdr@brightness-with-dpms@pipe-a-dp-3.html
    - bat-adlp-6:         NOTRUN -> [SKIP][11] +2 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-adlp-6/igt@kms_hdr@brightness-with-dpms@pipe-a-dp-3.html

  * {igt@kms_hdr@brightness-with-dpms@pipe-a-edp-1} (NEW):
    - bat-adlp-6:         NOTRUN -> [FAIL][12] +5 other tests fail
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-adlp-6/igt@kms_hdr@brightness-with-dpms@pipe-a-edp-1.html

  * {igt@kms_hdr@brightness-with-hdr} (NEW):
    - bat-arls-2:         NOTRUN -> [SKIP][13] +2 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-arls-2/igt@kms_hdr@brightness-with-hdr.html
    - bat-mtlp-8:         NOTRUN -> [FAIL][14] +5 other tests fail
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-mtlp-8/igt@kms_hdr@brightness-with-hdr.html
    - bat-jsl-1:          NOTRUN -> [SKIP][15] +2 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-jsl-1/igt@kms_hdr@brightness-with-hdr.html
    - bat-arlh-2:         NOTRUN -> [SKIP][16] +2 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-arlh-2/igt@kms_hdr@brightness-with-hdr.html

  * {igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-1} (NEW):
    - bat-adls-6:         NOTRUN -> [SKIP][17] +8 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-adls-6/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-1.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][18] +5 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/fi-rkl-11600/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-1.html

  * {igt@kms_hdr@brightness-with-suspend} (NEW):
    - {bat-arlh-3}:       NOTRUN -> [FAIL][19] +5 other tests fail
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-arlh-3/igt@kms_hdr@brightness-with-suspend.html
    - bat-dg1-7:          NOTRUN -> [SKIP][20] +5 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-dg1-7/igt@kms_hdr@brightness-with-suspend.html

  * {igt@kms_hdr@brightness-with-suspend@pipe-a-hdmi-a-2} (NEW):
    - bat-arls-1:         NOTRUN -> [SKIP][21] +5 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-arls-1/igt@kms_hdr@brightness-with-suspend@pipe-a-hdmi-a-2.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_hdr@static-toggle-suspend:
    - {bat-arlh-3}:       NOTRUN -> [FAIL][22] +1 other test fail
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-arlh-3/igt@kms_hdr@static-toggle-suspend.html

  
New tests
---------

  New tests have been introduced between CI_DRM_15452 and IGTPW_11824:

### New IGT tests (18) ###

  * igt@kms_hdr@brightness-with-dpms:
    - Statuses : 4 fail(s) 31 skip(s)
    - Exec time: [0.0, 3.62] s

  * igt@kms_hdr@brightness-with-dpms@pipe-a-dp-1:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_hdr@brightness-with-dpms@pipe-a-dp-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_hdr@brightness-with-dpms@pipe-a-edp-1:
    - Statuses : 4 fail(s)
    - Exec time: [2.31, 2.44] s

  * igt@kms_hdr@brightness-with-dpms@pipe-a-hdmi-a-1:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_hdr@brightness-with-dpms@pipe-a-hdmi-a-2:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_hdr@brightness-with-hdr:
    - Statuses : 4 fail(s) 31 skip(s)
    - Exec time: [0.0, 4.01] s

  * igt@kms_hdr@brightness-with-hdr@pipe-a-dp-1:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_hdr@brightness-with-hdr@pipe-a-dp-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_hdr@brightness-with-hdr@pipe-a-edp-1:
    - Statuses : 4 fail(s)
    - Exec time: [2.32, 2.44] s

  * igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-1:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-2:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_hdr@brightness-with-suspend:
    - Statuses : 4 fail(s) 31 skip(s)
    - Exec time: [0.0, 3.61] s

  * igt@kms_hdr@brightness-with-suspend@pipe-a-dp-1:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_hdr@brightness-with-suspend@pipe-a-dp-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_hdr@brightness-with-suspend@pipe-a-edp-1:
    - Statuses : 4 fail(s)
    - Exec time: [2.31, 2.44] s

  * igt@kms_hdr@brightness-with-suspend@pipe-a-hdmi-a-1:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_hdr@brightness-with-suspend@pipe-a-hdmi-a-2:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_11824 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - bat-dg2-13:         NOTRUN -> [SKIP][23] ([i915#7828]) +8 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-dg2-13/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_hdr@bpc-switch-dpms:
    - fi-cfl-8700k:       NOTRUN -> [SKIP][24] +11 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/fi-cfl-8700k/igt@kms_hdr@bpc-switch-dpms.html
    - bat-twl-1:          NOTRUN -> [SKIP][25] ([i915#8228]) +8 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-twl-1/igt@kms_hdr@bpc-switch-dpms.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][26] +11 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/fi-kbl-8809g/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@bpc-switch-suspend:
    - fi-ivb-3770:        NOTRUN -> [SKIP][27] +11 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/fi-ivb-3770/igt@kms_hdr@bpc-switch-suspend.html
    - bat-rplp-1:         NOTRUN -> [SKIP][28] ([i915#3555] / [i915#8228]) +8 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-rplp-1/igt@kms_hdr@bpc-switch-suspend.html

  * {igt@kms_hdr@brightness-with-dpms} (NEW):
    - fi-kbl-7567u:       NOTRUN -> [SKIP][29] +7 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/fi-kbl-7567u/igt@kms_hdr@brightness-with-dpms.html
    - bat-apl-1:          NOTRUN -> [SKIP][30] +6 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-apl-1/igt@kms_hdr@brightness-with-dpms.html

  * {igt@kms_hdr@brightness-with-hdr} (NEW):
    - fi-cfl-guc:         NOTRUN -> [SKIP][31] +11 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/fi-cfl-guc/igt@kms_hdr@brightness-with-hdr.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][32] ([i915#9792]) +11 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-mtlp-6/igt@kms_hdr@brightness-with-hdr.html
    - bat-adlp-11:        NOTRUN -> [SKIP][33] ([i915#10470]) +3 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-adlp-11/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - bat-mtlp-8:         NOTRUN -> [SKIP][34] ([i915#3555] / [i915#8228])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-mtlp-8/igt@kms_hdr@invalid-hdr.html
    - bat-adls-6:         NOTRUN -> [SKIP][35] ([i915#3555])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-adls-6/igt@kms_hdr@invalid-hdr.html
    - bat-adlp-6:         NOTRUN -> [SKIP][36] ([i915#3555] / [i915#8228])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-adlp-6/igt@kms_hdr@invalid-hdr.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][37] ([i915#3555] / [i915#8228])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/fi-rkl-11600/igt@kms_hdr@invalid-hdr.html
    - bat-dg1-7:          NOTRUN -> [SKIP][38] ([i915#3555] / [i915#8228])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-dg1-7/igt@kms_hdr@invalid-hdr.html
    - bat-adlp-9:         NOTRUN -> [SKIP][39] ([i915#3555] / [i915#8228])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-adlp-9/igt@kms_hdr@invalid-hdr.html
    - bat-twl-2:          NOTRUN -> [SKIP][40] ([i915#8228])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-twl-2/igt@kms_hdr@invalid-hdr.html
    - bat-dg2-11:         NOTRUN -> [SKIP][41] ([i915#3555] / [i915#8228])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-dg2-11/igt@kms_hdr@invalid-hdr.html
    - bat-arls-5:         NOTRUN -> [SKIP][42] ([i915#11571] / [i915#8228])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-arls-5/igt@kms_hdr@invalid-hdr.html
    - bat-arls-1:         NOTRUN -> [SKIP][43] ([i915#11571] / [i915#8228])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-arls-1/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-swap:
    - bat-dg2-14:         NOTRUN -> [SKIP][44] ([i915#3555] / [i915#8228]) +8 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-dg2-14/igt@kms_hdr@static-swap.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][45] +11 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/fi-elk-e7500/igt@kms_hdr@static-swap.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][46] +11 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/fi-kbl-guc/igt@kms_hdr@static-swap.html
    - bat-adlm-1:         NOTRUN -> [SKIP][47] ([i915#9900]) +11 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-adlm-1/igt@kms_hdr@static-swap.html
    - fi-ilk-650:         NOTRUN -> [SKIP][48] +11 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/fi-ilk-650/igt@kms_hdr@static-swap.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][49] ([i915#3555] / [i915#8228]) +8 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/fi-tgl-1115g4/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle:
    - bat-jsl-1:          NOTRUN -> [SKIP][50] ([i915#3555]) +8 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-jsl-1/igt@kms_hdr@static-toggle.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][51] +11 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/fi-blb-e6850/igt@kms_hdr@static-toggle.html
    - bat-kbl-2:          NOTRUN -> [SKIP][52] +11 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-kbl-2/igt@kms_hdr@static-toggle.html
    - bat-arlh-2:         NOTRUN -> [SKIP][53] ([i915#11346]) +8 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-arlh-2/igt@kms_hdr@static-toggle.html

  * igt@kms_hdr@static-toggle-dpms:
    - bat-dg2-9:          NOTRUN -> [SKIP][54] ([i915#9197]) +11 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-dg2-9/igt@kms_hdr@static-toggle-dpms.html
    - bat-adlp-11:        NOTRUN -> [SKIP][55] ([i915#10470] / [i915#10501]) +7 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-adlp-11/igt@kms_hdr@static-toggle-dpms.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][56] +11 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/fi-hsw-4770/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_hdr@static-toggle-suspend:
    - bat-arls-2:         NOTRUN -> [SKIP][57] ([i915#11571] / [i915#8228]) +4 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-arls-2/igt@kms_hdr@static-toggle-suspend.html
    - fi-glk-j4005:       NOTRUN -> [SKIP][58] +11 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/fi-glk-j4005/igt@kms_hdr@static-toggle-suspend.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10470]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10470
  [i915#10501]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10501
  [i915#11346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346
  [i915#11571]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11571
  [i915#11908]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11908
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#9197]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197
  [i915#9792]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792
  [i915#9900]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9900


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8035 -> IGTPW_11824

  CI-20190529: 20190529
  CI_DRM_15452: 4d4fdd11d1cc941f2f7c1653fc07519851d9052b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11824: e2cb14644b99a41a9ff89cc9ea862fdcad15dd3c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8035: 54cf84790112f2656b38b9068d4b492fbef13d84 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/index.html

--===============4511755588123581678==
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
<tr><td><b>Series:</b></td><td>Backlight control on HDR-enabled eDP panels (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139050/">https://patchwork.freedesktop.org/series/139050/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_15452 -&gt; IGTPW_11824</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_11824 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_11824, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/index.html</p>
<h2>Participating hosts (36 -&gt; 36)</h2>
<p>Additional (1): bat-adlp-6 <br />
  Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11824:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>bat-apl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-apl-1/igt@kms_hdr@bpc-switch-suspend.html">DMESG-WARN</a> +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1:</p>
<ul>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/fi-kbl-7567u/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>{igt@kms_hdr@brightness-with-dpms} (NEW):</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-adlp-9/igt@kms_hdr@brightness-with-dpms.html">SKIP</a> +5 other tests skip</li>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-twl-2/igt@kms_hdr@brightness-with-dpms.html">FAIL</a> +5 other tests fail</li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-dg2-11/igt@kms_hdr@brightness-with-dpms.html">SKIP</a> +5 other tests skip</li>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-twl-1/igt@kms_hdr@brightness-with-dpms.html">SKIP</a> +2 other tests skip</li>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-dg2-14/igt@kms_hdr@brightness-with-dpms.html">SKIP</a> +2 other tests skip</li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-rplp-1/igt@kms_hdr@brightness-with-dpms.html">SKIP</a> +2 other tests skip</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/fi-tgl-1115g4/igt@kms_hdr@brightness-with-dpms.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_hdr@brightness-with-dpms@pipe-a-dp-3} (NEW):</p>
<ul>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-arls-5/igt@kms_hdr@brightness-with-dpms@pipe-a-dp-3.html">SKIP</a> +5 other tests skip</li>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-adlp-6/igt@kms_hdr@brightness-with-dpms@pipe-a-dp-3.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_hdr@brightness-with-dpms@pipe-a-edp-1} (NEW):</p>
<ul>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-adlp-6/igt@kms_hdr@brightness-with-dpms@pipe-a-edp-1.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@kms_hdr@brightness-with-hdr} (NEW):</p>
<ul>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-arls-2/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> +2 other tests skip</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-mtlp-8/igt@kms_hdr@brightness-with-hdr.html">FAIL</a> +5 other tests fail</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-jsl-1/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> +2 other tests skip</li>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-arlh-2/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-1} (NEW):</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-adls-6/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-1.html">SKIP</a> +8 other tests skip</li>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/fi-rkl-11600/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-1.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_hdr@brightness-with-suspend} (NEW):</p>
<ul>
<li>{bat-arlh-3}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-arlh-3/igt@kms_hdr@brightness-with-suspend.html">FAIL</a> +5 other tests fail</li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-dg1-7/igt@kms_hdr@brightness-with-suspend.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_hdr@brightness-with-suspend@pipe-a-hdmi-a-2} (NEW):</p>
<ul>
<li>bat-arls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-arls-1/igt@kms_hdr@brightness-with-suspend@pipe-a-hdmi-a-2.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_hdr@static-toggle-suspend:<ul>
<li>{bat-arlh-3}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-arlh-3/igt@kms_hdr@static-toggle-suspend.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_15452 and IGTPW_11824:</p>
<h3>New IGT tests (18)</h3>
<ul>
<li>
<p>igt@kms_hdr@brightness-with-dpms:</p>
<ul>
<li>Statuses : 4 fail(s) 31 skip(s)</li>
<li>Exec time: [0.0, 3.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-dpms@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-dpms@pipe-a-dp-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-dpms@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [2.31, 2.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-dpms@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-dpms@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>Statuses : 4 fail(s) 31 skip(s)</li>
<li>Exec time: [0.0, 4.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr@pipe-a-dp-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [2.32, 2.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-suspend:</p>
<ul>
<li>Statuses : 4 fail(s) 31 skip(s)</li>
<li>Exec time: [0.0, 3.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-suspend@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-suspend@pipe-a-dp-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-suspend@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [2.31, 2.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-suspend@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11824 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>bat-dg2-13:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-dg2-13/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/fi-cfl-8700k/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> +11 other tests skip</li>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-twl-1/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +8 other tests skip</li>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/fi-kbl-8809g/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/fi-ivb-3770/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> +11 other tests skip</li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-rplp-1/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_hdr@brightness-with-dpms} (NEW):</p>
<ul>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/fi-kbl-7567u/igt@kms_hdr@brightness-with-dpms.html">SKIP</a> +7 other tests skip</li>
<li>bat-apl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-apl-1/igt@kms_hdr@brightness-with-dpms.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_hdr@brightness-with-hdr} (NEW):</p>
<ul>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/fi-cfl-guc/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> +11 other tests skip</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-mtlp-6/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792">i915#9792</a>) +11 other tests skip</li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-adlp-11/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10470">i915#10470</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-mtlp-8/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-adls-6/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-adlp-6/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/fi-rkl-11600/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-dg1-7/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-adlp-9/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-twl-2/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-dg2-11/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-arls-5/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11571">i915#11571</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
<li>bat-arls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-arls-1/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11571">i915#11571</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-dg2-14/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +8 other tests skip</li>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/fi-elk-e7500/igt@kms_hdr@static-swap.html">SKIP</a> +11 other tests skip</li>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/fi-kbl-guc/igt@kms_hdr@static-swap.html">SKIP</a> +11 other tests skip</li>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-adlm-1/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9900">i915#9900</a>) +11 other tests skip</li>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/fi-ilk-650/igt@kms_hdr@static-swap.html">SKIP</a> +11 other tests skip</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/fi-tgl-1115g4/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-jsl-1/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +8 other tests skip</li>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/fi-blb-e6850/igt@kms_hdr@static-toggle.html">SKIP</a> +11 other tests skip</li>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-kbl-2/igt@kms_hdr@static-toggle.html">SKIP</a> +11 other tests skip</li>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-arlh-2/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-dg2-9/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197">i915#9197</a>) +11 other tests skip</li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-adlp-11/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10470">i915#10470</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10501">i915#10501</a>) +7 other tests skip</li>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/fi-hsw-4770/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/bat-arls-2/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11571">i915#11571</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +4 other tests skip</li>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11824/fi-glk-j4005/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8035 -&gt; IGTPW_11824</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15452: 4d4fdd11d1cc941f2f7c1653fc07519851d9052b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11824: e2cb14644b99a41a9ff89cc9ea862fdcad15dd3c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8035: 54cf84790112f2656b38b9068d4b492fbef13d84 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============4511755588123581678==--
