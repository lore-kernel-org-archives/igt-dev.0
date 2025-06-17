Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F31C71136
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 12:44:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A5C110E3C5;
	Tue, 17 Jun 2025 12:44:46 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4B0710E3C5;
 Tue, 17 Jun 2025 12:44:44 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4377039499638722071=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_tests/kms=5Fflip=3A_Impro?=
 =?utf-8?q?ve_frame_timing_checks_for_high_refresh_rates_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 17 Jun 2025 12:44:44 -0000
Message-ID: <175016428472.86800.5748368701132649885@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250616063831.3332042-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20250616063831.3332042-1-ramanaidu.naladala@intel.com>
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

--===============4377039499638722071==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_flip: Improve frame timing checks for high refresh rates (rev3)
URL   : https://patchwork.freedesktop.org/series/148796/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8412 -> IGTPW_13298
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_13298 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_13298, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/index.html

Participating hosts (40 -> 37)
------------------------------

  Missing    (3): bat-dg2-8 fi-glk-j4005 fi-pnv-d510 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_13298:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@2x-absolute-wf_vblank@ab-dp1-hdmi-a2:
    - bat-rpls-4:         NOTRUN -> [FAIL][1] +9 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-rpls-4/igt@kms_flip@2x-absolute-wf_vblank@ab-dp1-hdmi-a2.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - bat-adlp-9:         NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-adlp-9/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
    - bat-rplp-1:         NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-rplp-1/igt@kms_flip@2x-flip-vs-dpms-on-nop.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - bat-adlp-11:        NOTRUN -> [SKIP][4] +3 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-adlp-11/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@2x-flip-vs-fences:
    - bat-arlh-3:         NOTRUN -> [SKIP][5] +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-arlh-3/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@absolute-wf_vblank@a-dp1:
    - bat-adls-6:         NOTRUN -> [FAIL][6] +13 other tests fail
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-adls-6/igt@kms_flip@absolute-wf_vblank@a-dp1.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1:
    - bat-adls-6:         [PASS][7] -> [FAIL][8] +1 other test fail
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8412/bat-adls-6/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-adls-6/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - fi-kbl-7567u:       NOTRUN -> [DMESG-WARN][9] +3 other tests dmesg-warn
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/fi-kbl-7567u/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_flip@wf_vblank-ts-check:
    - bat-jsl-1:          NOTRUN -> [FAIL][10] +3 other tests fail
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-jsl-1/igt@kms_flip@wf_vblank-ts-check.html
    - bat-twl-2:          NOTRUN -> [FAIL][11] +2 other tests fail
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-twl-2/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible:
    - fi-hsw-4770:        NOTRUN -> [FAIL][12] +5 other tests fail
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/fi-hsw-4770/igt@kms_flip@wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1:
    - fi-cfl-8700k:       NOTRUN -> [FAIL][13] +2 other tests fail
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/fi-cfl-8700k/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-vga1:
    - fi-ivb-3770:        NOTRUN -> [FAIL][14] +2 other tests fail
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/fi-ivb-3770/igt@kms_flip@wf_vblank-ts-check-interruptible@a-vga1.html

  * igt@kms_flip@wf_vblank-ts-check@a-dp1:
    - fi-kbl-7567u:       NOTRUN -> [FAIL][15] +2 other tests fail
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/fi-kbl-7567u/igt@kms_flip@wf_vblank-ts-check@a-dp1.html

  * igt@kms_flip@wf_vblank-ts-check@b-vga1:
    - fi-elk-e7500:       NOTRUN -> [FAIL][16] +2 other tests fail
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/fi-elk-e7500/igt@kms_flip@wf_vblank-ts-check@b-vga1.html

  
New tests
---------

  New tests have been introduced between IGT_8412 and IGTPW_13298:

### New IGT tests (274) ###

  * igt@kms_flip@2x-absolute-wf_vblank@ab-dp6-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [6.94] s

  * igt@kms_flip@2x-absolute-wf_vblank@ab-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [6.38] s

  * igt@kms_flip@2x-absolute-wf_vblank@ab-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.59] s

  * igt@kms_flip@2x-absolute-wf_vblank@ac-dp6-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [6.55] s

  * igt@kms_flip@2x-absolute-wf_vblank@ac-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [6.27] s

  * igt@kms_flip@2x-absolute-wf_vblank@ac-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.54] s

  * igt@kms_flip@2x-absolute-wf_vblank@ad-dp6-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [6.47] s

  * igt@kms_flip@2x-absolute-wf_vblank@ad-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [6.23] s

  * igt@kms_flip@2x-absolute-wf_vblank@ad-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.56] s

  * igt@kms_flip@2x-absolute-wf_vblank@bc-dp6-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [6.45] s

  * igt@kms_flip@2x-absolute-wf_vblank@bc-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [6.24] s

  * igt@kms_flip@2x-absolute-wf_vblank@bc-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.56] s

  * igt@kms_flip@2x-absolute-wf_vblank@bd-dp6-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [6.47] s

  * igt@kms_flip@2x-absolute-wf_vblank@bd-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [6.22] s

  * igt@kms_flip@2x-absolute-wf_vblank@bd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.55] s

  * igt@kms_flip@2x-absolute-wf_vblank@cd-dp6-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [6.45] s

  * igt@kms_flip@2x-absolute-wf_vblank@cd-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [6.22] s

  * igt@kms_flip@2x-absolute-wf_vblank@cd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.56] s

  * igt@kms_flip@2x-blocking-absolute-wf_vblank@ab-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [6.21] s

  * igt@kms_flip@2x-blocking-absolute-wf_vblank@ab-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.60] s

  * igt@kms_flip@2x-blocking-absolute-wf_vblank@ac-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [6.40] s

  * igt@kms_flip@2x-blocking-absolute-wf_vblank@ac-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.58] s

  * igt@kms_flip@2x-blocking-absolute-wf_vblank@ad-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [6.45] s

  * igt@kms_flip@2x-blocking-absolute-wf_vblank@ad-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.54] s

  * igt@kms_flip@2x-blocking-absolute-wf_vblank@bc-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [6.43] s

  * igt@kms_flip@2x-blocking-absolute-wf_vblank@bc-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.56] s

  * igt@kms_flip@2x-blocking-absolute-wf_vblank@bd-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [6.45] s

  * igt@kms_flip@2x-blocking-absolute-wf_vblank@bd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.52] s

  * igt@kms_flip@2x-blocking-absolute-wf_vblank@cd-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [6.42] s

  * igt@kms_flip@2x-blocking-absolute-wf_vblank@cd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.55] s

  * igt@kms_flip@2x-blocking-wf_vblank@ab-dp6-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [7.22] s

  * igt@kms_flip@2x-blocking-wf_vblank@ab-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [6.65] s

  * igt@kms_flip@2x-blocking-wf_vblank@ab-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.71] s

  * igt@kms_flip@2x-blocking-wf_vblank@ac-dp6-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [6.84] s

  * igt@kms_flip@2x-blocking-wf_vblank@ac-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [6.65] s

  * igt@kms_flip@2x-blocking-wf_vblank@ac-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.66] s

  * igt@kms_flip@2x-blocking-wf_vblank@ad-dp6-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [6.75] s

  * igt@kms_flip@2x-blocking-wf_vblank@ad-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [6.65] s

  * igt@kms_flip@2x-blocking-wf_vblank@ad-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.66] s

  * igt@kms_flip@2x-blocking-wf_vblank@bc-dp6-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [6.75] s

  * igt@kms_flip@2x-blocking-wf_vblank@bc-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [6.65] s

  * igt@kms_flip@2x-blocking-wf_vblank@bc-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.67] s

  * igt@kms_flip@2x-blocking-wf_vblank@bd-dp6-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [6.83] s

  * igt@kms_flip@2x-blocking-wf_vblank@bd-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [6.76] s

  * igt@kms_flip@2x-blocking-wf_vblank@bd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.64] s

  * igt@kms_flip@2x-blocking-wf_vblank@cd-dp6-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [6.82] s

  * igt@kms_flip@2x-blocking-wf_vblank@cd-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [6.62] s

  * igt@kms_flip@2x-blocking-wf_vblank@cd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.67] s

  * igt@kms_flip@2x-busy-flip@ab-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [1.73] s

  * igt@kms_flip@2x-busy-flip@ab-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [0.97] s

  * igt@kms_flip@2x-busy-flip@ac-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [1.81] s

  * igt@kms_flip@2x-busy-flip@ac-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [0.91] s

  * igt@kms_flip@2x-busy-flip@ad-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [1.82] s

  * igt@kms_flip@2x-busy-flip@ad-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [0.93] s

  * igt@kms_flip@2x-busy-flip@bc-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [1.81] s

  * igt@kms_flip@2x-busy-flip@bc-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [0.91] s

  * igt@kms_flip@2x-busy-flip@bd-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [1.78] s

  * igt@kms_flip@2x-busy-flip@bd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [0.91] s

  * igt@kms_flip@2x-busy-flip@cd-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [1.72] s

  * igt@kms_flip@2x-busy-flip@cd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [0.93] s

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.66] s

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ac-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.71] s

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ad-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.66] s

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank@bc-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.66] s

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank@bd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.66] s

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank@cd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.66] s

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.70] s

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ac-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.66] s

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ad-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.66] s

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@bc-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.66] s

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@bd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.64] s

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@cd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.64] s

  * igt@kms_flip@2x-flip-vs-dpms-on-nop@ab-dp1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [1.24] s

  * igt@kms_flip@2x-flip-vs-dpms-on-nop@ab-dp6-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [2.70] s

  * igt@kms_flip@2x-flip-vs-dpms-on-nop@ab-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [1.99] s

  * igt@kms_flip@2x-flip-vs-dpms-on-nop@ab-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [1.21] s

  * igt@kms_flip@2x-flip-vs-dpms-on-nop@ac-dp1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [1.22] s

  * igt@kms_flip@2x-flip-vs-dpms-on-nop@ac-dp6-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [2.34] s

  * igt@kms_flip@2x-flip-vs-dpms-on-nop@ac-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [2.03] s

  * igt@kms_flip@2x-flip-vs-dpms-on-nop@ac-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [1.20] s

  * igt@kms_flip@2x-flip-vs-dpms-on-nop@ad-dp1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [1.20] s

  * igt@kms_flip@2x-flip-vs-dpms-on-nop@ad-dp6-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [2.32] s

  * igt@kms_flip@2x-flip-vs-dpms-on-nop@ad-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [2.02] s

  * igt@kms_flip@2x-flip-vs-dpms-on-nop@ad-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [1.21] s

  * igt@kms_flip@2x-flip-vs-dpms-on-nop@bc-dp1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [1.20] s

  * igt@kms_flip@2x-flip-vs-dpms-on-nop@bc-dp6-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [2.25] s

  * igt@kms_flip@2x-flip-vs-dpms-on-nop@bc-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [2.04] s

  * igt@kms_flip@2x-flip-vs-dpms-on-nop@bc-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [1.17] s

  * igt@kms_flip@2x-flip-vs-dpms-on-nop@bd-dp1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [1.22] s

  * igt@kms_flip@2x-flip-vs-dpms-on-nop@bd-dp6-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [2.24] s

  * igt@kms_flip@2x-flip-vs-dpms-on-nop@bd-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [2.01] s

  * igt@kms_flip@2x-flip-vs-dpms-on-nop@bd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [1.16] s

  * igt@kms_flip@2x-flip-vs-dpms-on-nop@cd-dp1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [1.21] s

  * igt@kms_flip@2x-flip-vs-dpms-on-nop@cd-dp6-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [2.23] s

  * igt@kms_flip@2x-flip-vs-dpms-on-nop@cd-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [2.02] s

  * igt@kms_flip@2x-flip-vs-dpms-on-nop@cd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [1.19] s

  * igt@kms_flip@2x-flip-vs-dpms@ab-dp6-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [3.79] s

  * igt@kms_flip@2x-flip-vs-dpms@ab-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [2.87] s

  * igt@kms_flip@2x-flip-vs-dpms@ab-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [0.90] s

  * igt@kms_flip@2x-flip-vs-dpms@ac-dp6-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [2.85] s

  * igt@kms_flip@2x-flip-vs-dpms@ac-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [2.48] s

  * igt@kms_flip@2x-flip-vs-dpms@ac-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [0.76] s

  * igt@kms_flip@2x-flip-vs-dpms@ad-dp6-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [2.77] s

  * igt@kms_flip@2x-flip-vs-dpms@ad-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [2.48] s

  * igt@kms_flip@2x-flip-vs-dpms@ad-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [0.76] s

  * igt@kms_flip@2x-flip-vs-dpms@bc-dp6-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [2.69] s

  * igt@kms_flip@2x-flip-vs-dpms@bc-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [2.47] s

  * igt@kms_flip@2x-flip-vs-dpms@bc-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [1.03] s

  * igt@kms_flip@2x-flip-vs-dpms@bd-dp6-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [2.74] s

  * igt@kms_flip@2x-flip-vs-dpms@bd-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [2.46] s

  * igt@kms_flip@2x-flip-vs-dpms@bd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [1.04] s

  * igt@kms_flip@2x-flip-vs-dpms@cd-dp6-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [2.75] s

  * igt@kms_flip@2x-flip-vs-dpms@cd-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [2.33] s

  * igt@kms_flip@2x-flip-vs-dpms@cd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [1.03] s

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [6.21] s

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.42] s

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [6.23] s

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.40] s

  * igt@kms_flip@2x-flip-vs-expired-vblank@ad-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [6.25] s

  * igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.37] s

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [6.22] s

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.38] s

  * igt@kms_flip@2x-flip-vs-expired-vblank@bd-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [6.22] s

  * igt@kms_flip@2x-flip-vs-expired-vblank@bd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.38] s

  * igt@kms_flip@2x-flip-vs-expired-vblank@cd-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [6.22] s

  * igt@kms_flip@2x-flip-vs-expired-vblank@cd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.38] s

  * igt@kms_flip@2x-flip-vs-fences@ab-dp1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [5.55] s

  * igt@kms_flip@2x-flip-vs-fences@ab-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [6.25] s

  * igt@kms_flip@2x-flip-vs-fences@ab-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.44] s

  * igt@kms_flip@2x-flip-vs-fences@ac-dp1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [5.49] s

  * igt@kms_flip@2x-flip-vs-fences@ac-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [6.26] s

  * igt@kms_flip@2x-flip-vs-fences@ac-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.47] s

  * igt@kms_flip@2x-flip-vs-fences@ad-dp1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [5.44] s

  * igt@kms_flip@2x-flip-vs-fences@ad-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [6.33] s

  * igt@kms_flip@2x-flip-vs-fences@ad-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.38] s

  * igt@kms_flip@2x-flip-vs-fences@bc-dp1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [5.49] s

  * igt@kms_flip@2x-flip-vs-fences@bc-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [6.25] s

  * igt@kms_flip@2x-flip-vs-fences@bc-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.39] s

  * igt@kms_flip@2x-flip-vs-fences@bd-dp1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [5.45] s

  * igt@kms_flip@2x-flip-vs-fences@bd-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [6.20] s

  * igt@kms_flip@2x-flip-vs-fences@bd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.40] s

  * igt@kms_flip@2x-flip-vs-fences@cd-dp1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [5.42] s

  * igt@kms_flip@2x-flip-vs-fences@cd-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [6.24] s

  * igt@kms_flip@2x-flip-vs-fences@cd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.37] s

  * igt@kms_flip@2x-flip-vs-modeset@ab-dp6-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [3.32] s

  * igt@kms_flip@2x-flip-vs-modeset@ab-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [2.73] s

  * igt@kms_flip@2x-flip-vs-modeset@ab-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [0.96] s

  * igt@kms_flip@2x-flip-vs-modeset@ac-dp6-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [2.34] s

  * igt@kms_flip@2x-flip-vs-modeset@ac-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [2.37] s

  * igt@kms_flip@2x-flip-vs-modeset@ac-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [0.79] s

  * igt@kms_flip@2x-flip-vs-modeset@ad-dp6-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [2.35] s

  * igt@kms_flip@2x-flip-vs-modeset@ad-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [2.36] s

  * igt@kms_flip@2x-flip-vs-modeset@ad-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [0.78] s

  * igt@kms_flip@2x-flip-vs-modeset@bc-dp6-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [2.33] s

  * igt@kms_flip@2x-flip-vs-modeset@bc-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [2.48] s

  * igt@kms_flip@2x-flip-vs-modeset@bc-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [0.74] s

  * igt@kms_flip@2x-flip-vs-modeset@bd-dp6-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [2.36] s

  * igt@kms_flip@2x-flip-vs-modeset@bd-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [2.37] s

  * igt@kms_flip@2x-flip-vs-modeset@bd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [0.75] s

  * igt@kms_flip@2x-flip-vs-modeset@cd-dp6-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [2.30] s

  * igt@kms_flip@2x-flip-vs-modeset@cd-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [2.35] s

  * igt@kms_flip@2x-flip-vs-modeset@cd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [0.75] s

  * igt@kms_flip@2x-flip-vs-panning@ab-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [6.34] s

  * igt@kms_flip@2x-flip-vs-panning@ab-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.44] s

  * igt@kms_flip@2x-flip-vs-panning@ac-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [6.33] s

  * igt@kms_flip@2x-flip-vs-panning@ac-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.41] s

  * igt@kms_flip@2x-flip-vs-panning@ad-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [6.33] s

  * igt@kms_flip@2x-flip-vs-panning@ad-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.41] s

  * igt@kms_flip@2x-flip-vs-panning@bc-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [6.34] s

  * igt@kms_flip@2x-flip-vs-panning@bc-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.40] s

  * igt@kms_flip@2x-flip-vs-panning@bd-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [6.33] s

  * igt@kms_flip@2x-flip-vs-panning@bd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.37] s

  * igt@kms_flip@2x-flip-vs-panning@cd-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [6.34] s

  * igt@kms_flip@2x-flip-vs-panning@cd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.39] s

  * igt@kms_flip@2x-flip-vs-rmfb@ab-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [6.20] s

  * igt@kms_flip@2x-flip-vs-rmfb@ab-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.39] s

  * igt@kms_flip@2x-flip-vs-rmfb@ac-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [6.23] s

  * igt@kms_flip@2x-flip-vs-rmfb@ac-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.36] s

  * igt@kms_flip@2x-flip-vs-rmfb@ad-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [6.24] s

  * igt@kms_flip@2x-flip-vs-rmfb@ad-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.44] s

  * igt@kms_flip@2x-flip-vs-rmfb@bc-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [6.23] s

  * igt@kms_flip@2x-flip-vs-rmfb@bc-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.40] s

  * igt@kms_flip@2x-flip-vs-rmfb@bd-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [6.23] s

  * igt@kms_flip@2x-flip-vs-rmfb@bd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.44] s

  * igt@kms_flip@2x-flip-vs-rmfb@cd-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [6.23] s

  * igt@kms_flip@2x-flip-vs-rmfb@cd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.43] s

  * igt@kms_flip@2x-flip-vs-wf_vblank@ab-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.67] s

  * igt@kms_flip@2x-flip-vs-wf_vblank@ac-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.68] s

  * igt@kms_flip@2x-flip-vs-wf_vblank@ad-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.66] s

  * igt@kms_flip@2x-flip-vs-wf_vblank@bc-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.65] s

  * igt@kms_flip@2x-flip-vs-wf_vblank@bd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.65] s

  * igt@kms_flip@2x-flip-vs-wf_vblank@cd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.65] s

  * igt@kms_flip@2x-plain-flip-fb-recreate@ab-dp6-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [7.18] s

  * igt@kms_flip@2x-plain-flip-fb-recreate@ab-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [6.48] s

  * igt@kms_flip@2x-plain-flip-fb-recreate@ab-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.71] s

  * igt@kms_flip@2x-plain-flip-fb-recreate@ac-dp6-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [6.85] s

  * igt@kms_flip@2x-plain-flip-fb-recreate@ac-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [6.56] s

  * igt@kms_flip@2x-plain-flip-fb-recreate@ac-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.69] s

  * igt@kms_flip@2x-plain-flip-fb-recreate@ad-dp6-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [6.83] s

  * igt@kms_flip@2x-plain-flip-fb-recreate@ad-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [6.55] s

  * igt@kms_flip@2x-plain-flip-fb-recreate@ad-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.67] s

  * igt@kms_flip@2x-plain-flip-fb-recreate@bc-dp6-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [6.85] s

  * igt@kms_flip@2x-plain-flip-fb-recreate@bc-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [6.53] s

  * igt@kms_flip@2x-plain-flip-fb-recreate@bc-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.70] s

  * igt@kms_flip@2x-plain-flip-fb-recreate@bd-dp6-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [6.81] s

  * igt@kms_flip@2x-plain-flip-fb-recreate@bd-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [6.57] s

  * igt@kms_flip@2x-plain-flip-fb-recreate@bd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.64] s

  * igt@kms_flip@2x-plain-flip-fb-recreate@cd-dp6-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [6.74] s

  * igt@kms_flip@2x-plain-flip-fb-recreate@cd-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [6.52] s

  * igt@kms_flip@2x-plain-flip-fb-recreate@cd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.64] s

  * igt@kms_flip@2x-plain-flip-ts-check@ab-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [6.58] s

  * igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.71] s

  * igt@kms_flip@2x-plain-flip-ts-check@ac-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [6.58] s

  * igt@kms_flip@2x-plain-flip-ts-check@ac-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.67] s

  * igt@kms_flip@2x-plain-flip-ts-check@ad-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [6.53] s

  * igt@kms_flip@2x-plain-flip-ts-check@ad-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.71] s

  * igt@kms_flip@2x-plain-flip-ts-check@bc-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [6.55] s

  * igt@kms_flip@2x-plain-flip-ts-check@bc-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.66] s

  * igt@kms_flip@2x-plain-flip-ts-check@bd-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [6.55] s

  * igt@kms_flip@2x-plain-flip-ts-check@bd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.64] s

  * igt@kms_flip@2x-plain-flip-ts-check@cd-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [6.54] s

  * igt@kms_flip@2x-plain-flip-ts-check@cd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.71] s

  * igt@kms_flip@2x-plain-flip@ab-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [1.77] s

  * igt@kms_flip@2x-plain-flip@ab-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [0.91] s

  * igt@kms_flip@2x-plain-flip@ac-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [1.72] s

  * igt@kms_flip@2x-plain-flip@ac-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [0.88] s

  * igt@kms_flip@2x-plain-flip@ad-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [1.71] s

  * igt@kms_flip@2x-plain-flip@ad-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [0.89] s

  * igt@kms_flip@2x-plain-flip@bc-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [1.72] s

  * igt@kms_flip@2x-plain-flip@bc-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [0.86] s

  * igt@kms_flip@2x-plain-flip@bd-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [1.71] s

  * igt@kms_flip@2x-plain-flip@bd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [0.88] s

  * igt@kms_flip@2x-plain-flip@cd-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [1.68] s

  * igt@kms_flip@2x-plain-flip@cd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [0.90] s

  * igt@kms_flip@2x-wf_vblank-ts-check@ab-dp6-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [7.18] s

  * igt@kms_flip@2x-wf_vblank-ts-check@ab-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [6.67] s

  * igt@kms_flip@2x-wf_vblank-ts-check@ab-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.69] s

  * igt@kms_flip@2x-wf_vblank-ts-check@ac-dp6-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [6.84] s

  * igt@kms_flip@2x-wf_vblank-ts-check@ac-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [6.67] s

  * igt@kms_flip@2x-wf_vblank-ts-check@ac-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.67] s

  * igt@kms_flip@2x-wf_vblank-ts-check@ad-dp6-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [6.75] s

  * igt@kms_flip@2x-wf_vblank-ts-check@ad-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [6.48] s

  * igt@kms_flip@2x-wf_vblank-ts-check@ad-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.66] s

  * igt@kms_flip@2x-wf_vblank-ts-check@bc-dp6-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [6.84] s

  * igt@kms_flip@2x-wf_vblank-ts-check@bc-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [6.54] s

  * igt@kms_flip@2x-wf_vblank-ts-check@bc-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.66] s

  * igt@kms_flip@2x-wf_vblank-ts-check@bd-dp6-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [6.83] s

  * igt@kms_flip@2x-wf_vblank-ts-check@bd-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [6.72] s

  * igt@kms_flip@2x-wf_vblank-ts-check@bd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.66] s

  * igt@kms_flip@2x-wf_vblank-ts-check@cd-dp6-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [6.81] s

  * igt@kms_flip@2x-wf_vblank-ts-check@cd-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [6.47] s

  * igt@kms_flip@2x-wf_vblank-ts-check@cd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.67] s

  * igt@kms_flip@absolute-wf_vblank@d-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [3.00] s

  * igt@kms_flip@busy-flip@d-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [1.01] s

  * igt@kms_flip@flip-vs-dpms-on-nop@c-vga1:
    - Statuses : 2 pass(s)
    - Exec time: [1.12, 1.16] s

  * igt@kms_flip@flip-vs-dpms-on-nop@d-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [1.28] s

  * igt@kms_flip@flip-vs-fences-interruptible@a-dp1:
    - Statuses : 2 pass(s)
    - Exec time: [10.36, 10.79] s

  * igt@kms_flip@flip-vs-fences-interruptible@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.62] s

  * igt@kms_flip@flip-vs-fences-interruptible@b-dp1:
    - Statuses : 2 pass(s)
    - Exec time: [10.50, 10.88] s

  * igt@kms_flip@flip-vs-fences-interruptible@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.85] s

  * igt@kms_flip@flip-vs-fences-interruptible@c-dp1:
    - Statuses : 2 pass(s)
    - Exec time: [10.33, 10.53] s

  * igt@kms_flip@flip-vs-fences-interruptible@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.88] s

  * igt@kms_flip@flip-vs-fences@a-dp1:
    - Statuses : 1 dmesg-warn(s) 5 pass(s)
    - Exec time: [4.03, 10.69] s

  * igt@kms_flip@flip-vs-fences@a-edp1:
    - Statuses : 5 pass(s)
    - Exec time: [4.97, 11.84] s

  * igt@kms_flip@flip-vs-fences@b-dp1:
    - Statuses : 1 dmesg-warn(s) 5 pass(s)
    - Exec time: [4.04, 10.88] s

  * igt@kms_flip@flip-vs-fences@b-edp1:
    - Statuses : 5 pass(s)
    - Exec time: [5.01, 11.64] s

  * igt@kms_flip@flip-vs-fences@c-dp1:
    - Statuses : 1 dmesg-warn(s) 5 pass(s)
    - Exec time: [4.01, 10.88] s

  * igt@kms_flip@flip-vs-fences@c-edp1:
    - Statuses : 5 pass(s)
    - Exec time: [5.03, 11.85] s

  * igt@kms_flip@flip-vs-fences@d-edp1:
    - Statuses : 2 pass(s)
    - Exec time: [5.02, 8.72] s

  * igt@kms_flip@flip-vs-fences@d-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [4.01] s

  * igt@kms_flip@plain-flip-fb-recreate@a-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [3.30] s

  * igt@kms_flip@plain-flip-fb-recreate@b-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [3.30] s

  * igt@kms_flip@plain-flip-fb-recreate@c-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [3.29] s

  * igt@kms_flip@plain-flip-fb-recreate@d-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [3.29] s

  

Known issues
------------

  Here are the changes found in IGTPW_13298 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - fi-hsw-4770:        NOTRUN -> [SKIP][17] +31 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/fi-hsw-4770/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:
    - bat-arlh-2:         NOTRUN -> [SKIP][18] ([i915#11346] / [i915#9934]) +42 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-arlh-2/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - bat-arlh-3:         NOTRUN -> [SKIP][19] ([i915#9934]) +24 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-arlh-3/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - bat-dg1-7:          NOTRUN -> [SKIP][20] ([i915#9934]) +28 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-dg1-7/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - bat-dg2-9:          NOTRUN -> [SKIP][21] ([i915#9934]) +28 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-dg2-9/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - fi-rkl-11600:       NOTRUN -> [SKIP][22] ([i915#9934]) +30 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/fi-rkl-11600/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - fi-bsw-n3050:       NOTRUN -> [SKIP][23] +36 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/fi-bsw-n3050/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
    - bat-arls-5:         NOTRUN -> [SKIP][24] ([i915#9934])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-arls-5/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][25] ([i915#9934]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/fi-tgl-1115g4/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][26] ([i915#9934]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-mtlp-6/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
    - bat-arls-6:         NOTRUN -> [SKIP][27] ([i915#9934])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-arls-6/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][28] ([i915#9934])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-mtlp-8/igt@kms_flip@2x-flip-vs-dpms-on-nop.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - bat-dg2-11:         NOTRUN -> [SKIP][29] ([i915#9934]) +29 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-dg2-11/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-fences:
    - bat-mtlp-9:         NOTRUN -> [SKIP][30] ([i915#8381]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-mtlp-9/igt@kms_flip@2x-flip-vs-fences.html
    - bat-arls-6:         NOTRUN -> [SKIP][31] ([i915#8381]) +3 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-arls-6/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-flip-vs-fences-interruptible:
    - bat-dg1-7:          NOTRUN -> [SKIP][32] ([i915#8381]) +3 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-dg1-7/igt@kms_flip@2x-flip-vs-fences-interruptible.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][33] +89 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/fi-kbl-8809g/igt@kms_flip@2x-flip-vs-modeset.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][34] +31 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/fi-ivb-3770/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-panning:
    - bat-jsl-1:          NOTRUN -> [SKIP][35] ([i915#9934]) +29 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-jsl-1/igt@kms_flip@2x-flip-vs-panning.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][36] ([i915#3637] / [i915#9934]) +35 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/fi-tgl-1115g4/igt@kms_flip@2x-flip-vs-panning.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - fi-kbl-7567u:       NOTRUN -> [SKIP][37] +35 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/fi-kbl-7567u/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
    - bat-twl-1:          NOTRUN -> [SKIP][38] ([i915#9934]) +24 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-twl-1/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - fi-cfl-8700k:       NOTRUN -> [SKIP][39] +35 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/fi-cfl-8700k/igt@kms_flip@2x-flip-vs-suspend.html
    - bat-arls-5:         NOTRUN -> [SKIP][40] ([i915#3637] / [i915#9934]) +23 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-arls-5/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-flip-vs-wf_vblank:
    - fi-cfl-guc:         NOTRUN -> [SKIP][41] +24 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/fi-cfl-guc/igt@kms_flip@2x-flip-vs-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
    - bat-mtlp-6:         NOTRUN -> [SKIP][42] ([i915#3637] / [i915#9792] / [i915#9934]) +40 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-mtlp-6/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@2x-nonexisting-fb:
    - bat-dg1-6:          NOTRUN -> [SKIP][43] ([i915#12311] / [i915#9934]) +42 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-dg1-6/igt@kms_flip@2x-nonexisting-fb.html
    - bat-adlp-9:         NOTRUN -> [SKIP][44] ([i915#3637]) +24 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-adlp-9/igt@kms_flip@2x-nonexisting-fb.html
    - bat-twl-2:          NOTRUN -> [SKIP][45] ([i915#9934]) +25 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-twl-2/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - bat-apl-1:          NOTRUN -> [SKIP][46] +33 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-apl-1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - bat-rplp-1:         NOTRUN -> [SKIP][47] ([i915#3637]) +23 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-rplp-1/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - bat-mtlp-8:         NOTRUN -> [SKIP][48] ([i915#3637] / [i915#9934]) +22 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-mtlp-8/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - fi-kbl-guc:         NOTRUN -> [SKIP][49] +89 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/fi-kbl-guc/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - bat-arls-6:         NOTRUN -> [SKIP][50] ([i915#3637] / [i915#9934]) +27 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-arls-6/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-dp2:
    - fi-cfl-8109u:       [PASS][51] -> [DMESG-WARN][52] ([i915#13735] / [i915#13890]) +20 other tests dmesg-warn
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8412/fi-cfl-8109u/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp2.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/fi-cfl-8109u/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp2.html

  * igt@kms_flip@blocking-wf_vblank:
    - bat-rplp-1:         NOTRUN -> [FAIL][53] ([i915#13734]) +9 other tests fail
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-rplp-1/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@bo-too-big-interruptible:
    - bat-mtlp-6:         NOTRUN -> [SKIP][54] ([i915#3637] / [i915#9792]) +40 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-mtlp-6/igt@kms_flip@bo-too-big-interruptible.html

  * igt@kms_flip@dpms-off-confusion-interruptible:
    - bat-kbl-2:          NOTRUN -> [SKIP][55] +89 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-kbl-2/igt@kms_flip@dpms-off-confusion-interruptible.html

  * igt@kms_flip@dpms-vs-vblank-race:
    - bat-adlp-11:        NOTRUN -> [SKIP][56] ([i915#3637]) +85 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-adlp-11/igt@kms_flip@dpms-vs-vblank-race.html

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset:
    - bat-dg1-6:          NOTRUN -> [SKIP][57] ([i915#12311]) +42 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-dg1-6/igt@kms_flip@flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-dpms-on-nop-interruptible:
    - bat-mtlp-6:         NOTRUN -> [SKIP][58] ([i915#14110]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-mtlp-6/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - fi-kbl-x1275:       NOTRUN -> [SKIP][59] +89 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/fi-kbl-x1275/igt@kms_flip@flip-vs-expired-vblank.html
    - fi-bsw-n3050:       NOTRUN -> [FAIL][60] ([i915#13027]) +1 other test fail
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/fi-bsw-n3050/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-fences:
    - bat-dg2-9:          NOTRUN -> [SKIP][61] ([i915#8381]) +3 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-dg2-9/igt@kms_flip@flip-vs-fences.html
    - bat-dg2-11:         NOTRUN -> [SKIP][62] ([i915#8381]) +3 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-dg2-11/igt@kms_flip@flip-vs-fences.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][63] ([i915#8381]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-mtlp-8/igt@kms_flip@flip-vs-fences.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][64] ([i915#8381] / [i915#9792]) +3 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-mtlp-6/igt@kms_flip@flip-vs-fences.html
    - bat-dg2-14:         NOTRUN -> [SKIP][65] ([i915#8381]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-dg2-14/igt@kms_flip@flip-vs-fences.html
    - bat-arls-5:         NOTRUN -> [SKIP][66] ([i915#8381]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-arls-5/igt@kms_flip@flip-vs-fences.html

  * igt@kms_flip@flip-vs-fences-interruptible:
    - bat-dg1-6:          NOTRUN -> [SKIP][67] ([i915#12311] / [i915#8381]) +3 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-dg1-6/igt@kms_flip@flip-vs-fences-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - fi-cfl-guc:         NOTRUN -> [INCOMPLETE][68] ([i915#12745] / [i915#4839])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/fi-cfl-guc/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - fi-cfl-guc:         NOTRUN -> [INCOMPLETE][69] ([i915#12745])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/fi-cfl-guc/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-wf_vblank-interruptible:
    - bat-arlh-2:         NOTRUN -> [SKIP][70] ([i915#11346]) +46 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-arlh-2/igt@kms_flip@flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@nonblocking-read:
    - fi-cfl-8109u:       NOTRUN -> [DMESG-WARN][71] ([i915#13735])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/fi-cfl-8109u/igt@kms_flip@nonblocking-read.html

  * igt@kms_flip@wf_vblank-ts-check:
    - fi-rkl-11600:       NOTRUN -> [FAIL][72] ([i915#11832] / [i915#13734]) +1 other test fail
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/fi-rkl-11600/igt@kms_flip@wf_vblank-ts-check.html
    - bat-dg1-7:          NOTRUN -> [FAIL][73] ([i915#13734]) +3 other tests fail
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-dg1-7/igt@kms_flip@wf_vblank-ts-check.html
    - bat-dg2-14:         NOTRUN -> [FAIL][74] ([i915#13734]) +1 other test fail
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-dg2-14/igt@kms_flip@wf_vblank-ts-check.html
    - bat-mtlp-9:         NOTRUN -> [FAIL][75] ([i915#13734]) +1 other test fail
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-mtlp-9/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible:
    - bat-dg2-9:          NOTRUN -> [FAIL][76] ([i915#13734]) +2 other tests fail
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-dg2-9/igt@kms_flip@wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1:
    - fi-rkl-11600:       NOTRUN -> [FAIL][77] ([i915#13734]) +7 other tests fail
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/fi-rkl-11600/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1.html

  * igt@kms_flip@wf_vblank-ts-check@a-hdmi-a2:
    - bat-dg2-11:         NOTRUN -> [FAIL][78] ([i915#13734]) +2 other tests fail
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-dg2-11/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a2.html

  * igt@kms_flip@wf_vblank-ts-check@c-dp1:
    - fi-cfl-8109u:       NOTRUN -> [DMESG-WARN][79] ([i915#13735] / [i915#13890]) +145 other tests dmesg-warn
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/fi-cfl-8109u/igt@kms_flip@wf_vblank-ts-check@c-dp1.html

  
  [i915#11346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346
  [i915#11832]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11832
  [i915#12311]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#13027]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027
  [i915#13734]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13734
  [i915#13735]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735
  [i915#13890]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13890
  [i915#14110]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14110
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
  [i915#8381]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381
  [i915#9792]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8412 -> IGTPW_13298
  * Linux: CI_DRM_16706 -> CI_DRM_16707

  CI-20190529: 20190529
  CI_DRM_16706: dea7240e83c9e58ec755a3d68e7db10068df6b76 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_16707: 43ac07d088f280cfb9eeda0c4caf11b0b7b56e96 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_13298: 13298
  IGT_8412: 8412

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/index.html

--===============4377039499638722071==
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
<tr><td><b>Series:</b></td><td>tests/kms_flip: Improve frame timing checks for high refresh rates (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/148796/">https://patchwork.freedesktop.org/series/148796/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8412 -&gt; IGTPW_13298</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_13298 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_13298, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/index.html</p>
<h2>Participating hosts (40 -&gt; 37)</h2>
<p>Missing    (3): bat-dg2-8 fi-glk-j4005 fi-pnv-d510 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_13298:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank@ab-dp1-hdmi-a2:</p>
<ul>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-rpls-4/igt@kms_flip@2x-absolute-wf_vblank@ab-dp1-hdmi-a2.html">FAIL</a> +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-adlp-9/igt@kms_flip@2x-flip-vs-dpms-on-nop.html">SKIP</a></li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-rplp-1/igt@kms_flip@2x-flip-vs-dpms-on-nop.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-adlp-11/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences:</p>
<ul>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-arlh-3/igt@kms_flip@2x-flip-vs-fences.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank@a-dp1:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-adls-6/igt@kms_flip@absolute-wf_vblank@a-dp1.html">FAIL</a> +13 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1:</p>
<ul>
<li>bat-adls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8412/bat-adls-6/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-adls-6/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp1:</p>
<ul>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/fi-kbl-7567u/igt@kms_flip@flip-vs-suspend@c-dp1.html">DMESG-WARN</a> +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-jsl-1/igt@kms_flip@wf_vblank-ts-check.html">FAIL</a> +3 other tests fail</li>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-twl-2/igt@kms_flip@wf_vblank-ts-check.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/fi-hsw-4770/igt@kms_flip@wf_vblank-ts-check-interruptible.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1:</p>
<ul>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/fi-cfl-8700k/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@a-vga1:</p>
<ul>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/fi-ivb-3770/igt@kms_flip@wf_vblank-ts-check-interruptible@a-vga1.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-dp1:</p>
<ul>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/fi-kbl-7567u/igt@kms_flip@wf_vblank-ts-check@a-dp1.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@b-vga1:</p>
<ul>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/fi-elk-e7500/igt@kms_flip@wf_vblank-ts-check@b-vga1.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_8412 and IGTPW_13298:</p>
<h3>New IGT tests (274)</h3>
<ul>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank@ab-dp6-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank@ab-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank@ab-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank@ac-dp6-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank@ac-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank@ac-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank@ad-dp6-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank@ad-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank@ad-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank@bc-dp6-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank@bc-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank@bc-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank@bd-dp6-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank@bd-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank@bd-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank@cd-dp6-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank@cd-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank@cd-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank@ab-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank@ab-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank@ac-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank@ac-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank@ad-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank@ad-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank@bc-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank@bc-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank@bd-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank@bd-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank@cd-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank@cd-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank@ab-dp6-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank@ab-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank@ab-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank@ac-dp6-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank@ac-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank@ac-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank@ad-dp6-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank@ad-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank@ad-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank@bc-dp6-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank@bc-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank@bc-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank@bd-dp6-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank@bd-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank@bd-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank@cd-dp6-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank@cd-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank@cd-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-busy-flip@ab-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-busy-flip@ab-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-busy-flip@ac-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-busy-flip@ac-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-busy-flip@ad-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-busy-flip@ad-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-busy-flip@bc-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-busy-flip@bc-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-busy-flip@bd-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-busy-flip@bd-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-busy-flip@cd-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-busy-flip@cd-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ac-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ad-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank@bc-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank@bd-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank@cd-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ac-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ad-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank@bc-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank@bd-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank@cd-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop@ab-dp1-hdmi-a2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop@ab-dp6-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop@ab-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop@ab-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop@ac-dp1-hdmi-a2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop@ac-dp6-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop@ac-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop@ac-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop@ad-dp1-hdmi-a2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop@ad-dp6-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop@ad-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop@ad-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop@bc-dp1-hdmi-a2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop@bc-dp6-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop@bc-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop@bc-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop@bd-dp1-hdmi-a2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop@bd-dp6-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop@bd-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop@bd-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop@cd-dp1-hdmi-a2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop@cd-dp6-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop@cd-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop@cd-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms@ab-dp6-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms@ab-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms@ab-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms@ac-dp6-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms@ac-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms@ac-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms@ad-dp6-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms@ad-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms@ad-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms@bc-dp6-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms@bc-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms@bc-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms@bd-dp6-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms@bd-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms@bd-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms@cd-dp6-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms@cd-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms@cd-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ad-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bd-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bd-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@cd-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@cd-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences@ab-dp1-hdmi-a2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences@ab-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences@ab-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences@ac-dp1-hdmi-a2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences@ac-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences@ac-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences@ad-dp1-hdmi-a2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences@ad-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences@ad-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences@bc-dp1-hdmi-a2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences@bc-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences@bc-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences@bd-dp1-hdmi-a2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences@bd-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences@bd-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences@cd-dp1-hdmi-a2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences@cd-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences@cd-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset@ab-dp6-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset@ab-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset@ab-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset@ac-dp6-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset@ac-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset@ac-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset@ad-dp6-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset@ad-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset@ad-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset@bc-dp6-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset@bc-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset@bc-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset@bd-dp6-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset@bd-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset@bd-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset@cd-dp6-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset@cd-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset@cd-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning@ab-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning@ab-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning@ac-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning@ac-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning@ad-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning@ad-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning@bc-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning@bc-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning@bd-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning@bd-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning@cd-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning@cd-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb@ab-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb@ab-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb@ac-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb@ac-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb@ad-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb@ad-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb@bc-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb@bc-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb@bd-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb@bd-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb@cd-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb@cd-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank@ab-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank@ac-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank@ad-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank@bc-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank@bd-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank@cd-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate@ab-dp6-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate@ab-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate@ab-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate@ac-dp6-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate@ac-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate@ac-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate@ad-dp6-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate@ad-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate@ad-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate@bc-dp6-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate@bc-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate@bc-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate@bd-dp6-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate@bd-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate@bd-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate@cd-dp6-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate@cd-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate@cd-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check@ab-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check@ac-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check@ac-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check@ad-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check@ad-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check@bc-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check@bc-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check@bd-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check@bd-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check@cd-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check@cd-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip@ab-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip@ab-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip@ac-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip@ac-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip@ad-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip@ad-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip@bc-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip@bc-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip@bd-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip@bd-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip@cd-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip@cd-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check@ab-dp6-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check@ab-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check@ab-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check@ac-dp6-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check@ac-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check@ac-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check@ad-dp6-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check@ad-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check@ad-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check@bc-dp6-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check@bc-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check@bc-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check@bd-dp6-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check@bd-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check@bd-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check@cd-dp6-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check@cd-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check@cd-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank@d-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@busy-flip@d-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop@c-vga1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.12, 1.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop@d-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences-interruptible@a-dp1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [10.36, 10.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences-interruptible@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences-interruptible@b-dp1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [10.50, 10.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences-interruptible@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences-interruptible@c-dp1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [10.33, 10.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences-interruptible@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences@a-dp1:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 5 pass(s)</li>
<li>Exec time: [4.03, 10.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences@a-edp1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [4.97, 11.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences@b-dp1:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 5 pass(s)</li>
<li>Exec time: [4.04, 10.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences@b-edp1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [5.01, 11.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences@c-dp1:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 5 pass(s)</li>
<li>Exec time: [4.01, 10.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences@c-edp1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [5.03, 11.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences@d-edp1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [5.02, 8.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences@d-hdmi-a2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@a-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@b-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@c-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@d-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.29] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_13298 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/fi-hsw-4770/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html">SKIP</a> +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:</p>
<ul>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-arlh-2/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +42 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-arlh-3/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-dg1-7/igt@kms_flip@2x-dpms-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-dg2-9/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/fi-rkl-11600/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/fi-bsw-n3050/igt@kms_flip@2x-flip-vs-dpms-on-nop.html">SKIP</a> +36 other tests skip</li>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-arls-5/igt@kms_flip@2x-flip-vs-dpms-on-nop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/fi-tgl-1115g4/igt@kms_flip@2x-flip-vs-dpms-on-nop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-mtlp-6/igt@kms_flip@2x-flip-vs-dpms-on-nop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
<li>bat-arls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-arls-6/igt@kms_flip@2x-flip-vs-dpms-on-nop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-mtlp-8/igt@kms_flip@2x-flip-vs-dpms-on-nop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-dg2-11/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences:</p>
<ul>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-mtlp-9/igt@kms_flip@2x-flip-vs-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381">i915#8381</a>) +1 other test skip</li>
<li>bat-arls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-arls-6/igt@kms_flip@2x-flip-vs-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381">i915#8381</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences-interruptible:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-dg1-7/igt@kms_flip@2x-flip-vs-fences-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381">i915#8381</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/fi-kbl-8809g/igt@kms_flip@2x-flip-vs-modeset.html">SKIP</a> +89 other tests skip</li>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/fi-ivb-3770/igt@kms_flip@2x-flip-vs-modeset.html">SKIP</a> +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-jsl-1/igt@kms_flip@2x-flip-vs-panning.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +29 other tests skip</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/fi-tgl-1115g4/igt@kms_flip@2x-flip-vs-panning.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/fi-kbl-7567u/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a> +35 other tests skip</li>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-twl-1/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/fi-cfl-8700k/igt@kms_flip@2x-flip-vs-suspend.html">SKIP</a> +35 other tests skip</li>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-arls-5/igt@kms_flip@2x-flip-vs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank:</p>
<ul>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/fi-cfl-guc/igt@kms_flip@2x-flip-vs-wf_vblank.html">SKIP</a> +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-mtlp-6/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792">i915#9792</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +40 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-dg1-6/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +42 other tests skip</li>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-adlp-9/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>) +24 other tests skip</li>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-twl-2/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>bat-apl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-apl-1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-rplp-1/igt@kms_flip@2x-plain-flip-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-mtlp-8/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/fi-kbl-guc/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> +89 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>bat-arls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-arls-6/igt@kms_flip@2x-wf_vblank-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-dp2:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8412/fi-cfl-8109u/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/fi-cfl-8109u/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13890">i915#13890</a>) +20 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-rplp-1/igt@kms_flip@blocking-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13734">i915#13734</a>) +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big-interruptible:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-mtlp-6/igt@kms_flip@bo-too-big-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792">i915#9792</a>) +40 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion-interruptible:</p>
<ul>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-kbl-2/igt@kms_flip@dpms-off-confusion-interruptible.html">SKIP</a> +89 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race:</p>
<ul>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-adlp-11/igt@kms_flip@dpms-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>) +85 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-dg1-6/igt@kms_flip@flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a>) +42 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-mtlp-6/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14110">i915#14110</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/fi-kbl-x1275/igt@kms_flip@flip-vs-expired-vblank.html">SKIP</a> +89 other tests skip</li>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/fi-bsw-n3050/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027">i915#13027</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-dg2-9/igt@kms_flip@flip-vs-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381">i915#8381</a>) +3 other tests skip</li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-dg2-11/igt@kms_flip@flip-vs-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381">i915#8381</a>) +3 other tests skip</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-mtlp-8/igt@kms_flip@flip-vs-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381">i915#8381</a>) +1 other test skip</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-mtlp-6/igt@kms_flip@flip-vs-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381">i915#8381</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792">i915#9792</a>) +3 other tests skip</li>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-dg2-14/igt@kms_flip@flip-vs-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381">i915#8381</a>) +1 other test skip</li>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-arls-5/igt@kms_flip@flip-vs-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381">i915#8381</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences-interruptible:</p>
<ul>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-dg1-6/igt@kms_flip@flip-vs-fences-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381">i915#8381</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/fi-cfl-guc/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a1:</p>
<ul>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/fi-cfl-guc/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-arlh-2/igt@kms_flip@flip-vs-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>) +46 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@nonblocking-read:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/fi-cfl-8109u/igt@kms_flip@nonblocking-read.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/fi-rkl-11600/igt@kms_flip@wf_vblank-ts-check.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11832">i915#11832</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13734">i915#13734</a>) +1 other test fail</li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-dg1-7/igt@kms_flip@wf_vblank-ts-check.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13734">i915#13734</a>) +3 other tests fail</li>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-dg2-14/igt@kms_flip@wf_vblank-ts-check.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13734">i915#13734</a>) +1 other test fail</li>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-mtlp-9/igt@kms_flip@wf_vblank-ts-check.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13734">i915#13734</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-dg2-9/igt@kms_flip@wf_vblank-ts-check-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13734">i915#13734</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/fi-rkl-11600/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13734">i915#13734</a>) +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-hdmi-a2:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/bat-dg2-11/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13734">i915#13734</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@c-dp1:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13298/fi-cfl-8109u/igt@kms_flip@wf_vblank-ts-check@c-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13890">i915#13890</a>) +145 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8412 -&gt; IGTPW_13298</li>
<li>Linux: CI_DRM_16706 -&gt; CI_DRM_16707</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_16706: dea7240e83c9e58ec755a3d68e7db10068df6b76 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_16707: 43ac07d088f280cfb9eeda0c4caf11b0b7b56e96 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_13298: 13298<br />
  IGT_8412: 8412</p>

</body>
</html>

--===============4377039499638722071==--
