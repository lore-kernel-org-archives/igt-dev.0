Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1329D65C46
	for <igt-dev@archiver.kernel.org>; Thu, 14 Nov 2024 06:25:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7489810E12E;
	Thu, 14 Nov 2024 06:25:24 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AEB210E12E;
 Thu, 14 Nov 2024 06:25:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1415788176032862036=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_tests/kms=5Fflip=3A_Update_?=
 =?utf-8?q?the_skip_message?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Samala, Pranay" <pranay.samala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 14 Nov 2024 06:25:23 -0000
Message-ID: <173156552355.3944581.17105184405585797497@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241114051835.1860727-1-pranay.samala@intel.com>
In-Reply-To: <20241114051835.1860727-1-pranay.samala@intel.com>
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

--===============1415788176032862036==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_flip: Update the skip message
URL   : https://patchwork.freedesktop.org/series/141338/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8107 -> IGTPW_12100
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12100 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12100, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/index.html

Participating hosts (47 -> 43)
------------------------------

  Missing    (4): fi-rkl-11600 bat-arls-5 bat-mtlp-9 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12100:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@2x-flip-vs-panning:
    - bat-jsl-1:          NOTRUN -> [SKIP][1] +21 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-jsl-1/igt@kms_flip@2x-flip-vs-panning.html

  * igt@kms_flip@flip-vs-suspend:
    - fi-ivb-3770:        NOTRUN -> [INCOMPLETE][2] +1 other test incomplete
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-ivb-3770/igt@kms_flip@flip-vs-suspend.html
    - fi-pnv-d510:        NOTRUN -> [INCOMPLETE][3] +1 other test incomplete
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-pnv-d510/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@b-dp1:
    - bat-apl-1:          NOTRUN -> [INCOMPLETE][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-apl-1/igt@kms_flip@flip-vs-suspend@b-dp1.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible:
    - fi-tgl-1115g4:      NOTRUN -> [INCOMPLETE][5] +1 other test incomplete
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-tgl-1115g4/igt@kms_flip@wf_vblank-ts-check-interruptible.html

  
New tests
---------

  New tests have been introduced between IGT_8107 and IGTPW_12100:

### New IGT tests (30) ###

  * igt@kms_flip@2x-absolute-wf_vblank@ab-hdmi-a2-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [5.45] s

  * igt@kms_flip@2x-absolute-wf_vblank@ac-hdmi-a2-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [5.56] s

  * igt@kms_flip@2x-absolute-wf_vblank@ad-hdmi-a2-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [5.57] s

  * igt@kms_flip@2x-absolute-wf_vblank@bc-hdmi-a2-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [5.56] s

  * igt@kms_flip@2x-absolute-wf_vblank@bd-hdmi-a2-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [5.55] s

  * igt@kms_flip@2x-absolute-wf_vblank@cd-hdmi-a2-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [5.39] s

  * igt@kms_flip@2x-blocking-absolute-wf_vblank@ab-hdmi-a2-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [5.47] s

  * igt@kms_flip@2x-blocking-absolute-wf_vblank@ac-hdmi-a2-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [5.58] s

  * igt@kms_flip@2x-blocking-absolute-wf_vblank@ad-hdmi-a2-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [5.58] s

  * igt@kms_flip@2x-blocking-absolute-wf_vblank@bc-hdmi-a2-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [5.56] s

  * igt@kms_flip@2x-blocking-absolute-wf_vblank@bd-hdmi-a2-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [5.57] s

  * igt@kms_flip@2x-blocking-absolute-wf_vblank@cd-hdmi-a2-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [5.38] s

  * igt@kms_flip@2x-busy-flip@ab-hdmi-a2-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [0.96] s

  * igt@kms_flip@2x-busy-flip@ac-hdmi-a2-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [0.94] s

  * igt@kms_flip@2x-busy-flip@ad-hdmi-a2-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [0.95] s

  * igt@kms_flip@2x-busy-flip@bc-hdmi-a2-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [0.91] s

  * igt@kms_flip@2x-busy-flip@bd-hdmi-a2-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [0.89] s

  * igt@kms_flip@2x-busy-flip@cd-hdmi-a2-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [0.89] s

  * igt@kms_flip@2x-flip-vs-rmfb@ab-hdmi-a2-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [5.48] s

  * igt@kms_flip@2x-flip-vs-rmfb@ac-hdmi-a2-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [5.43] s

  * igt@kms_flip@2x-flip-vs-rmfb@ad-hdmi-a2-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [5.45] s

  * igt@kms_flip@2x-flip-vs-rmfb@bc-hdmi-a2-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [5.44] s

  * igt@kms_flip@2x-flip-vs-rmfb@bd-hdmi-a2-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [5.42] s

  * igt@kms_flip@2x-flip-vs-rmfb@cd-hdmi-a2-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [5.43] s

  * igt@kms_flip@2x-plain-flip-fb-recreate@ab-hdmi-a2-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [5.74] s

  * igt@kms_flip@2x-plain-flip-fb-recreate@ac-hdmi-a2-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [5.68] s

  * igt@kms_flip@2x-plain-flip-fb-recreate@ad-hdmi-a2-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [5.68] s

  * igt@kms_flip@2x-plain-flip-fb-recreate@bc-hdmi-a2-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [5.68] s

  * igt@kms_flip@2x-plain-flip-fb-recreate@bd-hdmi-a2-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [5.68] s

  * igt@kms_flip@2x-plain-flip-fb-recreate@cd-hdmi-a2-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [5.67] s

  

Known issues
------------

  Here are the changes found in IGTPW_12100 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@2x-absolute-wf_vblank:
    - bat-arlh-2:         NOTRUN -> [SKIP][6] ([i915#11346] / [i915#9934]) +40 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-arlh-2/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - fi-kbl-x1275:       NOTRUN -> [SKIP][7] +85 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-kbl-x1275/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - fi-ilk-650:         NOTRUN -> [SKIP][8] +23 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-ilk-650/igt@kms_flip@2x-blocking-absolute-wf_vblank.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][9] ([i915#3637]) +24 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-tgl-1115g4/igt@kms_flip@2x-blocking-absolute-wf_vblank.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][10] +26 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-blb-e6850/igt@kms_flip@2x-blocking-absolute-wf_vblank.html
    - fi-skl-6600u:       NOTRUN -> [SKIP][11] +21 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-skl-6600u/igt@kms_flip@2x-blocking-absolute-wf_vblank.html
    - bat-twl-2:          NOTRUN -> [SKIP][12] ([i915#9934]) +17 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-twl-2/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - bat-arlh-3:         NOTRUN -> [SKIP][13] ([i915#9934]) +16 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-arlh-3/igt@kms_flip@2x-blocking-wf_vblank.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][14] +26 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-pnv-d510/igt@kms_flip@2x-blocking-wf_vblank.html
    - bat-dg1-7:          NOTRUN -> [SKIP][15] ([i915#9934]) +19 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-dg1-7/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-busy-flip:
    - bat-dg2-8:          NOTRUN -> [SKIP][16] ([i915#5354] / [i915#9934]) +19 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-dg2-8/igt@kms_flip@2x-busy-flip.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - bat-dg2-9:          NOTRUN -> [SKIP][17] ([i915#5354] / [i915#9934]) +19 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-dg2-9/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - bat-dg2-11:         NOTRUN -> [SKIP][18] ([i915#5354] / [i915#9934]) +19 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-dg2-11/igt@kms_flip@2x-flip-vs-expired-vblank.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][19] +23 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-cfl-8700k/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-fences:
    - bat-jsl-3:          NOTRUN -> [SKIP][20] ([i915#9934]) +21 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-jsl-3/igt@kms_flip@2x-flip-vs-fences.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][21] +23 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-ivb-3770/igt@kms_flip@2x-flip-vs-fences.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][22] ([i915#8381]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-mtlp-8/igt@kms_flip@2x-flip-vs-fences.html
    - bat-dg2-8:          NOTRUN -> [SKIP][23] ([i915#8381]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-dg2-8/igt@kms_flip@2x-flip-vs-fences.html
    - bat-arlh-3:         NOTRUN -> [SKIP][24] ([i915#11465]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-arlh-3/igt@kms_flip@2x-flip-vs-fences.html
    - bat-dg1-7:          NOTRUN -> [SKIP][25] ([i915#8381]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-dg1-7/igt@kms_flip@2x-flip-vs-fences.html
    - bat-arlh-2:         NOTRUN -> [SKIP][26] ([i915#11346] / [i915#11465]) +3 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-arlh-2/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][27] +85 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-kbl-8809g/igt@kms_flip@2x-flip-vs-modeset.html
    - bat-rplp-1:         NOTRUN -> [SKIP][28] ([i915#3637]) +17 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-rplp-1/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - fi-kbl-7567u:       NOTRUN -> [SKIP][29] +23 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-kbl-7567u/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
    - bat-apl-1:          NOTRUN -> [SKIP][30] +23 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-apl-1/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - bat-kbl-2:          NOTRUN -> [SKIP][31] +85 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-kbl-2/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-flip-vs-wf_vblank:
    - bat-atsm-1:         NOTRUN -> [SKIP][32] ([i915#6078]) +86 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-atsm-1/igt@kms_flip@2x-flip-vs-wf_vblank.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][33] +23 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-hsw-4770/igt@kms_flip@2x-flip-vs-wf_vblank.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][34] ([i915#3637]) +16 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-mtlp-8/igt@kms_flip@2x-flip-vs-wf_vblank.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - fi-cfl-guc:         NOTRUN -> [SKIP][35] +23 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-cfl-guc/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - fi-glk-j4005:       NOTRUN -> [SKIP][36] +23 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-glk-j4005/igt@kms_flip@2x-plain-flip-fb-recreate.html
    - bat-adlp-9:         NOTRUN -> [SKIP][37] ([i915#3637]) +17 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-adlp-9/igt@kms_flip@2x-plain-flip-fb-recreate.html
    - bat-twl-1:          NOTRUN -> [SKIP][38] ([i915#9934]) +17 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-twl-1/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - bat-adlm-1:         NOTRUN -> [SKIP][39] ([i915#9900] / [i915#9934]) +42 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-adlm-1/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - bat-dg1-6:          NOTRUN -> [SKIP][40] ([i915#12311] / [i915#9934]) +40 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-dg1-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - fi-kbl-guc:         NOTRUN -> [SKIP][41] +85 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-kbl-guc/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@absolute-wf_vblank:
    - bat-adls-6:         NOTRUN -> [FAIL][42] ([i915#12517]) +3 other tests fail
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-adls-6/igt@kms_flip@absolute-wf_vblank.html

  * igt@kms_flip@blocking-wf_vblank:
    - bat-adls-6:         NOTRUN -> [FAIL][43] ([i915#12517] / [i915#2122]) +4 other tests fail
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-adls-6/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@blocking-wf_vblank@a-edp1:
    - bat-rplp-1:         NOTRUN -> [FAIL][44] ([i915#12517] / [i915#2122]) +2 other tests fail
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-rplp-1/igt@kms_flip@blocking-wf_vblank@a-edp1.html

  * igt@kms_flip@bo-too-big-interruptible:
    - bat-mtlp-6:         NOTRUN -> [SKIP][45] ([i915#3637] / [i915#9792]) +81 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-mtlp-6/igt@kms_flip@bo-too-big-interruptible.html

  * igt@kms_flip@dpms-off-confusion:
    - bat-dg1-6:          NOTRUN -> [SKIP][46] ([i915#12311]) +40 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-dg1-6/igt@kms_flip@dpms-off-confusion.html

  * igt@kms_flip@dpms-off-confusion-interruptible:
    - bat-arlh-2:         NOTRUN -> [SKIP][47] ([i915#11346]) +40 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-arlh-2/igt@kms_flip@dpms-off-confusion-interruptible.html

  * igt@kms_flip@dpms-vs-vblank-race:
    - bat-adlp-11:        NOTRUN -> [SKIP][48] ([i915#3637]) +85 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-adlp-11/igt@kms_flip@dpms-vs-vblank-race.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - fi-cfl-guc:         NOTRUN -> [FAIL][49] ([i915#79]) +1 other test fail
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-cfl-guc/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-fences:
    - bat-dg2-9:          NOTRUN -> [SKIP][50] ([i915#8381]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-dg2-9/igt@kms_flip@flip-vs-fences.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][51] ([i915#8381] / [i915#9792]) +3 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-mtlp-6/igt@kms_flip@flip-vs-fences.html
    - bat-dg2-14:         NOTRUN -> [SKIP][52] ([i915#8381]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-dg2-14/igt@kms_flip@flip-vs-fences.html
    - bat-dg2-11:         NOTRUN -> [SKIP][53] ([i915#8381]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-dg2-11/igt@kms_flip@flip-vs-fences.html

  * igt@kms_flip@flip-vs-fences-interruptible:
    - bat-dg1-6:          NOTRUN -> [SKIP][54] ([i915#12311] / [i915#8381]) +3 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-dg1-6/igt@kms_flip@flip-vs-fences-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - fi-ilk-650:         NOTRUN -> [INCOMPLETE][55] ([i915#4839]) +1 other test incomplete
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-ilk-650/igt@kms_flip@flip-vs-suspend.html
    - fi-cfl-guc:         NOTRUN -> [INCOMPLETE][56] ([i915#4839]) +1 other test incomplete
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-cfl-guc/igt@kms_flip@flip-vs-suspend.html
    - fi-cfl-8700k:       NOTRUN -> [INCOMPLETE][57] ([i915#4839]) +1 other test incomplete
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-cfl-8700k/igt@kms_flip@flip-vs-suspend.html
    - fi-hsw-4770:        NOTRUN -> [INCOMPLETE][58] ([i915#4839]) +1 other test incomplete
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-hsw-4770/igt@kms_flip@flip-vs-suspend.html
    - fi-glk-j4005:       NOTRUN -> [INCOMPLETE][59] ([i915#4839]) +1 other test incomplete
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-glk-j4005/igt@kms_flip@flip-vs-suspend.html
    - bat-apl-1:          NOTRUN -> [INCOMPLETE][60] ([i915#4839])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-apl-1/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@b-dp1:
    - fi-kbl-7567u:       NOTRUN -> [DMESG-WARN][61] ([i915#11621]) +1 other test dmesg-warn
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-kbl-7567u/igt@kms_flip@flip-vs-suspend@b-dp1.html

  * igt@kms_flip@flip-vs-suspend@b-vga1:
    - fi-blb-e6850:       NOTRUN -> [INCOMPLETE][62] ([i915#4839]) +1 other test incomplete
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-blb-e6850/igt@kms_flip@flip-vs-suspend@b-vga1.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - fi-kbl-7567u:       NOTRUN -> [INCOMPLETE][63] ([i915#4839]) +1 other test incomplete
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-kbl-7567u/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_flip@plain-flip-interruptible:
    - fi-bsw-nick:        NOTRUN -> [SKIP][64] +85 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-bsw-nick/igt@kms_flip@plain-flip-interruptible.html
    - bat-adlm-1:         NOTRUN -> [SKIP][65] ([i915#3637] / [i915#9900]) +42 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-adlm-1/igt@kms_flip@plain-flip-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check:
    - bat-adls-6:         NOTRUN -> [FAIL][66] ([i915#10826] / [i915#12517] / [i915#2122])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-adls-6/igt@kms_flip@wf_vblank-ts-check.html
    - bat-jsl-1:          NOTRUN -> [FAIL][67] ([i915#2122]) +3 other tests fail
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-jsl-1/igt@kms_flip@wf_vblank-ts-check.html
    - bat-arlh-3:         NOTRUN -> [FAIL][68] ([i915#11989] / [i915#12517] / [i915#12769])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-arlh-3/igt@kms_flip@wf_vblank-ts-check.html
    - fi-pnv-d510:        NOTRUN -> [FAIL][69] ([i915#2122]) +1 other test fail
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-pnv-d510/igt@kms_flip@wf_vblank-ts-check.html
    - bat-dg1-7:          NOTRUN -> [FAIL][70] ([i915#11989] / [i915#12517] / [i915#12769] / [i915#2122])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-dg1-7/igt@kms_flip@wf_vblank-ts-check.html
    - fi-glk-j4005:       NOTRUN -> [FAIL][71] ([i915#2122]) +2 other tests fail
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-glk-j4005/igt@kms_flip@wf_vblank-ts-check.html
    - bat-rpls-4:         NOTRUN -> [FAIL][72] ([i915#12517] / [i915#12769])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-rpls-4/igt@kms_flip@wf_vblank-ts-check.html
    - bat-twl-1:          NOTRUN -> [FAIL][73] ([i915#12517])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-twl-1/igt@kms_flip@wf_vblank-ts-check.html
    - bat-apl-1:          NOTRUN -> [FAIL][74] ([i915#12769]) +1 other test fail
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-apl-1/igt@kms_flip@wf_vblank-ts-check.html
    - bat-rplp-1:         NOTRUN -> [FAIL][75] ([i915#12517]) +1 other test fail
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-rplp-1/igt@kms_flip@wf_vblank-ts-check.html
    - bat-adlp-6:         NOTRUN -> [FAIL][76] ([i915#12769] / [i915#2122]) +1 other test fail
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-adlp-6/igt@kms_flip@wf_vblank-ts-check.html
    - fi-ivb-3770:        NOTRUN -> [FAIL][77] ([i915#12517] / [i915#12769])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-ivb-3770/igt@kms_flip@wf_vblank-ts-check.html
    - fi-hsw-4770:        NOTRUN -> [FAIL][78] ([i915#12517] / [i915#2122])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-hsw-4770/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_flip@wf_vblank-ts-check@a-dp1:
    - bat-adlp-9:         NOTRUN -> [FAIL][79] ([i915#12769] / [i915#2122]) +1 other test fail
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-adlp-9/igt@kms_flip@wf_vblank-ts-check@a-dp1.html
    - bat-apl-1:          NOTRUN -> [FAIL][80] ([i915#12769] / [i915#2122])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-apl-1/igt@kms_flip@wf_vblank-ts-check@a-dp1.html

  * igt@kms_flip@wf_vblank-ts-check@a-edp1:
    - bat-arlh-3:         NOTRUN -> [FAIL][81] ([i915#12769]) +1 other test fail
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-arlh-3/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
    - bat-twl-1:          NOTRUN -> [FAIL][82] ([i915#12702]) +1 other test fail
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-twl-1/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
    - bat-rplp-1:         NOTRUN -> [FAIL][83] ([i915#12702] / [i915#2122]) +1 other test fail
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-rplp-1/igt@kms_flip@wf_vblank-ts-check@a-edp1.html

  * igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1:
    - bat-adls-6:         NOTRUN -> [FAIL][84] ([i915#10826])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-adls-6/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1.html

  * igt@kms_flip@wf_vblank-ts-check@a-hdmi-a2:
    - bat-rpls-4:         NOTRUN -> [FAIL][85] ([i915#12702]) +1 other test fail
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-rpls-4/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a2.html
    - bat-dg2-11:         NOTRUN -> [FAIL][86] ([i915#2122]) +1 other test fail
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-dg2-11/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a2.html

  * igt@kms_flip@wf_vblank-ts-check@a-vga1:
    - fi-hsw-4770:        NOTRUN -> [FAIL][87] ([i915#12702]) +1 other test fail
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-hsw-4770/igt@kms_flip@wf_vblank-ts-check@a-vga1.html

  * igt@kms_flip@wf_vblank-ts-check@b-dp1:
    - bat-dg2-8:          NOTRUN -> [FAIL][88] ([i915#2122]) +3 other tests fail
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-dg2-8/igt@kms_flip@wf_vblank-ts-check@b-dp1.html

  * igt@kms_flip@wf_vblank-ts-check@b-edp1:
    - bat-adlp-6:         NOTRUN -> [FAIL][89] ([i915#12702] / [i915#12769] / [i915#2122])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-adlp-6/igt@kms_flip@wf_vblank-ts-check@b-edp1.html

  * igt@kms_flip@wf_vblank-ts-check@b-hdmi-a2:
    - bat-dg1-7:          NOTRUN -> [FAIL][90] ([i915#12702]) +1 other test fail
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-dg1-7/igt@kms_flip@wf_vblank-ts-check@b-hdmi-a2.html

  * igt@kms_flip@wf_vblank-ts-check@b-vga1:
    - fi-ivb-3770:        NOTRUN -> [FAIL][91] ([i915#12769]) +1 other test fail
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-ivb-3770/igt@kms_flip@wf_vblank-ts-check@b-vga1.html

  * igt@kms_flip@wf_vblank-ts-check@c-edp1:
    - bat-twl-1:          NOTRUN -> [FAIL][92] ([i915#12740])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-twl-1/igt@kms_flip@wf_vblank-ts-check@c-edp1.html
    - bat-rplp-1:         NOTRUN -> [FAIL][93] ([i915#2122]) +2 other tests fail
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-rplp-1/igt@kms_flip@wf_vblank-ts-check@c-edp1.html

  * igt@kms_flip@wf_vblank-ts-check@c-hdmi-a1:
    - bat-adls-6:         NOTRUN -> [FAIL][94] ([i915#2122]) +3 other tests fail
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-adls-6/igt@kms_flip@wf_vblank-ts-check@c-hdmi-a1.html

  * igt@kms_flip@wf_vblank-ts-check@c-hdmi-a2:
    - bat-dg1-7:          NOTRUN -> [FAIL][95] ([i915#12769])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-dg1-7/igt@kms_flip@wf_vblank-ts-check@c-hdmi-a2.html
    - bat-rpls-4:         NOTRUN -> [FAIL][96] ([i915#12769])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-rpls-4/igt@kms_flip@wf_vblank-ts-check@c-hdmi-a2.html

  * igt@kms_flip@wf_vblank-ts-check@c-vga1:
    - fi-hsw-4770:        NOTRUN -> [FAIL][97] ([i915#12740])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-hsw-4770/igt@kms_flip@wf_vblank-ts-check@c-vga1.html
    - fi-ivb-3770:        NOTRUN -> [FAIL][98] ([i915#12740])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-ivb-3770/igt@kms_flip@wf_vblank-ts-check@c-vga1.html

  * igt@kms_flip@wf_vblank-ts-check@d-hdmi-a1:
    - fi-tgl-1115g4:      NOTRUN -> [FAIL][99] ([i915#2122]) +5 other tests fail
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-tgl-1115g4/igt@kms_flip@wf_vblank-ts-check@d-hdmi-a1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10826]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10826
  [i915#11346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346
  [i915#11465]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11465
  [i915#11621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621
  [i915#11989]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11989
  [i915#12311]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311
  [i915#12517]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12517
  [i915#12702]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12702
  [i915#12740]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12740
  [i915#12769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12769
  [i915#2122]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#6078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078
  [i915#79]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/79
  [i915#8381]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381
  [i915#9792]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792
  [i915#9900]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9900
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8107 -> IGTPW_12100
  * Linux: CI_DRM_15689 -> CI_DRM_15692

  CI-20190529: 20190529
  CI_DRM_15689: 169c7cd31a373ed31054abb423981856eb5fb119 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15692: 52166ab72753e6d0d496539d050a5f54d9f2278b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12100: 12100
  IGT_8107: 0362b0deec80daaecdfa3dd0676dcabb6f14bd9c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/index.html

--===============1415788176032862036==
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
<tr><td><b>Series:</b></td><td>tests/kms_flip: Update the skip message</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141338/">https://patchwork.freedesktop.org/series/141338/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8107 -&gt; IGTPW_12100</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_12100 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_12100, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/index.html</p>
<h2>Participating hosts (47 -&gt; 43)</h2>
<p>Missing    (4): fi-rkl-11600 bat-arls-5 bat-mtlp-9 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_12100:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@2x-flip-vs-panning:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-jsl-1/igt@kms_flip@2x-flip-vs-panning.html">SKIP</a> +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-ivb-3770/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> +1 other test incomplete</li>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-pnv-d510/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-dp1:</p>
<ul>
<li>bat-apl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-apl-1/igt@kms_flip@flip-vs-suspend@b-dp1.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-tgl-1115g4/igt@kms_flip@wf_vblank-ts-check-interruptible.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_8107 and IGTPW_12100:</p>
<h3>New IGT tests (30)</h3>
<ul>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank@ab-hdmi-a2-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank@ac-hdmi-a2-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank@ad-hdmi-a2-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank@bc-hdmi-a2-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank@bd-hdmi-a2-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank@cd-hdmi-a2-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank@ab-hdmi-a2-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank@ac-hdmi-a2-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank@ad-hdmi-a2-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank@bc-hdmi-a2-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank@bd-hdmi-a2-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank@cd-hdmi-a2-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-busy-flip@ab-hdmi-a2-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-busy-flip@ac-hdmi-a2-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-busy-flip@ad-hdmi-a2-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-busy-flip@bc-hdmi-a2-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-busy-flip@bd-hdmi-a2-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-busy-flip@cd-hdmi-a2-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb@ab-hdmi-a2-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb@ac-hdmi-a2-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb@ad-hdmi-a2-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb@bc-hdmi-a2-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb@bd-hdmi-a2-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb@cd-hdmi-a2-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate@ab-hdmi-a2-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate@ac-hdmi-a2-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate@ad-hdmi-a2-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate@bc-hdmi-a2-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate@bd-hdmi-a2-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate@cd-hdmi-a2-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.67] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12100 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-arlh-2/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +40 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
<ul>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-kbl-x1275/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html">SKIP</a> +85 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-ilk-650/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">SKIP</a> +23 other tests skip</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-tgl-1115g4/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>) +24 other tests skip</li>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-blb-e6850/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">SKIP</a> +26 other tests skip</li>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-skl-6600u/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">SKIP</a> +21 other tests skip</li>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-twl-2/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-arlh-3/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +16 other tests skip</li>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-pnv-d510/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> +26 other tests skip</li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-dg1-7/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-busy-flip:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-dg2-8/igt@kms_flip@2x-busy-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-dg2-9/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-dg2-11/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +19 other tests skip</li>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-cfl-8700k/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a> +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences:</p>
<ul>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-jsl-3/igt@kms_flip@2x-flip-vs-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +21 other tests skip</li>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-ivb-3770/igt@kms_flip@2x-flip-vs-fences.html">SKIP</a> +23 other tests skip</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-mtlp-8/igt@kms_flip@2x-flip-vs-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381">i915#8381</a>) +1 other test skip</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-dg2-8/igt@kms_flip@2x-flip-vs-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381">i915#8381</a>) +1 other test skip</li>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-arlh-3/igt@kms_flip@2x-flip-vs-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11465">i915#11465</a>) +1 other test skip</li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-dg1-7/igt@kms_flip@2x-flip-vs-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381">i915#8381</a>) +1 other test skip</li>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-arlh-2/igt@kms_flip@2x-flip-vs-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11465">i915#11465</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-kbl-8809g/igt@kms_flip@2x-flip-vs-modeset.html">SKIP</a> +85 other tests skip</li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-rplp-1/igt@kms_flip@2x-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-kbl-7567u/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a> +23 other tests skip</li>
<li>bat-apl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-apl-1/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a> +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-kbl-2/igt@kms_flip@2x-flip-vs-suspend.html">SKIP</a> +85 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-atsm-1/igt@kms_flip@2x-flip-vs-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078">i915#6078</a>) +86 other tests skip</li>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-hsw-4770/igt@kms_flip@2x-flip-vs-wf_vblank.html">SKIP</a> +23 other tests skip</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-mtlp-8/igt@kms_flip@2x-flip-vs-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-cfl-guc/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a> +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-glk-j4005/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> +23 other tests skip</li>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-adlp-9/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>) +17 other tests skip</li>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-twl-1/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-adlm-1/igt@kms_flip@2x-plain-flip-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9900">i915#9900</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +42 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-dg1-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +40 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-kbl-guc/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> +85 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-adls-6/igt@kms_flip@absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12517">i915#12517</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-adls-6/igt@kms_flip@blocking-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12517">i915#12517</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122">i915#2122</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@a-edp1:</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-rplp-1/igt@kms_flip@blocking-wf_vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12517">i915#12517</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122">i915#2122</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big-interruptible:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-mtlp-6/igt@kms_flip@bo-too-big-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792">i915#9792</a>) +81 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion:</p>
<ul>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-dg1-6/igt@kms_flip@dpms-off-confusion.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a>) +40 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion-interruptible:</p>
<ul>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-arlh-2/igt@kms_flip@dpms-off-confusion-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>) +40 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race:</p>
<ul>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-adlp-11/igt@kms_flip@dpms-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>) +85 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-cfl-guc/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/79">i915#79</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-dg2-9/igt@kms_flip@flip-vs-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381">i915#8381</a>) +1 other test skip</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-mtlp-6/igt@kms_flip@flip-vs-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381">i915#8381</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792">i915#9792</a>) +3 other tests skip</li>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-dg2-14/igt@kms_flip@flip-vs-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381">i915#8381</a>) +1 other test skip</li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-dg2-11/igt@kms_flip@flip-vs-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381">i915#8381</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences-interruptible:</p>
<ul>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-dg1-6/igt@kms_flip@flip-vs-fences-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381">i915#8381</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-ilk-650/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>) +1 other test incomplete</li>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-cfl-guc/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>) +1 other test incomplete</li>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-cfl-8700k/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>) +1 other test incomplete</li>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-hsw-4770/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>) +1 other test incomplete</li>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-glk-j4005/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>) +1 other test incomplete</li>
<li>bat-apl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-apl-1/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-dp1:</p>
<ul>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-kbl-7567u/igt@kms_flip@flip-vs-suspend@b-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621">i915#11621</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-vga1:</p>
<ul>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-blb-e6850/igt@kms_flip@flip-vs-suspend@b-vga1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp1:</p>
<ul>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-kbl-7567u/igt@kms_flip@flip-vs-suspend@c-dp1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-interruptible:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-bsw-nick/igt@kms_flip@plain-flip-interruptible.html">SKIP</a> +85 other tests skip</li>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-adlm-1/igt@kms_flip@plain-flip-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9900">i915#9900</a>) +42 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-adls-6/igt@kms_flip@wf_vblank-ts-check.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10826">i915#10826</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12517">i915#12517</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122">i915#2122</a>)</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-jsl-1/igt@kms_flip@wf_vblank-ts-check.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122">i915#2122</a>) +3 other tests fail</li>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-arlh-3/igt@kms_flip@wf_vblank-ts-check.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11989">i915#11989</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12517">i915#12517</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12769">i915#12769</a>)</li>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-pnv-d510/igt@kms_flip@wf_vblank-ts-check.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122">i915#2122</a>) +1 other test fail</li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-dg1-7/igt@kms_flip@wf_vblank-ts-check.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11989">i915#11989</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12517">i915#12517</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12769">i915#12769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122">i915#2122</a>)</li>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-glk-j4005/igt@kms_flip@wf_vblank-ts-check.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122">i915#2122</a>) +2 other tests fail</li>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-rpls-4/igt@kms_flip@wf_vblank-ts-check.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12517">i915#12517</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12769">i915#12769</a>)</li>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-twl-1/igt@kms_flip@wf_vblank-ts-check.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12517">i915#12517</a>)</li>
<li>bat-apl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-apl-1/igt@kms_flip@wf_vblank-ts-check.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12769">i915#12769</a>) +1 other test fail</li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-rplp-1/igt@kms_flip@wf_vblank-ts-check.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12517">i915#12517</a>) +1 other test fail</li>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-adlp-6/igt@kms_flip@wf_vblank-ts-check.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12769">i915#12769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122">i915#2122</a>) +1 other test fail</li>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-ivb-3770/igt@kms_flip@wf_vblank-ts-check.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12517">i915#12517</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12769">i915#12769</a>)</li>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-hsw-4770/igt@kms_flip@wf_vblank-ts-check.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12517">i915#12517</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122">i915#2122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-dp1:</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-adlp-9/igt@kms_flip@wf_vblank-ts-check@a-dp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12769">i915#12769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122">i915#2122</a>) +1 other test fail</li>
<li>bat-apl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-apl-1/igt@kms_flip@wf_vblank-ts-check@a-dp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12769">i915#12769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122">i915#2122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-edp1:</p>
<ul>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-arlh-3/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12769">i915#12769</a>) +1 other test fail</li>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-twl-1/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12702">i915#12702</a>) +1 other test fail</li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-rplp-1/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12702">i915#12702</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122">i915#2122</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-adls-6/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10826">i915#10826</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-hdmi-a2:</p>
<ul>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-rpls-4/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12702">i915#12702</a>) +1 other test fail</li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-dg2-11/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122">i915#2122</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-vga1:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-hsw-4770/igt@kms_flip@wf_vblank-ts-check@a-vga1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12702">i915#12702</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@b-dp1:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-dg2-8/igt@kms_flip@wf_vblank-ts-check@b-dp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122">i915#2122</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@b-edp1:</p>
<ul>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-adlp-6/igt@kms_flip@wf_vblank-ts-check@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12702">i915#12702</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12769">i915#12769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122">i915#2122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@b-hdmi-a2:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-dg1-7/igt@kms_flip@wf_vblank-ts-check@b-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12702">i915#12702</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@b-vga1:</p>
<ul>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-ivb-3770/igt@kms_flip@wf_vblank-ts-check@b-vga1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12769">i915#12769</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@c-edp1:</p>
<ul>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-twl-1/igt@kms_flip@wf_vblank-ts-check@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12740">i915#12740</a>)</li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-rplp-1/igt@kms_flip@wf_vblank-ts-check@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122">i915#2122</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@c-hdmi-a1:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-adls-6/igt@kms_flip@wf_vblank-ts-check@c-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122">i915#2122</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@c-hdmi-a2:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-dg1-7/igt@kms_flip@wf_vblank-ts-check@c-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12769">i915#12769</a>)</li>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/bat-rpls-4/igt@kms_flip@wf_vblank-ts-check@c-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12769">i915#12769</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@c-vga1:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-hsw-4770/igt@kms_flip@wf_vblank-ts-check@c-vga1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12740">i915#12740</a>)</li>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-ivb-3770/igt@kms_flip@wf_vblank-ts-check@c-vga1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12740">i915#12740</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@d-hdmi-a1:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12100/fi-tgl-1115g4/igt@kms_flip@wf_vblank-ts-check@d-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122">i915#2122</a>) +5 other tests fail</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8107 -&gt; IGTPW_12100</li>
<li>Linux: CI_DRM_15689 -&gt; CI_DRM_15692</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15689: 169c7cd31a373ed31054abb423981856eb5fb119 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_15692: 52166ab72753e6d0d496539d050a5f54d9f2278b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_12100: 12100<br />
  IGT_8107: 0362b0deec80daaecdfa3dd0676dcabb6f14bd9c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============1415788176032862036==--
