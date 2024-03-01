Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2FCCC5478C
	for <igt-dev@archiver.kernel.org>; Fri,  1 Mar 2024 09:37:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7454510EC49;
	Fri,  1 Mar 2024 09:37:51 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8722910EC4A;
 Fri,  1 Mar 2024 09:37:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1811779313963320400=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_revamp_big_joiner_test_=28r?=
 =?utf-8?q?ev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 01 Mar 2024 09:37:50 -0000
Message-ID: <170928587054.434930.14458125778814090491@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240301082602.199510-1-kunal1.joshi@intel.com>
In-Reply-To: <20240301082602.199510-1-kunal1.joshi@intel.com>
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

--===============1811779313963320400==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: revamp big joiner test (rev2)
URL   : https://patchwork.freedesktop.org/series/130572/
State : failure

== Summary ==

CI Bug Log - changes from IGT_7739 -> IGTPW_10761
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_10761 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_10761, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/index.html

Participating hosts (41 -> 40)
------------------------------

  Additional (1): bat-atsm-1 
  Missing    (2): fi-snb-2520m fi-bsw-n3050 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10761:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_fence@basic-await@bcs0:
    - bat-dg2-9:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7739/bat-dg2-9/igt@gem_exec_fence@basic-await@bcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-dg2-9/igt@gem_exec_fence@basic-await@bcs0.html

  * igt@kms_big_joiner@basic:
    - bat-dg1-7:          NOTRUN -> [SKIP][3] +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-dg1-7/igt@kms_big_joiner@basic.html
    - bat-adlp-9:         NOTRUN -> [SKIP][4] +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-adlp-9/igt@kms_big_joiner@basic.html
    - bat-rplp-1:         NOTRUN -> [SKIP][5] +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-rplp-1/igt@kms_big_joiner@basic.html
    - bat-dg2-9:          NOTRUN -> [SKIP][6] +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-dg2-9/igt@kms_big_joiner@basic.html
    - bat-arls-2:         NOTRUN -> [SKIP][7] +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-arls-2/igt@kms_big_joiner@basic.html
    - bat-adln-1:         NOTRUN -> [SKIP][8] +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-adln-1/igt@kms_big_joiner@basic.html
    - bat-adlp-6:         NOTRUN -> [SKIP][9] +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-adlp-6/igt@kms_big_joiner@basic.html
    - bat-dg2-11:         NOTRUN -> [SKIP][10] +3 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-dg2-11/igt@kms_big_joiner@basic.html
    - bat-dg2-14:         NOTRUN -> [SKIP][11] +3 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-dg2-14/igt@kms_big_joiner@basic.html

  * {igt@kms_big_joiner@force-joiner-basic@1x-joiner} (NEW):
    - bat-dg2-9:          NOTRUN -> [FAIL][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-dg2-9/igt@kms_big_joiner@force-joiner-basic@1x-joiner.html
    - bat-arls-2:         NOTRUN -> [FAIL][13]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-arls-2/igt@kms_big_joiner@force-joiner-basic@1x-joiner.html
    - {bat-arls-4}:       NOTRUN -> [FAIL][14]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-arls-4/igt@kms_big_joiner@force-joiner-basic@1x-joiner.html
    - bat-adlp-6:         NOTRUN -> [FAIL][15]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-adlp-6/igt@kms_big_joiner@force-joiner-basic@1x-joiner.html
    - {bat-rpls-3}:       NOTRUN -> [FAIL][16]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-rpls-3/igt@kms_big_joiner@force-joiner-basic@1x-joiner.html
    - bat-dg2-8:          NOTRUN -> [FAIL][17]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-dg2-8/igt@kms_big_joiner@force-joiner-basic@1x-joiner.html
    - bat-arls-3:         NOTRUN -> [FAIL][18]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-arls-3/igt@kms_big_joiner@force-joiner-basic@1x-joiner.html
    - bat-mtlp-8:         NOTRUN -> [FAIL][19]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-mtlp-8/igt@kms_big_joiner@force-joiner-basic@1x-joiner.html
    - {bat-adls-6}:       NOTRUN -> [FAIL][20]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-adls-6/igt@kms_big_joiner@force-joiner-basic@1x-joiner.html
    - bat-adlp-9:         NOTRUN -> [FAIL][21]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-adlp-9/igt@kms_big_joiner@force-joiner-basic@1x-joiner.html
    - bat-adln-1:         NOTRUN -> [DMESG-FAIL][22]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-adln-1/igt@kms_big_joiner@force-joiner-basic@1x-joiner.html
    - bat-rplp-1:         NOTRUN -> [FAIL][23]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-rplp-1/igt@kms_big_joiner@force-joiner-basic@1x-joiner.html

  * {igt@kms_big_joiner@force-joiner-invalid-modeset} (NEW):
    - fi-rkl-11600:       NOTRUN -> [SKIP][24] +3 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/fi-rkl-11600/igt@kms_big_joiner@force-joiner-invalid-modeset.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][25] +3 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/fi-tgl-1115g4/igt@kms_big_joiner@force-joiner-invalid-modeset.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][26] +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-mtlp-6/igt@kms_big_joiner@force-joiner-invalid-modeset.html
    - {bat-rpls-3}:       NOTRUN -> [SKIP][27]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-rpls-3/igt@kms_big_joiner@force-joiner-invalid-modeset.html
    - {bat-adls-6}:       NOTRUN -> [SKIP][28]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-adls-6/igt@kms_big_joiner@force-joiner-invalid-modeset.html

  * {igt@kms_big_joiner@force-joiner-invalid-modeset@big_joiner_on_last_pipe} (NEW):
    - bat-jsl-3:          NOTRUN -> [FAIL][29] +1 other test fail
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-jsl-3/igt@kms_big_joiner@force-joiner-invalid-modeset@big_joiner_on_last_pipe.html
    - bat-jsl-1:          NOTRUN -> [FAIL][30] +1 other test fail
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-jsl-1/igt@kms_big_joiner@force-joiner-invalid-modeset@big_joiner_on_last_pipe.html

  * igt@kms_big_joiner@invalid-modeset:
    - bat-jsl-3:          NOTRUN -> [SKIP][31] +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-jsl-3/igt@kms_big_joiner@invalid-modeset.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][32] +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-mtlp-8/igt@kms_big_joiner@invalid-modeset.html
    - bat-dg2-8:          NOTRUN -> [SKIP][33] +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-dg2-8/igt@kms_big_joiner@invalid-modeset.html
    - bat-adlm-1:         NOTRUN -> [SKIP][34] +3 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-adlm-1/igt@kms_big_joiner@invalid-modeset.html
    - bat-jsl-1:          NOTRUN -> [SKIP][35] +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-jsl-1/igt@kms_big_joiner@invalid-modeset.html
    - bat-arls-1:         NOTRUN -> [SKIP][36] +3 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-arls-1/igt@kms_big_joiner@invalid-modeset.html
    - bat-arls-3:         NOTRUN -> [SKIP][37] +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-arls-3/igt@kms_big_joiner@invalid-modeset.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_big_joiner@basic:
    - {bat-arls-4}:       NOTRUN -> [SKIP][38] +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-arls-4/igt@kms_big_joiner@basic.html

  * igt@kms_big_joiner@invalid-modeset:
    - {bat-adls-6}:       NOTRUN -> [SKIP][39] +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-adls-6/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_busy@basic:
    - {bat-rpls-3}:       NOTRUN -> [SKIP][40] +2 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-rpls-3/igt@kms_busy@basic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - {bat-rpls-3}:       [SKIP][41] ([i915#4103]) -> [SKIP][42] +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7739/bat-rpls-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-rpls-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
    - {bat-rpls-3}:       [PASS][43] -> [SKIP][44] +5 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7739/bat-rpls-3/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-rpls-3/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - {bat-rpls-3}:       [SKIP][45] ([i915#3555] / [i915#3840] / [i915#9886]) -> [SKIP][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7739/bat-rpls-3/igt@kms_dsc@dsc-basic.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-rpls-3/igt@kms_dsc@dsc-basic.html

  
New tests
---------

  New tests have been introduced between IGT_7739 and IGTPW_10761:

### New IGT tests (4) ###

  * igt@kms_big_joiner@force-joiner-basic:
    - Statuses : 25 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_big_joiner@force-joiner-basic@1x-joiner:
    - Statuses : 1 dmesg-fail(s) 13 fail(s)
    - Exec time: [0.50, 3.08] s

  * igt@kms_big_joiner@force-joiner-invalid-modeset:
    - Statuses : 27 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_joiner@force-joiner-invalid-modeset@big_joiner_on_last_pipe:
    - Statuses : 2 fail(s) 10 pass(s)
    - Exec time: [0.20, 1.38] s

  

Known issues
------------

  Here are the changes found in IGTPW_10761 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - fi-kbl-7567u:       [PASS][47] -> [DMESG-WARN][48] ([i915#1982])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7739/fi-kbl-7567u/igt@core_hotunplug@unbind-rebind.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/fi-kbl-7567u/igt@core_hotunplug@unbind-rebind.html

  * igt@gem_mmap@basic:
    - bat-atsm-1:         NOTRUN -> [SKIP][49] ([i915#4083])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-atsm-1/igt@gem_mmap@basic.html

  * igt@gem_render_tiled_blits@basic:
    - bat-atsm-1:         NOTRUN -> [SKIP][50] ([i915#4079]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-atsm-1/igt@gem_render_tiled_blits@basic.html

  * igt@gem_tiled_fence_blits@basic:
    - bat-atsm-1:         NOTRUN -> [SKIP][51] ([i915#4077]) +2 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-atsm-1/igt@gem_tiled_fence_blits@basic.html

  * igt@i915_pm_rps@basic-api:
    - bat-atsm-1:         NOTRUN -> [SKIP][52] ([i915#6621])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-atsm-1/igt@i915_pm_rps@basic-api.html

  * igt@i915_selftest@live@execlists:
    - fi-bsw-nick:        [PASS][53] -> [ABORT][54] ([i915#7911])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7739/fi-bsw-nick/igt@i915_selftest@live@execlists.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/fi-bsw-nick/igt@i915_selftest@live@execlists.html

  * igt@kms_addfb_basic@size-max:
    - bat-atsm-1:         NOTRUN -> [SKIP][55] ([i915#6077]) +37 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-atsm-1/igt@kms_addfb_basic@size-max.html

  * igt@kms_big_joiner@basic:
    - fi-pnv-d510:        NOTRUN -> [SKIP][56] ([fdo#109271]) +3 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/fi-pnv-d510/igt@kms_big_joiner@basic.html
    - fi-glk-j4005:       NOTRUN -> [SKIP][57] ([fdo#109271]) +3 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/fi-glk-j4005/igt@kms_big_joiner@basic.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][58] ([fdo#109271]) +3 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/fi-kbl-7567u/igt@kms_big_joiner@basic.html
    - fi-cfl-guc:         NOTRUN -> [SKIP][59] ([fdo#109271]) +3 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/fi-cfl-guc/igt@kms_big_joiner@basic.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][60] ([fdo#109271]) +3 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/fi-kbl-x1275/igt@kms_big_joiner@basic.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][61] ([fdo#109271]) +3 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/fi-cfl-8109u/igt@kms_big_joiner@basic.html
    - fi-ilk-650:         NOTRUN -> [SKIP][62] ([fdo#109271]) +3 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/fi-ilk-650/igt@kms_big_joiner@basic.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][63] ([fdo#109271]) +3 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/fi-blb-e6850/igt@kms_big_joiner@basic.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][64] ([i915#9792]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-mtlp-6/igt@kms_big_joiner@basic.html
    - fi-skl-6600u:       NOTRUN -> [SKIP][65] ([fdo#109271]) +3 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/fi-skl-6600u/igt@kms_big_joiner@basic.html
    - fi-apl-guc:         NOTRUN -> [SKIP][66] ([fdo#109271]) +3 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/fi-apl-guc/igt@kms_big_joiner@basic.html
    - fi-skl-guc:         NOTRUN -> [SKIP][67] ([fdo#109271]) +3 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/fi-skl-guc/igt@kms_big_joiner@basic.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][68] ([fdo#109271]) +3 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/fi-cfl-8700k/igt@kms_big_joiner@basic.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][69] ([fdo#109271]) +3 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/fi-bsw-nick/igt@kms_big_joiner@basic.html

  * igt@kms_big_joiner@invalid-modeset:
    - fi-ivb-3770:        NOTRUN -> [SKIP][70] ([fdo#109271]) +3 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/fi-ivb-3770/igt@kms_big_joiner@invalid-modeset.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][71] ([fdo#109271]) +3 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/fi-elk-e7500/igt@kms_big_joiner@invalid-modeset.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][72] ([fdo#109271]) +3 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/fi-kbl-guc/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - bat-atsm-1:         NOTRUN -> [SKIP][73] ([i915#6078]) +25 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-atsm-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-atsm-1:         NOTRUN -> [SKIP][74] ([i915#6093]) +4 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-atsm-1/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
    - bat-atsm-1:         NOTRUN -> [SKIP][75] ([i915#1836]) +6 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-atsm-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html

  * igt@kms_prop_blob@basic:
    - bat-atsm-1:         NOTRUN -> [SKIP][76] ([i915#7357])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-atsm-1/igt@kms_prop_blob@basic.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-atsm-1:         NOTRUN -> [SKIP][77] ([i915#6094])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-atsm-1/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-flip:
    - bat-atsm-1:         NOTRUN -> [SKIP][78] ([fdo#109295] / [i915#6078])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-atsm-1/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-gtt:
    - bat-atsm-1:         NOTRUN -> [SKIP][79] ([fdo#109295] / [i915#4077]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-atsm-1/igt@prime_vgem@basic-gtt.html

  * igt@prime_vgem@basic-write:
    - bat-atsm-1:         NOTRUN -> [SKIP][80] ([fdo#109295]) +2 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-atsm-1/igt@prime_vgem@basic-write.html

  * igt@vgem_basic@unload:
    - fi-kbl-7567u:       [PASS][81] -> [DMESG-WARN][82] ([i915#9970])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7739/fi-kbl-7567u/igt@vgem_basic@unload.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/fi-kbl-7567u/igt@vgem_basic@unload.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@hangcheck:
    - fi-skl-guc:         [DMESG-FAIL][83] ([i915#10112]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7739/fi-skl-guc/igt@i915_selftest@live@hangcheck.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/fi-skl-guc/igt@i915_selftest@live@hangcheck.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [i915#10112]: https://gitlab.freedesktop.org/drm/intel/issues/10112
  [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#6077]: https://gitlab.freedesktop.org/drm/intel/issues/6077
  [i915#6078]: https://gitlab.freedesktop.org/drm/intel/issues/6078
  [i915#6093]: https://gitlab.freedesktop.org/drm/intel/issues/6093
  [i915#6094]: https://gitlab.freedesktop.org/drm/intel/issues/6094
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#7357]: https://gitlab.freedesktop.org/drm/intel/issues/7357
  [i915#7911]: https://gitlab.freedesktop.org/drm/intel/issues/7911
  [i915#9792]: https://gitlab.freedesktop.org/drm/intel/issues/9792
  [i915#9886]: https://gitlab.freedesktop.org/drm/intel/issues/9886
  [i915#9920]: https://gitlab.freedesktop.org/drm/intel/issues/9920
  [i915#9970]: https://gitlab.freedesktop.org/drm/intel/issues/9970


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7739 -> IGTPW_10761

  CI-20190529: 20190529
  CI_DRM_14374: 4f25ca6d074d229f793fa4635d6bac430a96d16f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10761: 10761
  IGT_7739: 7739


Testlist changes
----------------

+igt@kms_big_joiner@force-joiner-basic
+igt@kms_big_joiner@force-joiner-invalid-modeset
-igt@kms_big_joiner@2x-modeset

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/index.html

--===============1811779313963320400==
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
<tr><td><b>Series:</b></td><td>revamp big joiner test (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130572/">https://patchwork.freedesktop.org/series/130572/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7739 -&gt; IGTPW_10761</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_10761 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_10761, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/index.html</p>
<h2>Participating hosts (41 -&gt; 40)</h2>
<p>Additional (1): bat-atsm-1 <br />
  Missing    (2): fi-snb-2520m fi-bsw-n3050 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10761:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_exec_fence@basic-await@bcs0:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7739/bat-dg2-9/igt@gem_exec_fence@basic-await@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-dg2-9/igt@gem_exec_fence@basic-await@bcs0.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-dg1-7/igt@kms_big_joiner@basic.html">SKIP</a> +3 other tests skip</li>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-adlp-9/igt@kms_big_joiner@basic.html">SKIP</a> +1 other test skip</li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-rplp-1/igt@kms_big_joiner@basic.html">SKIP</a> +1 other test skip</li>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-dg2-9/igt@kms_big_joiner@basic.html">SKIP</a> +1 other test skip</li>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-arls-2/igt@kms_big_joiner@basic.html">SKIP</a> +1 other test skip</li>
<li>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-adln-1/igt@kms_big_joiner@basic.html">SKIP</a> +1 other test skip</li>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-adlp-6/igt@kms_big_joiner@basic.html">SKIP</a> +1 other test skip</li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-dg2-11/igt@kms_big_joiner@basic.html">SKIP</a> +3 other tests skip</li>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-dg2-14/igt@kms_big_joiner@basic.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_big_joiner@force-joiner-basic@1x-joiner} (NEW):</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-dg2-9/igt@kms_big_joiner@force-joiner-basic@1x-joiner.html">FAIL</a></li>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-arls-2/igt@kms_big_joiner@force-joiner-basic@1x-joiner.html">FAIL</a></li>
<li>{bat-arls-4}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-arls-4/igt@kms_big_joiner@force-joiner-basic@1x-joiner.html">FAIL</a></li>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-adlp-6/igt@kms_big_joiner@force-joiner-basic@1x-joiner.html">FAIL</a></li>
<li>{bat-rpls-3}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-rpls-3/igt@kms_big_joiner@force-joiner-basic@1x-joiner.html">FAIL</a></li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-dg2-8/igt@kms_big_joiner@force-joiner-basic@1x-joiner.html">FAIL</a></li>
<li>bat-arls-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-arls-3/igt@kms_big_joiner@force-joiner-basic@1x-joiner.html">FAIL</a></li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-mtlp-8/igt@kms_big_joiner@force-joiner-basic@1x-joiner.html">FAIL</a></li>
<li>{bat-adls-6}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-adls-6/igt@kms_big_joiner@force-joiner-basic@1x-joiner.html">FAIL</a></li>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-adlp-9/igt@kms_big_joiner@force-joiner-basic@1x-joiner.html">FAIL</a></li>
<li>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-adln-1/igt@kms_big_joiner@force-joiner-basic@1x-joiner.html">DMESG-FAIL</a></li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-rplp-1/igt@kms_big_joiner@force-joiner-basic@1x-joiner.html">FAIL</a></li>
</ul>
</li>
<li>
<p>{igt@kms_big_joiner@force-joiner-invalid-modeset} (NEW):</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/fi-rkl-11600/igt@kms_big_joiner@force-joiner-invalid-modeset.html">SKIP</a> +3 other tests skip</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/fi-tgl-1115g4/igt@kms_big_joiner@force-joiner-invalid-modeset.html">SKIP</a> +3 other tests skip</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-mtlp-6/igt@kms_big_joiner@force-joiner-invalid-modeset.html">SKIP</a> +1 other test skip</li>
<li>{bat-rpls-3}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-rpls-3/igt@kms_big_joiner@force-joiner-invalid-modeset.html">SKIP</a></li>
<li>{bat-adls-6}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-adls-6/igt@kms_big_joiner@force-joiner-invalid-modeset.html">SKIP</a></li>
</ul>
</li>
<li>
<p>{igt@kms_big_joiner@force-joiner-invalid-modeset@big_joiner_on_last_pipe} (NEW):</p>
<ul>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-jsl-3/igt@kms_big_joiner@force-joiner-invalid-modeset@big_joiner_on_last_pipe.html">FAIL</a> +1 other test fail</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-jsl-1/igt@kms_big_joiner@force-joiner-invalid-modeset@big_joiner_on_last_pipe.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-jsl-3/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> +1 other test skip</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-mtlp-8/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> +1 other test skip</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-dg2-8/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> +1 other test skip</li>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-adlm-1/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> +3 other tests skip</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-jsl-1/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> +1 other test skip</li>
<li>bat-arls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-arls-1/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> +3 other tests skip</li>
<li>bat-arls-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-arls-3/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>{bat-arls-4}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-arls-4/igt@kms_big_joiner@basic.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>{bat-adls-6}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-adls-6/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic:</p>
<ul>
<li>{bat-rpls-3}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-rpls-3/igt@kms_busy@basic.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>{bat-rpls-3}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7739/bat-rpls-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-rpls-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:</p>
<ul>
<li>{bat-rpls-3}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7739/bat-rpls-3/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-rpls-3/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>{bat-rpls-3}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7739/bat-rpls-3/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9886">i915#9886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-rpls-3/igt@kms_dsc@dsc-basic.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_7739 and IGTPW_10761:</p>
<h3>New IGT tests (4)</h3>
<ul>
<li>
<p>igt@kms_big_joiner@force-joiner-basic:</p>
<ul>
<li>Statuses : 25 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@force-joiner-basic@1x-joiner:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s) 13 fail(s)</li>
<li>Exec time: [0.50, 3.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@force-joiner-invalid-modeset:</p>
<ul>
<li>Statuses : 27 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@force-joiner-invalid-modeset@big_joiner_on_last_pipe:</p>
<ul>
<li>Statuses : 2 fail(s) 10 pass(s)</li>
<li>Exec time: [0.20, 1.38] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10761 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7739/fi-kbl-7567u/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/fi-kbl-7567u/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@basic:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-atsm-1/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-atsm-1/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4079">i915#4079</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_fence_blits@basic:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-atsm-1/igt@gem_tiled_fence_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-atsm-1/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7739/fi-bsw-nick/igt@i915_selftest@live@execlists.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/fi-bsw-nick/igt@i915_selftest@live@execlists.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7911">i915#7911</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@size-max:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-atsm-1/igt@kms_addfb_basic@size-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6077">i915#6077</a>) +37 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/fi-pnv-d510/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</li>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/fi-glk-j4005/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</li>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/fi-kbl-7567u/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</li>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/fi-cfl-guc/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</li>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/fi-kbl-x1275/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</li>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/fi-cfl-8109u/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</li>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/fi-ilk-650/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</li>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/fi-blb-e6850/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-mtlp-6/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9792">i915#9792</a>) +1 other test skip</li>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/fi-skl-6600u/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</li>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/fi-apl-guc/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</li>
<li>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/fi-skl-guc/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</li>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/fi-cfl-8700k/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</li>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/fi-bsw-nick/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/fi-ivb-3770/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</li>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/fi-elk-e7500/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</li>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/fi-kbl-guc/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-atsm-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6078">i915#6078</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-atsm-1/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6093">i915#6093</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-atsm-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1836">i915#1836</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@basic:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-atsm-1/igt@kms_prop_blob@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7357">i915#7357</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-atsm-1/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6094">i915#6094</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-atsm-1/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6078">i915#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-gtt:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-atsm-1/igt@prime_vgem@basic-gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/bat-atsm-1/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vgem_basic@unload:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7739/fi-kbl-7567u/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/fi-kbl-7567u/igt@vgem_basic@unload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9970">i915#9970</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@hangcheck:<ul>
<li>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7739/fi-skl-guc/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10112">i915#10112</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10761/fi-skl-guc/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7739 -&gt; IGTPW_10761</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14374: 4f25ca6d074d229f793fa4635d6bac430a96d16f @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10761: 10761<br />
  IGT_7739: 7739</p>
<h2>Testlist changes</h2>
<p>+igt@kms_big_joiner@force-joiner-basic<br />
+igt@kms_big_joiner@force-joiner-invalid-modeset<br />
-igt@kms_big_joiner@2x-modeset</p>

</body>
</html>

--===============1811779313963320400==--
