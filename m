Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D86DDC3ABBC
	for <igt-dev@archiver.kernel.org>; Fri,  9 May 2025 13:11:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6616010E25F;
	Fri,  9 May 2025 13:11:20 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41D5810E25F;
 Fri,  9 May 2025 13:11:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6486203022264534308=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_tests/kms=5Fflip=3A_Impro?=
 =?utf-8?q?ve_frame_timing_checks_for_high_refresh_rates_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 09 May 2025 13:11:19 -0000
Message-ID: <174679627925.63972.66502222952644542@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250509075232.1610123-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20250509075232.1610123-1-ramanaidu.naladala@intel.com>
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

--===============6486203022264534308==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_flip: Improve frame timing checks for high refresh rates (rev2)
URL   : https://patchwork.freedesktop.org/series/148796/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8359 -> IGTPW_13104
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_13104 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_13104, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/index.html

Participating hosts (45 -> 42)
------------------------------

  Missing    (3): fi-glk-j4005 bat-arlh-2 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_13104:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@2x-blocking-wf_vblank:
    - bat-rpls-4:         NOTRUN -> [FAIL][1] +9 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-rpls-4/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - bat-adlp-9:         NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-adlp-9/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
    - bat-rplp-1:         NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-rplp-1/igt@kms_flip@2x-flip-vs-dpms-on-nop.html

  * igt@kms_flip@2x-flip-vs-fences:
    - bat-arlh-3:         NOTRUN -> [SKIP][4] +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-arlh-3/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@flip-vs-dpms-on-nop-interruptible:
    - bat-adlp-11:        NOTRUN -> [SKIP][5] +3 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-adlp-11/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - fi-skl-6600u:       NOTRUN -> [ABORT][6] +1 other test abort
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/fi-skl-6600u/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - fi-kbl-7567u:       NOTRUN -> [DMESG-WARN][7] +3 other tests dmesg-warn
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/fi-kbl-7567u/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_flip@wf_vblank-ts-check:
    - bat-arls-5:         NOTRUN -> [FAIL][8] +1 other test fail
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-arls-5/igt@kms_flip@wf_vblank-ts-check.html
    - fi-cfl-8109u:       NOTRUN -> [FAIL][9] +1 other test fail
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/fi-cfl-8109u/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible:
    - fi-cfl-guc:         NOTRUN -> [FAIL][10] +4 other tests fail
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/fi-cfl-guc/igt@kms_flip@wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-vga1:
    - fi-pnv-d510:        NOTRUN -> [FAIL][11] +1 other test fail
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/fi-pnv-d510/igt@kms_flip@wf_vblank-ts-check-interruptible@a-vga1.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@c-hdmi-a1:
    - fi-cfl-8700k:       NOTRUN -> [FAIL][12] +1 other test fail
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/fi-cfl-8700k/igt@kms_flip@wf_vblank-ts-check-interruptible@c-hdmi-a1.html

  * igt@kms_flip@wf_vblank-ts-check@a-dp1:
    - bat-adls-6:         NOTRUN -> [FAIL][13] +11 other tests fail
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-adls-6/igt@kms_flip@wf_vblank-ts-check@a-dp1.html
    - fi-kbl-7567u:       NOTRUN -> [FAIL][14] +5 other tests fail
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/fi-kbl-7567u/igt@kms_flip@wf_vblank-ts-check@a-dp1.html

  * igt@kms_flip@wf_vblank-ts-check@a-edp1:
    - fi-skl-6600u:       NOTRUN -> [FAIL][15] +4 other tests fail
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/fi-skl-6600u/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
    - bat-twl-2:          NOTRUN -> [FAIL][16] +1 other test fail
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-twl-2/igt@kms_flip@wf_vblank-ts-check@a-edp1.html

  * igt@kms_flip@wf_vblank-ts-check@b-hdmi-a2:
    - bat-arls-6:         NOTRUN -> [FAIL][17] +1 other test fail
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-arls-6/igt@kms_flip@wf_vblank-ts-check@b-hdmi-a2.html

  * igt@kms_flip@wf_vblank-ts-check@b-vga1:
    - fi-ivb-3770:        NOTRUN -> [FAIL][18] +2 other tests fail
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/fi-ivb-3770/igt@kms_flip@wf_vblank-ts-check@b-vga1.html
    - fi-elk-e7500:       NOTRUN -> [FAIL][19] +1 other test fail
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/fi-elk-e7500/igt@kms_flip@wf_vblank-ts-check@b-vga1.html

  * igt@kms_flip@wf_vblank-ts-check@c-edp1:
    - bat-rplp-1:         NOTRUN -> [FAIL][20] +9 other tests fail
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-rplp-1/igt@kms_flip@wf_vblank-ts-check@c-edp1.html

  
New tests
---------

  New tests have been introduced between IGT_8359 and IGTPW_13104:

### New IGT tests (141) ###

  * igt@kms_flip@2x-absolute-wf_vblank@ab-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.56] s

  * igt@kms_flip@2x-absolute-wf_vblank@ac-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.54] s

  * igt@kms_flip@2x-absolute-wf_vblank@ad-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.57] s

  * igt@kms_flip@2x-absolute-wf_vblank@bc-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.55] s

  * igt@kms_flip@2x-absolute-wf_vblank@bd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.56] s

  * igt@kms_flip@2x-absolute-wf_vblank@cd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.53] s

  * igt@kms_flip@2x-blocking-absolute-wf_vblank@ab-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.56] s

  * igt@kms_flip@2x-blocking-absolute-wf_vblank@ac-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.54] s

  * igt@kms_flip@2x-blocking-absolute-wf_vblank@ad-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.54] s

  * igt@kms_flip@2x-blocking-absolute-wf_vblank@bc-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.52] s

  * igt@kms_flip@2x-blocking-absolute-wf_vblank@bd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.54] s

  * igt@kms_flip@2x-blocking-absolute-wf_vblank@cd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.54] s

  * igt@kms_flip@2x-blocking-wf_vblank@ab-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.84] s

  * igt@kms_flip@2x-blocking-wf_vblank@ac-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.83] s

  * igt@kms_flip@2x-blocking-wf_vblank@ad-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.85] s

  * igt@kms_flip@2x-blocking-wf_vblank@bc-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.65] s

  * igt@kms_flip@2x-blocking-wf_vblank@bd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.66] s

  * igt@kms_flip@2x-blocking-wf_vblank@cd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.64] s

  * igt@kms_flip@2x-busy-flip@ab-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [0.93] s

  * igt@kms_flip@2x-busy-flip@ac-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [0.91] s

  * igt@kms_flip@2x-busy-flip@ad-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [0.91] s

  * igt@kms_flip@2x-busy-flip@bc-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [0.90] s

  * igt@kms_flip@2x-busy-flip@bd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [0.89] s

  * igt@kms_flip@2x-busy-flip@cd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [0.91] s

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.68] s

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ac-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.66] s

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ad-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.66] s

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank@bc-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.68] s

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank@bd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.64] s

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank@cd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.66] s

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.67] s

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ac-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.68] s

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ad-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.68] s

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@bc-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.64] s

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@bd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.64] s

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@cd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.67] s

  * igt@kms_flip@2x-flip-vs-dpms-on-nop@ab-dp1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [1.25] s

  * igt@kms_flip@2x-flip-vs-dpms-on-nop@ab-dp6-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [2.85] s

  * igt@kms_flip@2x-flip-vs-dpms-on-nop@ab-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [2.04] s

  * igt@kms_flip@2x-flip-vs-dpms-on-nop@ab-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [2.37] s

  * igt@kms_flip@2x-flip-vs-dpms-on-nop@ac-dp1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [1.22] s

  * igt@kms_flip@2x-flip-vs-dpms-on-nop@ac-dp6-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [2.55] s

  * igt@kms_flip@2x-flip-vs-dpms-on-nop@ac-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [2.02] s

  * igt@kms_flip@2x-flip-vs-dpms-on-nop@ac-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [1.20] s

  * igt@kms_flip@2x-flip-vs-dpms-on-nop@ad-dp1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [1.22] s

  * igt@kms_flip@2x-flip-vs-dpms-on-nop@ad-dp6-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [2.52] s

  * igt@kms_flip@2x-flip-vs-dpms-on-nop@ad-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [2.04] s

  * igt@kms_flip@2x-flip-vs-dpms-on-nop@ad-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [1.18] s

  * igt@kms_flip@2x-flip-vs-dpms-on-nop@bc-dp1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [1.19] s

  * igt@kms_flip@2x-flip-vs-dpms-on-nop@bc-dp6-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [2.61] s

  * igt@kms_flip@2x-flip-vs-dpms-on-nop@bc-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [2.04] s

  * igt@kms_flip@2x-flip-vs-dpms-on-nop@bc-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [1.22] s

  * igt@kms_flip@2x-flip-vs-dpms-on-nop@bd-dp1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [1.20] s

  * igt@kms_flip@2x-flip-vs-dpms-on-nop@bd-dp6-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [2.55] s

  * igt@kms_flip@2x-flip-vs-dpms-on-nop@bd-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [2.04] s

  * igt@kms_flip@2x-flip-vs-dpms-on-nop@bd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [1.18] s

  * igt@kms_flip@2x-flip-vs-dpms-on-nop@cd-dp1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [1.20] s

  * igt@kms_flip@2x-flip-vs-dpms-on-nop@cd-dp6-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [2.51] s

  * igt@kms_flip@2x-flip-vs-dpms-on-nop@cd-edp1-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [1.99] s

  * igt@kms_flip@2x-flip-vs-dpms-on-nop@cd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [1.15] s

  * igt@kms_flip@2x-flip-vs-dpms@ab-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [0.92] s

  * igt@kms_flip@2x-flip-vs-dpms@ac-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [0.75] s

  * igt@kms_flip@2x-flip-vs-dpms@ad-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [0.76] s

  * igt@kms_flip@2x-flip-vs-dpms@bc-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [0.74] s

  * igt@kms_flip@2x-flip-vs-dpms@bd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [1.04] s

  * igt@kms_flip@2x-flip-vs-dpms@cd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [1.04] s

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.38] s

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.40] s

  * igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.40] s

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.35] s

  * igt@kms_flip@2x-flip-vs-expired-vblank@bd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.40] s

  * igt@kms_flip@2x-flip-vs-expired-vblank@cd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.38] s

  * igt@kms_flip@2x-flip-vs-fences@ab-dp1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [5.51] s

  * igt@kms_flip@2x-flip-vs-fences@ab-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.45] s

  * igt@kms_flip@2x-flip-vs-fences@ac-dp1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [5.47] s

  * igt@kms_flip@2x-flip-vs-fences@ac-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.41] s

  * igt@kms_flip@2x-flip-vs-fences@ad-dp1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [5.49] s

  * igt@kms_flip@2x-flip-vs-fences@ad-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.40] s

  * igt@kms_flip@2x-flip-vs-fences@bc-dp1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [5.47] s

  * igt@kms_flip@2x-flip-vs-fences@bc-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.41] s

  * igt@kms_flip@2x-flip-vs-fences@bd-dp1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [5.45] s

  * igt@kms_flip@2x-flip-vs-fences@bd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.43] s

  * igt@kms_flip@2x-flip-vs-fences@cd-dp1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [5.44] s

  * igt@kms_flip@2x-flip-vs-fences@cd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.38] s

  * igt@kms_flip@2x-flip-vs-modeset@ab-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [0.95] s

  * igt@kms_flip@2x-flip-vs-modeset@ac-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [0.80] s

  * igt@kms_flip@2x-flip-vs-modeset@ad-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [0.78] s

  * igt@kms_flip@2x-flip-vs-modeset@bc-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [0.76] s

  * igt@kms_flip@2x-flip-vs-modeset@bd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [0.77] s

  * igt@kms_flip@2x-flip-vs-modeset@cd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [0.72] s

  * igt@kms_flip@2x-flip-vs-panning@ab-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.43] s

  * igt@kms_flip@2x-flip-vs-panning@ac-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.41] s

  * igt@kms_flip@2x-flip-vs-panning@ad-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.41] s

  * igt@kms_flip@2x-flip-vs-panning@bc-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.38] s

  * igt@kms_flip@2x-flip-vs-panning@bd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.40] s

  * igt@kms_flip@2x-flip-vs-panning@cd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.42] s

  * igt@kms_flip@2x-flip-vs-rmfb@ab-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.41] s

  * igt@kms_flip@2x-flip-vs-rmfb@ac-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.38] s

  * igt@kms_flip@2x-flip-vs-rmfb@ad-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.43] s

  * igt@kms_flip@2x-flip-vs-rmfb@bc-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.38] s

  * igt@kms_flip@2x-flip-vs-rmfb@bd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.36] s

  * igt@kms_flip@2x-flip-vs-rmfb@cd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.44] s

  * igt@kms_flip@2x-flip-vs-wf_vblank@ab-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.70] s

  * igt@kms_flip@2x-flip-vs-wf_vblank@ac-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.70] s

  * igt@kms_flip@2x-flip-vs-wf_vblank@ad-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.68] s

  * igt@kms_flip@2x-flip-vs-wf_vblank@bc-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.65] s

  * igt@kms_flip@2x-flip-vs-wf_vblank@bd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.65] s

  * igt@kms_flip@2x-flip-vs-wf_vblank@cd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.64] s

  * igt@kms_flip@2x-plain-flip-fb-recreate@ab-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.67] s

  * igt@kms_flip@2x-plain-flip-fb-recreate@ac-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.70] s

  * igt@kms_flip@2x-plain-flip-fb-recreate@ad-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.71] s

  * igt@kms_flip@2x-plain-flip-fb-recreate@bc-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.68] s

  * igt@kms_flip@2x-plain-flip-fb-recreate@bd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.66] s

  * igt@kms_flip@2x-plain-flip-fb-recreate@cd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.68] s

  * igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.68] s

  * igt@kms_flip@2x-plain-flip-ts-check@ac-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.67] s

  * igt@kms_flip@2x-plain-flip-ts-check@ad-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.70] s

  * igt@kms_flip@2x-plain-flip-ts-check@bc-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.66] s

  * igt@kms_flip@2x-plain-flip-ts-check@bd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.66] s

  * igt@kms_flip@2x-plain-flip-ts-check@cd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.66] s

  * igt@kms_flip@2x-plain-flip@ab-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [0.92] s

  * igt@kms_flip@2x-plain-flip@ac-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [0.91] s

  * igt@kms_flip@2x-plain-flip@ad-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [0.88] s

  * igt@kms_flip@2x-plain-flip@bc-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [0.88] s

  * igt@kms_flip@2x-plain-flip@bd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [0.89] s

  * igt@kms_flip@2x-plain-flip@cd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [0.89] s

  * igt@kms_flip@2x-wf_vblank-ts-check@ab-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.67] s

  * igt@kms_flip@2x-wf_vblank-ts-check@ac-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.68] s

  * igt@kms_flip@2x-wf_vblank-ts-check@ad-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.66] s

  * igt@kms_flip@2x-wf_vblank-ts-check@bc-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.66] s

  * igt@kms_flip@2x-wf_vblank-ts-check@bd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.68] s

  * igt@kms_flip@2x-wf_vblank-ts-check@cd-hdmi-a1-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.66] s

  * igt@kms_flip@absolute-wf_vblank@d-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [3.06] s

  * igt@kms_flip@busy-flip@d-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [1.05] s

  * igt@kms_flip@flip-vs-dpms-on-nop@c-vga1:
    - Statuses : 2 pass(s)
    - Exec time: [1.13, 1.15] s

  * igt@kms_flip@flip-vs-dpms-on-nop@d-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_flip@flip-vs-fences@d-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [4.01] s

  * igt@kms_flip@plain-flip-fb-recreate@a-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [3.37] s

  * igt@kms_flip@plain-flip-fb-recreate@b-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [3.35] s

  * igt@kms_flip@plain-flip-fb-recreate@c-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [3.34] s

  * igt@kms_flip@plain-flip-fb-recreate@d-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [3.35] s

  

Known issues
------------

  Here are the changes found in IGTPW_13104 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_module_load@load:
    - bat-twl-1:          [PASS][21] -> [DMESG-WARN][22] ([i915#13736])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8359/bat-twl-1/igt@i915_module_load@load.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-twl-1/igt@i915_module_load@load.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - fi-kbl-x1275:       NOTRUN -> [SKIP][23] +89 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/fi-kbl-x1275/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - fi-ilk-650:         NOTRUN -> [SKIP][24] +35 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/fi-ilk-650/igt@kms_flip@2x-blocking-absolute-wf_vblank.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][25] ([i915#3637] / [i915#9934]) +34 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/fi-tgl-1115g4/igt@kms_flip@2x-blocking-absolute-wf_vblank.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][26] +27 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/fi-blb-e6850/igt@kms_flip@2x-blocking-absolute-wf_vblank.html
    - fi-skl-6600u:       NOTRUN -> [SKIP][27] +24 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/fi-skl-6600u/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - bat-arlh-3:         NOTRUN -> [SKIP][28] ([i915#9934]) +24 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-arlh-3/igt@kms_flip@2x-blocking-wf_vblank.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][29] +38 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/fi-pnv-d510/igt@kms_flip@2x-blocking-wf_vblank.html
    - bat-dg1-7:          NOTRUN -> [SKIP][30] ([i915#9934]) +28 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-dg1-7/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-busy-flip:
    - bat-dg2-8:          NOTRUN -> [SKIP][31] ([i915#9934]) +23 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-dg2-8/igt@kms_flip@2x-busy-flip.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - bat-twl-2:          NOTRUN -> [SKIP][32] ([i915#9934]) +24 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-twl-2/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - bat-dg2-9:          NOTRUN -> [SKIP][33] ([i915#9934]) +28 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-dg2-9/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - fi-rkl-11600:       NOTRUN -> [SKIP][34] ([i915#9934]) +29 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/fi-rkl-11600/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - fi-bsw-n3050:       NOTRUN -> [SKIP][35] +36 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/fi-bsw-n3050/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
    - bat-arls-5:         NOTRUN -> [SKIP][36] ([i915#9934])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-arls-5/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][37] ([i915#9934]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/fi-tgl-1115g4/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][38] ([i915#9934]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-mtlp-6/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][39] ([i915#9934])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-mtlp-8/igt@kms_flip@2x-flip-vs-dpms-on-nop.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - bat-arls-6:         NOTRUN -> [SKIP][40] ([i915#9934]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-arls-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - bat-dg2-11:         NOTRUN -> [SKIP][41] ([i915#9934]) +29 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-dg2-11/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-fences:
    - bat-mtlp-9:         NOTRUN -> [SKIP][42] ([i915#8381]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-mtlp-9/igt@kms_flip@2x-flip-vs-fences.html
    - bat-arls-6:         NOTRUN -> [SKIP][43] ([i915#8381]) +3 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-arls-6/igt@kms_flip@2x-flip-vs-fences.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][44] ([i915#8381]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-mtlp-8/igt@kms_flip@2x-flip-vs-fences.html
    - bat-dg2-8:          NOTRUN -> [SKIP][45] ([i915#8381]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-dg2-8/igt@kms_flip@2x-flip-vs-fences.html
    - bat-dg1-7:          NOTRUN -> [SKIP][46] ([i915#8381]) +3 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-dg1-7/igt@kms_flip@2x-flip-vs-fences.html
    - bat-arls-5:         NOTRUN -> [SKIP][47] ([i915#8381]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-arls-5/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-flip-vs-fences-interruptible:
    - bat-dg2-11:         NOTRUN -> [SKIP][48] ([i915#8381]) +3 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-dg2-11/igt@kms_flip@2x-flip-vs-fences-interruptible.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][49] +89 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/fi-kbl-8809g/igt@kms_flip@2x-flip-vs-modeset.html
    - bat-rplp-1:         NOTRUN -> [SKIP][50] ([i915#3637]) +23 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-rplp-1/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - fi-kbl-7567u:       NOTRUN -> [SKIP][51] +34 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/fi-kbl-7567u/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
    - bat-twl-1:          NOTRUN -> [SKIP][52] ([i915#9934]) +24 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-twl-1/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
    - bat-apl-1:          NOTRUN -> [SKIP][53] +34 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-apl-1/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
    - bat-arls-5:         NOTRUN -> [SKIP][54] ([i915#3637] / [i915#9934]) +24 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-arls-5/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - fi-cfl-8700k:       NOTRUN -> [SKIP][55] +35 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/fi-cfl-8700k/igt@kms_flip@2x-flip-vs-suspend.html
    - bat-kbl-2:          NOTRUN -> [SKIP][56] +89 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-kbl-2/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-flip-vs-wf_vblank:
    - bat-atsm-1:         NOTRUN -> [SKIP][57] ([i915#6078]) +90 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-atsm-1/igt@kms_flip@2x-flip-vs-wf_vblank.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][58] +25 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/fi-hsw-4770/igt@kms_flip@2x-flip-vs-wf_vblank.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][59] ([i915#3637] / [i915#9934]) +22 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-mtlp-8/igt@kms_flip@2x-flip-vs-wf_vblank.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - fi-cfl-guc:         NOTRUN -> [SKIP][60] +31 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/fi-cfl-guc/igt@kms_flip@2x-modeset-vs-vblank-race.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][61] ([i915#3637] / [i915#9792] / [i915#9934]) +40 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-mtlp-6/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-nonexisting-fb:
    - bat-adlp-9:         NOTRUN -> [SKIP][62] ([i915#3637]) +24 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-adlp-9/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - fi-ivb-3770:        NOTRUN -> [SKIP][63] +32 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/fi-ivb-3770/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][64] +35 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/fi-bsw-nick/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - bat-dg1-6:          NOTRUN -> [SKIP][65] ([i915#12311] / [i915#9934]) +42 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-dg1-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - fi-kbl-guc:         NOTRUN -> [SKIP][66] +89 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/fi-kbl-guc/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - bat-arls-6:         NOTRUN -> [SKIP][67] ([i915#3637] / [i915#9934]) +33 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-arls-6/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@bo-too-big:
    - bat-arls-6:         NOTRUN -> [SKIP][68] ([i915#3637]) +3 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-arls-6/igt@kms_flip@bo-too-big.html

  * igt@kms_flip@bo-too-big-interruptible:
    - bat-mtlp-6:         NOTRUN -> [SKIP][69] ([i915#3637] / [i915#9792]) +40 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-mtlp-6/igt@kms_flip@bo-too-big-interruptible.html

  * igt@kms_flip@dpms-off-confusion:
    - bat-dg1-6:          NOTRUN -> [SKIP][70] ([i915#12311]) +42 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-dg1-6/igt@kms_flip@dpms-off-confusion.html

  * igt@kms_flip@dpms-vs-vblank-race:
    - bat-adlp-11:        NOTRUN -> [SKIP][71] ([i915#3637]) +85 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-adlp-11/igt@kms_flip@dpms-vs-vblank-race.html

  * igt@kms_flip@flip-vs-dpms-on-nop-interruptible:
    - bat-mtlp-6:         NOTRUN -> [SKIP][72] ([i915#14110]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-mtlp-6/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - fi-pnv-d510:        NOTRUN -> [FAIL][73] ([i915#13027]) +1 other test fail
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/fi-pnv-d510/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-fences:
    - bat-dg2-9:          NOTRUN -> [SKIP][74] ([i915#8381]) +3 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-dg2-9/igt@kms_flip@flip-vs-fences.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][75] ([i915#8381] / [i915#9792]) +3 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-mtlp-6/igt@kms_flip@flip-vs-fences.html
    - bat-dg2-14:         NOTRUN -> [SKIP][76] ([i915#8381]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-dg2-14/igt@kms_flip@flip-vs-fences.html

  * igt@kms_flip@flip-vs-fences-interruptible:
    - bat-dg1-6:          NOTRUN -> [SKIP][77] ([i915#12311] / [i915#8381]) +3 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-dg1-6/igt@kms_flip@flip-vs-fences-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - fi-blb-e6850:       NOTRUN -> [INCOMPLETE][78] ([i915#4839]) +1 other test incomplete
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/fi-blb-e6850/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@b-dp1:
    - bat-dg2-8:          NOTRUN -> [INCOMPLETE][79] ([i915#6113]) +1 other test incomplete
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-dg2-8/igt@kms_flip@flip-vs-suspend@b-dp1.html

  * igt@kms_flip@wf_vblank-ts-check:
    - bat-mtlp-8:         NOTRUN -> [FAIL][80] ([i915#13734]) +1 other test fail
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-mtlp-8/igt@kms_flip@wf_vblank-ts-check.html
    - fi-rkl-11600:       NOTRUN -> [FAIL][81] ([i915#11832] / [i915#13734])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/fi-rkl-11600/igt@kms_flip@wf_vblank-ts-check.html
    - bat-dg1-7:          NOTRUN -> [FAIL][82] ([i915#13734]) +1 other test fail
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-dg1-7/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible:
    - fi-tgl-1115g4:      NOTRUN -> [FAIL][83] ([i915#13734]) +4 other tests fail
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/fi-tgl-1115g4/igt@kms_flip@wf_vblank-ts-check-interruptible.html
    - bat-dg2-9:          NOTRUN -> [FAIL][84] ([i915#13734]) +1 other test fail
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-dg2-9/igt@kms_flip@wf_vblank-ts-check-interruptible.html
    - fi-cfl-8700k:       NOTRUN -> [FAIL][85] ([Intel XE#3098] / [i915#10826])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/fi-cfl-8700k/igt@kms_flip@wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1:
    - fi-cfl-8700k:       NOTRUN -> [FAIL][86] ([i915#10826])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/fi-cfl-8700k/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1.html

  * igt@kms_flip@wf_vblank-ts-check@b-dp1:
    - bat-dg2-8:          NOTRUN -> [FAIL][87] ([i915#13734]) +2 other tests fail
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-dg2-8/igt@kms_flip@wf_vblank-ts-check@b-dp1.html

  * igt@kms_flip@wf_vblank-ts-check@b-edp1:
    - bat-mtlp-9:         NOTRUN -> [FAIL][88] ([i915#13734]) +1 other test fail
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-mtlp-9/igt@kms_flip@wf_vblank-ts-check@b-edp1.html

  * igt@kms_flip@wf_vblank-ts-check@c-edp1:
    - bat-arlh-3:         NOTRUN -> [FAIL][89] ([i915#13734]) +2 other tests fail
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-arlh-3/igt@kms_flip@wf_vblank-ts-check@c-edp1.html

  * igt@kms_flip@wf_vblank-ts-check@c-hdmi-a1:
    - fi-rkl-11600:       NOTRUN -> [FAIL][90] ([i915#13734]) +1 other test fail
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/fi-rkl-11600/igt@kms_flip@wf_vblank-ts-check@c-hdmi-a1.html

  
#### Possible fixes ####

  * igt@i915_module_load@load:
    - bat-mtlp-9:         [DMESG-WARN][91] ([i915#13494]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8359/bat-mtlp-9/igt@i915_module_load@load.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-mtlp-9/igt@i915_module_load@load.html

  * igt@kms_flip@basic-plain-flip@b-dp1:
    - fi-cfl-8109u:       [DMESG-WARN][93] ([i915#13735] / [i915#13890]) -> [PASS][94] +20 other tests pass
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8359/fi-cfl-8109u/igt@kms_flip@basic-plain-flip@b-dp1.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/fi-cfl-8109u/igt@kms_flip@basic-plain-flip@b-dp1.html

  
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [i915#10826]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10826
  [i915#11832]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11832
  [i915#12311]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311
  [i915#13027]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027
  [i915#13494]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13494
  [i915#13734]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13734
  [i915#13735]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735
  [i915#13736]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13736
  [i915#13890]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13890
  [i915#14110]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14110
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
  [i915#6078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078
  [i915#6113]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113
  [i915#8381]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381
  [i915#9792]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8359 -> IGTPW_13104
  * Linux: CI_DRM_16516 -> CI_DRM_16525

  CI-20190529: 20190529
  CI_DRM_16516: 2862c51f227a36e59ee4a9bb90b690c9855a6246 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_16525: b0db97d4270c697ade930cfefdb7aaef12cd80c9 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_13104: 0073c7f82d663abce9d62eb21e32529af12ed4e6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8359: 807f0cbcc771d1d0bb0d27a78231a5f92dc02126 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/index.html

--===============6486203022264534308==
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
<tr><td><b>Series:</b></td><td>tests/kms_flip: Improve frame timing checks for high refresh rates (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/148796/">https://patchwork.freedesktop.org/series/148796/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8359 -&gt; IGTPW_13104</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_13104 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_13104, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/index.html</p>
<h2>Participating hosts (45 -&gt; 42)</h2>
<p>Missing    (3): fi-glk-j4005 bat-arlh-2 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_13104:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-rpls-4/igt@kms_flip@2x-blocking-wf_vblank.html">FAIL</a> +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-adlp-9/igt@kms_flip@2x-flip-vs-dpms-on-nop.html">SKIP</a></li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-rplp-1/igt@kms_flip@2x-flip-vs-dpms-on-nop.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences:</p>
<ul>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-arlh-3/igt@kms_flip@2x-flip-vs-fences.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-adlp-11/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/fi-skl-6600u/igt@kms_flip@flip-vs-suspend.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp1:</p>
<ul>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/fi-kbl-7567u/igt@kms_flip@flip-vs-suspend@c-dp1.html">DMESG-WARN</a> +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check:</p>
<ul>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-arls-5/igt@kms_flip@wf_vblank-ts-check.html">FAIL</a> +1 other test fail</li>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/fi-cfl-8109u/igt@kms_flip@wf_vblank-ts-check.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible:</p>
<ul>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/fi-cfl-guc/igt@kms_flip@wf_vblank-ts-check-interruptible.html">FAIL</a> +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@a-vga1:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/fi-pnv-d510/igt@kms_flip@wf_vblank-ts-check-interruptible@a-vga1.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@c-hdmi-a1:</p>
<ul>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/fi-cfl-8700k/igt@kms_flip@wf_vblank-ts-check-interruptible@c-hdmi-a1.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-dp1:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-adls-6/igt@kms_flip@wf_vblank-ts-check@a-dp1.html">FAIL</a> +11 other tests fail</li>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/fi-kbl-7567u/igt@kms_flip@wf_vblank-ts-check@a-dp1.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-edp1:</p>
<ul>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/fi-skl-6600u/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">FAIL</a> +4 other tests fail</li>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-twl-2/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@b-hdmi-a2:</p>
<ul>
<li>bat-arls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-arls-6/igt@kms_flip@wf_vblank-ts-check@b-hdmi-a2.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@b-vga1:</p>
<ul>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/fi-ivb-3770/igt@kms_flip@wf_vblank-ts-check@b-vga1.html">FAIL</a> +2 other tests fail</li>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/fi-elk-e7500/igt@kms_flip@wf_vblank-ts-check@b-vga1.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@c-edp1:</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-rplp-1/igt@kms_flip@wf_vblank-ts-check@c-edp1.html">FAIL</a> +9 other tests fail</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_8359 and IGTPW_13104:</p>
<h3>New IGT tests (141)</h3>
<ul>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank@ab-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.56] s</li>
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
<p>igt@kms_flip@2x-absolute-wf_vblank@ad-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank@bc-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank@bd-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank@cd-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank@ab-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank@ac-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.54] s</li>
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
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank@bc-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank@bd-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank@cd-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank@ab-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank@ac-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank@ad-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank@bc-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank@bd-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank@cd-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-busy-flip@ab-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.93] s</li>
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
<p>igt@kms_flip@2x-busy-flip@ad-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-busy-flip@bc-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-busy-flip@bd-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-busy-flip@cd-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ac-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.66] s</li>
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
<li>Exec time: [5.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank@bd-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.64] s</li>
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
<li>Exec time: [5.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ac-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ad-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank@bc-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.64] s</li>
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
<li>Exec time: [5.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop@ab-dp1-hdmi-a2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop@ab-dp6-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop@ab-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop@ab-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.37] s</li>
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
<li>Exec time: [2.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop@ac-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.02] s</li>
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
<li>Exec time: [1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop@ad-dp6-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop@ad-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop@ad-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop@bc-dp1-hdmi-a2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop@bc-dp6-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.61] s</li>
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
<li>Exec time: [1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop@bd-dp1-hdmi-a2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop@bd-dp6-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop@bd-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop@bd-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop@cd-dp1-hdmi-a2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop@cd-dp6-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop@cd-edp1-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop@cd-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms@ab-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms@ac-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.75] s</li>
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
<p>igt@kms_flip@2x-flip-vs-dpms@bc-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.74] s</li>
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
<p>igt@kms_flip@2x-flip-vs-dpms@cd-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.38] s</li>
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
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bd-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.40] s</li>
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
<li>Exec time: [5.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences@ab-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences@ac-dp1-hdmi-a2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences@ac-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences@ad-dp1-hdmi-a2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences@ad-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences@bc-dp1-hdmi-a2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences@bc-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.41] s</li>
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
<p>igt@kms_flip@2x-flip-vs-fences@bd-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences@cd-dp1-hdmi-a2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences@cd-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset@ab-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset@ac-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.80] s</li>
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
<p>igt@kms_flip@2x-flip-vs-modeset@bc-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset@bd-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset@cd-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning@ab-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.43] s</li>
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
<p>igt@kms_flip@2x-flip-vs-panning@ad-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning@bc-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning@bd-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning@cd-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb@ab-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb@ac-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb@ad-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb@bc-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb@bd-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb@cd-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank@ab-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank@ac-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank@ad-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.68] s</li>
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
<li>Exec time: [5.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate@ab-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate@ac-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate@ad-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate@bc-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate@bd-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate@cd-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.68] s</li>
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
<p>igt@kms_flip@2x-plain-flip-ts-check@ad-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.70] s</li>
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
<p>igt@kms_flip@2x-plain-flip-ts-check@bd-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check@cd-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip@ab-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip@ac-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip@ad-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip@bc-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip@bd-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip@cd-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check@ab-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check@ac-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.68] s</li>
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
<p>igt@kms_flip@2x-wf_vblank-ts-check@bc-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check@bd-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check@cd-hdmi-a1-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank@d-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@busy-flip@d-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop@c-vga1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.13, 1.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop@d-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
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
<li>Exec time: [3.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@b-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@c-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@d-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.35] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_13104 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>bat-twl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8359/bat-twl-1/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-twl-1/igt@i915_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13736">i915#13736</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
<ul>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/fi-kbl-x1275/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html">SKIP</a> +89 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/fi-ilk-650/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">SKIP</a> +35 other tests skip</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/fi-tgl-1115g4/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +34 other tests skip</li>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/fi-blb-e6850/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">SKIP</a> +27 other tests skip</li>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/fi-skl-6600u/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">SKIP</a> +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-arlh-3/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +24 other tests skip</li>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/fi-pnv-d510/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> +38 other tests skip</li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-dg1-7/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-busy-flip:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-dg2-8/igt@kms_flip@2x-busy-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-twl-2/igt@kms_flip@2x-dpms-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-dg2-9/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/fi-rkl-11600/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/fi-bsw-n3050/igt@kms_flip@2x-flip-vs-dpms-on-nop.html">SKIP</a> +36 other tests skip</li>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-arls-5/igt@kms_flip@2x-flip-vs-dpms-on-nop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/fi-tgl-1115g4/igt@kms_flip@2x-flip-vs-dpms-on-nop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-mtlp-6/igt@kms_flip@2x-flip-vs-dpms-on-nop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-mtlp-8/igt@kms_flip@2x-flip-vs-dpms-on-nop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>bat-arls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-arls-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-dg2-11/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences:</p>
<ul>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-mtlp-9/igt@kms_flip@2x-flip-vs-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381">i915#8381</a>) +1 other test skip</li>
<li>bat-arls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-arls-6/igt@kms_flip@2x-flip-vs-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381">i915#8381</a>) +3 other tests skip</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-mtlp-8/igt@kms_flip@2x-flip-vs-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381">i915#8381</a>) +1 other test skip</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-dg2-8/igt@kms_flip@2x-flip-vs-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381">i915#8381</a>) +1 other test skip</li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-dg1-7/igt@kms_flip@2x-flip-vs-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381">i915#8381</a>) +3 other tests skip</li>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-arls-5/igt@kms_flip@2x-flip-vs-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381">i915#8381</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences-interruptible:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-dg2-11/igt@kms_flip@2x-flip-vs-fences-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381">i915#8381</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/fi-kbl-8809g/igt@kms_flip@2x-flip-vs-modeset.html">SKIP</a> +89 other tests skip</li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-rplp-1/igt@kms_flip@2x-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/fi-kbl-7567u/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a> +34 other tests skip</li>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-twl-1/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +24 other tests skip</li>
<li>bat-apl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-apl-1/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a> +34 other tests skip</li>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-arls-5/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/fi-cfl-8700k/igt@kms_flip@2x-flip-vs-suspend.html">SKIP</a> +35 other tests skip</li>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-kbl-2/igt@kms_flip@2x-flip-vs-suspend.html">SKIP</a> +89 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-atsm-1/igt@kms_flip@2x-flip-vs-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078">i915#6078</a>) +90 other tests skip</li>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/fi-hsw-4770/igt@kms_flip@2x-flip-vs-wf_vblank.html">SKIP</a> +25 other tests skip</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-mtlp-8/igt@kms_flip@2x-flip-vs-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/fi-cfl-guc/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a> +31 other tests skip</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-mtlp-6/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792">i915#9792</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +40 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-adlp-9/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/fi-ivb-3770/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> +32 other tests skip</li>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/fi-bsw-nick/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-dg1-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +42 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/fi-kbl-guc/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> +89 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>bat-arls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-arls-6/igt@kms_flip@2x-wf_vblank-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big:</p>
<ul>
<li>bat-arls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-arls-6/igt@kms_flip@bo-too-big.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big-interruptible:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-mtlp-6/igt@kms_flip@bo-too-big-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792">i915#9792</a>) +40 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion:</p>
<ul>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-dg1-6/igt@kms_flip@dpms-off-confusion.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a>) +42 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race:</p>
<ul>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-adlp-11/igt@kms_flip@dpms-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>) +85 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-mtlp-6/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14110">i915#14110</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/fi-pnv-d510/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027">i915#13027</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-dg2-9/igt@kms_flip@flip-vs-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381">i915#8381</a>) +3 other tests skip</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-mtlp-6/igt@kms_flip@flip-vs-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381">i915#8381</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792">i915#9792</a>) +3 other tests skip</li>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-dg2-14/igt@kms_flip@flip-vs-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381">i915#8381</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences-interruptible:</p>
<ul>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-dg1-6/igt@kms_flip@flip-vs-fences-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381">i915#8381</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/fi-blb-e6850/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-dp1:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-dg2-8/igt@kms_flip@flip-vs-suspend@b-dp1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113">i915#6113</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-mtlp-8/igt@kms_flip@wf_vblank-ts-check.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13734">i915#13734</a>) +1 other test fail</li>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/fi-rkl-11600/igt@kms_flip@wf_vblank-ts-check.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11832">i915#11832</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13734">i915#13734</a>)</li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-dg1-7/igt@kms_flip@wf_vblank-ts-check.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13734">i915#13734</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/fi-tgl-1115g4/igt@kms_flip@wf_vblank-ts-check-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13734">i915#13734</a>) +4 other tests fail</li>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-dg2-9/igt@kms_flip@wf_vblank-ts-check-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13734">i915#13734</a>) +1 other test fail</li>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/fi-cfl-8700k/igt@kms_flip@wf_vblank-ts-check-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10826">i915#10826</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1:</p>
<ul>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/fi-cfl-8700k/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10826">i915#10826</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@b-dp1:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-dg2-8/igt@kms_flip@wf_vblank-ts-check@b-dp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13734">i915#13734</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@b-edp1:</p>
<ul>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-mtlp-9/igt@kms_flip@wf_vblank-ts-check@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13734">i915#13734</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@c-edp1:</p>
<ul>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-arlh-3/igt@kms_flip@wf_vblank-ts-check@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13734">i915#13734</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@c-hdmi-a1:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/fi-rkl-11600/igt@kms_flip@wf_vblank-ts-check@c-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13734">i915#13734</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8359/bat-mtlp-9/igt@i915_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13494">i915#13494</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/bat-mtlp-9/igt@i915_module_load@load.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@b-dp1:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8359/fi-cfl-8109u/igt@kms_flip@basic-plain-flip@b-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13890">i915#13890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13104/fi-cfl-8109u/igt@kms_flip@basic-plain-flip@b-dp1.html">PASS</a> +20 other tests pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8359 -&gt; IGTPW_13104</li>
<li>Linux: CI_DRM_16516 -&gt; CI_DRM_16525</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_16516: 2862c51f227a36e59ee4a9bb90b690c9855a6246 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_16525: b0db97d4270c697ade930cfefdb7aaef12cd80c9 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_13104: 0073c7f82d663abce9d62eb21e32529af12ed4e6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8359: 807f0cbcc771d1d0bb0d27a78231a5f92dc02126 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============6486203022264534308==--
